package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_691:String = "RWUAM_WHISPER_USER";
      
      public static const const_616:String = "RWUAM_IGNORE_USER";
      
      public static const const_873:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_428:String = "RWUAM_KICK_USER";
      
      public static const const_726:String = "RWUAM_BAN_USER";
      
      public static const const_692:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_754:String = "RWUAM_RESPECT_USER";
      
      public static const const_871:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_665:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_650:String = "RWUAM_START_TRADING";
      
      public static const const_767:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_564:String = "RWUAM_KICK_BOT";
      
      public static const const_744:String = "RWUAM_REPORT";
      
      public static const const_469:String = "RWUAM_PICKUP_PET";
      
      public static const const_1645:String = "RWUAM_TRAIN_PET";
      
      public static const const_456:String = " RWUAM_RESPECT_PET";
      
      public static const const_360:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_674:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
