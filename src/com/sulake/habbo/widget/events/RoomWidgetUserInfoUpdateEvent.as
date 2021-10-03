package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_109:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_151:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_977:int = 2;
      
      public static const const_1051:int = 3;
      
      public static const const_1629:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1702:String = "";
      
      private var var_2005:int;
      
      private var var_2006:int = 0;
      
      private var var_2004:int = 0;
      
      private var var_540:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_240:Array;
      
      private var var_1542:Array;
      
      private var var_1249:int = 0;
      
      private var var_2093:String = "";
      
      private var var_2085:int = 0;
      
      private var var_2092:int = 0;
      
      private var var_1919:Boolean = false;
      
      private var var_1517:String = "";
      
      private var var_2089:Boolean = false;
      
      private var var_2087:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2088:Boolean = false;
      
      private var var_2090:Boolean = false;
      
      private var var_2086:Boolean = false;
      
      private var var_2083:Boolean = false;
      
      private var var_2091:Boolean = false;
      
      private var var_2084:Boolean = false;
      
      private var var_2082:int = 0;
      
      private var var_1921:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_240 = [];
         this.var_1542 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1702 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1702;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2005 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2005;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2006 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2006;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2004 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2004;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_540 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_240 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_240;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1542;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1542 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1249 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1249;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2093 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2093;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2089 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2089;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2088 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2088;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2090 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2090;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2086 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2086;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2083 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2083;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2091 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2091;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2084 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2084;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2082 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2082;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2087 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2087;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1921 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1921;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2085 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2085;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2092 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2092;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1919 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1919;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1517 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1517;
      }
   }
}
