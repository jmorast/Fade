package;

import nme.ui.Mouse;
import nme.Assets;
import nme.display.Sprite;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.system.input.Mouse;
import org.flixel.FlxPoint;
import org.flixel.plugin.photonstorm.FlxVelocity;
import org.flixel.FlxGroup;
import nme.Lib;


class LevelState extends FlxState
{
	
	var Player:FlxSprite;
	var Enemy:FlxSprite;
	var addred = 0;
	var addgreen = 0;
	var addblue = 0;
	var pred = 0;
	var pgreen = 0;
	var pblue = 0;
	var PlayerLoc:FlxPoint;

	override public function create():Void
	{
		
		FlxG.bgColor = 0xffffffff;	
		
		
		Player = new FlxSprite(320,249);
		Player.makeGraphic(20,20);
		Player.color=0x000000;
		add(Player);
		
		var mpoint:FlxSprite = new FlxSprite(0,0);
		mpoint.makeGraphic(1,1);
		//mpoint.alpha=0;
		
		FlxG.mouse.show(mpoint,0.01);
		

		createEnemies(100);

		var Enemy = new FlxSprite(10,10);
		Enemy.makeGraphic(30,30);
		Enemy.color=0xffff0000;
		add(Enemy);
		
		FlxVelocity.moveTowardsPoint(Enemy,new FlxPoint(Player.x,Player.y),100);
	
	}
	
	public function createEnemies(numEnemies:Int) {
		for (i in 0...numEnemies) {
			trace("enemy creation");
			var Enemy = new FlxSprite(Std.random(FlxG.width),Std.random(FlxG.height));
			Enemy.makeGraphic(30,30);
			Enemy.color=0xffff0000;
			add(Enemy);
			FlxVelocity.moveTowardsPoint(Enemy,new FlxPoint(Player.x,Player.y),100);
		}

	}
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		updateEntities();
		CheckCollision();
		UpdatePlayer();

		CheckState();
		trace(Lib.getTimer());
		
	}	
	
	private function UpdatePlayer() {
		Player.x=FlxG.mouse.screenX;
		Player.y=FlxG.mouse.screenY;
		if (addred != 0) {
			pred=pred+addred;
			pred=normalize(pred);
		}
		if (addgreen != 0) {
			pgreen=pgreen+addgreen;
			pgreen=normalize(pgreen);
		}
		if (addblue != 0) {
			pblue=pred+addblue;
			pblue=normalize(pblue);
		}
		addred = addgreen = addblue = 0;
		
		Player.color = (pred<<8)*255|(pgreen<<4)*255|pblue;
		
	}
	
	private function updateEntities() {
	  // spawn new enemies if needed
	  // move enemies based on their velocities
	  // enemy specific behavior
	}
	
	private function CheckCollision() {
	  // for each enemy in enemy list check if player collides
	  // update addred, addgreen, addblue and change enemy behavior
	}
	
	private function CheckState() {
	  // is the game or level over?
	}
	
	private function normalize(cvalue:Int):Int {
		if (cvalue<0) return 0;
		if (cvalue>255) return 255;
		return cvalue;
	}
	
}
