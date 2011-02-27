/**
 * ...
 * @author Scott Campbell
 */

package ;
import picaxe.col.ColorTools;
import picaxe.data.BitmapData;
import picaxe.data.BitmapShape;
import picaxe.display.Bitmap;
import picaxe.geom.Point;
import picaxe.shape.Circle;
import picaxe.geom.Vector;
import picaxe.shape.Polygon;
import picaxe.World;
import picaxe.data.BitmapShapeSolver;
import picaxe.col.BitmapCollisionSolver;


class Example extends World
{
	var ball:Circle; var ballbm:Bitmap;
	var poly:Polygon; var polybm:Bitmap;
	var point:Point;
	
	var bmd:BitmapData;
	
	public function new() {
		super();
		
		//Make Circle
		ball = new Circle();
		ball.set(10, 10);
		ball.radius = 10;
		ball.velocity = new Vector(2, 2);
		
		//Make Circle Display Object (bitmap)
		var ballbmd:BitmapData = new BitmapData(Math.ceil(ball.radius * 2)+1, Math.ceil(ball.radius * 2)+1,true, 0x00ffffff);
		ballbm = new Bitmap(ballbmd);
		BitmapShapeSolver.circle(ball).drawOnto(ballbmd, 0xffff00ff);
		
		//Make Polygon
		poly = new Polygon();//triangle
		poly.vertices.add(new Vector( 10, 0));
		poly.vertices.add(new Vector( 0, 20));
		poly.vertices.add(new Vector( 20, 20));
		poly.velocity = new Vector(1, 1);
		
		//Make Polygon Display Object (bitmap)
		var polybmd:BitmapData = new BitmapData(21, 21, true, 0x00ffffff);
		polybm = new Bitmap(polybmd);
		BitmapShapeSolver.polygon(poly).drawOnto(polybmd, 0xff00ffff);
		
		//Vector example
		//...
		
		//Make something to collide against aka make level
		bmd = new BitmapData(550, 400, true, 0x00ffffff);
		var bm:Bitmap = new Bitmap(bmd);
		BitmapShapeSolver.line(new Point(0, 300), new Point(550, 100)).drawOnto(bmd, 0xffff0000);
		
		//add display objects to the display
		add(bm);
		add(ballbm);
		add(polybm);
	}
	override public function doStep():Void
	{
		//Circle Example
		ball.add(ball.velocity);
		BitmapCollisionSolver.testPath(bmd, ball, ColorTools.isOpaque);
		
		//Polygon Example
		poly.add(poly.velocity);
		//BitmapCollisionSolver.testPath(bmd, poly, ColorTools.isOpaque);
		
		//Vector Example
	}
	override public function doRender():Void 
	{
		ball.copyPositionTo(ballbm);
		poly.copyPositionTo(polybm);
	}
}