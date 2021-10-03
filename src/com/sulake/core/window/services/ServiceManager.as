package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2757:uint;
      
      private var var_139:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1035:IMouseDraggingService;
      
      private var var_1039:IMouseScalingService;
      
      private var var_1036:IMouseListenerService;
      
      private var var_1037:IFocusManagerService;
      
      private var var_1040:IToolTipAgentService;
      
      private var var_1038:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2757 = 0;
         this.var_139 = param2;
         this._windowContext = param1;
         this.var_1035 = new WindowMouseDragger(param2);
         this.var_1039 = new WindowMouseScaler(param2);
         this.var_1036 = new WindowMouseListener(param2);
         this.var_1037 = new FocusManager(param2);
         this.var_1040 = new WindowToolTipAgent(param2);
         this.var_1038 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1035 != null)
         {
            this.var_1035.dispose();
            this.var_1035 = null;
         }
         if(this.var_1039 != null)
         {
            this.var_1039.dispose();
            this.var_1039 = null;
         }
         if(this.var_1036 != null)
         {
            this.var_1036.dispose();
            this.var_1036 = null;
         }
         if(this.var_1037 != null)
         {
            this.var_1037.dispose();
            this.var_1037 = null;
         }
         if(this.var_1040 != null)
         {
            this.var_1040.dispose();
            this.var_1040 = null;
         }
         if(this.var_1038 != null)
         {
            this.var_1038.dispose();
            this.var_1038 = null;
         }
         this.var_139 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1035;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1039;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1036;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1037;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1040;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1038;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
