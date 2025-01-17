local Transform = require "util/Transform"
local Layout = require "util/Layout"

local Action = require "actions/Action"
local MessageBox = require "actions/MessageBox"
local Menu = require "actions/Menu"
local Ease = require "actions/Ease"
local Parallel = require "actions/Parallel"
local Serial = require "actions/Serial"
local Do = require "actions/Do"
local Wait = require "actions/Wait"
local PlayAudio = require "actions/PlayAudio"
local AudioFade = require "actions/AudioFade"
local Spawn = require "actions/Spawn"
local While = require "actions/While"
local Repeat = require "actions/Repeat"
local Executor = require "actions/Executor"
local BlockPlayer = require "actions/BlockPlayer"
local YieldUntil = require "actions/YieldUntil"

local Subscreen = require "object/Subscreen"

local shine = require "lib/shine"

local Scene = require "scene/Scene"

local BasicScene = class(Scene)

function BasicScene:onEnter(args)
	self:pushLayer("tiles")
	
	self.lastSpawnPoint = args.spawn_point or "Spawn 1"
	
	self.spawnPoints = {}
	
	self.region = args.region
	self.mapName = args.mapName
	self.map = args.map

	self.map.objects = {}
	self.objectLookup = {}
	
	self.maps = args.maps
	self.images = args.images
	self.animations = args.animations or {}
	self.audio = args.audio
	self.mboxGradient = args.images["mboxgradient"]
	self.camPos = Transform()
	self.tutorial = args.tutorial
	self.nighttime = args.nighttime or self.map.properties.nighttime
	
	self.cacheSceneData = args.cache
	
	-- NOTE: This is how we draw the lua map data
	-- There is a draw function on the sti map object.
	-- All our SceneNode drawing interface requires is a
	-- draw function, so this works out fine.
	self:addNode(self.map, "tiles")

	if self.nighttime and not self.map.properties.ignorenight then
		self.originalMapDraw = self.map.drawTileLayer
		self.originalImgDraw = self.map.drawImageLayer
		self.map.drawTileLayer = function(map, layer)
			if not self.night then
				self.night = shine.nightcolor()
			end
			self.night:draw(function() self.originalMapDraw(map, layer) end)
		end
		self.map.drawImageLayer = function(map, layer)
			if not self.night then
				self.night = shine.nightcolor()
			end
			if layer.properties.nonight then
				self.originalImgDraw(map, layer)
			else
				self.night:draw(function() self.originalImgDraw(map, layer) end)
			end
		end
	end
	
	local placeholder
	local classCache = {}
	for _,layer in ipairs(self.map.layers) do
		-- Initialize map objects
		if layer.objects then
			self:pushLayer(layer.name, true)
		
			local drawFun = layer.draw
			layer.draw = function()
				drawFun()
				self:sortedDraw(layer.name)
			end
			
			for _,object in pairs(layer.objects) do
				if not classCache[object.type] then
					-- Dynamically load classes at most once
					classCache[object.type] = require ("object/"..object.type)
				end
				
				if object.type ~= "Player" or object.name == self.lastSpawnPoint then
					local objRef = (classCache[object.type])(self, layer, object)
					self.objectLookup[object.name] = objRef
					self:addObject(objRef)
				end
				
				-- If object is marked as a player spawn location
				if  object.type == "Player" or
					object.type == "TinyPlayer" or
					object.type == "EscapePlayer" or
					object.type == "EscapePlayerVert" or
					object.type == "SavePoint" or
					object.type == "SceneEdge" or
					object.type == "Door" or
					object.type == "SpawnPoint"
				then
					self.spawnPoints[object.name] = object
				end
				
				-- If object is marked as "fallable"
				if object.properties.fallable then
					if not self.map.fallables then
						self.map.fallables = {}
					end
					table.insert(self.map.fallables, object)
				end
			end
		end
		
		-- Initialize layer-level objects
		local classType = layer.properties.type
		if classType then
			if not classCache[classType] then
				-- Dynamically load classes at most once
				classCache[classType] = require ("object/"..classType)
			end
			local objRef = (classCache[classType])(self, layer)
			self.objectLookup[layer.name] = objRef
			self:addObject(objRef)
		end
	end
	
	self:pushLayer("ui")
	
	-- Play music/sambient sound on start
	if self.map.music then
		self.audio:setMusicVolume(1.0)
		self.audio:playMusic(self.map.music)
	end
	
	if self.map.ambient then
		self.audio:playAmbient(self.map.ambient)
	end
	
	local onLoadAction = Action()
	if self.map.properties.onload then
		onLoadAction = love.filesystem.load("maps/"..self.map.properties.onload)()(self, args.hint)
	end
	
	-- Pan to player
	if self.player then
		-- Place player at spawn point and orient them appropriately
		if self.lastSpawnPoint then
			local spawn = self.spawnPoints[self.lastSpawnPoint]
			local spawnOffset = args.spawn_point_offset or
				Transform(spawn.width/2, spawn.height/2)
			if not self.player.object.properties.strictLocation then
				-- Place player
				self.player.x = spawn.x + spawnOffset.x
				self.player.y = spawn.y + spawnOffset.y - self.player.height
			end
				
			-- Reset player state
			self.player.doingSpecialMove = false
			self.player.ignoreSpecialMoveCollision = false
			self.player.state = spawn.properties.orientation and "idle"..spawn.properties.orientation or "idledown"
			
			-- Restart special move, if necessary
			if args.doingSpecialMove and GameState.leader == "sonic" then
				self.player.basicUpdate = function(p, dt) end
				self.player.sprite.visible = false
				self.player:run(BlockPlayer {
					Wait(0.5),
					YieldUntil(function()
						return not self.cinematicPause
					end),
					Do(function()
						self.player.skipChargeSpecialMove = true
						self.player.sprite.visible = true
						self.player:onSpecialMove()
					end)
				})
			else
				self.player.basicUpdate = self.player.origUpdate or self.player.basicUpdate
				self.player:updateSprite()
			end
			
			-- Make sure we render the camera in the correct spot now before fade-in
			self:update(0)
		end
	end
	
	self.initialized = true
	
	-- Post init
	for _, obj in pairs(self.map.objects) do
		obj:postInit()
	end
	
	--[[ Create nodes for collision map
	self.pathingNodes = {}
	for y=1,self.map.height do
		for x=1,self.map.width do
			local px,py = self:collisionCoordToWorldCoord(x, y)
			table.insert(self.pathingNodes, {x=px, y=py, canMove=not self.map["collisionMap"][y][x]})
		end
	end]]

	-- Fade in scene
	local fadeInSpeed = args.fadeInSpeed or 1.0
	self.bgColor = {0,0,0,255}
	ScreenShader:sendColor("multColor", self.bgColor)
	
	if GameState.leader == "bunny" then
		print("no special move")
		self.player.noSpecialMove = true
	end
	
	return Serial {
		Spawn(
			Serial {
				Parallel {
					Ease(self.bgColor, 1, 255, 2 * fadeInSpeed, "linear"),
					Ease(self.bgColor, 2, 255, 2 * fadeInSpeed, "linear"),
					Ease(self.bgColor, 3, 255, 2 * fadeInSpeed, "linear"),
					
					Do(function()
						ScreenShader:sendColor("multColor", self.bgColor)
					end)
				}
			}
		),
			
		onLoadAction,
		
		Do(function()
			self:addHandler("keytriggered", BasicScene.mainInput, self)
			
			if GameState.leader == "bunny" then
				print("yes special move")
				self.player.noSpecialMove = false
			end
		end)
	}
