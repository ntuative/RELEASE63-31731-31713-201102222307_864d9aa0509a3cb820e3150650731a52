package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1969:String;
      
      protected var var_1243:Number;
      
      protected var var_2730:Boolean;
      
      protected var var_2731:Boolean;
      
      protected var var_2353:Boolean;
      
      protected var var_2583:Boolean;
      
      protected var var_2737:int;
      
      protected var var_2357:int;
      
      protected var var_2352:int;
      
      protected var var_2351:int;
      
      protected var var_1494:String;
      
      protected var var_2137:int;
      
      protected var var_967:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2353 = param5;
         this.var_2731 = param6;
         this.var_2730 = param7;
         this.var_2583 = param8;
         this.var_1969 = param9;
         this.var_1243 = param10;
         this.var_2737 = param11;
         this.var_2357 = param12;
         this.var_2352 = param13;
         this.var_2351 = param14;
         this.var_1494 = param15;
         this.var_2137 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1969;
      }
      
      public function get extra() : Number
      {
         return this.var_1243;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2730;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2731;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2353;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2583;
      }
      
      public function get expires() : int
      {
         return this.var_2737;
      }
      
      public function get creationDay() : int
      {
         return this.var_2357;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2352;
      }
      
      public function get creationYear() : int
      {
         return this.var_2351;
      }
      
      public function get slotId() : String
      {
         return this.var_1494;
      }
      
      public function get songId() : int
      {
         return this.var_2137;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_967 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_967;
      }
   }
}
