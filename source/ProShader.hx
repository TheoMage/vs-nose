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
		var hola:Array<Float>;
		hola = [value];
		shader.distort.value = hola;
		return distort;
	}
}

class ProShaderShader extends FlxShader {
	//hola theo
	@:glFragmentSource('
		/**
		* https://www.shadertoy.com/view/wsdBWM
		**/

		varying float openfl_Alphav;
		varying vec4 openfl_ColorMultiplierv;
		varying vec4 openfl_ColorOffsetv;
		varying vec2 openfl_TextureCoordv;

		uniform bool openfl_HasColorTransform;
		uniform vec2 openfl_TextureSize;
		uniform sampler2D bitmap;

		uniform bool hasTransform;
		uniform bool hasColorTransform;

		vec4 flixel_texture2D(sampler2D bitmap, vec2 coord)
		{
			vec4 color = texture2D(bitmap, coord);
			if (!hasTransform)
			{
				return color;
			}

			if (color.a == 0.0)
			{
				return vec4(0.0, 0.0, 0.0, 0.0);
			}

			if (!hasColorTransform)
			{
				return color * openfl_Alphav;
			}

			color = vec4(color.rgb / color.a, color.a);

			mat4 colorMultiplier = mat4(0);
			colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
			colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
			colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
			colorMultiplier[3][3] = openfl_ColorMultiplierv.w;

			color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);

			if (color.a > 0.0)
			{
				return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
			}
			return vec4(0.0, 0.0, 0.0, 0.0);
		}

		uniform float distort = 0.0;
		
		vec2 pincushionDistortion(in vec2 uv, float strength) {
			vec2 st = uv - 0.5;
			float uvA = atan(st.x, st.y);
			float uvD = dot(st, st);
			return 0.5 + vec2(sin(uvA), cos(uvA)) * sqrt(uvD) * (1.0 - strength * uvD);
		}
		
		void main() {
			float rChannel = flixel_texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.3 * distort)).r;
			float gChannel = flixel_texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.15 * distort)).g;
			float bChannel = flixel_texture2D(bitmap, pincushionDistortion(openfl_TextureCoordv, 0.075 * distort)).b;
			gl_FragColor = vec4(rChannel, gChannel, bChannel, 1.0);
	}')

	public function new()
	{
		super();
	}
}