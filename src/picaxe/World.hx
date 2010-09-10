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

class World 
{

	public var timer:Timer;
	public var logic:Void->Void;
	public var fps:Int = 30;
	public var sps:Int = 30;//steps per second
	
	public function new() 
	{
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
		timer = new Timer(Math.ceil(1000/30));// 60 ticks per second, to match our 60fps
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
		trace("render!! - update graphic positions here");
	}
	
}