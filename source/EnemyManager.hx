package;
 
import nme.Lib;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import org.flixel.FlxGroup;
 
class EnemyManager extends FlxGroup
{
    private var lastReleased:Int;
    private var releaseRate:Int;
 	private var poolSize:Int;
 	private var enemyCount:Int=0;
 
    public function new()
    {
        super();
 		startLevel();
        
    }
    
    
    private function startLevel() {
    	releaseRate = 500;
 
        poolSize = 100;
        var i = 0;
        while (i < poolSize) {
            var enemy = new Enemy();
            add(enemy);

            i++;
        }
    
    }
    
 
 	public function setPool(size:Int) {
 		poolSize = size;
 	}
 	
 	public function setReleaseRate(rate:Int) {
 		releaseRate = rate;
 	}
 
    public function release():Void
    {
        var enemy = cast ( getFirstAvailable(), Enemy);
 
        if (enemy!=null)
        {
            enemy.launch();
            enemyCount++;
            
        }
    }
 
    override public function update():Void
    {
        super.update();
 		
 
 		
 		
 		if (enemyCount==0 && Registry.player.exists==false) {
 			//trace("done");
 			/*Registry.level += 1;
 			poolSize = 100 + Registry.level*20;
 			releaseRate = 500 + 50*Registry.level;
 			Registry.player.exists=true;
 			Registry.player.color=0x000000;
 			startLevel();
 			*/
 		}
 		
 		if (this.countLiving()>=poolSize) {
 			return;
 		}
 		
 		
        if (Lib.getTimer() > lastReleased + releaseRate)
        {
            lastReleased = Lib.getTimer();
 
            release();
        }
    }

 
    public function enemyHitPlayer(player:FlxObject, enemy:FlxObject):Void
    {
        enemy.kill();
        enemyCount--;
        

        //Registry.player.addred=10;
        //enemy.hurt(1);
 
        //Registry.fx.explodeBlock(Std.int(enemy.x+enemy.width*.5), Std.int(enemy.y+enemy.height));
        Registry.fx.explodeBlock(Std.int(player.x),Std.int(player.y));
 
        FlxG.score += 1;
    }
 
}
