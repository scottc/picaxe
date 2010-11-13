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
		
		var path:BitmapShape = BitmapShapeSolver.line(
				Point.fromVector(s),
				Point.fromVector(s.velocity)
		);
		trace(path.pixels.length);
		for (pixel in path.pixels) {
			var hits = testBitmapShape(bitmapData, BitmapShapeSolver.shape(s), condition);
			if (hits.pixels.length != 0)
			return { pos:pixel, hits:hits };
		}
		
		return null;
	}
	public static function testBitmapShape(bitmapData:BitmapData, bitmapShape:BitmapShape, condition:UInt->Bool) {
		var hits:BitmapShape = new BitmapShape();
		
		//for each pixel in bitmapShape
		for (pixel in bitmapShape.pixels) {
			var x:Int = bitmapShape.x + pixel.x;
			var y:Int = bitmapShape.y + pixel.y;
			
			//if the pixel color matches the condition
			if(condition(bitmapData.getPixel32(x, y)))
			hits.pixels.push(pixel.clone());
		}
		
		//return any hits
		return hits;
	}
}