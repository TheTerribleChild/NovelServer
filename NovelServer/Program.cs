using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NovelServer
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            EntityAccessor ea = EntityAccessor.getInstance();

            using(var context = new ServerEntityContext())
            {
                context.Users.Add(new User() { UserEmail = "aa", UserGroup = "ssd", UserName = "asd", UserPasswordHash = 123, UserPrivilege = "asddf" });
                context.SaveChanges();
            }

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new AdminForm());
        }
    }
}
