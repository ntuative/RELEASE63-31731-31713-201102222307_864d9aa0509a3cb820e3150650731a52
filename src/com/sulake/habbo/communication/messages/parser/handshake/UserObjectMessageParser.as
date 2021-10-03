package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_540:String;
      
      private var var_912:String;
      
      private var var_2607:String;
      
      private var var_1517:String;
      
      private var var_2608:int;
      
      private var var_2604:String;
      
      private var var_2605:int;
      
      private var var_2606:int;
      
      private var var_2241:int;
      
      private var _respectLeft:int;
      
      private var var_678:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_540 = param1.readString();
         this.var_912 = param1.readString();
         this.var_2607 = param1.readString();
         this.var_1517 = param1.readString();
         this.var_2608 = param1.readInteger();
         this.var_2604 = param1.readString();
         this.var_2605 = param1.readInteger();
         this.var_2606 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_678 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function get sex() : String
      {
         return this.var_912;
      }
      
      public function get customData() : String
      {
         return this.var_2607;
      }
      
      public function get realName() : String
      {
         return this.var_1517;
      }
      
      public function get tickets() : int
      {
         return this.var_2608;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2604;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2605;
      }
      
      public function get directMail() : int
      {
         return this.var_2606;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2241;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_678;
      }
   }
}
