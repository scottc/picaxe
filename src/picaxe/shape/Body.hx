/**
 * ...
 * @author Scott Campbell
 */

package picaxe.shape;

import picaxe.geom.Vector;



enum BodyType {
	circle;
	polygon;
	line;
	point;
}


/**
 * A collection of shapes, that make up a greater whole object
 */
class Body 
{
	public var x:Float; //position
	public var y:Float;
	
	public var type:BodyType;
	
	public var velocity:Vector;
	
	
	public function new(?type:BodyType) 
	{
		this.type = type;
	}
	
}