FROM docker.io/divigraph/demo1_test:v$VERSION AS build

WORKDIR /build/test
COPY ["test/libs/HalloWorldDocker.Utilities.Tests.Unit/HalloWorldDocker.Utilities.Tests.Unit.csproj", "libs/HalloWorldDocker.Utilities.Tests.Unit/"]
RUN dotnet restore "libs/HalloWorldDocker.Utilities.Tests.Unit/HalloWorldDocker.Utilities.Tests.Unit.csproj"

COPY test .

WORKDIR /build/test/libs/HalloWorldDocker.Utilities.Tests.Unit
RUN dotnet build HalloWorldDocker.Utilities.Tests.Unit.csproj -c Release

CMD ["dotnet", "test", "HalloWorldDocker.Utilities.Tests.Unit.csproj", "-c", "Release", "--logger:trx"]