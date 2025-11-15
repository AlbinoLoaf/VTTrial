FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY src .

RUN dotnet build

RUN dotnet publish


EXPOSE 5211 
ENTRYPOINT ["dotnet", "run", "--project", "frontend/"]