end

function BasicScene:onReEnter(args)
	-- Recreate player
	self.player:remove()
	local prevPlayer = self.player
	local PlayerClass = require("object/"..(prevPlayer.playerType or "Player"))
	self.player = PlayerClass(self, self.player.layer, self.player.object)
	self.player.x = prevPlayer.x
	self.player.y = prevPlayer.y

	-- Place player at spawn point and orient them appropriately
	if args.spawn_point then
		local spawn = self.spawnPoints[args.spawn_point]
		local spawnOffset = args.spawn_point_offset or
			Transform(spawn.width/2, spawn.height/2)
		self.player.x = spawn.x + spawnOffset.x
		self.player.y = spawn.y + spawnOffset.y - self.player.height
		
		-- Reset player state
		self.player.doingSpecialMove = false
		self.player.ignoreSpecialMoveCollision = false
		self.player.state = spawn.properties.orientation and "idle"..spawn.properties.orientation or "idledown"
		
		-- Restart special move, if necessary
		if args.doingSpecialMove and GameState.leader == "sonic" then
			self.player.basicUpdate = function(p, dt) end
			self.player.sprite.visible = false
			self.player:run(BlockPlayer {
				Wait(0.5),
				YieldUntil(function()
					return not self.cinematicPause
				end),
				Do(function()
					self.player.skipChargeSpecialMove = true
					self.player.sprite.visible = true
					self.player:onSpecialMove()
				end)
			})
		else
			self.player.basicUpdate = self.player.origUpdate
			self.player:updateSprite()
		end
	end
	
	self.reenteringFromBattle = self.enteringBattle
	self.enteringBattle = false
	self.player.cinematic = false
	self.reentering = true
	
	self.blur = nil
	
	for _, obj in pairs(self.map.objects) do
		if obj.flagForDeletion then
			obj:remove()
		end
	end
	
	local onLoadAction = Action()
	if self.map.properties.onload then
		onLoadAction = love.filesystem.load("maps/"..self.map.properties.onload)()(self, args.hint)
	end

	local fadeInSpeed = args.fadeInSpeed or 1.0
	self.bgColor = {0,0,0,255}
	ScreenShader:sendColor("multColor", self.bgColor)
	
	if GameState.leader == "bunny" then
		print("no special move")
		self.player.noSpecialMove = true
	end
	return Serial {
		Do(function()
			self.player.cinematicStack = 1
		end),
	
		Parallel {
			-- Fade in
			Ease(self.bgColor, 1, 255, 2 * fadeInSpeed, "linear"),
			Ease(self.bgColor, 2, 255, 2 * fadeInSpeed, "linear"),
			Ease(self.bgColor, 3, 255, 2 * fadeInSpeed, "linear"),
			Do(function()
				ScreenShader:sendColor("multColor", self.bgColor)
			end)
		},
		
		Do(function()
			self.player.cinematicStack = 0
		end),
		
		onLoadAction,
		
		Do(function()
			self.player.cinematicStack = 0
			self.reentering = false
			self.reenteringFromBattle = false
			
			if GameState.leader == "bunny" then
				print("yes special move")
				self.player.noSpecialMove = false
			end
		end)
	}
