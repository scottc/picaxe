/**
 * ...
 * @author Scott Campbell
 */

package picaxe.display;

/**
 * A class for copying properties from 1 object to another, with T interface.
 * Great for automatic copying of properties from model to view.
 */
class Renderer<T>
{
	public var display:T;//destination object aka view
	public var object:T;//source object aka model
	
	public function new(display:T, object:T) 
	{
		this.display = display;
		this.object = object;
	}
	public function render() {

				for (property in Reflect.fields(object)) {
					Reflect.setField(
						display, //object
						property, //field
						Reflect.field(object, property)//value
					);
				}
	}
}