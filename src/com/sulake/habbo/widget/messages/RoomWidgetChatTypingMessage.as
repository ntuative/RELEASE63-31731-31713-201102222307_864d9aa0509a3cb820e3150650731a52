package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_617:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_563:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_617);
         this.var_563 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_563;
      }
   }
}
