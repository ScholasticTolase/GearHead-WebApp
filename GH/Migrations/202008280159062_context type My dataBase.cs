namespace GH.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class contexttypeMydataBase : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        CategoryType = c.String(nullable: false, maxLength: 15),
                        CategoryName = c.String(nullable: false, maxLength: 15),
                    })
                .PrimaryKey(t => t.CategoryType);
            
            CreateTable(
                "dbo.Articles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 150),
                        Content = c.Double(nullable: false),
                        ImageUrl = c.String(),
                        CategoryType = c.String(maxLength: 15),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Categories", t => t.CategoryType)
                .Index(t => t.CategoryType);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Articles", "CategoryType", "dbo.Categories");
            DropIndex("dbo.Articles", new[] { "CategoryType" });
            DropTable("dbo.Articles");
            DropTable("dbo.Categories");
        }
    }
}
