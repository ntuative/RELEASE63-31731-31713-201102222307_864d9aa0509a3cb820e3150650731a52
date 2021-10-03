package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_345:int = 1;
      
      public static const const_234:int = 2;
      
      public static const const_273:int = 3;
      
      public static const const_366:int = 4;
      
      public static const const_235:int = 5;
      
      public static const const_394:int = 1;
      
      public static const const_867:int = 2;
      
      public static const const_748:int = 3;
      
      public static const const_669:int = 4;
      
      public static const const_230:int = 5;
      
      public static const const_733:int = 6;
      
      public static const const_803:int = 7;
      
      public static const const_265:int = 8;
      
      public static const const_346:int = 9;
      
      public static const const_1816:int = 10;
      
      public static const const_661:int = 11;
      
      public static const const_470:int = 12;
       
      
      private var var_391:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_391 = new Array();
         this.var_391.push(new Tab(this._navigator,const_345,const_470,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_479));
         this.var_391.push(new Tab(this._navigator,const_234,const_394,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_479));
         this.var_391.push(new Tab(this._navigator,const_366,const_661,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_981));
         this.var_391.push(new Tab(this._navigator,const_273,const_230,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_479));
         this.var_391.push(new Tab(this._navigator,const_235,const_265,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_751));
         this.setSelectedTab(const_345);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_366;
      }
      
      public function get tabs() : Array
      {
         return this.var_391;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_391)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_391)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_391)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
