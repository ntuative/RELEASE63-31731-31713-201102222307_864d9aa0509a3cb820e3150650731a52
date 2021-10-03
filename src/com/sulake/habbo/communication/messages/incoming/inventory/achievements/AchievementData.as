package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1338:int;
      
      private var var_292:String;
      
      private var var_2470:int;
      
      private var var_2317:int;
      
      private var var_1667:int;
      
      private var var_2471:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1338 = param1.readInteger();
         this.var_292 = param1.readString();
         this.var_2470 = param1.readInteger();
         this.var_2317 = param1.readInteger();
         this.var_1667 = param1.readInteger();
         this.var_2471 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_292;
      }
      
      public function get level() : int
      {
         return this.var_1338;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2470;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2317;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1667;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2471;
      }
   }
}
