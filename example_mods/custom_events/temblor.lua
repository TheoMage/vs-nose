x = 0
y = 0
temblor = false
function onEvent(n, v1, v2)
    if n == 'temblor' then
        if v2 ~= 'false' then
            x = getPropertyFromClass('openfl.Lib','application.window.x')
            y = getPropertyFromClass('openfl.Lib','application.window.y')
            temblor = true
        else
            temblor = false
        end
    end
end

function onUpdate()
    if temblor then
        setPropertyFromClass('openfl.Lib','application.window.x', x + getRandomInt(15, -15))
        setPropertyFromClass('openfl.Lib','application.window.y', y + getRandomInt(15, -15)) 
    end
end