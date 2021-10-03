package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      private var var_150:Number = 0;
      
      private var var_2461:Number = 0;
      
      private var var_2458:Number = 0;
      
      private var var_2460:Number = 0;
      
      private var var_2456:Number = 0;
      
      private var var_265:int = 0;
      
      private var var_2457:int = 0;
      
      private var var_315:Array;
      
      private var var_2459:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_315 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_151 = param3;
         this.var_150 = param4;
         this.var_2461 = param5;
         this.var_265 = param6;
         this.var_2457 = param7;
         this.var_2458 = param8;
         this.var_2460 = param9;
         this.var_2456 = param10;
         this.var_2459 = param11;
         this.var_315 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_151;
      }
      
      public function get z() : Number
      {
         return this.var_150;
      }
      
      public function get localZ() : Number
      {
         return this.var_2461;
      }
      
      public function get targetX() : Number
      {
         return this.var_2458;
      }
      
      public function get targetY() : Number
      {
         return this.var_2460;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2456;
      }
      
      public function get dir() : int
      {
         return this.var_265;
      }
      
      public function get dirHead() : int
      {
         return this.var_2457;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2459;
      }
      
      public function get actions() : Array
      {
         return this.var_315.slice();
      }
   }
}
