package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1801:int;
      
      private var var_2515:int;
      
      private var var_1161:int;
      
      private var var_514:Number;
      
      private var var_2517:Boolean;
      
      private var var_2516:int;
      
      private var var_1802:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2515 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2516 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2517 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1161;
         if(this.var_1161 == 1)
         {
            this.var_514 = param1;
            this.var_1801 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1161);
            this.var_514 = this.var_514 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2517 && param3 - this.var_1801 >= this.var_2515 && this.var_1802 < this.var_2516)
         {
            _loc5_ = 1000 / this.var_514;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1802;
            this.var_1801 = param3;
            this.var_1161 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
