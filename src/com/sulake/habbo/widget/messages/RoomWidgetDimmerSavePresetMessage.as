package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_679:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2332:int;
      
      private var var_2331:int;
      
      private var _color:uint;
      
      private var var_1055:int;
      
      private var var_2330:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_679);
         this.var_2332 = param1;
         this.var_2331 = param2;
         this._color = param3;
         this.var_1055 = param4;
         this.var_2330 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2332;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2331;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1055;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2330;
      }
   }
}
