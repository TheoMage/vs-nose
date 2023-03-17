hola = 0
sumar = 0
restar = 0
sisi = 0
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

    setShaderBool('vcr', 'vignetteOn', true)
    setShaderBool('vcr', 'perspectiveOn', true)
    setShaderBool('vcr', 'distortionOn', true)
    setShaderBool('vcr', 'scanlinesOn', true)
    setShaderBool('vcr', 'vignetteMoving', true)
    
    runHaxeCode([[
        var camGameShaders:Array<ShaderEffect> = [];

            camGameShaders.push(game.getLuaObject("theomagshader").shader);
            var newCamEffects:Array<BitmapFilter> = []; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
            var newCamEffectsHUD:Array<BitmapFilter> = [];

            for(i in camGameShaders){
                newCamEffectsHUD.push(new ShaderFilter(game.getLuaObject("vcr").shader));
                newCamEffects.push(new ShaderFilter(game.getLuaObject("vcr").shader));
            }

            game.camGame.setFilters(newCamEffects);
            game.camHUD.setFilters(newCamEffectsHUD);
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
    sisi = sisi + 0.01
    setShaderFloat('vcr', 'iTime', sisi)

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