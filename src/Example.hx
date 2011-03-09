/**
 * ...
 * @author Scott Campbell
 */

package ;
import flash.geom.ColorTransform;
import flash.geom.Rectangle;
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
	var ball:Circle; var shapebm:Bitmap;
	var poly:Polygon;
	var point:Point;
	
	var bmd:BitmapData;
	
	public function new() {
		super();
		
		//Make Circle Display Object (bitmap)
		var shapebmd:BitmapData = new BitmapData(550, 400, true, 0x00ffffff);
		shapebm = new Bitmap(shapebmd);
		
		//Make Circle
		ball = new Circle();
		ball.set(30, 30);
		ball.radius = 1;
		ball.velocity = new Vector(3, -2);

		//Make Polygon
		poly = new Polygon();//triangle
		poly.set(50, 50 );
		poly.vertices.add(new Vector( 10, 0));
		poly.vertices.add(new Vector( 0, 20));
		poly.vertices.add(new Vector( 20, 20));
		poly.velocity = new Vector(-1, 1);
		
		//Vector example
		//...
		
		//Make something to collide against aka make level
		bmd = new BitmapData(550, 400, true, 0x00ffffff);
		var bm:Bitmap = new Bitmap(bmd);
		var p:Polygon = new Polygon();
		p.vertices.add(new Vector(0, 0));
		p.vertices.add(new Vector(540, 0));
		p.vertices.add(new Vector(540, 390));
		p.vertices.add(new Vector(0, 390));
		//p.set(100, 100);
		BitmapShapeSolver.polygon(p).drawOnto(bmd, 0xffff0000);

		
		//add display objects to the display
		add(bm);
		add(shapebm);
	}
	override public function doStep():Void
	{
		ball.add(ball.velocity);
		poly.add(poly.velocity);
		
		ball.velocity.y += 0.5;
		
		ball.velocity.x *= 0.98;
		ball.velocity.y *= 0.98;
		
		if (BitmapCollisionSolver.testPath(bmd, ball, ColorTools.isOpaque))
		{
			ball.velocity.y *= -1;
		}

		if (BitmapCollisionSolver.testPath(bmd, poly, ColorTools.isOpaque)){
			poly.velocity.x *= -1;
			poly.velocity.y *= -1;
		}
		
	}
	override public function doRender():Void 
	{
				
		BitmapShapeSolver.circle(ball).drawOnto(shapebm.bitmapData, 0xffff00ff);
		//BitmapShapeSolver.polygon(poly).drawOnto(shapebm.bitmapData, 0xff00ffff);
		
	}
}