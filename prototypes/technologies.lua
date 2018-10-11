local _ = require "name-uniquifier"

data:extend{
  {
      type = "technology",
      name = _("furnace"),
      icon_size = 128,
      icon = "__choke-on-smoke__/graphics/technology/furnace.png",
      effects =
      {
        {
          type  = "unlock-recipe",
          recipe = _("furnace")
        }
      },
      unit =
      {
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1}
        },
        time = 30,
        count = 200
      },
      order = "-aaa"
  },
  {
    type = "recipe",
    name = _("furnace"),
    result = _("furnace"),
    enabled = false,
    energy_required = 3,
    ingredients = {
      {"steel-plate", 50},
      {"stone-brick", 50},
    },
  },
}