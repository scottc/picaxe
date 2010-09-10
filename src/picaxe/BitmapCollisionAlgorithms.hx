/**
 * ...
 * @author Scott Campbell
 */

package picaxe;

import picaxe.geom.Vector;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
import picaxe.shape.Circle;
//import picaxe.shape.Segment;
//import picaxe.shape.Polygon;

class BitmapCollisionAlgorithms
{
	public var bitmapData:BitmapData;
	public var condition:Int->Bool;
	
	public function new(){}//singleton?
	
	public function circle(circle:Circle, velocity:Vector):BitmapShape
	{
		var bitmapShape:BitmapShape;
		
		//calculate pixels for shape
		
		//test along predicted path
		testPath(bitmapShape);
		
	}
	
	private function testPath(bitmapShape:BitmapShape,position,velocity:Vector) {
		var tx:Int; //temporay position to work with
		var ty:Int;
		
		var lx:Int; //last/previous position
		var ly:Int;
		
		var d:Int; //length of our pixel path (the greater value between our x and y)
		
		if(Math.abs(velocity.x) > Math.abs(velocity.y)){
			d = Math.abs(velocity.x);
		}else{
			d = Math.abs(velocity.y);
		}
		
		for (var i:Int = 0; i <= d; i++) {
		
			//which position to test (1 pixel ahead of where we are)
			tx = Math.round(velocity.x * (i + 1) / d) + position.x;
			ty = Math.round(velocity.y * (i + 1) / d) + position.y;
			
			lx = Math.round(velocity.x * i / d) + position.x;
			ly = Math.round(velocity.y * i / d) + position.y;
			
			//for each pixel along the movement path, we need to check with our bitmap shape
			for() {
				testBitmapShape(bitmapShape);
			}
		}
	}
	private function testBitmapShape(bitmapShape:BitmapShape) {
		var hits:BitmapShape = new BitmapShape();
		
		//for each pixel in bitmapShape
		for (vector in bitmapShape.pixels) {
			var x:Int = bitmapData.x - bitmapShape.x + vector.x;
			var y:Int = bitmapData.y - bitmapShape.y + vector.y;
			
			//if the pixel color matches the condition
			if(condition(bitmapData.getPixel32(x, y)))
			hits.pixels.push(vector.clone());
		}
		
		//return any hits
		return hits;
	}
}




