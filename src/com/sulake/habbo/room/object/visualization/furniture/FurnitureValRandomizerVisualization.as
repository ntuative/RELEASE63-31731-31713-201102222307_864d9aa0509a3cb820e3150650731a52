package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_911:int = 20;
      
      private static const const_589:int = 10;
      
      private static const const_1244:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_275:Array;
      
      private var var_765:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_275 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_765)
            {
               this.var_765 = true;
               this.var_275 = new Array();
               this.var_275.push(const_1244);
               this.var_275.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_589)
         {
            if(this.var_765)
            {
               this.var_765 = false;
               this.var_275 = new Array();
               if(_direction == 2)
               {
                  this.var_275.push(const_911 + 5 - param1);
                  this.var_275.push(const_589 + 5 - param1);
               }
               else
               {
                  this.var_275.push(const_911 + param1);
                  this.var_275.push(const_589 + param1);
               }
               this.var_275.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
