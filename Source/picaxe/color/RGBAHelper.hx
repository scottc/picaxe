package picaxe.color;

/**
 * ...
 * @author scott
 */

typedef RGBA = Int;

class RGBAHelper
{
	public static inline function toARGB(rgba:RGBA):Int {
		rgba = rgba & 0xFFFFFFFF;
		
		return (rgba >> 8) + (rgba << 24);
	}
	
	/**
	 * Converts a color into a human friendly format.
	 * @param	argb
	 * @return	{a:(0-255), r:(0-255), g:(0-255), b:(0-255)}
	 */
	public static inline function getChannels(argb:RGBA):Dynamic{
		return 
		{
			a:argb >> 24 & 0xFF,
			r:argb >> 16 & 0xFF,
			g:argb >> 8 & 0xFF,
			b:argb & 0xFF
		};
	}
	
}