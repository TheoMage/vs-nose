package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxShader;

class ProShader {
	public var shader(default, null):ProShaderShader = new ProShaderShader();
	public var distort(default, set):Float = 0;

	public function new()
	{
		shader.distort.value = [0];
	}

	function set_distort(value:Float):Float {
		distort = value;
		shader.distort.value[0] = distort;
		return distort;
	}
}

class ProShaderShader extends FlxShader {
	@:glFragmentSource('
		#pragma header

		/**
		* https://www.shadertoy.com/view/wsdBWM
		**/
		
		uniform float distort = 0.0;
		
		vec2 pincushionDistortion(in vec2 uv, float strength) {
			vec2 st = uv - 0.5;
			float uvA = atan(st.x, st.y);
			float uvD = dot(st, st);
			return 0.5 + vec2(sin(uvA), cos(uvA)) * sqrt(uvD) * (1.0 - strength * uvD);
		}
		
		void main() {
			float rChannel = texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.3 * distort)).r;
			float gChannel = texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.15 * distort)).g;
			float bChannel = texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.075 * distort)).b;
			gl_FragColor = vec4(rChannel, gChannel, bChannel, 1.0);
	}')

	public function new()
	{
		super();
	}
}