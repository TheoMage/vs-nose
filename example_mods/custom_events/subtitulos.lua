function onCreate()
    makeLuaText('nose', '', 0, 0, 550)
    setTextSize('nose', 32)
    setProperty('nose.alpha', 0)
    addLuaText('nose')
end

function onEvent(n,v1,v2)
    if n == 'subtitulos' then
        if v1 ~= '' and v2 == '' then
            setTextString('nose', v1)
            screenCenter('nose', 'X')
            doTweenAlpha('alphaNose', 'nose', 1, 0.5)
        elseif v2 == 'false' then
            doTweenAlpha('alphaNose', 'nose', 0, 0.5)
        end
    end
end

function onUpdate()
    setProperty('nose.scale.x', getProperty('iconP2.scale.x'))
    setProperty('nose.scale.y', getProperty('iconP2.scale.y'))
end