local _ = require "name-uniquifier"

function register_commands()
    commands.add_command("every", "Beep", function(e)
        for k,v in pairs(game.player.force.recipes) do
            if v.category == _("fuel") then
              game.player.insert{name=v.ingredients[1].name, count=10}
            end
          end
    end)
end
register_commands()