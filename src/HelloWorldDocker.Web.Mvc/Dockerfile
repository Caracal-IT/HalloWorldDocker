FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["src/HelloWorldDocker.Web.Mvc/HelloWorldDocker.Web.Mvc.csproj", "src/HelloWorldDocker.Web.Mvc/"]
RUN dotnet restore "src/HelloWorldDocker.Web.Mvc/HelloWorldDocker.Web.Mvc.csproj"
COPY . .
WORKDIR "/src/src/HelloWorldDocker.Web.Mvc"
RUN dotnet build "HelloWorldDocker.Web.Mvc.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "HelloWorldDocker.Web.Mvc.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY ["certs/dockerdemo.pfx", "https/dockerdemo.pfx"]

ENTRYPOINT ["dotnet", "HelloWorldDocker.Web.Mvc.dll"]
