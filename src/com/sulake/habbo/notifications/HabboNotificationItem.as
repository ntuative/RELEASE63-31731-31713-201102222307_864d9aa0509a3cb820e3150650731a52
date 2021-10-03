package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_82:HabboNotificationItemStyle;
      
      private var var_174:String;
      
      private var _component:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_174 = param1;
         this.var_82 = param2;
         this._component = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_82;
      }
      
      public function get content() : String
      {
         return this.var_174;
      }
      
      public function dispose() : void
      {
         this.var_174 = null;
         if(this.var_82 != null)
         {
            this.var_82.dispose();
            this.var_82 = null;
         }
         this._component = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_82.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this._component != null)
            {
               this._component.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
