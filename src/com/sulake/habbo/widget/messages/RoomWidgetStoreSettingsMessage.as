package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1439:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_866:String = "RWSSM_STORE_SOUND";
      
      public static const const_806:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_480:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_480;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_480 = param1;
      }
   }
}
