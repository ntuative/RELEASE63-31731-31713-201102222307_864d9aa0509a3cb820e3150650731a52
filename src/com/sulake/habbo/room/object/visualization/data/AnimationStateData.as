package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationStateData
   {
       
      
      private var var_1690:int = -1;
      
      private var var_2374:int = 0;
      
      private var var_1691:Boolean = false;
      
      private var var_604:int = 0;
      
      private var _frames:Array;
      
      private var var_892:Array;
      
      private var var_893:Array;
      
      private var var_586:int = 0;
      
      public function AnimationStateData()
      {
         this._frames = [];
         this.var_892 = [];
         this.var_893 = [];
         super();
      }
      
      public function get animationOver() : Boolean
      {
         return this.var_1691;
      }
      
      public function set animationOver(param1:Boolean) : void
      {
         this.var_1691 = param1;
      }
      
      public function get frameCounter() : int
      {
         return this.var_604;
      }
      
      public function set frameCounter(param1:int) : void
      {
         this.var_604 = param1;
      }
      
      public function get animationId() : int
      {
         return this.var_1690;
      }
      
      public function set animationId(param1:int) : void
      {
         if(param1 != this.var_1690)
         {
            this.var_1690 = param1;
            this.resetAnimationFrames(false);
         }
      }
      
      public function get animationAfterTransitionId() : int
      {
         return this.var_2374;
      }
      
      public function set animationAfterTransitionId(param1:int) : void
      {
         this.var_2374 = param1;
      }
      
      public function dispose() : void
      {
         this._frames = null;
         this.var_892 = null;
         this.var_893 = null;
      }
      
      public function setLayerCount(param1:int) : void
      {
         this.var_586 = param1;
         this.resetAnimationFrames();
      }
      
      public function resetAnimationFrames(param1:Boolean = true) : void
      {
         var _loc3_:* = null;
         if(param1 || this._frames == null)
         {
            this._frames = [];
         }
         this.var_892 = [];
         this.var_893 = [];
         this.var_1691 = false;
         this.var_604 = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_586)
         {
            if(param1 || this._frames.length <= _loc2_)
            {
               this._frames[_loc2_] = null;
            }
            else
            {
               _loc3_ = this._frames[_loc2_];
               if(_loc3_ != null)
               {
                  this._frames[_loc2_] = new AnimationFrame(_loc3_.id,_loc3_.x,_loc3_.y,_loc3_.repeats,0,_loc3_.isLastFrame);
               }
            }
            this.var_892[_loc2_] = false;
            this.var_893[_loc2_] = false;
            _loc2_++;
         }
      }
      
      public function getFrame(param1:int) : AnimationFrame
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            return this._frames[param1];
         }
         return null;
      }
      
      public function setFrame(param1:int, param2:AnimationFrame) : void
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            this._frames[param1] = param2;
         }
      }
      
      public function getAnimationPlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            return this.var_893[param1];
         }
         return true;
      }
      
      public function setAnimationPlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            this.var_893[param1] = param2;
         }
      }
      
      public function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            return this.var_892[param1];
         }
         return true;
      }
      
      public function setLastFramePlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < this.var_586)
         {
            this.var_892[param1] = param2;
         }
      }
   }
}
