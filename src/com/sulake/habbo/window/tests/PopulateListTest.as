package com.sulake.habbo.window.tests
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.utils.getTimer;
   
   public class PopulateListTest extends TestCase
   {
       
      
      private var _frames:Array;
      
      public function PopulateListTest()
      {
         super();
      }
      
      override public function begin(param1:HabboWindowManagerComponent) : void
      {
         this._frames = new Array();
         super.begin(param1);
      }
      
      override public function test(param1:Object) : void
      {
         this.actualTest(param1.type,param1.style,param1.caption,param1.count,param1.properties);
      }
      
      private function actualTest(param1:uint, param2:int = 0, param3:String = "Example Caption", param4:int = 300, param5:Array = null) : void
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc6_:IFrameWindow = windowManager.buildFromXML(windowManager.assets.getAssetByName("list_tester_xml").content as XML,2) as IFrameWindow;
         _loc6_.caption = "Populating window type: " + param1 + " x " + param4;
         this._frames.push(_loc6_);
         var _loc7_:IItemListWindow = _loc6_.findChildByName("_list_horizontal") as IItemListWindow;
         var _loc8_:IItemListWindow = _loc6_.findChildByName("_list_vertical") as IItemListWindow;
         var _loc9_:IWindow = windowManager.create("foo",param1,param2,WindowParam.const_32,null,null,param3,0,null,null,param5);
         var _loc12_:int = getTimer();
         _loc10_ = new Array();
         _loc11_ = 0;
         while(_loc11_ < param4)
         {
            _loc10_.push(_loc9_.clone());
            _loc11_++;
         }
         _loc8_.populate(_loc10_);
         result = getTimer() - _loc12_;
         if(_loc8_.numListItems != param4)
         {
            throw new Error("Wrong number of items populated!!!");
         }
      }
      
      override public function end() : void
      {
         super.end();
         if(this._frames)
         {
            while(this._frames.length > 0)
            {
               this._frames.pop().dispose();
            }
         }
      }
   }
}
