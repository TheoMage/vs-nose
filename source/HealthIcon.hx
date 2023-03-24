package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;

	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';
	private var p_anim:Bool = false;

	private var hahaha:Int = 24;

	public function new(char:String = 'bf', isPlayer:Bool = false, Anim:Bool = false, fps:Int = 24)
	{
		#if (haxe >= "4.0.0")
		animOffsets = new Map();
		#else
		animOffsets = new Map<String, Array<Dynamic>>();
		#end

		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		hahaha = fps;
		changeIcon(char, Anim, hahaha);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 12, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String, Anim:Bool = false, fps:Int = 24) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
			//hahahaha = fps;

			p_anim = Anim;

			if (!Anim)
			{
				loadGraphic(file); //Load stupidly first for getting the file size
				loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
				iconOffsets[0] = (width - 150) / 2;
				iconOffsets[1] = (width - 150) / 2;
				updateHitbox();
	
				animation.add(char, [0, 1], 0, false, isPlayer);

				animation.play(char);
			}
			else
			{
				frames = Paths.getSparrowAtlas(name); //Load stupidly first for getting the file size
				updateHitbox();
	
				animation.addByPrefix('idle', 'idle', 24, true, isPlayer);
				animation.addByPrefix('losing', 'losing', 24, true, isPlayer);

				trace(fps);

				playAnim('idle');
			}

			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
	}

	public function playAnim(name:String, forced:Bool = false, reverse:Bool = false, startFrame:Int = 0) {
		var daOffset = animOffsets.get(name);
		if (animOffsets.exists(name))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		animation.play(name, forced, reverse, startFrame);
	}

	override function updateHitbox()
	{
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];
	}

	public function getCharacter():String {
		return char;
	}

	public function getAnim():Bool {
		return p_anim;
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
