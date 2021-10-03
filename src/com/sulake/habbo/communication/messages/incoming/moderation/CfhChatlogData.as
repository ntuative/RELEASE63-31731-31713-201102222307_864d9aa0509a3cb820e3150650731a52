package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1846:int;
      
      private var var_2557:int;
      
      private var var_1323:int;
      
      private var var_2182:int;
      
      private var var_105:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1846 = param1.readInteger();
         this.var_2557 = param1.readInteger();
         this.var_1323 = param1.readInteger();
         this.var_2182 = param1.readInteger();
         this.var_105 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1846);
      }
      
      public function get callId() : int
      {
         return this.var_1846;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2557;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1323;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2182;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_105;
      }
   }
}
