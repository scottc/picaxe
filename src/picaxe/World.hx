/**
 * ...
 * @author Scott Campbell
 */

package picaxe;


#if flash
import flash.Lib;
import flash.events.Event;
#else
import nme.Lib;
import nme.events.Event;
#end

import haxe.Timer;

import picaxe.display.Renderer;

class World 
{

	public var timer:Timer;
	public var logic:Void->Void;
	public static var STEPS_PER_SECOND:Int = 60;
	
	public var renderers:List<Dynamic>;
	
	public function new() 
	{
		renderers = new List<Dynamic>();
		//throw "This is an abstract class";
		init();	
	}
	/**
	 * Setup our game envioment
	 */
	function init()
	{
		//setup our renderer
		Lib.current.addEventListener( Event.ENTER_FRAME, doRender);
		doRender();//kick start the rendering
		
		//setup our stepper
		timer = new Timer(Math.ceil(1000/STEPS_PER_SECOND));// 60 ticks per second, to match our 60fps
		timer.run = doStep;
	}
	
	/**
	 * Do a physics step, at 60 steps per second (independent of framerate)
	 */
	private function doStep() {
		trace("tick!! - place game logic here");
	}
	
	/**
	 * Render the display objects to screen, on frame event at 60 frames per second
	 */
	private function doRender(?event:Event) {
		for (object in renderers) {
			//if(object.hasChanged)
			object.render();
		}
		
		//remove all jobs items from Que.
		//renderers.clear();
	}
	
}