package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1294:int = 2;
      
      private static const const_1295:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_275:Array;
      
      private var var_1131:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_275 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1294)
         {
            this.var_275 = new Array();
            this.var_275.push(const_1295);
            this.var_1131 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1131 > 0)
         {
            --this.var_1131;
         }
         if(this.var_1131 == 0)
         {
            if(this.var_275.length > 0)
            {
               super.setAnimation(this.var_275.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
