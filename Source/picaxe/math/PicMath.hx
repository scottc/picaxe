/**
 * ...
 * @author Scott Campbell
 */

package picaxe.math;

class PicMath 
{
	public static function roundOut(number:Float):Int {
		if (number > 0) return Math.ceil(number);
		return Math.floor(number);
	}
	public static function roundIn(number:Float):Int {
		if (number < 0) return Math.ceil(number);
		return Math.floor(number);
	}
}