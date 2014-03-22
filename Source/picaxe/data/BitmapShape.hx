/**
 * ...
 * @author Scott Campbell
 */

package picaxe.data;

import picaxe.display.Bitmap;
import picaxe.geom.Point;
import picaxe.shape.Shape;

import picaxe.math.PicMath;



class BitmapShape
{
	public var x:Int;
	public var y:Int;
	public var pixels:Array<Point>;
	
	public var shape:Shape;
	
	public var bitmapData:BitmapData;
	
	
	
	public function new(){
		bitmapData = new BitmapData(300,300);
		pixels = new Array<Point>();
	}
	public inline function plot(x, y) {
		plotPoint(new Point(x, y));
	}
	public inline function plotPoint(p:Point) {
		pixels.push(p);
	}
	/**
	 * 
	 * @param	bmd
	 * @param	argb32 (eg 0xff996633)
	 */
	public function drawOnto(bmd:BitmapData, color:Int){
		for (pixel in pixels) {
			bmd.setPixel32(x+pixel.x, y+pixel.y, color);
		}
	}
	/*
	public function getWidth() {
		var max:Int = 0;
		var min:Int = 0;
		for (pixel in pixels) {
			if(pixel.x+1 > max)
			max = Math.ceil(pixel.x+1);
			if(pixel.x+1 < min)
			min = Math.floor(pixel.x+1);	
		}
		return max + min*-1;
	}
	public function getHeight() {
		var max:Int = 0;
		var min:Int = 0;
		for (pixel in pixels) {
			if(pixel.y > max)
			max = Math.ceil(pixel.y+1);
			if(pixel.y < min)
			min = Math.floor(pixel.y+1);	
		}
		return max + min*-1;
	}
	private function getLowestY() {
		var min:Int = 0;
		for (pixel in pixels) {
			if(pixel.y < min)
			min = Math.floor(pixel.y+1);	
		}
		return min;
	}
	private function getLowestX() {
		var min:Int = 0;
		for (pixel in pixels) {
			if(pixel.x < min)
			min = Math.floor(pixel.x+1);	
		}
		return min;
	}*/
	public function toString():String {
		
		var str:String = "x: " + x + "  y:" + y + "\n";
		
		for (pixel in pixels) {
			str += "(" + Math.round(pixel.x) + ", " +  Math.round(pixel.y) + ")\n";
		}
		
		return str;
	}
}