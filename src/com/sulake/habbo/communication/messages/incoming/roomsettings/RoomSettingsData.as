package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_468:int = 0;
      
      public static const const_175:int = 1;
      
      public static const const_122:int = 2;
      
      public static const const_707:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1490:String;
      
      private var var_2171:int;
      
      private var var_1311:int;
      
      private var var_2172:int;
      
      private var var_2533:int;
      
      private var var_797:Array;
      
      private var var_2170:Array;
      
      private var var_2532:int;
      
      private var var_2173:Boolean;
      
      private var var_2169:Boolean;
      
      private var var_2174:Boolean;
      
      private var var_2175:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2173;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2173 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2169;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2169 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2174;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2174 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2175;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2175 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1490;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1490 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2171;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2171 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1311;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1311 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2172;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2172 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2533;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2533 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_797;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_797 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2170;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2170 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2532;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2532 = param1;
      }
   }
}
