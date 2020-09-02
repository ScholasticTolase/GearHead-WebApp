namespace GH.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class changeddoubletostring : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Articles", "Content", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Articles", "Content", c => c.Double(nullable: false));
        }
    }
}
