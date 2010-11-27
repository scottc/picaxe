/**
 * ...
 * @author Scott Campbell
 */

package picaxe.shape;

import picaxe.geom.Vector;

class Polygon extends Shape
{
	public var vertices:List<Vector>;
	//public var axis:...
	
	public function new() 
	{
		super();
		vertices = new List<Vector>();
	}
	
}