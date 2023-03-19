function onUpdate()
	if not high then
    noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0, 0.5)
    noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 0.5)
	end
end

function onUpdatePost(elapsed)
	high = curStep > drugone and curStep < drugoneend or curStep > drugtwo and curStep < drugtwoend
	songPos = getSongPosition() / 300
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('iconP2.flipX',false)
	setProperty('healthBar.flipX',true)
	if curStep > drugone and curStep < drugoneend then
		noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 6) - 0)+ (math.cos((songPos) + 0) * 100) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 6) + 110)+ (math.cos((songPos) + 1) * 100) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 6) + 220)+ (math.cos((songPos) + 2) * 100) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 6) + 330) + (math.cos((songPos) + 3) * 100) - 0, 0.001)
	elseif curStep > drugtwo and curStep < drugtwoend then
		noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 6) - 0)+ (math.cos((songPos) + 0) * 150) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 6) + 110)+ (math.cos((songPos) + 1) * 150) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 6) + 220)+ (math.cos((songPos) + 2) * 150) - 0, 0.001)
		noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 6) + 330) + (math.cos((songPos) + 3) * 150) - 0, 0.001)
	end
end
