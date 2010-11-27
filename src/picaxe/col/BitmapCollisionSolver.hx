/**
 * ...
 * @author Scott Campbell
 */

package picaxe.col;

//import picaxe.geom.Vector;
import picaxe.geom.Point;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
import picaxe.shape.Shape;
//import picaxe.shape.Segment;
//import picaxe.shape.Polygon;
import picaxe.data.BitmapShapeSolver;
import picaxe.shape.Body;

class BitmapCollisionSolver
{
	public static function testPath(bitmapData:BitmapData, s:Shape, condition:UInt->Bool) {
		
		var bms:BitmapShape = BitmapShapeSolver.shape(s);

		testPath2(bitmapData, bms, Point.fromVector(s), Point.fromVector(s.clone().add(s.velocity)), condition);
	}
	public static function testPath2(bitmapData:BitmapData, bms:BitmapShape, from:Point, to:Point,condition:UInt->Bool) {
		
		var path:BitmapShape = BitmapShapeSolver.line(from,to);
		
		for (pixel in path.pixels) {
			if(condition(bitmapData.getPixel32(pixel.x, pixel.y)))
				trace("hit" + pixel);
			
			//var hits = testBitmapShape(bitmapData, bms, condition);
			
			//if (hits.pixels.length != 0)
				//trace(":"+pixel);
				//return { pos:pixel, hits:hits };
		}
	}
	public static function testBitmapShape(bitmapData:BitmapData, bitmapShape:BitmapShape, condition:UInt->Bool) {
		var hits:BitmapShape = new BitmapShape();
		
		//for each pixel in bitmapShape
		for (pixel in bitmapShape.pixels) {
			var x:Int = bitmapShape.x + pixel.x;
			var y:Int = bitmapShape.y + pixel.y;
			
			//if the pixel color matches the condition
			if(condition(bitmapData.getPixel32(x, y)))
				hits.pixels.push(pixel);
		}
		
		//return any hits
		return hits;
	}
}