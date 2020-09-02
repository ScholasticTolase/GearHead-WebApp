using System.Data.Entity;



namespace GH.Models
{
    public class MyDbContext : DbContext
    {
        public MyDbContext() : base("MyConn") { }

        public DbSet<UserAccount> Users { get; set; }
        public DbSet<AdminAccount> Admins { get; set; }
        public DbSet<Article> Articles { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}