end

function BasicScene:onExit(args)
	local fadeOutSpeed = args.fadeOutSpeed or 1.0
	ScreenShader:sendColor("multColor", self.bgColor)
	
	local fadeMusicOrNoop = Action()
	if args.fadeOutMusic then
		fadeMusicOrNoop = AudioFade(
			"music",
			self.audio:getMusicVolume(),
			0,
			2 * fadeOutSpeed,
			"linear"
		)
	end
	
	local fadeAction = Action()
	if not args.noFade then
		fadeAction = Parallel {
			fadeMusicOrNoop,
		
			-- Fade to black
			Ease(self.bgColor, 1, 0, 2 * fadeOutSpeed, "linear"),
			Ease(self.bgColor, 2, 0, 2 * fadeOutSpeed, "linear"),
			Ease(self.bgColor, 3, 0, 2 * fadeOutSpeed, "linear"),
			Do(function()
				ScreenShader:sendColor("multColor", self.bgColor)
			end)
		}
	end
	
	return Serial {
		fadeAction,
		Do(function()
			self:remove()
		end)
	}
end

function BasicScene:fadeIn(speed)
	speed = speed or 1
	return Parallel {
		-- Fade from black
		Ease(self.bgColor, 1, 255, 2 * speed, "linear"),
		Ease(self.bgColor, 2, 255, 2 * speed, "linear"),
		Ease(self.bgColor, 3, 255, 2 * speed, "linear"),
		Do(function()
			ScreenShader:sendColor("multColor", self.bgColor)
		end)
	}
end

function BasicScene:fadeOut(speed)
	speed = speed or 1
	return Parallel {
		-- Fade to black
		Ease(self.bgColor, 1, 0, 2 * speed, "linear"),
		Ease(self.bgColor, 2, 0, 2 * speed, "linear"),
		Ease(self.bgColor, 3, 0, 2 * speed, "linear"),
		Do(function()
			ScreenShader:sendColor("multColor", self.bgColor)
		end)
	}
end

function BasicScene:remove()
	-- Delete all map objects
	for _, obj in pairs(self.map.objects) do
		obj:remove()
	end
	self.map.drawTileLayer = self.originalMapDraw
	self.map.drawImageLayer = self.originalImgDraw
	self.map.objects = nil
	self.objectLookup = nil
	self.map.fallables = nil
	self:removeNode(self.map)

	self.player:remove()
	self.player = nil
	
	self:cleanupLayers()
end

