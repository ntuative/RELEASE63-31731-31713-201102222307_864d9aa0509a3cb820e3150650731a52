package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1247:Boolean = false;
      
      private var var_1651:int;
      
      private var var_1524:Array;
      
      private var var_663:Array;
      
      private var var_664:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1247 = _loc2_.isWrappingEnabled;
         this.var_1651 = _loc2_.wrappingPrice;
         this.var_1524 = _loc2_.stuffTypes;
         this.var_663 = _loc2_.boxTypes;
         this.var_664 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1247;
      }
      
      public function get price() : int
      {
         return this.var_1651;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1524;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_663;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_664;
      }
   }
}
