/**
 * ...
 * @author Scott Campbell
 */

package picaxe.data;

import picaxe.geom.Point;
import picaxe.geom.Vector;
import picaxe.shape.Body;
import picaxe.shape.Circle;
import picaxe.shape.Polygon;
import picaxe.shape.Shape;

/**
 * This Class contains static functions to convert geometric shapes into
 * pixel shapes(collection of pixels), which then can be checked against/drawn onto bitmapdata.
 */
class BitmapShapeSolver 
{
	/**
	 * 
	 * http://en.wikipedia.org/wiki/Midpoint_circle_algorithm
	 */
	static public function circle(c:Circle):BitmapShape
	{
		var bms:BitmapShape = new BitmapShape();
		
		var error:Int = Math.round(-c.radius);
		var x:Int = Math.round(c.radius);
		var y:Int = 0;

		// The following while loop may altered to 'while (x > y)' for a
		// performance benefit, as long as a call to 'plot4points' follows
		// the body of the loop. This allows for the elimination of the
		// '(x != y') test in 'plot8points', providing a further benefit.
		//
		// For the sake of clarity, this is not shown here.
		while (x >= y)
		{
			plot8points(bms, Math.round(c.x), Math.round(c.y), x, y);

			error += y;
			++y;
			error += y;

			// The following test may be implemented in assembly language in
			// most machines by testing the carry flag after adding 'y' to
			// the value of 'error' in the previous step, since 'error'
			// nominally has a negative value.
			if (error >= 0)
			{
				--x;
				error -= x;
				error -= x;
			}
		}
		
		return bms;
	}
 
	private static inline function plot8points(bms:BitmapShape, cx:Int, cy:Int, x:Int, y:Int)
	{
		plot4points(bms, cx, cy, x, y);
		if (x != y) plot4points(bms, cx, cy, y, x);
	}
	 
	// The '(x != 0 && y != 0)' test in the last line of this function
	// may be omitted for a performance benefit if the radius of the
	// circle is known to be non-zero.
	static private inline function plot4points(bms:BitmapShape, cx:Int, cy:Int, x:Int, y:Int)
	{
		bms.plot(cx + x, cy + y);
		if (x != 0) bms.plot(cx - x, cy + y);
		if (y != 0) bms.plot(cx + x, cy - y);
		if (x != 0 && y != 0) bms.plot(cx - x, cy - y);
	}
	
	/**
	 * 
	 * http://en.wikipedia.org/wiki/Bresenham's_line_algorithm
	 *
	 */
	public static function line(p0:Point, p1:Point):BitmapShape {
		
		var bms:BitmapShape = new BitmapShape();
		
		var steep = Math.abs(p1.y - p0.y) > Math.abs(p1.x - p0.x);
		
		if (steep){
			// swap
			var tmp = p0.x; p0.x = p0.y; p0.y = tmp;
			tmp = p1.x; p1.x = p1.y; p1.y = tmp;
		}
		if (p0.x > p1.x){
			// swap
			var tmp = p0.x; p0.x = p1.x; p1.x = tmp;
			tmp = p0.y; p0.y = p1.y; p1.y = tmp;
		}

		var deltax = p1.x - p0.x;
		var deltay = Math.abs(p1.y - p0.y);
		var error:Float = 0;
		var ystep;
		var y = p0.y;
		
		if (p0.y < p1.y) ystep = 1; else ystep = -1;
		for (x in p0.x...p1.x+1) {
			if (steep) bms.plot(y, x); else bms.plot(x, y);
			
			error = error + deltay;
			if (2*error >= deltax){
				y = y + ystep;
				error = error - deltax;
			}
		}
		return bms;
	}
	public static function polygon(poly:Polygon):BitmapShape {
		var prev:Vector = poly.vertices.last();
		var bms:BitmapShape = new BitmapShape();
		
		bms.x = Math.round(poly.x);
		bms.y = Math.round(poly.y);
		
		for (vert in poly.vertices) {//TODO: optimise so the corner points arnt drawn twice.
			for (pixel in line(Point.fromVector(prev), Point.fromVector(vert)).pixels)
				bms.pixels.push(pixel);
			prev = vert;
		}
		
		return bms;
	}
	static public function point(p:Point):BitmapShape {
		var bms:BitmapShape = new BitmapShape();
		bms.plotPoint(p);
		return bms;
	}
	/*
	static public function rect():BitmapShape {
		//only use 2 loops to improve proformace
		for (var pixel:Int in x...x+width) {
			//draw top and bottom lines
		}
		for (var pixel:Int in y+1...y+width-1) {//minus a pixel from the top and bottom
			//draw left and right lines
		}
	}
	*/
	public static function shape(s:Shape):BitmapShape {
		switch(Type.getClass(s)) {
			case Circle:
				return circle(cast(s,Circle));
			case Polygon:
				return polygon(cast(s,Polygon));
			//case BodyType.line:
				//line(cast(body,Line));
			default:
				return point(Point.fromVector(s));
		}
	}
}