package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_822:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2398:String;
      
      private var var_2399:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_822,param3,param4);
         this.var_2398 = param1;
         this.var_2399 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2398;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2399;
      }
   }
}
