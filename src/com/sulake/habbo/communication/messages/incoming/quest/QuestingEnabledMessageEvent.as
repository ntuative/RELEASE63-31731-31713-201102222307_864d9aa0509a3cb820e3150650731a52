package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.QuestingEnabledMessageParser;
   
   public class QuestingEnabledMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function QuestingEnabledMessageEvent(param1:Function)
      {
         super(param1,QuestingEnabledMessageParser);
      }
      
      public function getParser() : QuestingEnabledMessageParser
      {
         return var_10 as QuestingEnabledMessageParser;
      }
   }
}
