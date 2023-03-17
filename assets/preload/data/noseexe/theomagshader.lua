hola = 0
sumar = 0
restar = 0
empezar = false

terminar = false

function onCreatePost()
    initLuaShader("theomagshader")

    makeLuaSprite("theomagshader")
    makeGraphic("theomagshader", screenWidth, screenHeight)

    setSpriteShader("theomagshader", "theomagshader")

    initLuaShader("vcr")

    makeLuaSprite("vcr")
    makeGraphic("vcr", screenWidth, screenHeight)

    setSpriteShader("vcr", "vcr")

    runHaxeCode([[
        var camGameShaders:Array<ShaderEffect> = [];

            camGameShaders.push(game.getLuaObject("vcr").shader);
            var newCamEffects:Array<BitmapFilter> = []; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
            for(i in camGameShaders){
                newCamEffects.push(new ShaderFilter(game.getLuaObject("vcr").shader));
                newCamEffects.push(new ShaderFilter(game.getLuaObject("theomagshader").shader));
            }

            game.camGame.setFilters(newCamEffects);
            //game.camHUD.setFilters(newCamEffects);
            //game.camOther.setFilters(newCamEffects);
    ]])
end

function onEvent(n,v1,v2)
    if n == 'aparecershader' then
        if v1 == 'true' then
            sumar = v2
            empezar = true
            terminar = false
        elseif v1 == 'false' then
            restar = v2
            empezar = false
            terminar = true
        elseif v1 == 'stop' then
            empezar = false
            terminar = false
        end
    end
end

function onUpdate()
    if empezar then
        hola = hola + sumar
        setShaderFloat('theomagshader', 'distort', hola)
    end

    if terminar then
        hola = hola - restar
        setShaderFloat('theomagshader', 'distort', hola)
        if hola <= 0 then
            terminar = false
        end
    end
end