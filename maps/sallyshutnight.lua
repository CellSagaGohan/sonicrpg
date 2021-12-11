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
  nextobjectid = 19,
  properties = {
    ["battlebg"] = "../art/backgrounds/robotropolis1.png",
    ["onload"] = "actions/sallyhut.lua",
    ["regionName"] = "Sally's Hut"
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
      imageheight = 1170,
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
      tilecount = 1044,
      tiles = {}
    },
    {
      name = "forest",
      firstgid = 1045,
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
      firstgid = 4529,
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
    },
    {
      name = "knotholeindoors",
      firstgid = 8029,
      filename = "knotholeindoors.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../art/tiles/knotholeinterior.png",
      imagewidth = 1696,
      imageheight = 1088,
      transparentcolor = "#b326bd",
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
      tilecount = 1802,
      tiles = {}
    },
    {
      name = "darkswamp2",
      firstgid = 9831,
      filename = "darkswamp2.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../art/tiles/darkswamp2.png",
      imagewidth = 1090,
      imageheight = 1600,
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
      tilecount = 1700,
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
        0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 844, 845, 0, 0, 0, 0, 0, 0, 251, 252, 253, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 873, 874, 0, 0, 0, 0, 0, 0, 280, 281, 282, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 173, 0, 0, 0, 0, 0, 0, 168, 309, 310, 311, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 339, 340, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 367, 368, 369, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 396, 397, 398, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 425, 426, 427, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 255, 256, 257, 258, 259, 0, 0, 0, 0, 0, 366, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 284, 285, 286, 287, 288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 313, 314, 315, 316, 317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "computer",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 347, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 614, 615, 0, 0, 0, 817, 818, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 644, 0, 0, 0, 846, 847, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 875, 876, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          name = "BigChest",
          type = "BasicNPC",
          shape = "rectangle",
          x = 384,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["GreenLeaf"] = 1,
            ["align"] = "bottom_left",
            ["onInteract"] = "local BlockPlayer = require \"actions/BlockPlayer\"\nlocal MessageBox = require \"actions/MessageBox\"\nlocal Menu = require \"actions/Menu\"\nlocal Action = require \"actions/Action\"\nlocal Do = require \"actions/Do\"\n\nlocal Transform = require \"util/Transform\"\nlocal Layout = require \"util/Layout\"\n\nreturn function(self)\n    if GameState.leader == \"sonic\" then\n        return BlockPlayer {\n            MessageBox {message=\"Sonic: Locked. {p50}I wonder what's in there...\", textSpeed=4},\n            Do(function()\n                self:refreshKeyHint()\n            end)\n        }\n    elseif GameState.leader == \"sally\" then\n        return BlockPlayer {\n            MessageBox {message=\"Sally: ...\", textspeed=2},\n            Do(function()\n                self:refreshKeyHint()\n            end)\n        }\n    elseif GameState.leader == \"bunny\" then\n        return BlockPlayer {\n            MessageBox {message=\"Bunnie: My daddy taught me not to snoop.\", textspeed=2},\n            Do(function()\n                self:refreshKeyHint()\n            end)\n        }\n    end\n    return Action()\nend",
            ["onScan"] = "local BlockPlayer = require \"actions/BlockPlayer\"\nlocal MessageBox = require \"actions/MessageBox\"\n\nreturn function(self)\n    return BlockPlayer {\n        MessageBox {message=\"Nicole: I detect several personal effects within this chest, {p40}Sally.\"},\n        MessageBox {message=\"Nicole: Family pictures, {p40}royal garb, {p40}family heirlooms...\"},\n        MessageBox {message=\"Sally: That's enough Nicole.\"}\n    }\nend",
            ["sprite"] = "../art/sprites/bigchest.png"
          }
        },
        {
          id = 2,
          name = "Door",
          type = "Door",
          shape = "rectangle",
          x = 352,
          y = 608,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["alignOffsetX"] = -20,
            ["alignOffsetY"] = -32,
            ["ghost"] = true,
            ["key"] = "down",
            ["orientation"] = "up",
            ["scene"] = "knothole.lua",
            ["spawn_point"] = "SallyHutDoor",
            ["spawn_point_offset_x"] = 16,
            ["spawn_point_offset_y"] = 40,
            ["sprite"] = "../art/sprites/hutdoor.png"
          }
        },
        {
          id = 4,
          name = "SallysBed",
          type = "BasicNPC",
          shape = "rectangle",
          x = 192,
          y = 384,
          width = 192,
          height = 64,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["alignOffsetX"] = 8,
            ["ghost"] = true,
            ["onScan"] = "local BlockPlayer = require \"actions/BlockPlayer\"\nlocal MessageBox = require \"actions/MessageBox\"\n\nreturn function(self)\n    return BlockPlayer {\n        MessageBox {message=\"Nicole: This is your bed, {p40}Sally.\"},\n        MessageBox {message=\"Nicole: ...{p40}are you tired, or something?\"}\n    }\nend",
            ["sprite"] = "../art/sprites/sallybed.png"
          }
        },
        {
          id = 5,
          name = "SallysBookshelf",
          type = "BasicNPC",
          shape = "rectangle",
          x = 512,
          y = 512,
          width = 64,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["onInteract"] = "local BlockPlayer = require \"actions/BlockPlayer\"\nlocal MessageBox = require \"actions/MessageBox\"\nlocal Menu = require \"actions/Menu\"\nlocal Do = require \"actions/Do\"\nlocal Action = require \"actions/Action\"\n\nlocal Transform = require \"util/Transform\"\nlocal Layout = require \"util/Layout\"\n\nreturn function(self)\n    if GameState.leader == \"sonic\" then\n        return BlockPlayer {\n            MessageBox {message=\"Sonic: Sal's science textbooks... {p50}Boooring.\", textSpeed=4},\n            Do(function() self:refreshKeyHint() end)\n        }\n    elseif GameState.leader == \"sally\" then\n        return BlockPlayer {\n            MessageBox {message=\"Sally: I haven't read some of these in quite awhile... {p40}! {p20}'The adventures of Windom'! {p20}I remember my father reading this to me.\"},\n            MessageBox {message=\"Sally: Maybe I could read it to Tails.\"},\n            Do(function() self:refreshKeyHint() end)\n        }\n    elseif GameState.leader == \"bunny\" then\n        return BlockPlayer {\n            MessageBox {message=\"Bunnie: My goodness, {p40}that Sally-girl sure is a book worm!\"},\n            Do(function() self:refreshKeyHint() end)\n        }\n    end\n    return Action()\nend",
            ["onScan"] = "local BlockPlayer = require \"actions/BlockPlayer\"\nlocal Do = require \"actions/Do\"\nlocal MessageBox = require \"actions/MessageBox\"\n\nreturn function(self)\n    return BlockPlayer {\n        MessageBox {message=\"Nicole: I am detecting a great deal of dust, {p40}Sally.\"},\n        Do(function()\n            self.scene.player.noIdle = true\n            self.scene.player.state = \"thinking\"\n        end),\n        MessageBox {message=\"Sally: Ha, {p40}ha. {p60}Very funny, Nicole.\"},\n        Do(function()\n            self.scene.player.state = \"thinking2\"\n        end),\n        MessageBox {message=\"Sally: I guess I haven't had much time to read recently...\", textspeed=2},\n        Do(function()\n            self.scene.player.noIdle = false\n        end)\n    }\nend",
            ["sprite"] = "../art/sprites/sallybookshelf.png"
          }
        },
        {
          id = 7,
          name = "SallysStool",
          type = "BasicNPC",
          shape = "rectangle",
          x = 512,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["ghost"] = true,
            ["onInteract"] = "local Serial = require \"actions/Serial\"\nlocal Parallel = require \"actions/Parallel\"\nlocal MessageBox = require \"actions/MessageBox\"\nlocal Menu = require \"actions/Menu\"\nlocal Action = require \"actions/Action\"\nlocal Wait = require \"actions/Wait\"\nlocal BlockPlayer = require \"actions/BlockPlayer\"\nlocal DescBox = require \"actions/DescBox\"\nlocal Do = require \"actions/Do\"\nlocal PlayAudio = require \"actions/PlayAudio\"\nlocal YieldUntil = require \"actions/YieldUntil\"\n\nlocal Transform = require \"util/Transform\"\nlocal Layout = require \"util/Layout\"\n\nreturn function(self)\n    self.menuClosing = false\n    local descBox = MessageBox{\n        message=\"Computer: What would you like to do?\",\n        noPressX = true,\n        closeAction = YieldUntil(self, \"menuClosing\")\n    }\n    return BlockPlayer {\n        PlayAudio(\"sfx\", \"nicolebeep\", 1.0, true),\n        Parallel {\n            descBox,\n            Serial {\n                Wait(1),\n                Menu {\n                    layout = Layout {\n                        {Layout.Text(\"Practice fighting\"), choose = function(menu)\n                            local fightMenuOpts = {{Layout.Text(\"Which boss?\"), selectable = false}}\n                            local bots = {\"rover\"}\n                            for _, name in pairs(bots) do\n                                local bot = require (\"data/monsters/\"..name)\n                                table.insert(fightMenuOpts, {Layout.Text(bot.name), choose = function(menu2)\n                                    self.scene:run {\n                                        Menu {\n                                            layout = Layout {\n                                                {Layout.Text(\"Fight \"..bot.name..\"?\"), selectable = false},\n                                                {Layout.Text(\"Yes\"), choose = function(menu3)\n                                                    menu:close()\n                                                    menu2:close()\n                                                    menu3:close()\n                                                    self.menuClosing = true\n                                                    self.scene:run {\n                                                        menu3,\n                                                        menu2,\n                                                        menu,\n                                                        descBox,\n                                                        self.scene:enterBattle {\n                                                            opponents = {name},\n                                                            music = \"boss\",\n                                                            bossBattle = true,\n                                                            practice = true\n                                                        },\n                                                        MessageBox{message=\"Computer: Fighting simulation complete.\", blocking = true},\n                                                        -- Hack to fix bug returning from battle\n                                                        Do(function()\n                                                            self.scene.player.cinematicStack = 1\n                                                        end)\n                                                    }\n                                                end},\n                                                {Layout.Text(\"No\"), choose = function(menu3)\n                                                    menu3:close()\n                                                end}\n                                            },\n                                            cancellable = true,\n                                            transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2+30),\n                                            selectedRow = 2\n                                        }\n                                    }\n                                end})\n                            end\n                            self.scene:run {\n                                Parallel {menu,\n                                Menu {\n                                    layout = Layout(fightMenuOpts),\n                                    cancellable = true,\n                                    transform = Transform(love.graphics.getWidth()/2 + 200, love.graphics.getHeight()/2 + 30),\n                                    selectedRow = 2\n                                }}\n                            }\n                        end, desc = \"Practice fighting against past bosses.\"},\n                        {Layout.Text(\"Practice sneaking\"), choose = function(menu)\n                            self.scene:run {\n                                Parallel {menu,\n                                Menu {\n                                    layout = Layout {\n                                        {Layout.Text(\"Are you sure?\"), selectable = false},\n                                        {Layout.Text(\"Yes\"), choose = function(menu2)\n                                            menu:close()\n                                            menu2:close()\n                                            self.menuClosing = true\n                                            self.scene:run {\n                                                menu2,\n                                                menu,\n                                                descBox,\n                                                Do(function()\n                                                    self.scene.audio:stopMusic()\n                                                    self.scene:changeScene{map=\"stealthtut1\", tutorial=true}\n                                                end),\n                                                MessageBox {\n                                                    message = \"Computer: Stealth simulation complete.\",\n                                                    blocking = true\n                                                },\n                                                -- Hack to fix bug returning from battle\n                                                Do(function()\n                                                    self.scene.player.cinematicStack = 1\n                                                end)\n                                            }\n                                        end},\n                                        {Layout.Text(\"No\"), choose = function(menu2)\n                                            menu2:close()\n                                        end}\n                                    },\n                                    cancellable = true,\n                                    transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2+30),\n                                    selectedRow = 2\n                                }}\n                            }\n                        end, desc = \"Fighting isn't the only option.\"},\n                        {Layout.Text(\"Give me a hint\"), choose = function(menu)\n                            menu:close()\n                            self.menuClosing = true\n                            local msg = \"\"\n                            if not GameState:isFlagSet(\"rotorreveal_done\") then\n                                msg = \"Rotor's locked himself in his workshop for quite awhile, hasn't he?\"\n                            else\n                                msg = \"You're still here?? {p60}Shouldn't you be at the Death Egg right now?\"\n                            end\n\n                            self.scene:run {\n                                menu,\n                                descBox,\n                                MessageBox {\n                                    message = \"Computer: \"..msg,\n                                    blocking = true,\n                                    textSpeed = 4\n                                }\n                            }\n                        end, desc = \"Forgot what you were supposed to be doing?\"}\n                    },\n                    cancellable = true,\n                    withClose = Do(function() descBox:close() end),\n                    transform = Transform(love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 30)\n                }\n            }\n        },\n        Do(function()\n            self:refreshKeyHint()\n        end)\n    }\nend",
            ["sprite"] = "../art/sprites/stool.png"
          }
        },
        {
          id = 8,
          name = "DeskUpper",
          type = "BasicNPC",
          shape = "rectangle",
          x = 512,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["nocollision"] = true,
            ["sprite"] = "../art/sprites/sallycomputerdeskupper.png"
          }
        },
        {
          id = 9,
          name = "DeskLower",
          type = "BasicNPC",
          shape = "rectangle",
          x = 544,
          y = 384,
          width = 32,
          height = 64,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["nocollision"] = true,
            ["sprite"] = "../art/sprites/sallycomputerdesklower.png"
          }
        },
        {
          id = 14,
          name = "Spawn 1",
          type = "Player",
          shape = "rectangle",
          x = 384,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 4565,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "SallyPensive",
          type = "BasicNPC",
          shape = "rectangle",
          x = 384,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["defaultAnim"] = "idleup",
            ["ignoreMapCollision"] = true,
            ["sprite"] = "../art/sprites/sally.png"
          }
        },
        {
          id = 16,
          name = "Waypoint2",
          type = "BasicNPC",
          shape = "rectangle",
          x = 576,
          y = 246,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["ghost"] = true
          }
        },
        {
          id = 17,
          name = "SallySad",
          type = "BasicNPC",
          shape = "rectangle",
          x = 256,
          y = 416,
          width = 32,
          height = 64,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["align"] = "bottom_left",
            ["alignOffsetY"] = -32,
            ["defaultAnim"] = "sit_sad",
            ["sprite"] = "../art/sprites/sally.png"
          }
        },
        {
          id = 18,
          name = "Waypoint1",
          type = "BasicNPC",
          shape = "rectangle",
          x = 384,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 6839,
          visible = true,
          properties = {
            ["ghost"] = true
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "top",
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
        0, 0, 0, 0, 0, 83, 84, 85, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 112, 113, 114, 612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 141, 142, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 170, 171, 172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 199, 200, 201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 228, 229, 230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
      type = "tilelayer",
      name = "shadow",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 0.3,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936,
        6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936, 6936
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119, 119, 0, 0, 0, 0, 0,
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
      type = "tilelayer",
      name = "BunnyExtCollision",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
    }
  }
}
