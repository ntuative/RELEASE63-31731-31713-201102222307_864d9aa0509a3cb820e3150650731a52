package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1602:IID;
      
      private var var_760:Boolean;
      
      private var var_1078:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1602 = param1;
         this.var_1078 = new Array();
         this.var_760 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1602;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_760;
      }
      
      public function get receivers() : Array
      {
         return this.var_1078;
      }
      
      public function dispose() : void
      {
         if(!this.var_760)
         {
            this.var_760 = true;
            this.var_1602 = null;
            while(this.var_1078.length > 0)
            {
               this.var_1078.pop();
            }
            this.var_1078 = null;
         }
      }
   }
}
