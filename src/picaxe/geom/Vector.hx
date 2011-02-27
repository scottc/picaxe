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
		set(x, y);
	}
	public inline function set(x:Float, y:Float):Vector {
		this.x = x;
		this.y = y;
		
		return this;
	}
	public inline function add(v:Vector):Vector {
		x += v.x;
		y += v.y;
		
		return this;
	}
	public inline function subtract(v:Vector):Vector {
		x -= v.x;
		y -= v.y;
		
		return this;
	}
	public inline function clone():Vector {
		return new Vector(x, y);
	}
	public inline function copyPositionOf(v:Vector):Void {
		x = v.x;
		y = v.y;
	}
	public inline function copyPositionTo(ob:Dynamic):Void {
		ob.x = x;
		ob.y = y;
	}
	public inline function length():Float {
		return Math.sqrt(x * x + y * y);
	}
	public inline function toString():String {
		return "Vector(" + x + ", " + y + ")";
	}
}