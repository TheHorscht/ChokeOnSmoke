local _ = require "name-uniquifier"

data:extend({
    {
        type = "double-setting",
        name = _("multiplier"),
        setting_type = "startup",
        minimum_value = 0.1,
        maximum_value = 100.0,
        default_value = 1.0
    }
})