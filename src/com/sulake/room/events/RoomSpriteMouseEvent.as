package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1897:String = "";
      
      private var var_1678:String = "";
      
      private var var_2550:String = "";
      
      private var var_2581:Number = 0;
      
      private var var_2576:Number = 0;
      
      private var var_2359:Number = 0;
      
      private var var_2358:Number = 0;
      
      private var var_2580:Boolean = false;
      
      private var var_2578:Boolean = false;
      
      private var var_2577:Boolean = false;
      
      private var var_2579:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1897 = param2;
         this.var_1678 = param3;
         this.var_2550 = param4;
         this.var_2581 = param5;
         this.var_2576 = param6;
         this.var_2359 = param7;
         this.var_2358 = param8;
         this.var_2580 = param9;
         this.var_2578 = param10;
         this.var_2577 = param11;
         this.var_2579 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1897;
      }
      
      public function get canvasId() : String
      {
         return this.var_1678;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2550;
      }
      
      public function get screenX() : Number
      {
         return this.var_2581;
      }
      
      public function get screenY() : Number
      {
         return this.var_2576;
      }
      
      public function get localX() : Number
      {
         return this.var_2359;
      }
      
      public function get localY() : Number
      {
         return this.var_2358;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2580;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2578;
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
