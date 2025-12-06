FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY src .

RUN dotnet build

WORKDIR /src/frontend
RUN dotnet publish -c Release -o app


EXPOSE 8080 
ENTRYPOINT ["./app/vttrial"]
#ENTRYPOINT ["dotnet", "run", "--project", "frontend/vttrial.csproj", "--urls", "http://0.0.0.0:5211"]

