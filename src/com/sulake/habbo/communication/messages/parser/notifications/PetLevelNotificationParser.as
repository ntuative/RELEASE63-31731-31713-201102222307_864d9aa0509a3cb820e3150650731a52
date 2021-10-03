package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1878:int;
      
      private var var_2157:String;
      
      private var var_1338:int;
      
      private var var_1208:int;
      
      private var var_1594:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1878 = param1.readInteger();
         this.var_2157 = param1.readString();
         this.var_1338 = param1.readInteger();
         this.var_1208 = param1.readInteger();
         this.var_1594 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1878;
      }
      
      public function get petName() : String
      {
         return this.var_2157;
      }
      
      public function get level() : int
      {
         return this.var_1338;
      }
      
      public function get petType() : int
      {
         return this.var_1208;
      }
      
      public function get breed() : int
      {
         return this.var_1594;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
