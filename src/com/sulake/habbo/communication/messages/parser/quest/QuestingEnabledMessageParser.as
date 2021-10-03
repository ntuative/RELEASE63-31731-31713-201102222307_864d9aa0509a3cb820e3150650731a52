package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class QuestingEnabledMessageParser implements IMessageParser
   {
       
      
      private var var_1247:Boolean;
      
      private var var_1836:String;
      
      public function QuestingEnabledMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1247 = false;
         this.var_1836 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1247 = param1.readBoolean();
         this.var_1836 = param1.readString();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1247;
      }
      
      public function get defaultCampaignCode() : String
      {
         return this.var_1836;
      }
   }
}
