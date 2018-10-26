using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace StajTakipUygulamasiService
{
    [DataContract]
    public class Sorumlular
    {
        [DataMember]
        public int SorumluID { get; set; }
        [DataMember]
        public string SorumluAd { get; set; }
        [DataMember]
        public string SorumluSoyad { get; set; }
        [DataMember]
        public string SorumluAlan { get; set; }
        [DataMember]
        public string SorumluSifre { get; set; }
        [DataMember]
        public string SorumluMail { get; set; }
        //[DataMember]
        //public int Session { get; set; }
    }
}