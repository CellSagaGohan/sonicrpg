return function(scene, hint)
	local Transform = require "util/Transform"
	local Rect = unpack(require "util/Shapes")
	local Layout = require "util/Layout"

	local Action = require "actions/Action"
	local Animate = require "actions/Animate"
	local TypeText = require "actions/TypeText"
	local Menu = require "actions/Menu"
	local MessageBox = require "actions/MessageBox"
	local PlayAudio = require "actions/PlayAudio"
	local AudioFade = require "actions/AudioFade"
	local Ease = require "actions/Ease"
	local Repeat = require "actions/Repeat"
	local Parallel = require "actions/Parallel"
	local Serial = require "actions/Serial"
	local Executor = require "actions/Executor"
	local Wait = require "actions/Wait"
	local BlockPlayer = require "actions/BlockPlayer"
	local Do = require "actions/Do"
	local Move = require "actions/Move"
	local shine = require "lib/shine"
	local SpriteNode = require "object/SpriteNode"
	local NameScreen = require "actions/NameScreen"
	local Player = require "object/Player"
	local BasicNPC = require "object/BasicNPC"
	
	local knotholeIntro = function()
		local subtext = TypeText(
			Transform(50, 470),
			{255, 255, 255, 0},
			FontCache.TechnoSmall,
			"Great Forest",
			100
		)
		
		local text = TypeText(
			Transform(50, 500),
			{255, 255, 255, 0},
			FontCache.Techno,
			"Knothole",
			100
		)
		Executor(scene):act(Serial {
			Wait(0.5),
			subtext,
			text,
			Parallel {
				Ease(text.color, 4, 255, 1),
				Ease(subtext.color, 4, 255, 1),
			},
			Wait(2),
			Parallel {
				Ease(text.color, 4, 0, 1),
				Ease(subtext.color, 4, 0, 1)
			}
		})
		
		scene.audio:playMusic("knothole", 0.8, true)
	end
	
	scene.player.dustColor = Player.FOREST_DUST_COLOR

	if hint == "fromworldmap" then
		knotholeIntro()
		return BlockPlayer {
			Parallel {
				Do(function()
					local cart = scene.objectLookup.CartBG
					scene.player.x = cart.x + cart.sprite.w
					scene.player.y = cart.y + cart.sprite.h
				end),
				Move(scene.objectLookup.CartBG, scene.objectLookup.CartWaypoint2),
				Move(scene.objectLookup.Cart, scene.objectLookup.CartWaypoint2)
			}
		}
	elseif GameState:isFlagSet("ep3_intro") and
		not GameState:isFlagSet("ep3_introknothole")
	then
		GameState:setFlag("ep3_introknothole")
		GameState:setFlag("sallysad_over")
		scene.audio:stopMusic()
		return BlockPlayer {
			PlayAudio("music", "knothole", 1.0, true, true),
			Do(function()
				scene.player.noIdle = true
				scene.player.sprite:setAnimation("thinking2")
			end),
			Wait(3),
			MessageBox {message="Sally: Ahhh...", textspeed=1},
			Do(function()
				scene.player.noIdle = true
				scene.player.sprite:setAnimation("pose")
			end),
			MessageBox {message="Sally: Nothing like a breath of that fresh, morning air to clear your head...", textspeed=1},
			AudioFade("music", 1.0, 0.0, 1),
			Wait(1),
			MessageBox {message="Fleet: Awww, {p20}getting tired?", closeAction=Wait(1)},
			Do(function()
				scene.player.sprite:setAnimation("idleright")
			end),
			MessageBox {message="Sally: ?", closeAction=Wait(0.5)},
			MessageBox {message="Sonic: Dream on, featherweight!", closeAction=Wait(1)},
			Wait(1),
			PlayAudio("music", "awkward", 1.0, true, true),
			-- Sonic/Fleet blast past Sally
			Do(function()
				scene.objectLookup.FleetEp3Run.hidden = false
				scene.objectLookup.SonicEp3Run.hidden = false
				scene.objectLookup.FleetEp3Run.movespeed = 30
				scene.objectLookup.SonicEp3Run.movespeed = 30
				scene.objectLookup.FleetEp3Run.sprite.transform.ox = scene.objectLookup.FleetEp3Run.sprite.w/2
				scene.objectLookup.FleetEp3Run.sprite.transform.oy = scene.objectLookup.FleetEp3Run.sprite.h/2
				scene.objectLookup.FleetEp3Run.sprite.transform.angle = -math.pi/6
			end),
			Parallel {
				Move(scene.objectLookup.FleetEp3Run, scene.objectLookup.Ep3Waypoint, "fly"),
				Serial {
					Wait(0.2),
					Do(function()
						scene.player.sprite:setAnimation("idleleft")
					end)
				}
			},
			Wait(1),
			Parallel {
				Move(scene.objectLookup.SonicEp3Run, scene.objectLookup.Ep3Waypoint, "juice"),
				Serial {
					Wait(0.2),
					scene.player:spin(3, 0.01)
				}
			},
			Do(function()
				scene.objectLookup.FleetEp3Run:remove()
				scene.objectLookup.SonicEp3Run:remove()
				scene.player.sprite:setAnimation("shock")
			end),
			Wait(1),
			Do(function()
				scene.player.sprite:setAnimation("frustrateddown")
			end),
			MessageBox {message="Sally: Sonic!!"},
			Do(function()
				scene.player.sprite:setAnimation("thinking")
			end),
			Wait(1),
			Do(function()
				scene.player.noIdle = false
			end)
		}
	elseif GameState:isFlagSet("ep3_intro") and
		GameState:isFlagSet("ep3_ffmeeting") and
		not GameState:isFlagSet("ep3_ffmeetingover")
	then
		GameState:setFlag("ep3_ffmeetingover")
		
		scene.audio:stopMusic()

		scene.objectLookup.SonicMtg.hidden = false
		scene.objectLookup.RotorMtg.hidden = false
		scene.objectLookup.AntoineMtg.hidden = false
		scene.objectLookup.SallyMtg.hidden = false
		scene.objectLookup.BunnieMtg.hidden = false
		scene.objectLookup.GriffMtg.hidden = false
		scene.objectLookup.FleetMtg.hidden = false
		scene.objectLookup.LoganMtg.hidden = false
		scene.objectLookup.IvanMtg.hidden = false
		scene.objectLookup.LeonMtg.hidden = false
		
		local sally = scene.objectLookup.SallyMtg
		local antoine = scene.objectLookup.AntoineMtg
		local sonic = scene.objectLookup.SonicMtg
		local rotor = scene.objectLookup.RotorMtg
		local bunnie = scene.objectLookup.BunnieMtg
		local griff = scene.objectLookup.GriffMtg
		griff.sprite.sortOrderY = 0
		
		local fleet = scene.objectLookup.FleetMtg
		local logan = scene.objectLookup.LoganMtg
		local ivan = scene.objectLookup.IvanMtg
		local leon = scene.objectLookup.LeonMtg
		
		local hop = function(obj)
			return Serial {
				Ease(obj, "y", function() return obj.y - 30 end, 8),
				Ease(obj, "y", function() return obj.y + 30 end, 8, "quad"),
				Ease(obj, "y", function() return obj.y - 5 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y + 5 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y - 2 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y + 2 end, 20, "quad")
			}
		end
		local dblhop = function(obj)
			return Serial {
				Ease(obj, "y", function() return obj.y - 30 end, 8),
				Ease(obj, "y", function() return obj.y + 30 end, 8, "quad"),
				Ease(obj, "y", function() return obj.y - 30 end, 8),
				Ease(obj, "y", function() return obj.y + 30 end, 8, "quad"),
				Ease(obj, "y", function() return obj.y - 5 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y + 5 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y - 2 end, 20, "quad"),
				Ease(obj, "y", function() return obj.y + 2 end, 20, "quad")
			}
		end

		scene.player.sprite.visible = false
		scene.player.dropShadow.hidden = true

		return BlockPlayer {
			Do(function()
				scene.player.x = scene.objectLookup.BunnieMtg.x
				scene.player.y = scene.objectLookup.BunnieMtg.y + 64
				scene.player.sprite.visible = false
				scene.player.dropShadow.hidden = true
				scene.player.cinematic = true
			end),

			Wait(3),
			
			PlayAudio("music", "royalwelcome", 0.6, true, true),
			Animate(sally.sprite, "planning_smile"),
			MessageBox {message="Sally: To start off, I'd like to welcome the Rebellion to Knothole Village! {p60}I am sure many of you have already become acquainted--"},
			hop(sonic),
			MessageBox {message="Sonic: Oh, we're acquainted alright."},
			Animate(fleet.sprite, "meeting_smirk"),
			MessageBox {message="Fleet: Ha ha, amazing how so much attitude can come from such a small creature."},
			dblhop(sonic),
			MessageBox {message="Sonic: I'll show you, small!"},
			Do(function()
				fleet.sprite:setAnimation("meeting_laugh")
			end),
			Animate(sally.sprite, "planning_irritated"),
			MessageBox {message="Sally: Sonic, {p20}stop!"},
			MessageBox {message="Sonic: Hmph! Whatever."},
			Animate(fleet.sprite, "meeting_idledown"),
			Animate(sally.sprite, "planning"),
			MessageBox {message="Sally: As I was saying..."},
			Animate(sally.sprite, "planning_smile"),
			MessageBox {message="Sally: I'm honored to welcome Commander Leon and his esteemed officers to our home!"},
			Animate(sally.sprite, "planning"),
			MessageBox {message="Sally: Oh, {p60}where is Leon?"},
			Animate(ivan.sprite, "meeting_idledown_attitude"),
			MessageBox {message="Ivan: He will be here shortly."},
			Animate(sally.sprite, "planning_smile"),
			MessageBox {message="Sally: That's fine. {p60}As, I was saying--{p60}I'm certain that if we unite our efforts to take down Robotnik, we will be unstoppable!"},
			Animate(ivan.sprite, "meeting_idledown"),
			AudioFade("music", 0.6, 0, 1),
			Animate(fleet.sprite, "meeting_lookright"),
			Animate(sally.sprite, "planning"),
			MessageBox {message="Fleet: Princess{p60}, with all due respect{p60}, the Rebellion is an elite military force, combining undoubtedly the smartest and strongest in all of\nMobius..."},
			MessageBox {message="Fleet: Meanwhile, the Freedom Fighters are...{p60} how do I put this?..."},
			PlayAudio("music", "tense2", 1.0, true, true),
			Animate(ivan.sprite, "meeting_idledown_attitude"),
			MessageBox {message="Ivan: Inexperienced?", closeAction=Wait(1)},
			Animate(logan.sprite, "meeting_idledown_attitude"),
			MessageBox {message="Logan: Incompetent?", closeAction=Wait(1)},
			Animate(fleet.sprite, "meeting_smirk"),
			MessageBox {message="Fleet: Right{p60}, inexperienced incompetent teenagers!"},
			Animate(sonic.sprite, "shock"),
			Animate(bunnie.sprite, "shock"),
			Animate(antoine.sprite, "shock"),
			Animate(rotor.sprite, "shock"),
			Animate(sally.sprite, "meeting_shock"),
			Wait(1.5),
			Animate(antoine.sprite, "sitlookforward"),
			Animate(sonic.sprite, "sitlookforward"),
			Animate(rotor.sprite, "sitright"),
			Animate(bunnie.sprite, "sitlookforward"),
			Animate(sally.sprite, "meeting_thinking"),
			MessageBox {message="Fleet: Point is, {p60}while I'm sure you \"Freedom Fighters\" have fun playing your little games..."},
			MessageBox {message="Fleet: ...maybe you should just let the grown ups take it from here."},
			Do(function()
				fleet.sprite:setAnimation("meeting_laugh")
			end),
			Animate(sally.sprite, "meeting_thinking3"),
			MessageBox {message="Sally: Excuse me?"},
			hop(antoine),
			MessageBox {message="Antoine: I have never been so insulted in all of my life!!"},
			hop(sonic),
			MessageBox {message="Sonic: Hey! {p60}We've been doing this for a long time, bird brain!"},
			MessageBox {message="Rotor: Yeah! We've been fighting Robotnik since we were kids!"},
			hop(bunnie),
			MessageBox {message="Bunnie: How do y'all call that \"inexperienced\"! {p60}How rude can ya get!?"},
			Animate(fleet.sprite, "meeting_smirk"),
			MessageBox {message="Fleet: Ok then."},
			Animate(fleet.sprite, "meeting_smirkright"),
			MessageBox {message="Fleet: Tell me, Princess... {p60}have you ever really come close to defeating Robotnik?"},
			Animate(sally.sprite, "meeting_thinking2"),
			MessageBox {message="Sally: Well no, but--"},
			MessageBox {message="Fleet: Have you taken back control over \"any\" part of the city?"},
			Animate(sally.sprite, "meeting_thinking"),
			MessageBox {message="Sally: No--"},
			MessageBox {message="Fleet: Surely, {p20}you've at least found the rightful ruler of Mobotropolis and safely brought him to Knothole Village-- {p60}your very own {h father}?"},
			Animate(sally.sprite, "meeting_sadleft"),
			MessageBox {message="Sally: ...I--"},
			Do(function()
				fleet.sprite:setAnimation("meeting_laugh")
			end),
			MessageBox {message="Fleet: Amazing, you've actually made my point for me!"},
			MessageBox {message="Fleet: Go on Princess, {p20}just admit it..."},
			Wait(1),
			AudioFade("music", 1, 0, 1),
			PlayAudio("sfx", "leonroar", 0.7, true),
			Animate(fleet.sprite, "meeting_shock"),
			MessageBox {message="That's enough!"},
			PlayAudio("music", "leonenters", 1.0, true),
			Parallel {
				Serial {
					MessageBox {message="Fleet: B-but--", closeAction=Wait(1)},
					Animate(sally.sprite, "meeting_idleleft"),
					MessageBox {message="Leon: It is precisely because the Freedom Fighters lack formal training..."},
					Animate(fleet.sprite, "meeting_idledown"),
					Animate(logan.sprite, "meeting_idledown"),
					Animate(ivan.sprite, "meeting_idledown"),
					MessageBox {message="Leon: ...and yet, have somehow become a formidable enough foe to Robotnik that he knows them by name..."},
					MessageBox {message="Leon: ...that they deserve out utmost respect."},
					MessageBox {message="Leon: I see no reason why they should cease operations."}
				},
				Serial {
					Move(leon, scene.objectLookup.LeonWaypoint, "walk"),
					Animate(leon.sprite, "idleright")
				}
			},
			Wait(1),
			PlayAudio("music", "standup", 0.9, true),
			Animate(sally.sprite, "meeting_thinking"),
			MessageBox {message="Sally: Look{p60}, we may not be trained military officers{p60}, but we've been fighting Robotnik most of our\nlives..."},
			MessageBox {message="Sally: We don't just have experience{p60}, it's defined who we are.{p60} And we're not going to stop fighting."},
			MessageBox {message="Leon: ...you really are your father's daughter."},
			MessageBox {message="Sally: Th-{p20}thank you Leon."},
			AudioFade("music", 1.0, 0.0, 0.5),
			Wait(1),
			Parallel {
				Ease(scene.camPos, "y", -180, 2),
				PlayAudio("sfx", "griffvehicle", 1.0, true),
				Serial {
					Move(griff, scene.objectLookup.GriffWaypoint),
					Ease(griff, "x", function() return griff.x - 5 end, 8),
					Ease(griff, "x", function() return griff.x + 3 end, 8),
					Ease(griff, "x", function() return griff.x - 2 end, 8),
					Ease(griff, "x", function() return griff.x + 1 end, 8)
				}
			},
			Wait(1.2),
			Animate(griff.sprite, "idleleft_lookup"),
			MessageBox {message="Griff: Sally--", closeAction=Wait(1)},
			Animate(sally.sprite, "planning"),
			MessageBox {message="Sally: --Griff?"},
			Ease(scene.camPos, "y", 0, 0.5),
			Animate(ivan.sprite, "meeting_idledown_attitude"),
			MessageBox {message="Ivan: What is a Griff?"},
			MessageBox {message="Sally: Uh- {p40}a fellow freedom fighter-"},
			Animate(ivan.sprite, "meeting_idledown"),
			Ease(scene.camPos, "y", -180, 0.5),
			MessageBox {message="Griff: I found something... {p60}Something big."},
			MessageBox {message="Griff: You guys need to see this."},
			Do(function()
				scene.player.cinematic = true
				sally:run(BlockPlayer {
					scene:fadeOut(0.2),
					Do(function()
						scene.camPos.y = 0
						griff.sprite:setAnimation("emptyleft")
						scene.objectLookup.GriffMtg2.hidden = false

						local gx = scene.objectLookup.GriffMtg2.x

						scene.objectLookup.GriffMtg2.x = sally.x - 3
						
						sally.sprite:setAnimation("meeting_idledown")
						sally.x = gx + 8
						ivan.x = ivan.x + 16
						
						leon.x = scene.objectLookup.RotorMtg.x - 40
						leon.y = scene.objectLookup.RotorMtg.y
						leon.sprite:setAnimation("idleright")
						
						scene.objectLookup.NicoleMtg.hidden = false
						scene.objectLookup.NicoleMtg.sprite.sortOrderY = 99999
					end),
					Wait(1),
					scene:fadeIn(0.5),
					MessageBox {message="Sally: Nicole{p60}, play file."},
					Animate(scene.objectLookup.NicoleMtg.sprite, "lit"),
					MessageBox {message="Nicole: Playing{p60}, Sally."},
					Do(function()
						scene.objectLookup.NicoleMtg.sprite:setAnimation("project")
						scene.objectLookup.ProjectionMtg.hidden = false
						scene.objectLookup.ProjectionMtg.sprite.sortOrderY = 99999
					end),
					Wait(1),
					PlayAudio("music", "project", 1.0, true, true),
					Do(function()
						scene.objectLookup.ProjectionMtg.sprite:setAnimation("face")
					end),
					Wait(1),
					hop(antoine),
					MessageBox {message="Antione: Eep! W-w-w-what is zat!?"},
					MessageBox {message="Griff: {h Project Firebird}."},
					hop(bunnie),
					MessageBox {message="Bunnie: Well ain't that just the stuff o' nightmares!"},
					Animate(ivan.sprite, "meeting_idledown_attitude"),
					MessageBox {message="Ivan: Elaboration is required."},
					MessageBox {message="Griff: ...{p60}who is this guy?"},
					hop(sonic),
					MessageBox {message="Sonic: It's a long story{p60}, just tell us what the heck that is!"},
					MessageBox {message="Griff: I must admit, I'm not entirely sure..."},
					MessageBox {message="Griff: ...all I can tell you is{p60}, if Robotnik finishes it{p60}, he could wipe out every living thing on the planet in a matter of days..."},
					Animate(sonic.sprite, "shock"),
					Animate(bunnie.sprite, "shock"),
					Animate(antoine.sprite, "shock"),
					Animate(rotor.sprite, "shock"),
					Animate(sally.sprite, "meeting_shock"),
					MessageBox {message="Antoine: *screams*", closeAction=Wait(1)},
					Animate(antoine.sprite, "sitlookforward"),
					Animate(sonic.sprite, "sitlookforward"),
					Animate(rotor.sprite, "sitright"),
					Animate(bunnie.sprite, "sitlookforward"),
					Animate(sally.sprite, "meeting_idledown"),
					hop(bunnie),
					MessageBox {message="Bunnie: Oh my stars!!"},
					MessageBox {message="Griff: There's a prototype being developed outside the city limits, in a top-secret location known as {h Iron Lock}."},
					Animate(sally.sprite, "meeting_thinking2"),
					MessageBox {message="Sally: Iron Lock?!"},
					MessageBox {message="Leon: The old prison complex?"},
					Animate(sally.sprite, "meeting_thinking"),
					MessageBox {message="Sally: We've been there before...{p60} I found a message from my father there."},
					MessageBox {message="Leon: The King?"},
					MessageBox {message="Sally: Yes...{p60}there was so much more I wanted to \ninvestigate...{p60} but our visit was cut short."},
					hop(sonic),
					MessageBox {message="Sonic: Yeah, thanks to ol' Robuttnik's monster machine."},
					MessageBox {message="Griff: Well don't expect this time to be much easier..."},
					MessageBox {message="Griff: ...reports say Robotnik's got this place locked down. {p60}Maximum security."},
					hop(sonic),
					MessageBox {message="Sonic: Mondo problemo{p60}, but what about our current\noperation?"},
					MessageBox {message="Sonic: Ya know{p60}, the {h computer virus} that could \nbring down Buttnik's whole army?"},
					MessageBox {message="Sally: This has to take precedence.{p60} We need to find out what Robotnik's got up his sleeve."},
					hop(sonic),
					MessageBox {message="Sonic: Ok. {p60}Then we break into Iron Lock{p60}, trash this porker{p60}, and get back to business!"},
					MessageBox {message="Sally: Agreed."},
					AudioFade("music", 1.0, 0.0, 1),
					Wait(1),
					Animate(sally.sprite, "planning_smile"),
					MessageBox {message="Sally: Well...{p80} I'd say that this is a great opportunity for our first joint mission!"},				
					PlayAudio("music", "royalwelcome", 0.6, true, true),
					hop(sonic),
					MessageBox {message="Sonic: Say wha?"},
					Animate(sally.sprite, "planning"),
					MessageBox {message="Sally: If Iron Lock is as dangerous as Griff says{p80}, and this project Robotnik is working on is really a planetary threat{p80}, we are going to have to put aside our differences and work together!"},
					MessageBox {message="Leon: That sounds like a wonderful idea."},
					MessageBox {message="Leon: Fleet, Logan, and Ivan, you will accompany Sally's away team."},
					hop(sonic),
					MessageBox {message="Sonic: The bird's comin? {p60}Oh brother."},
					-- annoyed
					Animate(fleet.sprite, "meeting_lookright"),
					MessageBox {message="Fleet: *mumbles* Great{p60}, countless years of training and I'm relegated to babysitting..."},
					
					MessageBox {message="Sally: Perfect!"},
					Animate(sally.sprite, "planning_smile"),
					MessageBox {message="Sally: Then it's settled...{p60} tomorrow{p60}, alongside the Rebellion{p60}, Sonic, Antoine, and I will return to Iron Lock!"},
					Animate(antoine.sprite, "shock"),
					MessageBox {message="Antoine: Me!?"},
					Animate(antoine.sprite, "nauseated"),
					Do(function()
						antoine.sprite.transform.ox = antoine.sprite.w/2
						antoine.sprite.transform.oy = antoine.sprite.h
						antoine.x = antoine.x + antoine.sprite.w
						antoine.y = antoine.y + antoine.sprite.h*2
					end),
					Ease(antoine.sprite.transform, "angle", math.pi/48, 2),
					Ease(antoine.sprite.transform, "angle", -math.pi/48, 2),
					Ease(antoine.sprite.transform, "angle", math.pi/48, 3),
					Ease(antoine.sprite.transform, "angle", -math.pi/48, 3),
					Animate(antoine.sprite, "dead"),
					
					Do(function()
						scene:changeScene{map="knotholeatnight"}
					end)
					
					-- faint
					
						--[[
						scene.player.sprite.visible = true
						scene.player.dropShadow.hidden = false
						
						sally.hidden = true
						rotor.hidden = true
						bunnie.hidden = true
						sonic.hidden = true
						antoine.hidden = true
						
						GameState:addToParty("bunny", 3, true)
						GameState.leader = "sonic"
						scene.player:updateSprite()
						
						local cart = scene.objectLookup.Cart
						scene.player.hidekeyhints[tostring(cart)] = cart
						
						scene.player.x = scene.objectLookup.CartWaypoint2.x + 64 - 50
						scene.player.y = scene.objectLookup.CartWaypoint2.y + 50 - 50
						
						local walkout, walkin, sprites = scene.player:split {
							GameState.party.sonic,
							GameState.party.bunny,
							GameState.party.sally
						}
						
						scene.player.x = scene.objectLookup.CartWaypoint2.x + 94
						scene.player.y = scene.objectLookup.CartWaypoint2.y + 50
						
						scene.player.cinematicStack = scene.player.cinematicStack + 1
						scene.player.cinematic = false
						
						scene.objectLookup.Bunnie:remove()
						scene.objectLookup.PestExample:remove()

						sonic:run(BlockPlayer {
							scene:fadeIn(0.5),
							Wait(0.5),
							walkout,
							Do(function()
								scene.audio:playMusic("knothole", 0.8)
							end),
							MessageBox{message="Sally: When you're both ready to go, we can just ride this pulley cart out of Knothole."},
							walkin
						})
						
					end)]]
				})
			end)
		}
	else
		knotholeIntro()
		return Action()
	end
end
