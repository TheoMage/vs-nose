function onCreate()
    makeLuaText('nose', '', 0, 0, 550)
    setTextSize('nose', 32)
    setProperty('nose.alpha', 0)
    setObjectCamera('nose', 'camOther')
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

function onUpdate(elapsed)
    multx = lerp(1, getProperty('nose.scale.x'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1));
    multy = lerp(1, getProperty('nose.scale.y'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1));

    setProperty('nose.scale.x', multx)
    setProperty('nose.scale.y', multy)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('nose.scale.x', 1.1)
        setProperty('nose.scale.y', 0.9)
    elseif curBeat % 2 == 1 then
        setProperty('nose.scale.x', 0.9)
        setProperty('nose.scale.y', 1.1)
    end
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end