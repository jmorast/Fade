package ;
 
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxSpecialFX;
import org.flixel.FlxG;
import org.flixel.plugin.photonstorm.fx.StarfieldFX;
 
class Registry
{
	// from http://www.haxeflixel.com/articles/game-registry
    public static var enemies:EnemyManager;
 	public static var player:Player;
 	public static var level:Int;
 	public static var woffset:Int;
	public static var fx:Fx;
 	
 	
    //Setup the Registry Objects to create your instances
    public static function init()
    {
        //create the player ship
        //player = new Player();
        enemies = new EnemyManager();
        player = new Player();
        level = 1;
        woffset = 60;
	fx = new Fx();
    }
 
}