//old AS3 Source Code
	/*
		public function circ2bmd(r:int,circleVec:Vector2D):Array
		{
			//temp vars
			var array:Array = new Array();
			var v:Vector2D = new Vector2D();
			//c = new Vector2D(x, y, dx, dy);
			var tx:Number;// = c.x;
			var ty:Number;// = c.y;
			//var dir:Number = Math.PI / 1; //what direction is the circle traveling?
			//var segment:Number = 2 * Math.PI * r;
			
			var d:int;
			if(Math.abs(circleVec.dx) > Math.abs(circleVec.dy)){
				d = Math.abs(circleVec.dx);
			}else{
				d = Math.abs(circleVec.dy);
			}
			
			for(var i:uint=0;i <= d;i++){
				
				//which position to test (1 pixel ahead of where we are)
				tx = Math.round(circleVec.dx*(i+1)/d)+circleVec.x;
				ty = Math.round(circleVec.dy*(i+1)/d)+circleVec.y;
				
				//where we "are"
				lx = Math.round(circleVec.dx*i/d)+circleVec.x;
				ly = Math.round(circleVec.dy*i/d)+circleVec.y;
			
				
				for(var j:Number = 0;j <= r*2;j++){
					v.dy = ty + j-r;
					v.dx = tx + Math.sqrt(r*r - v.dy*v.dy);
					
					
					//trace(v);
					
					if(v.dotProduct(circleVec) >= 0){
						//trace("(" + Math.round(v.dx) + "," + v.dy + ")");
						//graphics.beginFill(0xff0000);
					}else{
						//graphics.beginFill(0x0000ff);
					}
					//graphics.drawRect(Math.round(v.dx)+r*2,v.dy+r*2,1,1);
					if(j != 0 && j != r*2){
						v.dx *= -1;
						if(v.dotProduct(circleVec) >= 0){
							//trace("(" + Math.round(v.dx) + "," + v.dy + ")");
							//graphics.beginFill(0xff0000);
						}else{
							//graphics.beginFill(0x0000ff);
						}
						//graphics.drawRect(Math.round(v.dx)+r*2,v.dy+r*2,1,1);
					}
					
					
					
					v.dx = tx + j-r;
					v.dy = ty + Math.sqrt(r*r - v.dx*v.dx);
					
					//trace(v);
					
					if(v.dotProduct(circleVec) >= 0){
						//trace("(" + v.dx + "," + Math.round(v.dy) + ")");
						//graphics.beginFill(0xff0000);
					}else{
						//graphics.beginFill(0x0000ff);
					}
					//graphics.drawRect(v.dx+r*2,Math.round(v.dy)+r*2,1,1);
					if(j != 0 && j != r*2){
						v.dy *= -1;
						if(v.dotProduct(circleVec) >= 0){
							//trace("(" + v.dx + "," + Math.round(v.dy) + ")");
							//graphics.beginFill(0xff0000);
						}else{
							//graphics.beginFill(0x0000ff);
						}
						//graphics.drawRect(v.dx+r*2,Math.round(v.dy)+r*2,1,1);
					}
				}
			}
			
			return null;
		} 
		public function samplebmd(x:int,y:int):Array
		{
			//useless function, seeing that we can just get a bytearray from flash.
			return new Array[[isOpaque(x-1,y-1),isOpaque(x,y-1),isOpaque(x+1,y-1)],
							 [isOpaque(x-1,y),  isOpaque(x,y),  isOpaque(x+1,y)],
							 [isOpaque(x-1,y+1),isOpaque(x,y+1),isOpaque(x+1,y+1)]
							 ];
		}
		public function rect2bmd(_w:Number,_h:Number,_x:Number,_y:Number,_dx:Number,_dy:Number/*,rotation:Number* /):Array
		{
			//do rounding, so we get the exact pixel we want
			var w:uint = _w;
			var h:uint = _h;
			var x:int = round._in(_x);
			var y:int = round._in(_y);
			var dx:int = round.out(_dx);
			var dy:int = round.out(_dy);
			
			//temp x,y for checking
			var tx:uint;
			var ty:uint;
			
			//last temp x and y
			var lx:uint;
			var ly:uint;
			
			//get the longer x or y component
			var d:int;
			if(Math.abs(dx) > Math.abs(dy)){
				d = Math.abs(dx);
			}else{
				d = Math.abs(dy);
			}
			
			//do the collisions
			for(var i:uint=0;i <= d;i++){ // we start with 1, because we don't need to check our current pos, so we start with the 2nd.
				
				var array:Array = new Array();//place to store pixels
				var j:uint;//temp var for loops
				var left:uint = 0; //just some vars so we dont double check the corners
				var right:uint = 0;
				
				//which position to test (1 pixel ahead of where we are)
				tx = Math.round(dx*(i+1)/d)+x;
				ty = Math.round(dy*(i+1)/d)+y;
				
				//where we "are"
				lx = Math.round(dx*i/d)+x;
				ly = Math.round(dy*i/d)+y;
				
				//what sides we need to test at this position?
				
				if(tx < lx){//left
					left = 1;
					for(j = 0;j <= h;j++){
						if(isOpaque(tx,ty+j-1)){
							array.push(new Point(tx,ty+j-1));
						}
					}
				}else if(tx > lx){//right
					right = 1;
					for(j = 0;j <= h;j++){
						if(isOpaque(tx+w-1,ty+j-1)){
							array.push(new Point(tx+w-1,ty+j-1));
						}
					}
				}
				if(ty < ly){//top
					for(j = 1+left;j <= w-right;j++){
						if(isOpaque(tx+j-1,ty)){
							array.push(new Point(tx+j-1,ty));
						}
					}
				}else if(ty > ly){//bottom
					for(j = 1+left;j <= w-right;j++){
						if(isOpaque(tx+j-1,ty+h-1)){
							array.push(new Point(tx+j-1,ty+h-1));
						}
					}
				}				
				//if we got 1 or more pixels, return the position + the touching pixels
				if(array.length != 0){
					//add the last safe posistion
					array.unshift(new Point(lx,ly));
					return array;
				}
			}
			return null;
		}
		
		public function line2bmd(x:int,y:int,dx:int,dy:int):Point
		{
			//get the "distance" (the longer x or y distance)
			var d:int;
			if(Math.abs(dx) > Math.abs(dy)){
				d = Math.abs(dx);
			}else{
				d = Math.abs(dy);
			}
			//Note: the real distance is calulated like this.
			//var d:int = Math.abs(dx)+Math.abs(dy)/2;
			
			//do the collisions
			for(var i:uint=0;i <= d;i++){// i = 1, because we dont need to check where it spawns.
				if(isOpaque(Math.round(dx*i/d)+x,Math.round(dy*i/d)+y)){
					//trace("hit:"+tx+":"+ty);
					return new Point(Math.round(dx*(i-1)/d)+x,Math.round(dy*(i-1)/d)+y);
				}
			}
			return null;
		}
		public function trajectory2bmd(t:trajectory):Point
		{
			
			for(var j:uint = 1;j<t.points.length-1;j++){
				var x:Number = t.points[j].x;
				var y:Number = t.points[j].y;
				var dx:Number = t.points[j+1].x - t.points[j].x;
				var dy:Number = t.points[j+1].y - t.points[j].y;
				//get the "distance" (the longer x or y distance)
				var d:int;
				if(Math.abs(dx) > Math.abs(dy)){
					d = Math.abs(dx);
				}else{
					d = Math.abs(dy);
				}
				//Note: the real distance is calulated like this.
				//var d:int = Math.abs(dx)+Math.abs(dy)/2;
				
				//do the collisions
				for(var i:uint=0;i <= d;i++){// i = 1, because we dont need to check where it spawns.
					if(isOpaque(Math.round(dx*i/d)+x,Math.round(dy*i/d)+y)){
						//trace("hit:"+tx+":"+ty);
						return new Point(Math.round(dx*(i-1)/d)+x,Math.round(dy*(i-1)/d)+y);
					}
				}
			}
			return null;
		}
	 */