function BasicScene:restart(args)
	self.cacheSceneData = false
	self.sceneMgr.cachedScenes[tostring(self.map)] = nil
	self.isRestarting = true

	self.sceneMgr:switchScene {
		class = "BasicScene",
		mapName = self.mapName,
		map = self.map,
		maps = self.maps,
		region = self.region,
		spawn_point = self.lastSpawnPoint,
		spawn_point_offset = Transform(),
		fadeInSpeed = 2,
		fadeOutSpeed = 2,
		fadeOutMusic = args and args.fadeOutMusic,
		images = self.images,
		animations = self.animations,
		audio = self.audio,
		tutorial = self.tutorial,
		hint = args and args.hint
	}
end

function BasicScene:changeScene(args)
	local mapName = "maps/"..args.map..".lua"
	self.sceneMgr:pushScene {
		class = "BasicScene",
		map = self.maps[mapName],
		mapName = mapName,
		maps = self.maps,
		images = self.images,
		region = self.region,
		animations = self.animations,
		audio = self.audio,
		spawn_point = args.spawnPoint,
		hint = args.hint,
		tutorial = args.tutorial,
		fadeOutSpeed = args.fadeOutSpeed,
		fadeInSpeed = args.fadeInSpeed,
		fadeOutMusic = args.fadeOutMusic,
		cache = args.cache
	}
end

-- Vertical screen shake
function BasicScene:screenShake(str, sp, rp)
	local strength = str or 50
	local speed = sp or 15
	local repeatTimes = rp or 1
	
	return Serial {
		Do(function()
			self.isScreenShaking = true
		end),
		
		Repeat(Serial {
			Ease(self.camPos, "y", function() return self.camPos.y - strength end, speed, "quad"),
			Ease(self.camPos, "y", function() return self.camPos.y + strength end, speed, "quad")
		}, repeatTimes),
		
		Ease(self.camPos, "y", function() return self.camPos.y - strength/2 end, speed, "quad"),
		Ease(self.camPos, "y", function() return self.camPos.y + strength/2 end, speed, "quad"),
		
		Do(function()
			self.isScreenShaking = false
			self.camPos.y = 0
		end)
	}
end

function BasicScene:addObject(object)
	self.map.objects[tostring(object)] = object
end

function BasicScene:removeObject(object)
	if self.map.objects then
		self.map.objects[tostring(object)] = nil
	end
end

function BasicScene:enterBattle(args)
	if self.enteringBattle then
		return Action()
	end
	if not self.blur then
		self.blur = shine.boxblur()
		self.blur.radius_v = 0.0
		self.blur.radius_h = 0.0
	end
	return Serial {
		Do(function()
			self.player.cinematic = true
			self.enteringBattle = true
			
			self.bgColor = {255,255,255,255}
			ScreenShader:sendColor("multColor", self.bgColor)
		end),
	
		-- Fade out current music
		AudioFade("music", self.audio:getMusicVolume(), 0, 1),

		-- Play enter battle sfx
		PlayAudio("sfx", "battlestart", 1.0, true),

		-- Motion blur + fade to black + fade music
		Ease(self.blur, "radius_h", 150, 2),
		
		args.beforeBattle or Action(),
		
		Do(function()
			self.audio.allowDucking = false
			self.sceneMgr:pushScene {
				class = "BattleScene",
				audio = self.audio,
				images = self.images,
				animations = self.animations,
				background = self.map.properties.battlebg,
				nextMusic = args.music,
				prevMusic = args.prevMusic or self.audio:getCurrentMusic(),
				blur = self.blur,
				opponents = args.opponents,
				bossBattle = args.bossBattle,
				initiative = args.initiative,
				color = args.color,
				practice = args.practice,
				onEnter = args.onEnter
			}
		end),
		
		Do(function()
			
		end)
	}
end

function BasicScene:mainInput(key, uni)
	-- Open subscreen
	if key == "z" and
		not self.player.cinematic and
		self.player.cinematicStack == 0 and
		(not self.subscreen or
			(self.subscreen.isRemoved and self.subscreen:isRemoved()))
	then
		self.subscreen = Subscreen(self, Transform(100, 15), {255,255,255,255}, self.mboxGradient)
	end
end

