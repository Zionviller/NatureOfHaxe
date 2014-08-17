package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;


class Main extends Sprite {
	
	private var previousTime:Int;
	public var elapsed:Float;
	//private var ourWalker:Walker;
	private var randomCounts:Array<Int>;
	
	private var numberOfCounts:Int = 20;
	
	public function new () {
		super ();
		randomCounts = new Array<Int>();
		for (i in 0...numberOfCounts)
		{
			randomCounts.push(0);
		}
		//ourWalker = new Walker(this.stage.stageWidth / 2, this.stage.stageHeight / 2, 200);
		//trace(ourWalker);
		
		previousTime = Lib.getTimer();
		this.addEventListener(Event.ENTER_FRAME, loop);
	}
	
	private function loop(e:Event):Void 
	{
		deltaTime();
		update();
		draw();
		//trace("what is this?");
	}
	
	private function deltaTime():Void
	{
		var currentTime:Int = Lib.getTimer();
		var delta = currentTime - previousTime;
		previousTime = currentTime;
		elapsed = delta / 1000;		
	}
	
	private function update()
	{
		//ourWalker.step(elapsed);
		var randomPosition:Int = Math.floor(Math.random() * numberOfCounts);
		
		randomCounts[randomPosition]+= 10;
		
		//trace(randomCounts);
	}
	
	private function draw():Void
	{
		//trace(ourWalker);
		//var radius:Float = (Math.random() * 32) + 32;
		this.graphics.clear();
		
		
		this.graphics.lineStyle(1, 0x000000, 1);
		drawArray();
		this.graphics.endFill();
	}
	
	private function drawArray():Void
	{
		var screenDiv = this.stage.stageWidth / randomCounts.length;
		
		for (i in 0...randomCounts.length)
		{
			this.graphics.beginFill(0x8FA2B6 + (randomCounts[i]), 1);
			this.graphics.drawRect(i * screenDiv, this.stage.stageHeight, screenDiv, -randomCounts[i]);
		}
	}
	
}