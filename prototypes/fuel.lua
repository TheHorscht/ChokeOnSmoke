local _ = require "name-uniquifier"

-- Define a new fluid type that never gets used except as an icon for ALT mode,
-- to show that "pollution" is being "crafted"
local pollution = table.deepcopy(data.raw.fluid.steam)
pollution.name = _("pollution")
pollution.icon = "__choke-on-smoke__/graphics/icons/fluid/pollution.png"
pollution.icon_size = 32
data:extend{pollution}

-- Make everything thats fuel burnable in our special furnace
for k,v in pairs(data.raw.item) do
  if v.fuel_category == "chemical" then
    data:extend{
      {
        type = "recipe",
        name = _(v.name.."-to-smoke"),
        category = _("fuel"),
        energy_required = 5,
        emissions_multiplier = 1,
        hide_from_stats = true,
        hidden = true,
        ingredients = {{v.name, 1}},
        results = {{ type="fluid", name=_("pollution"), amount=0}}
      }
    }
  end
end