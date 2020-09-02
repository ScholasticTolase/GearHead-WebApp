namespace GH.Migrations
{
    using System.Data.Entity.Migrations;

    public partial class changeddataypeofphonenumbertostring : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AdminAccounts", "PhoneNumber", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AdminAccounts", "PhoneNumber", c => c.Int(nullable: false));
        }
    }
}
