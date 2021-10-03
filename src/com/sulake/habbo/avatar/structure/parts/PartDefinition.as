package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2248:String;
      
      private var var_1626:String;
      
      private var var_2247:String;
      
      private var var_1627:Boolean;
      
      private var var_1628:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2248 = String(param1["set-type"]);
         this.var_1626 = String(param1["flipped-set-type"]);
         this.var_2247 = String(param1["remove-set-type"]);
         this.var_1627 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1628 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1628;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1628 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2248;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1626;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2247;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1627;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1627 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1626 = param1;
      }
   }
}