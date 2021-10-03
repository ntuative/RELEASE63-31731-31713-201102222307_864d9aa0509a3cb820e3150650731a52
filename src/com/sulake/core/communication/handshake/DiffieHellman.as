package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_917:BigInteger;
      
      private var var_2392:BigInteger;
      
      private var var_1928:BigInteger;
      
      private var var_2724:BigInteger;
      
      private var var_1476:BigInteger;
      
      private var var_1927:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1476 = param1;
         this.var_1927 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1476.toString() + ",generator: " + this.var_1927.toString() + ",secret: " + param1);
         this.var_917 = new BigInteger();
         this.var_917.fromRadix(param1,param2);
         this.var_2392 = this.var_1927.modPow(this.var_917,this.var_1476);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1928 = new BigInteger();
         this.var_1928.fromRadix(param1,param2);
         this.var_2724 = this.var_1928.modPow(this.var_917,this.var_1476);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2392.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2724.toRadix(param1);
      }
   }
}
