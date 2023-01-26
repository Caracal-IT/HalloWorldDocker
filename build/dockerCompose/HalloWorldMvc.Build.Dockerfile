FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /build/src
COPY ["src/HelloWorldDocker.Web.Mvc/HelloWorldDocker.Web.Mvc.csproj", "HelloWorldDocker.Web.Mvc/"]
RUN dotnet restore "HelloWorldDocker.Web.Mvc/HelloWorldDocker.Web.Mvc.csproj"

COPY src .
WORKDIR "/build/src/HelloWorldDocker.Web.Mvc"
RUN dotnet build "HelloWorldDocker.Web.Mvc.csproj" -c Release -o /app/build