/**
 * ...
 * @author Scott Campbell
 */

package ;
import picaxe.col.ColorTools;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
import picaxe.display.Bitmap;
import picaxe.geom.Point;
import picaxe.shape.Circle;
import picaxe.geom.Vector;
import picaxe.World;
import picaxe.data.BitmapShapeSolver;
import picaxe.col.BitmapCollisionSolver;


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
		c.velocity.y = c.velocity.x = 0;
		
		c.radius = 83;
		
		var bms2:BitmapShape = BitmapShapeSolver.point(new Point(100,100));
		var bms3:BitmapShape = BitmapShapeSolver.circle(c);
		
		bms.drawOnto(bmd, 0xffff00ff);
		bms2.drawOnto(bmd, 0xffff00ff);
		bms3.drawOnto(bmd, 0xffff00ff);
		
		
		
		var c2:Circle = new Circle();
		
		c2.x = 100;
		c2.y = 100;
		c2.velocity.y = c2.velocity.x = 10;
		
		c2.radius = 83;
		
		trace(
		BitmapCollisionSolver.testPath(bmd, c2, ColorTools.isOpaque));
		
		//trace(ColorTools.isOpaque(0xffccddaa));
		//trace(bms.getBitmap().x);
	}
}