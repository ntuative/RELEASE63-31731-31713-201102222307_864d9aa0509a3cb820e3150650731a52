package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_540:String;
      
      private var var_912:String;
      
      private var var_1747:String;
      
      private var var_2005:int;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function get sex() : String
      {
         return this.var_912;
      }
      
      public function get customInfo() : String
      {
         return this.var_1747;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2005;
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this.var_540 = "";
         this.var_912 = "";
         this.var_1747 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_540 = param1.readString();
         this.var_912 = param1.readString();
         this.var_1747 = param1.readString();
         this.var_2005 = param1.readInteger();
         if(this.var_912)
         {
            this.var_912 = this.var_912.toUpperCase();
         }
         return true;
      }
   }
}
