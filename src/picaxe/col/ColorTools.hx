/**
 * ...
 * @author Scott Campbell
 */

package picaxe.col;

class ColorTools
{
	//Note: colors are ARGB
	/**
	 * Converts a color into a human friendly format.
	 * @param	argb32
	 * @return	{a:(0-255), r:(0-255), g:(0-255), b:(0-255)}
	 */
	public static inline function toARGB(argb32:Int){
		return 
		{
			a:argb32 >> 24 & 0xFF,
			r:argb32 >> 16 & 0xFF,
			g:argb32 >> 8 & 0xFF,
			b:argb32 & 0xFF
		};
	}
	public static inline function getAlpha(argb32:Int) {
		return argb32 >> 24 & 0xFF;
	}
	public static inline function getRed(argb32:Int) {
		return argb32 >> 16 & 0xFF;
	}
	public static inline function getGreen(argb32:Int) {
		return argb32 >> 8 & 0xFF;
	}
	public static inline function getBlue(argb32:Int) {
		return argb32 & 0xFF;
	}

	/**
	 * 
	 * @param	color
	 * @return	true if the color is fully opaque, otherwise false
	 */
	public static inline function isOpaque(argb32:Int) {
		return 255 == argb32 >> 24 & 0xFF;
	}
	/**
	 * 
	 * @param	color
	 * @return	true if the color is fully transperent, otherwise false
	 */
	public static inline function isTransperent(argb32:Int) {
		return 0 == argb32 >> 24 & 0xFF;
	}
	/**
	 * 
	 * @param	color
	 * @return	true if the color is a shade of gray, otherwise false
	 */
	public static inline function isGrayScale(argb32:Int) {
		return argb32 >> 24 & 0xFF == argb32 >> 16 & 0xFF &&
				argb32 >> 24 & 0xFF == argb32 >> 8 & 0xFF;
	}
}