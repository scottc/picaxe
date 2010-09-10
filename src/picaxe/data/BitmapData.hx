/**
 * ...
 * @author Scott Campbell
 */

package picaxe.data;

typedef BitmapData =
#if flash
flash.display.BitmapData;
#else
nme.display.BitmapData;
#end