using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace StajTakipUygulamasiService
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(AddressFilterMode = AddressFilterMode.Any)]

    public class Service1 : IService1
    {
        

        public Service1()
        {
            ConnectToDb();
        }
        SqlConnection conn;
        SqlCommand comm;
        SqlConnectionStringBuilder connStringBuilder;

        public bool ConnectToDb()
        {
            connStringBuilder = new SqlConnectionStringBuilder();
            connStringBuilder.DataSource = "DESKTOP-57M37QB\\ABRA";
            connStringBuilder.InitialCatalog = "StajTakip";
            connStringBuilder.Encrypt = true;
            connStringBuilder.TrustServerCertificate = true;
            connStringBuilder.ConnectTimeout = 30;
            connStringBuilder.AsynchronousProcessing = true;
            connStringBuilder.MultipleActiveResultSets = true;
            connStringBuilder.IntegratedSecurity = true;
            connStringBuilder.ConnectionString = "Data Source=DESKTOP-57M37QB;Initial Catalog=StajTakip;Integrated Security=True";

            conn = new SqlConnection(connStringBuilder.ToString());
            comm = conn.CreateCommand();

            return true;
        }

        public int EkleStajyer(Stajyerler stajyer)
        {
            try
            {
                comm.CommandText = "INSERT INTO Stajyer(StajyerAd,StajyerSoyad,StajyerNo,BaslangicTarihi," +
                                    "BitisTarihi,CalismaGunu,SorumluID,StajKonusu) " +
                                    "VALUES(@StajyerAd, @StajyerSoyad, @StajyerNo,@BaslangicTarihi," +
                                    "@BitisTarihi,@CalismaGunu,@SorumluID,@StajKonusu)";
                comm.Parameters.AddWithValue("@StajyerAd", stajyer.StajyerAd);
                comm.Parameters.AddWithValue("@StajyerSoyad", stajyer.StajyerSoyad);
                comm.Parameters.AddWithValue("@StajyerNo", stajyer.StajyerNo);
                comm.Parameters.AddWithValue("@BaslangicTarihi", stajyer.BaslangicTarihi);
                comm.Parameters.AddWithValue("@BitisTarihi", stajyer.BitisTarihi);
                comm.Parameters.AddWithValue("@CalismaGunu", stajyer.CalismaGunu);
                comm.Parameters.AddWithValue("@SorumluID", stajyer.SorumluID);
                comm.Parameters.AddWithValue("@StajKonusu", stajyer.StajKonusu);

                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public int EkleSorumlu(Sorumlular sorumlu)
        {
            try
            {
                comm.CommandText = "INSERT INTO  Sorumlu(SorumluAd,SorumluSoyad,SorumluAlan,SorumluSifre,SorumluMail) " +
                    "VALUES(@SorumluAd, @SorumluSoyad, @SorumluAlan,@SorumluSifre,@SorumluMail)";
                comm.Parameters.AddWithValue("@SorumluAd", sorumlu.SorumluAd);
                comm.Parameters.AddWithValue("@SorumluSoyad", sorumlu.SorumluSoyad);
                comm.Parameters.AddWithValue("@SorumluAlan", sorumlu.SorumluAlan);
                comm.Parameters.AddWithValue("@SorumluSifre", sorumlu.SorumluSifre);
                comm.Parameters.AddWithValue("@SorumluMail", sorumlu.SorumluMail);


                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }


        }

        public int girisSorumlu(Sorumlular sorumlu)
        {
            try
            {
                comm.CommandText = "Select * from Sorumlu where SorumluMail=@SorumluMail and SorumluSifre=@SorumluSifre";
                comm.Parameters.AddWithValue("@SorumluMail", sorumlu.SorumluMail);
                comm.Parameters.AddWithValue("@SorumluSifre", sorumlu.SorumluSifre);
                comm.CommandType = CommandType.Text;
                conn.Open();
                int UserExist = (int)comm.ExecuteScalar();
                if (UserExist > 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }

            }
            catch (Exception e)
            {

                return 0;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

        }

        public int GuncelleStajyer(Stajyerler stajyer)
        {
            try
            {
                comm.CommandText = "UPDATE  Stajyer  SET StajyerAd = @StajyerAd ,StajyerSoyad " +
                    "= @StajyerSoyad,StajyerNo = @StajyerNo,BaslangicTarihi = @BaslangicTarihi,BitisTarihi " +
                    "= @BitisTarihi,CalismaGunu=@CalismaGunu,StajKonusu =@StajKonusu,SorumluID " +
                    "= @SorumluID  where StajyerNo=@StajyerNo ";
                comm.Parameters.AddWithValue("@StajyerAd", stajyer.StajyerAd);
                comm.Parameters.AddWithValue("@StajyerSoyad", stajyer.StajyerSoyad);
                comm.Parameters.AddWithValue("@StajyerNo", stajyer.StajyerNo);
                comm.Parameters.AddWithValue("@BaslangicTarihi", stajyer.BaslangicTarihi);
                comm.Parameters.AddWithValue("@BitisTarihi", stajyer.BitisTarihi);
                comm.Parameters.AddWithValue("@CalismaGunu", stajyer.CalismaGunu);
                comm.Parameters.AddWithValue("@StajKonusu", stajyer.StajKonusu);
                comm.Parameters.AddWithValue("@SorumluID", stajyer.SorumluID);
                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public int GuncelleSorumlu(Sorumlular sorumlu)
        {
            try
            {
                comm.CommandText = "UPDATE INTO  Sorumlu(SorumluAd,SorumluSoyad,SorumluAlan,SorumluSifre,SorumluMail) VALUES(@SorumluAd, @SorumluSoyad, @SorumluAlan,@SorumluSifre,@SorumluMail)";
                comm.Parameters.AddWithValue("@SorumluAd", sorumlu.SorumluAd);
                comm.Parameters.AddWithValue("@SorumluSoyad", sorumlu.SorumluSoyad);
                comm.Parameters.AddWithValue("@SorumluAlan", sorumlu.SorumluAlan);
                comm.Parameters.AddWithValue("@SorumluSifre", sorumlu.SorumluSifre);
                comm.Parameters.AddWithValue("@SorumluMail", sorumlu.SorumluMail);


                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public int SilStajyer(Stajyerler stajyer)
        {
            try
            {
                comm.CommandText = "DELETE Stajyer where StajyerNo=@StajyerNo";
                comm.Parameters.AddWithValue("@StajyerNo", stajyer.StajyerNo);
                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public int SilSorumlu(Sorumlular sorumlu)
        {
            try
            {
                comm.CommandText = "DELETE Sorumlu where SorumluAd=@SorumluAd";
                comm.Parameters.AddWithValue("@SorumluAd", sorumlu.SorumluAd);
                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
        public Stajyerler StajyerGetir(Stajyerler stajyer)
        {
            Stajyerler stj = new Stajyerler();
            try
            {
                comm.CommandText = "Select * from Stajyer where StajyerID=@StajyerID";
                comm.Parameters.AddWithValue("@StajyerID", stajyer.StajyerID);
                comm.CommandType = CommandType.Text;
                conn.Open();

                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    stj.StajyerID = Convert.ToInt32(reader[0]);
                    stj.StajyerAd = reader[1].ToString();
                    stj.StajyerSoyad = reader[2].ToString();
                    stj.StajyerNo = Convert.ToInt32(reader[3]);

                }
                return stj;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public Sorumlular SorumluGetir(Sorumlular sorumlu)
        {
            Sorumlular srm = new Sorumlular();
            try
            {
                comm.CommandText = "Select * from Sorumlu where SorumluMail=@SorumluMail";
                comm.Parameters.AddWithValue("@SorumluMail", sorumlu.SorumluMail);

                comm.CommandType = CommandType.Text;
                conn.Open();

                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    srm.SorumluID = Convert.ToInt32(reader[0]);
                    srm.SorumluAd = reader[1].ToString();
                    srm.SorumluSoyad = reader[2].ToString();
                    srm.SorumluAlan = reader[3].ToString();
                    srm.SorumluSifre = reader[4].ToString();
                    srm.SorumluMail = reader[5].ToString();
                }
                return srm;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public Stajyerler StajyerGetirNo(Stajyerler stajyer)
        {
            Stajyerler stj = new Stajyerler();
            try
            {
                comm.CommandText = "Select * from Stajyer where StajyerNo=@StajyerNo";
                comm.Parameters.AddWithValue("@StajyerNo", stajyer.StajyerNo);
                comm.CommandType = CommandType.Text;
                conn.Open();

                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    stj.StajyerID = Convert.ToInt32(reader[0]);
                    stj.StajyerAd = reader[1].ToString();
                    stj.StajyerSoyad = reader[2].ToString();
                    stj.StajyerNo = Convert.ToInt32(reader[3]);
                    stj.BaslangicTarihi = reader[4].ToString().TrimEnd('0', ':');
                    stj.BitisTarihi = reader[5].ToString().TrimEnd('0', ':');
                    stj.CalismaGunu = Convert.ToInt32(reader[6]);
                    stj.SorumluID = Convert.ToInt32(reader[7]);
                    stj.StajKonusu = reader[8].ToString();


                }
                return stj;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        //public int SessionDegis(Sorumlular sorumlu)
        //{
        //    try
        //    {
        //        comm.CommandText = "UPDATE  Sorumlu  SET Session = @Session    where SorumluMail=@SorumluMail ";
        //        comm.Parameters.AddWithValue("@SorumluMail", sorumlu.SorumluMail);
        //        comm.Parameters.AddWithValue("@Session", sorumlu.Session);

        //        comm.CommandType = CommandType.Text;
        //        conn.Open();
        //        return comm.ExecuteNonQuery();

        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        if (conn != null)
        //        {
        //            conn.Close();
        //        }
        //    }
        //}

        public List<Stajyerler> GetStajyerler(Stajyerler stajyer)
        {
            List<Stajyerler> Stajyer = new List<Stajyerler>();
            try
            {
                comm.CommandText = "Select * from Stajyer where SorumluID=@SorumluID ";
                comm.Parameters.AddWithValue("@SorumluID", stajyer.SorumluID);
                comm.CommandType = CommandType.Text;
                conn.Open();

                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    
                    Stajyerler stajyer1 = new Stajyerler()
                    {
                        StajyerID = Convert.ToInt32(reader[0]),
                        StajyerAd = reader[1].ToString(),
                        StajyerSoyad = reader[2].ToString(),
                        StajyerNo = Convert.ToInt32(reader[3]),
                        BaslangicTarihi = reader[4].ToString().TrimEnd('0',':'),
                        BitisTarihi = reader[5].ToString().TrimEnd('0', ':'),
                        CalismaGunu = Convert.ToInt32(reader[6]),
                        SorumluID = Convert.ToInt32(reader[7]),
                        StajKonusu = reader[8].ToString()
                        
                    };
                    Stajyer.Add(stajyer1);

                }
                
                    return Stajyer;
                
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public int Yorum(Gunluk gunluk)
        {
            try
            {
                comm.CommandText = "INSERT INTO Gunluk(Yorum,SorumluID,StajyerID,Tarih) VALUES(@Yorum, @SorumluID,@StajyerID,@Tarih)";
                comm.Parameters.AddWithValue("@Yorum", gunluk.Yorum);
                comm.Parameters.AddWithValue("@SorumluID", gunluk.SorumluID);
                comm.Parameters.AddWithValue("@StajyerID", gunluk.StajyerID);
                comm.Parameters.AddWithValue("@Tarih", gunluk.Tarih);

                comm.CommandType = CommandType.Text;
                conn.Open();
                return comm.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public List<Gunluk> YorumGetir(Gunluk gunluk)
        {
            List<Gunluk> gun = new List<Gunluk>();
            try
            {
                comm.CommandText = "Select * from Gunluk where StajyerID=@StajyerID ";
                comm.Parameters.AddWithValue("@StajyerID", gunluk.StajyerID);
                comm.CommandType = CommandType.Text;
                conn.Open();

                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {

                    Gunluk gunlluk1 = new Gunluk()
                    {
                        YorumID = Convert.ToInt32(reader[0]),
                        Yorum = reader[1].ToString(),
                        SorumluID = Convert.ToInt32(reader[2]),
                        StajyerID = Convert.ToInt32(reader[3]),
                        Tarih = reader[4].ToString().TrimEnd('0', ':'),
                        
                    };
                    gun.Add(gunlluk1);

                }

                return gun;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
    } 
}