function BasicScene:keytriggered(key, uni)
	if key == "escape" then
		if self.tutorial then
			if self.showingEscapeMenu then
				return
			end
			self.showingEscapeMenu = true
			
			self:run(BlockPlayer{ Menu {
				layout = Layout {
					{Layout.Text("Exit tutorial?"), selectable = false},
					{Layout.Text("Yes"), choose = function(menu)
						menu:close()
						self:run {
							menu,
							Do(function() self.sceneMgr:popScene{} end),
							Do(function() end)
						}
					end},
					{Layout.Text("No"),
						choose = function(menu)
							menu:close()
							self:run {
								menu,
								Do(function() self.showingEscapeMenu = false end)
							}
						end},
					colWidth = 200
				},
				transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 30),
				selectedRow = 2,
				cancellable = true
			}})
		else
			if self.showingEscapeMenu then
				love.event.quit()
			end
			self.showingEscapeMenu = true
			
			self:run(BlockPlayer{ Menu {
				layout = Layout {
					{Layout.Text("Exit game?"), selectable = false},
					{Layout.Text("Yes"), choose = love.event.quit},
					{Layout.Text("No"),
						choose = function(menu)
							menu:close()
							self:run {
								menu,
								Do(function() self.showingEscapeMenu = false end)
							}
						end},
					colWidth = 200
				},
				transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 30),
				selectedRow = 2,
				cancellable = true
			}})
		end
    end
end

function BasicScene:playerMovable()
	return  (self.initialized) and
			(not self.mbox or self.mbox:isDone()) and
			(not self.subscreen or (self.subscreen.isRemoved and self.subscreen:isRemoved())) and
			not self.enteringBattle and
			not self.pausePlayer
end

function BasicScene:pauseEnemies(active)
	for _, object in pairs(self.map.objects) do
		if object.isBot then
			object.pauseMove = active
		end
	end
end

function BasicScene:pan(worldOffsetX, worldOffsetY)
	if worldOffsetX > 0 then
		worldOffsetX = self.camPos.x
	elseif worldOffsetX < -(self:getMapWidth() - love.graphics.getWidth()) then
		worldOffsetX = -(self:getMapWidth() - love.graphics.getWidth()) + self.camPos.x
	end

	if worldOffsetY > 0 then
		worldOffsetY = self.camPos.y
	elseif worldOffsetY < -(self:getMapHeight() - love.graphics.getHeight()) then
		worldOffsetY = -(self:getMapHeight() - love.graphics.getHeight())-- + self.camPos.y
	end

	for _,obj in pairs(self.map.objects) do
		if obj.sprite and not obj.hidden and obj.sprite.transform and obj.x then
			if obj.layer and obj.layer.properties and obj.layer.properties.movespeed then
				obj.sprite.transform.x = math.floor((obj.x + worldOffsetX)*obj.layer.properties.movespeed)
				obj.sprite.transform.y = math.floor((obj.y + worldOffsetY)*obj.layer.properties.movespeed)
			else
				obj.sprite.transform.x = math.floor(obj.x + worldOffsetX)
				obj.sprite.transform.y = math.floor(obj.y + worldOffsetY)
			end
		end
	end
	
	for _,layer in ipairs(self.map.layers) do
		if not layer.image then
			layer.x = layer.offsetx + worldOffsetX
			layer.y = layer.offsety + worldOffsetY
		elseif layer.properties.type ~= "Parallax" then
			layer.x = math.floor((layer.offsetx + worldOffsetX)*(layer.properties.movespeed or 1.05))
			layer.y = math.floor((layer.offsety + worldOffsetY)*(layer.properties.movespeed or 1.05))
			
			-- If image layer is configured to shimmer, setup a shimmer cycle and remove config
			if layer.properties.shimmer then
				local originalOpacity = layer.opacity
				Executor(self):act(
					Repeat(
						Serial {
							Ease(layer, "opacity", originalOpacity/1.5, 3, "quad"),
							Ease(layer, "opacity", originalOpacity, 3, "quad")
						}
					)
				)
				layer.properties.shimmer = nil
			end
		end
	end
end

function BasicScene:updatePlayerPos()
	local xCap = love.graphics.getWidth()/2
	local yCap = love.graphics.getHeight()/2
	if self.player.doingSpecialMove then
		--xCap = self.player.sprite.w*4
	end

	if  self.player.x < xCap then
		self.player.sprite.transform.x = math.floor(self.player.x - self.player.width + self.camPos.x)
	elseif self.player.x > self:getMapWidth() - xCap then
		self.player.sprite.transform.x = math.floor(self.player.x - (self:getMapWidth() - love.graphics.getWidth()) - self.player.width + self.camPos.x)
	else
		self.player.sprite.transform.x = math.floor(xCap - self.player.width + self.camPos.x)
	end
	
	if  self.player.y < yCap then
		self.player.sprite.transform.y = math.floor(self.player.y - self.player.height + self.camPos.y)
	elseif self.player.y > self:getMapHeight() - yCap then
		self.player.sprite.transform.y = math.floor(self.player.y - (self:getMapHeight() - love.graphics.getHeight()) - self.player.height + self.camPos.y)
	else
		self.player.sprite.transform.y = math.floor(yCap - self.player.height + self.camPos.y)
	end
