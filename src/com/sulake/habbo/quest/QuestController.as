package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.ActivateQuestMessageComposer;
   
   public class QuestController implements IDisposable
   {
      
      private static const MODE_NO_TABS:String = "MODE_NO_TABS";
      
      private static const MODE_TABS:String = "MODE_TABS";
       
      
      private var var_191:HabboQuestEngine;
      
      private var var_158:Map;
      
      private var var_305:QuestCampaign;
      
      private var var_760:Boolean = false;
      
      private var _window:IFrameWindow;
      
      private var var_1183:IWindowContainer;
      
      private var var_609:String;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         this.var_158 = new Map();
         super();
         this.var_191 = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_158)
         {
            for each(_loc1_ in this.var_158)
            {
               _loc1_.dispose();
            }
            this.var_158.dispose();
            this.var_158 = null;
         }
         this.var_760 = true;
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_760;
      }
      
      private function reset() : void
      {
         if(this.var_305)
         {
            this.var_305.dispose();
            this.var_305 = null;
         }
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function questAccepted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this.var_158[param1];
         if(!_loc3_)
         {
            _loc3_ = new QuestCampaign(this,param1);
            this.var_158[param1] = _loc3_;
         }
         if(_loc3_)
         {
            _loc3_.questAccepted(param2);
         }
      }
      
      public function questCompleted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this.var_158[param1];
         if(!_loc3_)
         {
            _loc3_ = new QuestCampaign(this,param1);
            this.var_158[param1] = _loc3_;
         }
         if(_loc3_)
         {
            _loc3_.questCompleted(param2);
         }
      }
      
      public function activateQuest(param1:Quest) : void
      {
         if(param1)
         {
            this.var_191.communication.getHabboMainConnection(null).send(new ActivateQuestMessageComposer(param1.id));
         }
      }
      
      public function get questEngine() : HabboQuestEngine
      {
         return this.var_191;
      }
      
      public function openCampaign(param1:String, param2:int, param3:Array) : void
      {
         if(this.var_609 != MODE_TABS)
         {
            this.var_609 = MODE_NO_TABS;
         }
         this.detachCampaign();
         var _loc4_:QuestCampaign = this.var_158[param1];
         if(!_loc4_)
         {
            _loc4_ = new QuestCampaign(this,param1);
            this.var_158[param1] = _loc4_;
         }
         _loc4_.activityPointType = param2;
         this.var_305 = _loc4_;
         this.var_305.openCampaign(param3);
         this.prepareWindow();
         this.attachCampaign();
         if(this.var_609 == MODE_TABS)
         {
            this.refreshTabs();
            this.updateTabs();
         }
      }
      
      private function detachCampaign() : void
      {
         if(!this.var_1183)
         {
            return;
         }
         this.var_1183.removeChildAt(0);
      }
      
      private function attachCampaign() : void
      {
         if(!this.var_305)
         {
            return;
         }
         if(!this.var_1183)
         {
            return;
         }
         this.var_1183.addChild(this.var_305.window);
         var _loc1_:String = "quest_" + this.var_305.code;
         var _loc2_:* = _loc1_ + ".title";
         this._window.caption = "${" + _loc2_ + "}";
      }
      
      public function openCampaigns(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_609 != MODE_TABS)
         {
            this.reset();
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
         }
         this.var_609 = MODE_TABS;
         for each(_loc3_ in param1)
         {
            _loc4_ = this.var_158[_loc3_];
            if(!_loc4_)
            {
               _loc4_ = new QuestCampaign(this,_loc3_);
               this.var_158[_loc3_] = _loc4_;
            }
            _loc4_.expired = param2;
         }
         this.prepareWindow();
         this.refreshTabs();
         this.updateTabs();
      }
      
      private function updateTabs() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:String = "";
         if(this.var_305)
         {
            _loc1_ = this.var_305.code;
         }
         else if(this.var_158.getKeys().length > 0)
         {
            _loc1_ = this.var_158.getKeys()[0];
         }
         if(_loc1_ != "")
         {
            _loc2_ = this._window.findChildByName("campaigns") as ITabContextWindow;
            _loc3_ = _loc2_.getTabItemByName("tab_" + _loc1_);
            if(_loc3_)
            {
               _loc2_.selector.setSelected(_loc3_);
            }
         }
      }
      
      public function updatePurse() : void
      {
         if(!this.var_305)
         {
            return;
         }
         this.var_305.updatePurse();
      }
      
      private function prepareWindow() : void
      {
         var _loc1_:* = null;
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         switch(this.var_609)
         {
            case MODE_NO_TABS:
               _loc1_ = "QuestEngine";
               break;
            case MODE_TABS:
               _loc1_ = "QuestEngineTabs";
               break;
            default:
               _loc1_ = "QuestEngine";
         }
         this._window = IFrameWindow(this.var_191.getXmlWindow(_loc1_));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.center();
         this.var_1183 = this._window.findChildByName("content") as IWindowContainer;
      }
      
      private function refreshTabs() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:ITabContextWindow = this._window.findChildByName("campaigns") as ITabContextWindow;
         for each(_loc4_ in this.var_158.getKeys())
         {
            _loc3_ = this.var_158[_loc4_];
            _loc2_ = _loc1_.getTabItemByName("tab_" + _loc4_);
            if(!_loc2_)
            {
               _loc2_ = this.var_191.windowManager.createWindow("tab_" + _loc4_,_loc4_,WindowType.const_448) as ITabButtonWindow;
               _loc1_.addTabItem(_loc2_);
               _loc2_.addEventListener(WindowEvent.const_57,this.onTabSelect);
            }
            _loc5_ = 4287150640;
            if(!_loc3_.expired)
            {
               _loc2_.color = 4287150640;
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onTabSelect(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(!param2)
         {
            param2 = param1.target as IWindow;
         }
         Logger.log("Tab select: " + param2.name + " " + param2.caption);
         this.var_191.getQuestCampaign(param2.caption);
      }
   }
}
