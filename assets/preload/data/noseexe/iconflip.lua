function onCreatePost()
    runHaxeCode([[
        game.iconP1.changeIcon(game.dad.curCharacter);
        game.iconP2.changeIcon(game.boyfriend.curCharacter);
    ]])

    setProperty('healthGain', -1)
    setProperty('healthLoss', -1)
end

function onUpdate()
    if getHealth() < 0.01 then
        setHealth(0.01)
    end

    if getHealth() >= 1.99 then
        setHealth(0)
    end
end

function onEvent(n,v1,v2)
    if n == 'Change Character' then
        runHaxeCode([[
            game.iconP1.changeIcon(game.dad.curCharacter);
            game.iconP2.changeIcon(game.boyfriend.curCharacter);
        ]])
    end
end