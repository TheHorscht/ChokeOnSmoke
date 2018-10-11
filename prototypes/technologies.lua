data:extend{
  {
      type = "technology",
      name = "oil-burner",
      icon_size = 128,
      icon = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
      effects =
      {
        {
          type = "nothing"
        }
      },
      prerequisites = {"military-2", "advanced-electronics"},
      unit =
      {
        count_formula = "L*200",
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
          {"science-pack-3", 1},
          {"military-science-pack", 1},
        },
        time = 30
      },
      order = "-aaa"
  },
}