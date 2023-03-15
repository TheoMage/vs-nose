function onCreatePost()
    runHaxeCode([[
        game.iconP1.changeIcon(game.dad.curCharacter);
        game.iconP2.changeIcon(game.boyfriend.curCharacter);
    ]])
end