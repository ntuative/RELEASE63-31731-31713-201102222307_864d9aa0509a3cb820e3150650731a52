package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_174:int = 0;
       
      
      private var var_2164:int = 0;
      
      private var var_1372:Dictionary;
      
      private var var_1744:int = 0;
      
      private var var_1743:int = 0;
      
      private var var_2040:Boolean = false;
      
      private var var_2431:int = 0;
      
      private var var_2432:int = 0;
      
      public function Purse()
      {
         this.var_1372 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2164;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2164 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1744;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1744 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1743;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1743 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1744 > 0 || this.var_1743 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2040;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2040 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2431;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2431 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2432;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2432 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1372;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1372 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1372[param1];
      }
   }
}
