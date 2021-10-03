package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1822:int = 0;
      
      public static const const_1446:int = 1;
      
      public static const const_1496:int = 2;
      
      public static const const_1759:int = 3;
      
      public static const const_1765:int = 4;
      
      public static const const_1768:int = 5;
      
      public static const const_1499:int = 10;
      
      public static const const_1836:int = 11;
      
      public static const const_1793:int = 12;
      
      public static const const_1728:int = 13;
      
      public static const const_1934:int = 16;
      
      public static const const_1828:int = 17;
      
      public static const const_1929:int = 18;
      
      public static const const_1864:int = 19;
      
      public static const const_1803:int = 20;
      
      public static const const_1775:int = 22;
      
      public static const const_1867:int = 23;
      
      public static const const_1780:int = 24;
      
      public static const const_1763:int = 25;
      
      public static const const_1900:int = 26;
      
      public static const const_1713:int = 27;
      
      public static const const_1838:int = 28;
      
      public static const const_1818:int = 29;
      
      public static const const_1920:int = 100;
      
      public static const const_1930:int = 101;
      
      public static const const_1798:int = 102;
      
      public static const const_1821:int = 103;
      
      public static const const_1869:int = 104;
      
      public static const const_1809:int = 105;
      
      public static const const_1875:int = 106;
      
      public static const const_1771:int = 107;
      
      public static const const_1914:int = 108;
      
      public static const const_1863:int = 109;
      
      public static const const_1804:int = 110;
      
      public static const const_1888:int = 111;
      
      public static const const_1754:int = 112;
      
      public static const const_1850:int = 113;
      
      public static const const_1891:int = 114;
      
      public static const const_1766:int = 115;
      
      public static const const_1718:int = 116;
      
      public static const const_1847:int = 117;
      
      public static const const_1848:int = 118;
      
      public static const const_1840:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1446:
            case const_1499:
               return "banned";
            case const_1496:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
