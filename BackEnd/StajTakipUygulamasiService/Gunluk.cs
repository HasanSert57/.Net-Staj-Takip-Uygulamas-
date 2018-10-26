using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace StajTakipUygulamasiService
{
    [DataContract]
    public class Gunluk
    {
        [DataMember]
        public int YorumID { get; set; }


        [DataMember]
        public string Yorum { get; set; }

       
        [DataMember]
        public int SorumluID { get; set; }

        [DataMember]
        public int StajyerID { get; set; }

        [DataMember]
        public string Tarih { get; set; }
    }
}