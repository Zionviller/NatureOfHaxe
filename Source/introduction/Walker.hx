package introduction ;

/**
 * The Walker class based upon Daniel Shiffman's "The Nature of Code" - Section I.2
 * "The Nature of Code" : http://natureofcode.com/
 * 
 * @author C. Anson Butler
 */
class Walker
{
	public var x:Float; //Cartesian postion x axis.
	public var y:Float; //Catesian position y axis.
	//Remember (0,0) is in the top-left of th screen.
	
	public var speed:Float; //How fast (or more acurately, how big of a step) our walker will move.
	
	public function new(xPos:Float = 0, yPos:Float = 0, inSpeed:Float = 400) 
	{
		//Instantiates the new walker's properties.
		x = xPos;
		y = yPos;
		speed = inSpeed;
	}
	
	//This will make the Walker take a step in one of 8 directions, or even stay still.
	public function step(elapsed:Float):Void
	{
		var xMove = Math.floor(Math.random() * 3) - 1; //Gives us -1, 0, or 1
		var yMove = Math.floor(Math.random() * 3) - 1; //Gives us -1, 0, or 1
		
		x += xMove * speed * elapsed; //Steps left, right, or not at all.
		y += yMove * speed * elapsed; //Steps up, down, or not at all.
	}
	
	//This step is baised to go in a particular direction. In this case, to the right.
	public function biasedStep(elapsed:Float):Void
	{
		var rand = Math.random();
		
		if (rand < .20)
		{
			y -= speed * elapsed;
		} else if ( rand < .40)
		{
			y += speed * elapsed;
		} else if ( rand < .60)
		{
			x -= speed * elapsed;
		} else {
			x += speed * elapsed;
		}
	}	
}