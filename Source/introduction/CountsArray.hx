package introduction;

/**
 * A class based upon Daniel Shiffman's "The Nature of Code" - "randomCounts" in Section I.2
 * "The Nature of Code" : http://natureofcode.com/
 * 
 * @author C. Anson Butler
 */
class CountsArray
{
	public var counts:Array<Int>; //The array of numbers
	
	public function new(arrayLength:Int = 16) 
	{
		//Initializing the array
		counts = new Array<Int>();
		
		//Setting it all to 0
		for (i in 0...arrayLength)
		{
			counts.push(0);
		}
	}
	
	//Uniformly stepping up each number in the array
	public function uniformStep(amount:Int = 1) {
		var randPos:Int = Math.floor(Math.random() * counts.length);
		
		countUp(randPos, amount);
	}
	
	//Steps up the number indicated by position in the array, by an indicated amount.
	public function countUp(postion:Int, countAmount:Int = 1):Void
	{
		counts[postion] += countAmount;
	}
}