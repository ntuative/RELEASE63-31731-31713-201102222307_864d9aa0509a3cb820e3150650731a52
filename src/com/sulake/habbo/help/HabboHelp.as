package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_182:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_309:IHabboCommunicationManager;
      
      private var var_939:IHabboLocalizationManager;
      
      private var var_937:IHabboConfigurationManager;
      
      private var var_405:ISessionDataManager;
      
      private var var_1160:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_63:HelpUI;
      
      private var var_101:TutorialUI;
      
      private var var_754:HotelMergeUI;
      
      private var var_938:RegistrationUI;
      
      private var var_1403:CallForHelpData;
      
      private var var_2511:UserRegistry;
      
      private var var_2114:String = "";
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1403 = new CallForHelpData();
         this.var_2511 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1160 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2114 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2114;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1403;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2511;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_939;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_182;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_405;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_101;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_754;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_101)
         {
            return this.var_101.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.dispose();
            this.var_63 = null;
         }
         if(this.var_101 != null)
         {
            this.var_101.dispose();
            this.var_101 = null;
         }
         if(this.var_754)
         {
            this.var_754.dispose();
            this.var_754 = null;
         }
         if(this.var_938 != null)
         {
            this.var_938.dispose();
            this.var_938 = null;
         }
         if(this.var_1160 != null)
         {
            this.var_1160.dispose();
            this.var_1160 = null;
         }
         this._incomingMessages = null;
         if(this.var_182)
         {
            this.var_182.release(new IIDHabboToolbar());
            this.var_182 = null;
         }
         if(this.var_939)
         {
            this.var_939.release(new IIDHabboLocalizationManager());
            this.var_939 = null;
         }
         if(this.var_309)
         {
            this.var_309.release(new IIDHabboCommunicationManager());
            this.var_309 = null;
         }
         if(this.var_937)
         {
            this.var_937.release(new IIDHabboConfigurationManager());
            this.var_937 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_405 != null)
         {
            this.var_405.release(new IIDSessionDataManager());
            this.var_405 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1160;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_309 != null && param1 != null)
         {
            this.var_309.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_937 == null)
         {
            return param1;
         }
         return this.var_937.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1403.reportedUserId = param1;
         this.var_1403.reportedUserName = param2;
         this.var_63.showUI(HabboHelpViewEnum.const_341);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_63 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_63.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_63 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_63 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_939,this.var_182);
         }
         return this.var_63 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_101 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_101 = new TutorialUI(this,_loc1_);
         }
         return this.var_101 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_101 != null)
         {
            this.var_101.dispose();
            this.var_101 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_754)
         {
            this.var_754 = new HotelMergeUI(this);
         }
         this.var_754.startNameChange();
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_938)
         {
            this.var_938 = new RegistrationUI(this);
         }
         this.var_938.showRegistrationView();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_101 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_101.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_101)
         {
            this.var_101.showView(TutorialUI.const_322);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_309 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_309);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_182 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_939 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_937 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_93,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_98,this.onRoomSessionEvent);
         this.var_182.events.addEventListener(HabboToolbarEvent.const_65,this.onHabboToolbarEvent);
         this.var_182.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_405 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_93:
               if(this.var_63 != null)
               {
                  this.var_63.setRoomSessionStatus(true);
               }
               if(this.var_101 != null)
               {
                  this.var_101.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_98:
               if(this.var_63 != null)
               {
                  this.var_63.setRoomSessionStatus(false);
               }
               if(this.var_101 != null)
               {
                  this.var_101.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_182 != null)
         {
            this.var_182.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_119,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_65)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
