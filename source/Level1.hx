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


class Level1 extends FlxState
{
	/// NOTE -> MIKE... i was messing around with having MenuState be the load screen
	// still ain't working yet.

	// soooon
	//
	// off to take liam to maker works... see you in a bit.
	private var scoreBoard:FlxText;
	private var successMsg:FlxText;
	private var level1:Int=1;
	private var msgalpha:Int=0;

	override public function create():Void
	{
		FlxG.bgColor = 0xffffffff;	

		var mpoint:FlxSprite = new FlxSprite(0,0);
		mpoint.makeGraphic(1,1);
		
		FlxG.mouse.show(mpoint,0.01);
		
		Registry.init();
		add(Registry.player);
		add(Registry.enemies);
		
		successMsg = new FlxText(0,250,600,"SUCCESS");
		successMsg.setFormat("assets/Adore64",9,0x000000,"center");
		successMsg.alpha=0;
		add(successMsg);
		
		// create status area
		// need colored box, player limitation
		// registry.woffset has width of status box
		
		
		
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
		//UpdatePlayer();
		CheckState();
		
	}	

	private function updateEntities() {
	  // spawn new enemies if needed
	  // move enemies based on their velocities
	  // enemy specific behavior
	}
	
	private function CheckCollision() {
	 	// for each enemy in enemy list check if player collides
		FlxG.overlap(Registry.player, Registry.enemies, Registry.enemies.enemyHitPlayer);
	
		// update addred, addgreen, addblue and change enemy behavior
	}
	
	private function CheckState() {
		
		if (Registry.player.color==0xffffff) {
			Registry.enemies.setPool(0);
			Registry.player.exists=false;
			successMsg.alpha = (msgalpha++)/255;
			if (msgalpha==255) { msgalpha=254; }
			
			
			
		}
	  // is the game or level over?
	}

}
