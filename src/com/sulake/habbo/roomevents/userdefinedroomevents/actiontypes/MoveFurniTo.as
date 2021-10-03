package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class MoveFurniTo extends DefaultActionType
   {
       
      
      public function MoveFurniTo()
      {
         super();
      }
      
      override public function get code() : int
      {
         return ActionTypeCodes.var_1956;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.var_313;
      }
   }
}
