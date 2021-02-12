FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln .
COPY . .
WORKDIR /app/SmileIT.API
RUN dotnet restore

RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/SmileIT.API/out ./
EXPOSE 80
ENTRYPOINT ["dotnet", "SmileIT.API.dll"] 