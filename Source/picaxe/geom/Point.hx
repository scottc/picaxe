/**
 * ...
 * @author Scott Campbell
 */

package picaxe.geom;

class Point 
{
	public var x:Int;
	public var y:Int;
	public function new(?x:Int=0, ?y:Int=0) 
	{
		this.x = x;
		this.y = y;
	}
	public inline function add(p:Point) {
		x += p.x;
		y += p.y;
	}
	public inline function clone():Point {
		return new Point(x, y);
	}
	
	/**
	 * Construct a point from a vector.
	 * 
	 * @return a Point
	 */
	public static inline function fromVector(v:Vector):Point {
		return new Point(Math.round(v.x), Math.round(v.y));
	}
	
	public inline function toString() {
		return "Point(" + x + ", " + y + ")";
	}
}