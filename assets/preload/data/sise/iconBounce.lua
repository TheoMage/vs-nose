iconOffset = 26

function onCreatePost()
    makeLuaSprite('scaleP1', 'empty', 0, 0)
    addLuaSprite('scaleP1')
    setProperty('scaleP1.visible', false)

    makeLuaSprite('scaleP2', 'empty', 0, 0)
    addLuaSprite('scaleP2')
    setProperty('scaleP2.visible', false)
end

function onUpdatePost(elapsed)
    multx = lerp(1, getProperty('scaleP1.scale.x'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1));
    multy = lerp(1, getProperty('scaleP1.scale.y'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1));
    multa = lerp(1, getProperty('scaleP1.angle'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1));

    setProperty('scaleP1.scale.x', multx)
    setProperty('scaleP1.scale.y', multy)
    setProperty('scaleP1.angle', multa)

    setProperty('iconP1.scale.x', getProperty('scaleP1.scale.x'))
    setProperty('iconP1.scale.y', getProperty('scaleP1.scale.y'))
    setProperty('iconP1.angle', getProperty('scaleP1.angle'))

    multx = lerp(1, getProperty('scaleP2.scale.x'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
    multy = lerp(1, getProperty('scaleP2.scale.y'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
    multa = lerp(1, getProperty('scaleP2.angle'), boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))

    setProperty('scaleP2.scale.x', multx)
    setProperty('scaleP2.scale.y', multy)
    setProperty('scaleP2.angle', multa)

    setProperty('iconP2.scale.x', getProperty('scaleP2.scale.x'))
    setProperty('iconP2.scale.y', getProperty('scaleP2.scale.y'))
    setProperty('iconP2.angle', getProperty('scaleP2.angle'))

    setProperty('iconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) + (150 * getProperty('scaleP1.scale.x') - 150) / 2 - iconOffset)
    setProperty('iconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) - (150 * getProperty('scaleP2.scale.x')) / 2 - iconOffset * 2)

    if getProperty('healthBar.percent') < 20 then
        --setProperty('scaleP1.angle', getRandomFloat(5, -5))
    end

    if getProperty('healthBar.percent') > 80 then
        setProperty('scaleP2.angle', getRandomFloat(5, -5))
    end
end

function onStepHit()
    valorganando1 = 1.2
    valorganando2 = 0.8

    valorperdiendo1 = 1.5
    valorperdiendo2 = 0.5

    angle = 10

    --if getProperty('healthBar.percent') > 20 then
        if curStep % 8 == 0 then
            setProperty('scaleP1.angle', angle)
            setProperty('scaleP1.scale.x', 1.2)
            setProperty('scaleP1.scale.y', 0.8)
        elseif curStep % 8 == 4 then
            setProperty('scaleP1.angle', -angle)
            setProperty('scaleP1.scale.x', 0.8)
            setProperty('scaleP1.scale.y', 1.2)
        end
    --end
        --if curStep % 2 == 0 then
            --setProperty('scaleP1.angle', angle)
            --setProperty('scaleP1.scale.x', 1.2)
            --setProperty('scaleP1.scale.y', 0.8)
        --elseif curStep % 2 == 1 then
            --setProperty('scaleP1.angle', -angle)
            --setProperty('scaleP1.scale.x', 0.8)
            --setProperty('scaleP1.scale.y', 1.2)
       --end
    --end

    if getProperty('healthBar.percent') < 80 then
        if curStep % 8 == 0 then
            setProperty('scaleP2.angle', angle)
            setProperty('scaleP2.scale.x', 1.2)
            setProperty('scaleP2.scale.y', 0.8)
        elseif curStep % 8 == 4 then
            setProperty('scaleP2.angle', -angle)
            setProperty('scaleP2.scale.x', 0.8)
            setProperty('scaleP2.scale.y', 1.2)
        end
    else
        if curStep % 2 == 0 then
            --setProperty('scaleP2.angle', angle)
            setProperty('scaleP2.scale.x', 1.2)
            setProperty('scaleP2.scale.y', 0.8)
        elseif curStep % 2 == 1 then
            --setProperty('scaleP2.angle', -angle)
            setProperty('scaleP2.scale.x', 0.8)
            setProperty('scaleP2.scale.y', 1.2)
        end
    end
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function remapToRange(value, start1, stop1, start2, stop2)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1));
end