Microsoft.VisualStudio.Web.CodeGeneration.Design   2.2
Microsoft.EntityFrameworkCore 2.2
Microsoft.EntityFrameworkCore.SqlServer  2.2
Microsoft.EntityFrameworkCore.Tools  2.2
Microsoft.EntityFrameworkCore.Design  2.2


Scaffold-DbContext “Server=shiv;Database=Inventory;Integrated Security=True” Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models


1. connection string verify
"ConnectionStrings": {
    "DefaultConnection": "Server=shiv;Database=Inventory;Integrated Security=True;"
  },

store procedure
2. Add-migration spGetList   - store procedure name
3. add our store producure like generate migration file

protected override void Up(MigrationBuilder migrationBuilder)
        {
            var sp = @"create procedure [dbo].[spGetList]
                    as
                    begin
                     select*From Products;
                    end";
            migrationBuilder.Sql(sp);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }








