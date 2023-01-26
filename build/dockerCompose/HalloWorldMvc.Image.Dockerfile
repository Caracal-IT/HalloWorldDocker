FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM docker.io/divigraph/demo1_test:$VERSION AS build

FROM build AS publish
WORKDIR /build/src/HelloWorldDocker.Web.Mvc
RUN dotnet publish "HelloWorldDocker.Web.Mvc.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY ["certs/dockerdemo.pfx", "https/dockerdemo.pfx"]

ENTRYPOINT ["dotnet", "HelloWorldDocker.Web.Mvc.dll"]