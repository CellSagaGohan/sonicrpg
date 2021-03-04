return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.5",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 20,
  properties = {
    ["onload"] = "actions/knotholehut.lua",
    ["regionName"] = "Sonic's Room"
  },
  tilesets = {
    {
      name = "knotholehut",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../art/tiles/knotholehutinterior.png",
      imagewidth = 950,
      imageheight = 914,
      transparentcolor = "#000000",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 812,
      tiles = {}
    },
    {
      name = "forest",
      firstgid = 813,
      filename = "knothole.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../art/tiles/knotholeexterior.png",
      imagewidth = 1664,
      imageheight = 2144,
      transparentcolor = "#b326c3",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 3484,
      tiles = {}
    },
    {
      name = "robotropolis",
      firstgid = 4297,
      filename = "robotropolis.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../art/tiles/robotropolis2.png",
      imagewidth = 1120,
      imageheight = 3200,
      transparentcolor = "#000000",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 3500,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "floor",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "above",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 467, 468, 469, 470, 471, 472, 0, 137, 138, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 496, 497, 498, 188, 189, 190, 0, 166, 167, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 525, 526, 527, 217, 218, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 554, 555, 556, 246, 247, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 583, 584, 585, 275, 276, 277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 17, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 44, 45, 46, 47, 48, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74, 75, 76, 77, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 102, 103, 104, 105, 106, 107, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 130, 131, 132, 133, 134, 135, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 159, 160, 161, 162, 163, 164, 165, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "above2",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 195, 196, 0, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 224, 225, 0, 0, 0, 0, 0, 0, 0, 0, 193, 194, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, 223, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "Chest1",
          type = "Chest",
          shape = "rectangle",
          x = 544,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["GreenLeaf"] = 1,
            ["sprite"] = "../art/sprites/chest.png"
          }
        },
        {
          id = 3,
          name = "Spawn 1",
          type = "Player",
          shape = "rectangle",
          x = 416,
          y = 448,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 4333,
          visible = true,
          properties = {
            ["orientation"] = "up"
          }
        },
        {
          id = 4,
          name = "Door",
          type = "Door",
          shape = "rectangle",
          x = 352,
          y = 608,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["alignOffsetX"] = -20,
            ["alignOffsetY"] = -32,
            ["ghost"] = true,
            ["key"] = "down",
            ["orientation"] = "up",
            ["scene"] = "knothole.lua",
            ["spawn_point"] = "SonicHutDoor",
            ["sprite"] = "../art/sprites/hutdoor.png"
          }
        },
        {
          id = 5,
          name = "Photo",
          type = "BasicNPC",
          shape = "rectangle",
          x = 512,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["ghost"] = true,
            ["onInteract"] = "local Serial = require \"actions/Serial\"\nlocal MessageBox = require \"actions/MessageBox\"\nlocal Ease = require \"actions/Ease\"\nlocal Do = require \"actions/Do\"\n\nlocal SpriteNode = require \"object/SpriteNode\"\nlocal Transform = require \"util/Transform\"\nlocal Rect = unpack(require \"util/Shapes\")\n\nreturn function(self)\n    local pic = SpriteNode(self.scene, Transform(0,0,1,1), {255,255,255,0}, \"splash/sonicpicture\", nil, nil, \"ui\")\n\n    local w = (love.graphics.getWidth() - 10)\n    local h = 160\n    local rect = Rect(Transform(love.graphics.getWidth() / 2, h/2), w, h)\n\n    return Serial {\n        Ease(pic.color, 4, 255, 1, \"linear\"),\n        MessageBox {\n            message = \"Sonic: Uncle Chuck and Muttski...\",\n            textSpeed = 3,\n            rect = rect,\n            blocking = true\n        },\n        MessageBox {\n            message = \"Sonic: Don't worry guys, {p40}I'll save ya one of these days.\",\n            rect = rect,\n            blocking = true\n        },\n        Ease(pic.color, 4, 0, 1, \"linear\"),\n        Do(function() pic:remove() end)\n    }\nend"
          }
        },
        {
          id = 7,
          name = "Guitar",
          type = "BasicNPC",
          shape = "rectangle",
          x = 224,
          y = 320,
          width = 64,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["ghost"] = true,
            ["onInteract"] = "local Serial = require \"actions/Serial\"\nlocal MessageBox = require \"actions/MessageBox\"\nlocal Ease = require \"actions/Ease\"\nlocal Do = require \"actions/Do\"\nlocal Menu = require \"actions/Menu\"\nlocal PlayAudio = require \"actions/PlayAudio\"\n\nlocal Transform = require \"util/Transform\"\nlocal Layout = require \"util/Layout\"\n\nreturn function(self)\n    return Menu {\n        layout = Layout {\n            {Layout.Text(\"Play guitar?\"), selectable = false},\n            {Layout.Text(\"Yes\"), choose = function(menu)\n                menu:close()\n                self.scene:run {\n                    menu,\n                    MessageBox {\n                        message = \"Sonic: Eh, {p40}a little heavy metal isn't the worst way to start the morning...\",\n                        blocking = true\n                    },\n                    PlayAudio(\"music\", \"sonicguitar\", 1.0),\n                    MessageBox {\n                        message = \"Sonic: Way past cool! {p40}I need to play this thing more.\",\n                        blocking = true\n                    },\n                    PlayAudio(\"music\", \"knotholehut\", 1.0, true),\n                }\n            end},\n            {Layout.Text(\"No\"), choose = function(menu) menu:close() end},\n        },\n        cancellable = true,\n        transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 30),\n        selectedRow = 2,\n        blocking = true\n    }\nend"
          }
        },
        {
          id = 11,
          name = "Brightness",
          type = "BasicNPC",
          shape = "rectangle",
          x = 320,
          y = 288,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 6628,
          visible = true,
          properties = {
            ["ghost"] = true,
            ["notColliding"] = "return function(self, player)\n    player.lights[tostring(self)] = nil\nend",
            ["whileColliding"] = "return function(self, player)\n    player.lights[tostring(self)] = true\nend"
          }
        },
        {
          id = 12,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 224,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "tall",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 13,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 192,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "tall",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 14,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 224,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "tall",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 15,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 192,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "tall",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 16,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 544,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "short",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 17,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 576,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "short",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 18,
          name = "Pot",
          type = "BasicNPC",
          shape = "rectangle",
          x = 544,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "plant",
            ["ghost"] = true,
            ["sprite"] = "../art/sprites/pot.png"
          }
        },
        {
          id = 19,
          name = "AlarmClock",
          type = "BasicNPC",
          shape = "rectangle",
          x = 320,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6607,
          visible = true,
          properties = {
            ["ghost"] = true,
            ["onInteract"] = "local Serial = require \"actions/Serial\"\nlocal Parallel = require \"actions/Parallel\"\nlocal Do = require \"actions/Do\"\nlocal Animate = require \"actions/Animate\"\nlocal MessageBox = require \"actions/MessageBox\"\n\nreturn function(self)\n    return Serial {\n        Do(function()\n            self.scene.player.cinematicStack = self.scene.player.cinematicStack + 1\n            self.scene.player.noIdle = true\n        end),\n        MessageBox {\n            message = \"Sonic: Ugh. {p40}I can't believe Sal is making us use these alarm clocks...\"\n        },\n        Parallel {\n            Animate(self.scene.player.sprite, \"irritated\", true),\n            MessageBox {\n                message = \"Sonic: Doesn't she know that a hedgehog needs his beauty sleep?!\"\n            }\n        },\n        Do(function()\n            self.scene.player.cinematicStack = self.scene.player.cinematicStack - 1\n            self.scene.player.noIdle = false\n            self.scene.player.state = \"idledown\"\n            self.scene.player.hidekeyhints[tostring(self)] = nil\n        end)\n    }\nend"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "Collision",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
