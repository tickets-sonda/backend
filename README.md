## Requisitos

-   Tener instalado Node.js (version 10)
-   Tener instalado Git
-   Tener instalado SQL server

## Instalación

1. Clonar el repositorio a tu computadora
   `git clone https://github.com/tickets-sonda/backend.git`
2. Una vez clonado, instalar dependencias de Node.js (debes estar en la carpeta recien clonada)
   `npm install`
3. Abrir el proyecto con editor de codigo y crear archivo `.env` y aqui establecer tu configuracion de tu base de datos. Necesitaras:

-   `PORT` : Puerto en el que quieras que corra tu API.
-   `DBUSER`: Usuario de la base de datos a conectar. (Debes tener habilitado SQL Server and Windows Authentication mode en tu SQL Server )
-   `DBPASS`: Contraseña de la base de datos a conectar.
-   `DBNAME`: Nombre de la base de datos a conectar.
-   `DBPORT`: Puerto de la base de datos a conectar (Necesitas tener habilitado el TCP/IP en la configuracion de SQL Server Network)
-   `DBINSTANCE`: Nombre de la instancia de la base de datos a conectar.
-   `DBSERVER`: Nombre o IP local de la base de datos a conectar (Si usas 127.0.0.1 sirve ya que es la IP local o tambien llamado localhost)

4. Para correr el proyecto
   `npm run start`
