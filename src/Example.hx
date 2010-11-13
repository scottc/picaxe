/**
 * ...
 * @author Scott Campbell
 */

package ;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
import picaxe.display.Bitmap;
import picaxe.geom.Point;
import picaxe.shape.Circle;
import picaxe.geom.Vector;
import picaxe.World;
import picaxe.data.BitmapShapeSolver;


#if flash
import flash.Lib;
import flash.events.Event;
#else
import nme.Lib;
import nme.events.Event;
#end

class Example
{
	public function new() {
		
		//note: colors in flash are sometimes ARGB, RGBA othertimes

		var bmd:BitmapData = new BitmapData(1000, 1000, true, 0x00000000);
		var bm:Bitmap = new Bitmap(bmd);
		Lib.current.addChild(bm);
		
		//bmd.setPixel(300, 300, 0xff000000);
		
		
		var bms:BitmapShape = BitmapShapeSolver.line(
			new Point(242, 300),
			new Point(324, 363)
		);
		
		var c:Circle = new Circle();
		
		c.x = 100;
		c.y = 100;
		
		c.radius = 83;
		
		var bms2:BitmapShape = BitmapShapeSolver.point(new Point(100,100));
		var bms3:BitmapShape = BitmapShapeSolver.circle(c);
		
		bms.drawOnto(bmd, 0xffff00ff);
		bms2.drawOnto(bmd, 0xffff00ff);
		bms3.drawOnto(bmd, 0xffff00ff);
		
		//trace(bms.getBitmap().x);
	}
}