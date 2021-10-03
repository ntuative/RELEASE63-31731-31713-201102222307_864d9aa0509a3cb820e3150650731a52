package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1686:Boolean;
      
      private var var_2364:int;
      
      private var var_398:Boolean;
      
      private var var_1119:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1686;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2364;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1119;
      }
      
      public function get owner() : Boolean
      {
         return this.var_398;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1119 != null)
         {
            this.var_1119.dispose();
            this.var_1119 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1686 = param1.readBoolean();
         if(this.var_1686)
         {
            this.var_2364 = param1.readInteger();
            this.var_398 = param1.readBoolean();
         }
         else
         {
            this.var_1119 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
