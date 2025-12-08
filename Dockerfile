FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ./src/backend/backend.csproj backend/
RUN dotnet restore backend/backend.csproj

COPY ./src/frontend/vttrial.csproj frontend/
RUN dotnet restore frontend/vttrial.csproj


COPY ./src/backend/ backend/
RUN dotnet build backend/backend.csproj -c Release -o /app/build

COPY ./src/frontend frontend/
RUN dotnet build frontend/vttrial.csproj -c Release -o /app/build


WORKDIR /src/frontend
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS build
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080 
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "vttrial.dll"]
#ENTRYPOINT ["dotnet", "run", "--project", "frontend/vttrial.csproj", "--urls", "http://0.0.0.0:5211"]

