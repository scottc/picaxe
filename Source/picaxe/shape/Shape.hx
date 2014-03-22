/**
 * ...
 * @author Scott Campbell
 */

package picaxe.shape;
import picaxe.geom.Vector;

/**
 * A generic Shape
 */
class Shape extends Vector
{
	public var velocity:Vector;
	
	public function new() 
	{
		super();
		velocity = new Vector();
	}
	
}