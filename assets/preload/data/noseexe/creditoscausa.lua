--easy script configs
IntroTextSize = 45	--Size of the text for the Now Playing thing.
IntroSubTextSize = 35 --size of the text for the Song Name.
IntroTagColor = 'EAF5FF'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs
--actual script

function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', -405-IntroTagWidth, 15+ 200)
	makeGraphic('JukeBoxTag', 400+IntroTagWidth, 150, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -405-IntroTagWidth, 15+ 200)
	makeGraphic('JukeBox', 400, 150, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Nosex.fla', 400, -405-IntroTagWidth, 30+ 200)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', "cancion", 400, -405-IntroTagWidth, 80+ 200)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize - 8)
	addLuaText('JukeBoxSubText')
	makeLuaText('more', "By TheoMag", 400, -405-IntroTagWidth, 125+ 200)
	setTextAlignment('more', 'left')
	setObjectCamera('more', 'other')
	setTextSize('more', IntroSubTextSize)
	addLuaText('more')
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFui', 'more', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFoasdur', 'more', -450, 1.5, 'CircInOut')
	end
end