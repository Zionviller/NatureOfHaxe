package ;

/**
 * ...
 * @author C. Anson Butler
 */
class Walker
{
	public var x:Float;
	public var y:Float;
	public var speed:Float;
	
	public function new(xPos:Float = 0, yPos:Float = 0, inSpeed:Float = 400) 
	{
		x = xPos;
		y = yPos;
		speed = inSpeed;
	}
	
	public function step(elapsed:Float):Void
	{
		var xMove = Math.floor(Math.random() * 3) - 1;
		var yMove = Math.floor(Math.random() * 3) - 1;
		
		x += xMove * speed * elapsed;
		y += yMove * speed * elapsed;
	}
	
}