package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      private var var_1043:Boolean;
      
      private var var_842:Array = null;
      
      private var var_2068:int;
      
      private var var_1559:int;
      
      public function UserRightsMessageParser()
      {
         super();
         this.var_842 = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Boolean = param1.readBoolean();
         if(_loc2_)
         {
            this.var_842 = [];
            _loc3_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_842.push(param1.readString());
               _loc4_++;
            }
            this.var_1043 = false;
         }
         else
         {
            this.var_2068 = param1.readInteger();
            this.var_1559 = param1.readInteger();
            this.var_1043 = true;
         }
         return true;
      }
      
      public function get simpleSecurity() : Boolean
      {
         return this.var_1043;
      }
      
      public function get rights() : Array
      {
         return this.var_842.slice();
      }
      
      public function get clubLevel() : int
      {
         return this.var_2068;
      }
      
      public function get securityLevel() : int
      {
         return this.var_1559;
      }
   }
}
