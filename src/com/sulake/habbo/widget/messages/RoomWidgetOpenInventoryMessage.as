package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_874:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1024:String = "inventory_effects";
      
      public static const const_1158:String = "inventory_badges";
      
      public static const const_1399:String = "inventory_clothes";
      
      public static const const_1533:String = "inventory_furniture";
       
      
      private var var_2333:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_874);
         this.var_2333 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2333;
      }
   }
}
