package picaxe.color;


typedef ARGB = Int;


class ARGBHelper{

	/**
	 * Converts a color into a human friendly format.
	 * @param	argb
	 * @return	{a:(0-255), r:(0-255), g:(0-255), b:(0-255)}
	 */
	public static inline function getChannels(argb:ARGB):Dynamic{
		return 
		{
			a:getAlpha(argb),
			r:getRed(argb),
			g:getGreen(argb),
			b:getBlue(argb)
		};
	}
	
	public static inline function toRGBA(argb:ARGB):Int {
		argb = argb & 0xFFFFFFFF;
		
		return (argb << 8) + (argb >> 24);
	}
	
	
	public static inline function getAlpha(argb:ARGB):Int{
		return argb >> 24 & 0xFF;
	}
	public static inline function getRed(argb:ARGB):Int{
		return argb >> 16 & 0xFF;
	}
	public static inline function getGreen(argb:ARGB):Int{
		return argb >> 8 & 0xFF;
	}
	public static inline function getBlue(argb:ARGB):Int{
		return argb & 0xFF;
	}

	/**
	 * 
	 * @param	color
	 * @return	true if the color is fully opaque, otherwise false
	 */
	public static inline function isOpaque(argb:ARGB):Bool{
		return 255 == argb >> 24 & 0xFF;
	}
	/**
	 * 
	 * @param	color
	 * @return	true if the color is fully transperent, otherwise false
	 */
	public static inline function isTransperent(argb:ARGB):Bool{
		return 0 == argb >> 24 & 0xFF;
	}
	/**
	 * 
	 * @param	color
	 * @return	true if the color is a shade of gray, otherwise false
	 */
	public static inline function isGrayScale(argb:ARGB):Bool{
		return getRed(argb) == getBlue(argb) &&
				getBlue(argb) == getGreen(argb);
	}
}