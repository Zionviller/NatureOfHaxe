package;

import introduction.CountsArray;
import introduction.Walker;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import util.Gaussian;


class Main extends Sprite {
	
	private var previousTime:Int;
	public var elapsed:Float;
	private var biasedWalker:Walker;
	private var randomWalker:Walker;
	private var randomCounts:CountsArray;
	
	public function new () {
		super ();
		
		randomCounts = new CountsArray();
		biasedWalker = new Walker(this.stage.stageWidth / 2, this.stage.stageHeight / 2, 200);
		randomWalker = new Walker(this.stage.stageWidth / 2, this.stage.stageHeight / 2);
		
		previousTime = Lib.getTimer();
		this.addEventListener(Event.ENTER_FRAME, loop);
	}
	
	private function loop(e:Event):Void 
	{
		deltaTime();
		update();
		draw();
	}
	
	private function update()
	{
		//trace(Gaussian.getGaussian(0, 1));
		//biasedWalker.biasedStep(elapsed);
		//randomWalker.step(elapsed);
		//randomCounts.uniformStep();		
	}
	
	//Later we might move drawing into a class of its own.
	private function draw():Void
	{
		//this.graphics.clear();
		//drawArray();
		this.graphics.beginFill(0x531F54, .10);
		this.graphics.drawCircle(Gaussian.getGaussian(320, 75), 180, 16);
		//this.graphics.beginFill(0xAB94DC, .5);
		//this.graphics.drawEllipse(biasedWalker.x, biasedWalker.y, 32, 16);
		//this.graphics.beginFill(0xF7FD73, .5);
		//this.graphics.drawCircle(randomWalker.x, randomWalker.y, 16);
		this.graphics.endFill();
	}
	
	private function drawArray():Void
	{
		var screenDiv = this.stage.stageWidth / randomCounts.counts.length;
		
		for (i in 0...randomCounts.counts.length)
		{
			this.graphics.beginFill(0x8FA2B6 + (randomCounts.counts[i]), 1);
			this.graphics.drawRect(i * screenDiv, this.stage.stageHeight, screenDiv, -randomCounts.counts[i]);
		}
	}
	
	private function deltaTime():Void
	{
		var currentTime:Int = Lib.getTimer();
		var delta = currentTime - previousTime;
		previousTime = currentTime;
		elapsed = delta / 1000;		
	}
	
}