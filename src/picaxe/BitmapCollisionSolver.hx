/**
 * ...
 * @author Scott Campbell
 */

package picaxe;

//import picaxe.geom.Vector;
import flash.geom.Point;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
//import picaxe.shape.Segment;
//import picaxe.shape.Polygon;
import picaxe.data.BitmapShapeSolver;
import picaxe.shape.Body;

class BitmapCollisionSolver
{
	public var bitmapData:BitmapData;
	
	public function new(){}//singleton?
	
	private function testPath(bitmapShape:BitmapShape, object:Body, condition:UInt->Bool) {
		
		var path:BitmapShape = BitmapShapeSolver.line(
				new Point(object.x, object.y),
				Point.fromVector(object.velocity)
		);
		
		for (pixel in path.pixels) {
			testBitmapShape(object, condition);
		}
	}
	private function testBitmapShape(bitmapShape:BitmapShape) {
		var hits:BitmapShape = new BitmapShape();
		
		//for each pixel in bitmapShape
		for (vector in bitmapShape.pixels) {
			var x:Int = bitmapData.x - bitmapShape.x + vector.x;
			var y:Int = bitmapData.y - bitmapShape.y + vector.y;
			
			//if the pixel color matches the condition
			if(condition(bitmapData.getPixel32(x, y)))
			hits.pixels.push(vector.clone());
		}
		
		//return any hits
		return hits;
	}
}