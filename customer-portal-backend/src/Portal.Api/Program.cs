var builder = WebApplication.CreateBuilder(args);

builder.Services.AddProblemDetails();

var app = builder.Build();

app.UseExceptionHandler();
app.UseStatusCodePages();

app.MapGet("/health", () => Results.Ok(new { status = "healthy", service = "portal-api" }))
   .WithName("HealthCheck")
   .WithTags("Operations");

app.MapGet("/api/v1/customers/{id:guid}", (Guid id) =>
{
    // Demo: synthetic data only
    return Results.Ok(new { id, displayName = "Demo Customer" });
})
.WithName("GetCustomer")
.WithTags("Customers");

app.Run();
