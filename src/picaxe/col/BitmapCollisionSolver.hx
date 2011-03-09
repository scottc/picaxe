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
	public static function testPath(bitmapData:BitmapData, s:Shape, condition:Int->Bool):Bool {
		return testPath2(bitmapData, BitmapShapeSolver.shape(s), Point.fromVector(s), Point.fromVector(s.clone().add(s.velocity)), condition);
	}
	public static function testPath2(bitmapData:BitmapData, bms:BitmapShape, from:Point, to:Point,condition:Int->Bool):Bool {
		
		var path:BitmapShape = BitmapShapeSolver.line(from,to);
		
		
		for (pathpixel in path.pixels) {
			//for (pixel in bms.pixels) {
				//var p:Point = pathpixel.clone();
				//p.add(pixel);
				//p.x += bms.x;
				//p.y += bms.y;
				
				//if the pixel color matches the condition
				if (condition(bitmapData.getPixel32(pathpixel.x, pathpixel.y))) {
					//trace("hit - " + p);
					return true;
					//hits.pixels.push(pixel);
					
				}
			//}
		}
		
		return false;
	}
	public static function testBitmapShape(bitmapData:BitmapData, bitmapShape:BitmapShape, condition:Int->Bool):BitmapShape {
		var hits:BitmapShape = new BitmapShape();
		
		//for each pixel in bitmapShape
		for (pixel in bitmapShape.pixels) {
			var x:Int = bitmapShape.x + pixel.x;
			var y:Int = bitmapShape.y + pixel.y;
			
			//if the pixel color matches the condition
			if(condition(bitmapData.getPixel32(x, y))){
				hits.pixels.push(pixel);
				trace("hit" + pixel);
			}
		}
		
		//return any hits
		return hits;
	}
}