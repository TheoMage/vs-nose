function onCreate()
    --addIconOffset('iconP1', 'idle', 0, 450)
end

function onCreatePost()
    runHaxeCode([[
        game.iconP1.changeIcon(game.dad.curCharacter, true, true, 24);
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

function onUpdatePost()
    runHaxeCode([[
        if (game.iconP1.animation.curAnim.name == 'idle')
            game.iconP1.offset.set(-8,-25);
        else if (game.iconP1.animation.curAnim.name == 'losing')
            game.iconP1.offset.set(0,0);
        end
    ]])
end