package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1878:int;
      
      private var _name:String;
      
      private var var_1338:int;
      
      private var var_2645:int;
      
      private var var_2056:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_540:String;
      
      private var var_2644:int;
      
      private var var_2643:int;
      
      private var var_2646:int;
      
      private var var_2622:int;
      
      private var var_2052:int;
      
      private var _ownerName:String;
      
      private var var_497:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1878;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1338;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2645;
      }
      
      public function get experience() : int
      {
         return this.var_2056;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2644;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2643;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2646;
      }
      
      public function get respect() : int
      {
         return this.var_2622;
      }
      
      public function get ownerId() : int
      {
         return this.var_2052;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_497;
      }
      
      public function flush() : Boolean
      {
         this.var_1878 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1878 = param1.readInteger();
         this._name = param1.readString();
         this.var_1338 = param1.readInteger();
         this.var_2645 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this.var_2644 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2643 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2646 = param1.readInteger();
         this.var_540 = param1.readString();
         this.var_2622 = param1.readInteger();
         this.var_2052 = param1.readInteger();
         this.var_497 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
