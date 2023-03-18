iconOffset = 37

function onCreate()
    makeLuaSprite('bar', 'empty', 0, 0)
    addLuaSprite('bar')
    setProperty('bar.visible', false)

    makeLuaSprite('lentes', 'nose/lentes', 0, 580)
    setObjectOrder('lentes', getObjectOrder('iconP2') + 1)
    setObjectCamera('lentes', 'camHUD')
    setProperty('lentes.alpha', 0)
    setProperty('lentes.flipX', true)
    addLuaSprite('lentes')
end

function onCreatePost()
end

function onUpdatePost()
    setProperty('songLength', getRandomInt(200000, 500000))
    setProperty('songPercent', getProperty('bar.x'))
    --setProperty('lentes.scale.x', getProperty('iconP2.scale.x'))
    --setProperty('lentes.scale.y', getProperty('iconP2.scale.y'))
end

function onUpdate()
    --setProperty('lentes.x', getProperty('iconP2.x') + 126)
    --setProperty('songPercent', getProperty('bar.x'))
end

function onBeatHit()
    setProperty('bar.x', 1)
    doTweenX('barX', 'bar', 0, (stepCrochet / 1000) * 4, 'quadOut')
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function onEvent(n,v1,v2)
    if n == 'nerd' then
        if v1 == 'true' then
            doTweenY('lentesY', 'lentes', 623, 0.25, 'sineInOut')
            doTweenAlpha('lentesA', 'lentes', 1, 0.25, 'sineInOut')
        elseif v1 == 'false' then
            doTweenY('lentesY', 'lentes', 580, 0.25, 'sineInOut')
            doTweenAlpha('lentesA', 'lentes', 0, 0.25, 'sineInOut')
        end
    end
end