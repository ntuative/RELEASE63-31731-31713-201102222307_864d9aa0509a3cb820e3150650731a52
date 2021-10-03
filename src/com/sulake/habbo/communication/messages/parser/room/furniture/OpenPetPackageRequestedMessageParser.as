package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_348:int = -1;
      
      private var var_1208:int = -1;
      
      private var var_1594:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_348;
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
      
      public function flush() : Boolean
      {
         this.var_348 = -1;
         this.var_1208 = -1;
         this.var_1594 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_348 = param1.readInteger();
         this.var_1208 = param1.readInteger();
         this.var_1594 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
