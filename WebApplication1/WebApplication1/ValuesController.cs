using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IvanAkcheurov.NTextCat.Lib;
using System.Data.SQLite;


namespace WebApplication1
{
    
    public class ValuesController : ApiController
    {
        public void Open_Conn() 
        {
            var conn = new SQLiteConnection("Data Source = test.db;Version =");
            conn.Open();

        }
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(string id)
        {
            Open_Conn();
            var factory = new RankedLanguageIdentifierFactory();
            var iden = factory.Load("D:\\БГУИР\\4курс1сем\\WebApplication1\\packages\\IvanAkcheurov.NTextCat.Lib.0.2.1.1\\Core14.profile.xml");
            var languages = iden.Identify(id);
            var most = languages.FirstOrDefault();
            string s = null;
            if (most != null)
            {
                s = most.Item1.Iso639_3;
                
            }
            else 
            {
                s = "cannot specif";
                
            }
            return s;
            ;//web api controller читать!!
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}