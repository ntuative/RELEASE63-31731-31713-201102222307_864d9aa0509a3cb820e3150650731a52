package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_231:String = "ROE_MOUSE_CLICK";
      
      public static const const_1782:String = "ROE_MOUSE_ENTER";
      
      public static const const_493:String = "ROE_MOUSE_MOVE";
      
      public static const const_1912:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1904:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_562:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1897:String = "";
      
      private var var_2578:Boolean;
      
      private var var_2580:Boolean;
      
      private var var_2577:Boolean;
      
      private var var_2579:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1897 = param2;
         this.var_2578 = param5;
         this.var_2580 = param6;
         this.var_2577 = param7;
         this.var_2579 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1897;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2578;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2580;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2577;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2579;
      }
   }
}
