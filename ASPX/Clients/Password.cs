using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ASPX.Clients
{
    public class Password
    {
        public string Encode(string password)
        {
            try
            {
                byte[] EncDataByte = new byte[password.Length];
                EncDataByte = Encoding.UTF32.GetBytes(password);
                string EncrypedData = Convert.ToBase64String(EncDataByte);
                return EncrypedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in encription" + ex.Message);
            }
        }
    }
}