package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_811:int;
      
      private var var_662:Boolean;
      
      private var var_1703:Boolean;
      
      private var var_540:String;
      
      private var var_1311:int;
      
      private var var_1702:String;
      
      private var var_1518:String;
      
      private var var_1517:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_811 = param1.readInteger();
         this.var_662 = param1.readBoolean();
         this.var_1703 = param1.readBoolean();
         this.var_540 = param1.readString();
         this.var_1311 = param1.readInteger();
         this.var_1702 = param1.readString();
         this.var_1518 = param1.readString();
         this.var_1517 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_811;
      }
      
      public function get online() : Boolean
      {
         return this.var_662;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1703;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function get categoryId() : int
      {
         return this.var_1311;
      }
      
      public function get motto() : String
      {
         return this.var_1702;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1518;
      }
      
      public function get realName() : String
      {
         return this.var_1517;
      }
   }
}
