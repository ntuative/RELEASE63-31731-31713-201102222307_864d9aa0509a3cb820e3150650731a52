package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2570:int;
      
      private var var_2573:int;
      
      private var var_662:Boolean;
      
      private var var_2572:int;
      
      private var var_2571:int;
      
      private var var_2575:int;
      
      private var var_2574:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2570 = param1.readInteger();
         this.var_2573 = param1.readInteger();
         this.var_662 = param1.readBoolean();
         this.var_2572 = param1.readInteger();
         this.var_2571 = param1.readInteger();
         this.var_2575 = param1.readInteger();
         this.var_2574 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2570;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2573;
      }
      
      public function get online() : Boolean
      {
         return this.var_662;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2572;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2571;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2575;
      }
      
      public function get banCount() : int
      {
         return this.var_2574;
      }
   }
}
