package ;

import flash.Lib;

/**
 * ...
 * @author Scott Campbell
 */

class Main 
{
	
	static function main() 
	{
		#if flash
			new Example();
		#else
			Lib.create(function(){new Example();},550,400,60,0xffffff,(1*Lib.HARDWARE) | Lib.RESIZABLE);
		#end
	}
	
}