package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2080:int;
      
      private var var_1519:String;
      
      private var var_2042:String;
      
      private var var_2636:Boolean;
      
      private var var_2635:Boolean;
      
      private var var_2637:int;
      
      private var var_2041:String;
      
      private var var_2634:String;
      
      private var var_1517:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2080 = param1.readInteger();
         this.var_1519 = param1.readString();
         this.var_2042 = param1.readString();
         this.var_2636 = param1.readBoolean();
         this.var_2635 = param1.readBoolean();
         param1.readString();
         this.var_2637 = param1.readInteger();
         this.var_2041 = param1.readString();
         this.var_2634 = param1.readString();
         this.var_1517 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2080;
      }
      
      public function get avatarName() : String
      {
         return this.var_1519;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2042;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2636;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2635;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2637;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2041;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2634;
      }
      
      public function get realName() : String
      {
         return this.var_1517;
      }
   }
}
