package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_911:int = 20;
      
      private static const const_589:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_275:Array;
      
      private var var_765:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_275 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_765)
            {
               this.var_765 = true;
               this.var_275 = new Array();
               this.var_275.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_765)
            {
               this.var_765 = false;
               this.var_275 = new Array();
               this.var_275.push(const_911);
               this.var_275.push(const_589 + param1);
               this.var_275.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
