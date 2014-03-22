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
	
	private function new() 
	{
		if (Type.getClass(this) == World)
			throw "This is abstract class";
		init();	
	}
	/**
	 * Setup our game envioment
	 */
	private function init()
	{
		//setup our renderer
		Lib.current.addEventListener( Event.ENTER_FRAME, callRender);
		//doRender();//kick start the rendering
		
		//setup our stepper
		timer = new Timer(Math.ceil(1000/STEPS_PER_SECOND));// 60 ticks per second, to match our 60fps
		timer.run = doStep;
	}
	public function add(displayObject) {
		Lib.current.addChild(displayObject);
	}
	/**
	 * Do a physics step, at 60 steps per second (independent of framerate)
	 */
	public function doStep():Void {
		throw "Abstract Method";
	}
	
	/**
	 * Render the display objects to screen, on frame event at 60 frames per second
	 */
	public function doRender():Void {
		throw "Abstract Method";
	}
	private inline function callRender(?event:Event):Void {
		doRender();
	}
}