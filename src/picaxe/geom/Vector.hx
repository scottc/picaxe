/**
 * ...
 * @author Scott Campbell
 */

package picaxe.geom;

class Vector 
{
	public var x:Float;
	public var y:Float;
	
	public function new(?x:Float=0, ?y:Float=0) 
	{
		this.x = x;
		this.y = y;
	}
	public inline function add(v:Vector):Vector {
		x += v.x;
		y += v.y;
		
		return this;
	}
	public inline function clone():Vector {
		return new Vector(x, y);
	}
	public inline function toString() {
		return "Vector(" + x + ", " + y + ")";
	}
}