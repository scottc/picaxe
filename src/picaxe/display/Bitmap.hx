/**
 * ...
 * @author Scott Campbell
 */

package picaxe.display;


typedef Bitmap =
#if flash
flash.display.Bitmap;
#else
nme.display.Bitmap;
#end