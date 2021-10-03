package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_894:IAssetLoader;
      
      private var var_1753:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1753 = param1;
         this.var_894 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1753;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_894;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_894 != null)
            {
               if(!this.var_894.disposed)
               {
                  this.var_894.dispose();
                  this.var_894 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