end

function BasicScene:update(dt)
	Scene.update(self, dt)

	-- Cannot move while subscreen is up
	if (not self.player or not self:playerMovable()) and
		not self.pausePlayer
	then
		return
	end
	
	if not self.timer then
		self.timer = 0
	end
	self.timer = self.timer + dt
	if self.timer > 1 then
		--print("num objects in scene = "..tostring(table.count(self.map.objects)))
		self.timer = 0
	end

	-- Shift tiles based on player position
	local worldOffsetX = math.floor((-self.player.x + love.graphics.getWidth()/2))
	local worldOffsetY = math.floor((-self.player.y + love.graphics.getHeight()/2))
	
	self:pan(
		math.floor((worldOffsetX + self.camPos.x)),
		math.floor((worldOffsetY + self.camPos.y))
	)
	self:updatePlayerPos()
end

function BasicScene:getMapWidth()
	if not self.mapWidth then
		self.mapWidth = self.map.width * self:getTileWidth()
	end
	return self.mapWidth
end

function BasicScene:getMapHeight()
	if not self.mapHeight then
		self.mapHeight = self.map.height * self:getTileHeight()
	end
	return self.mapHeight
end

function BasicScene:worldCoordToCollisionCoord(x, y)
	return math.floor(x/self.map.tilewidth)+1, math.floor(y/self.map.tileheight)+1
end

function BasicScene:screenCoordToWorldCoord(x, y)
	local xcoord
	local ycoord

	if self.player.x >= (self:getMapWidth() - love.graphics.getWidth()/2) then
		xcoord = x + self.player.x - love.graphics.getWidth()/2 - (self.player.x - (self:getMapWidth() - love.graphics.getWidth()/2))
	elseif self.player.x <= love.graphics.getWidth()/2 then
		xcoord = x
	else
		xcoord = x + self.player.x - love.graphics.getWidth()/2
	end
	
	if self.player.y >= (self:getMapHeight() - love.graphics.getHeight()/2) then
		ycoord = y + self.player.y - love.graphics.getHeight()/2 - (self.player.y - (self:getMapHeight() - love.graphics.getHeight()/2))
	elseif self.player.y <= love.graphics.getHeight()/2 then
		ycoord = y
	else
		ycoord = y + self.player.y - love.graphics.getHeight()/2
	end

	return xcoord, ycoord
end

function BasicScene:collisionCoordToWorldCoord(x, y)
	return (x-1) * self.map.tilewidth, (y-1) * self.map.tileheight
end

function BasicScene:getTileWidth()
	return self.map.tilewidth
end

function BasicScene:getTileHeight()
	return self.map.tileheight
end

function BasicScene:canMove(x, y, dx, dy, mapName)
	mapName = mapName or "collisionMap"
	-- Special case for map boundaries
	if  (x + dx) <= 0 or
		(x + dx) >= self:getMapWidth() or
		(y + dy) <= 0 or
		(y + dy) >= self:getMapHeight()
	then
		return false
	end
	local mapx, mapy = self:worldCoordToCollisionCoord(x + dx, y + dy)
	return not self.map[mapName][mapy][mapx]
end

function BasicScene:canMoveWhitelist(x, y, dx, dy, whiteList)
	mapName = "collisionMap"
	-- Special case for map boundaries
	if  (x + dx) <= 0 or
		(x + dx) >= self:getMapWidth() or
		(y + dy) <= 0 or
		(y + dy) >= self:getMapHeight()
	then
		return false
	end
	local mapx, mapy = self:worldCoordToCollisionCoord(x + dx, y + dy)
	return not self.map[mapName][mapy][mapx] or (whiteList and whiteList[mapy] and whiteList[mapy][mapx])
end

function BasicScene:draw()
	if self.blur then
		self.blur:draw(function()
			love.graphics.setDefaultFilter("nearest", "nearest")
			Scene.draw(self)
		end)
	else
		love.graphics.setDefaultFilter("nearest", "nearest")
		Scene.draw(self)
	end
end


return BasicScene
