package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const const_460:int = -1;
      
      public static const const_1151:int = -1;
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_151:int = 0;
      
      private var var_2376:int = 1;
      
      private var var_896:int = 1;
      
      private var var_1692:int = 1;
      
      private var var_2377:int = -1;
      
      private var var_2378:int = 0;
      
      private var var_2379:Boolean = false;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_151 = param3;
         this.var_2379 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2376 = param4;
         if(param5 < 0)
         {
            param5 = const_460;
         }
         this.var_896 = param5;
         this.var_1692 = param5;
         if(param7 >= 0)
         {
            this.var_2377 = param7;
            this.var_2378 = param8;
         }
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_151;
      }
      
      public function get repeats() : int
      {
         return this.var_2376;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_896;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2379;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_896 < 0)
         {
            return const_460;
         }
         return this.var_1692;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_896 > 0 && param1 > this.var_896)
         {
            param1 = this.var_896;
         }
         this.var_1692 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2377;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2378;
      }
   }
}
