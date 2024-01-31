using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Data.SqlClient;

var databaseNames = "";

var connectionBuilder = new SqlConnectionStringBuilder() {
    DataSource = "localhost,1433",
    UserID = "sa",
    Password = "P@ssw0rd"
};

using (var containerConnection = new SqlConnection(connectionBuilder.ConnectionString)) {
    containerConnection.Open();
    var tsql = "SELECT [NAME] AS DBNAME FROM SYS.DATABASES";

    using (var tsqlCommand = new SqlCommand(tsql, containerConnection)) {
        using (var reader = tsqlCommand.ExecuteReader()) {
            int rowcount = 0;
            while (reader.Read()) {
                if (rowcount == 0) {
                    databaseNames += reader.GetString(0);
                } else {
                    databaseNames = reader.GetString(0) + "," + databaseNames;
                }
                rowcount += 1;
            }
        }
    }
}

var host = new WebHostBuilder()
    .UseKestrel()
    .UseUrls("http://0.0.0.0:8090")
    .Configure(app => app.Run(async context => {
        await context.Response.WriteAsync("The databases are: " + databaseNames);
    }))
    .Build();

host.Run();
