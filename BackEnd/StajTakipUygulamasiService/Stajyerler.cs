using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace StajTakipUygulamasiService
{
    [DataContract]
    public class Stajyerler
    {
        [DataMember]
        public int StajyerID { get; set; }

        [DataMember]
        public string StajyerAd { get; set; }

        [DataMember]
        public string StajyerSoyad { get; set; }

        [DataMember]
        public int StajyerNo { get; set; }

        [DataMember]
        public string BaslangicTarihi { get; set; }

        [DataMember]
        public string BitisTarihi { get; set; }

        [DataMember]
        public int CalismaGunu { get; set; }
        
        [DataMember]
        public int SorumluID { get; set; }

        [DataMember]
        public string StajKonusu { get; set; }
    }
}