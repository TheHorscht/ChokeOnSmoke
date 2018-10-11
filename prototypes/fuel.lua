local _ = require "name-uniquifier"

-- Define a new fluid type that never gets used except as an icon for ALT mode,
-- to show that "pollution" is being "crafted"
local pollution = table.deepcopy(data.raw.fluid.steam)
pollution.name = _("pollution")
pollution.icon = "__choke-on-smoke__/graphics/icons/fluid/pollution.png"
pollution.icon_size = 32
data:extend{pollution}

-- Converts a string like "225MJ" to a number which represents the megajoules
-- 2MJ wooden chest nuclear fuel 1.21GJ
function parse_joule_string_to_mjs(joule_str)
  local amount, unit = string.match(joule_str, "^(.+)([kKMGTPEZY]J)$")
  amount = tonumber(amount)
  if amount == nil or unit == nil then
    return nil
  end
  local powers_of_ten = {
    kJ = -3, KJ = -3,
    MJ = 0,
    GJ = 3,
    TJ = 6,
    PJ = 9,
    EJ = 12,
    ZJ = 15,
    YJ = 18,
  }
  amount = amount * 1 * 10^powers_of_ten[unit]
  return amount
end

-- Make everything thats fuel burnable in our special furnace
for k,v in pairs(data.raw.item) do
  if v.fuel_category == "chemical" then
    log(v.name ..": fuel_value parsed = ".. parse_joule_string_to_mjs(v.fuel_value))
    log(v.name ..": energy_required = ".. (1 * parse_joule_string_to_mjs(v.fuel_value)))
    data:extend{
      {
        type = "recipe",
        name = _(v.name.."-to-smoke"),
        category = _("fuel"),
        energy_required = 1 * parse_joule_string_to_mjs(v.fuel_value),
        emissions_multiplier = 1,
        hide_from_stats = true,
        hidden = true,
        ingredients = {{v.name, 1}},
        results = {{ type="fluid", name=_("pollution"), amount=0}}
      }
    }
  end
end