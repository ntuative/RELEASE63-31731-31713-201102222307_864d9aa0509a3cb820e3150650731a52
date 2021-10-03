package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var _name:String;
      
      private var var_1819:String;
      
      private var var_1308:Boolean;
      
      private var var_1309:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         this._name = String(param1.@name);
         this.var_1819 = String(param1.@link);
         this.var_1308 = Boolean(parseInt(param1.@fliph));
         this.var_1309 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get link() : String
      {
         return this.var_1819;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1308;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1309;
      }
   }
}
