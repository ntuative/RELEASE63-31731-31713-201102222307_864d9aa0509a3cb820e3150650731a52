package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1712:int = 1;
      
      public static const const_1928:int = 2;
      
      public static const const_1762:int = 3;
      
      public static const const_1885:int = 4;
      
      public static const const_1479:int = 5;
      
      public static const const_1719:int = 6;
      
      public static const const_1601:int = 7;
      
      public static const const_1470:int = 8;
      
      public static const const_1741:int = 9;
      
      public static const const_1418:int = 10;
      
      public static const const_1611:int = 11;
      
      public static const const_1420:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1489:int;
      
      private var var_1381:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1489 = param1.readInteger();
         this.var_1381 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1489;
      }
      
      public function get info() : String
      {
         return this.var_1381;
      }
   }
}
