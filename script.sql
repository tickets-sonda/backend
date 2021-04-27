--DROP DATABASE [ProyectoSonda_PIAIngenieria]
CREATE DATABASE [ProyectoSonda_PIAIngenieria]

USE [ProyectoSonda_PIAIngenieria];
CREATE TABLE Estado
(idEstado INT PRIMARY KEY,
 Nombre VARCHAR(30) NOT NULL
)

CREATE TABLE Municipio
(idMunicipio INT PRIMARY KEY, 
 NombreMunicipio VARCHAR(30) NOT NULL, 
 idEstado INT, 
 CONSTRAINT FK_IDESTADO_MUNICIPIO FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE TipoServicio
(idTipoServicio INT PRIMARY KEY, 
 NombreTipoServicio VARCHAR(40) NOT NULL
)

CREATE TABLE TipoUsuario
(idTipoUsuario INT PRIMARY KEY, 
 NombreTipoUser VARCHAR(30) NOT NULL, 
)

/**
CREATE TABLE TipoEmpleado
(idTipoEmpleado INT PRIMARY KEY, 
 Descripcion VARCHAR(30)
)
**/

CREATE TABLE EmpresaCliente
(idEmpresaCliente INT PRIMARY KEY, 
 NombreCliente VARCHAR(50) NOT NULL, 
 Telefono VARCHAR(10),
 Email VARCHAR(30),
 DescripcionRama VARCHAR(40) NOT NULL, 
)

CREATE TABLE Sucursal
(idSucursal INT PRIMARY KEY, 
 Latitud VARCHAR(50),
 Longitud VARCHAR(50), 
 idEmpresaCliente INT, 
 CONSTRAINT FK_SucursalEmpresaCliente FOREIGN KEY (idEmpresaCliente) REFERENCES EmpresaCliente(idEmpresaCliente) 
)

CREATE TABLE TipoMovProducto
(idTipoMovProducto INT PRIMARY KEY, 
 NombreTipoMovP VARCHAR(30) NOT NULL
)

CREATE TABLE EquipoRefacciones
(NoSerieProducto VARCHAR(30) PRIMARY KEY,
 Descripcion VARCHAR(30) NOT NULL, 
 idTipoMovProducto INT, 
 CONSTRAINT FK_idTipoMovProd_EqRefacciones FOREIGN KEY (idTipoMovProducto) REFERENCES TipoMovProducto(idTipoMovProducto) 
)

CREATE TABLE Empleado
(NoEmpleado INT PRIMARY KEY, 
 Nombre VARCHAR(20) NOT NULL, 
 Paterno VARCHAR(20) NOT NULL, 
 Materno VARCHAR(20) NOT NULL, 
 FechaIngreso DATETIME, --MODIFICACION 
 Telefono VARCHAR(10), 
 idMunicipio INT, 
 Direccion VARCHAR(50), 
 Sueldo MONEY, 
 Email VARCHAR(40), 
 FechaNacimiento DATETIME, --MODIFICACION 
 MetodoTransporte VARCHAR(10)
 CONSTRAINT CK_MetodoTransEmp CHECK (MetodoTransporte = 'PUBLICO' OR MetodoTransporte = 'PRIVADO'),
 Sexo VARCHAR(1)
 CONSTRAINT CK_SexoEmp CHECK (Sexo IN ('F','M')),
 CONSTRAINT FK_idMunicipioEmp FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio)
)


CREATE TABLE Usuario
(idUser VARCHAR(10) PRIMARY KEY, 
 ClaveUsuario VARCHAR(8) NOT NULL, 
 idTipoUsuario INT, 
 NoEmpleado INT NULL,
 idEmpresaCliente INT NULL, 
 CONSTRAINT FK_idTipoUsuario_User FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario), 
 CONSTRAINT FK_NoEmp_User FOREIGN KEY (NoEmpleado) REFERENCES Empleado(NoEmpleado),
 CONSTRAINT FK_EmpresaCliente FOREIGN KEY (idEmpresaCliente) REFERENCES EmpresaCliente(idEmpresaCliente)
)

CREATE TABLE Servicio
(NoServicio INT PRIMARY KEY, 
 FechaInicio DATETIME, 
 Duracion TIME, 
 FechaFin DATETIME, 
 FechaAsignacion DATETIME, 
 FechaDeSolicitud DATETIME,
 Prioridad VARCHAR(15), 
 Estatus VARCHAR(20),
 Sitio VARCHAR(50) NOT NULL, 
 ResponsableDelSitio VARCHAR(30), 
 Asunto  VARCHAR(200), 
 RutaDescarga VARCHAR(MAX), 
 RutaSubida VARCHAR(MAX), 
 idTipoServicio INT, 
 CONSTRAINT FK_idTipoServicio_servicio FOREIGN KEY (idTipoServicio) REFERENCES TipoServicio(idTipoServicio), 
 idMunicipio INT, 
 CONSTRAINT FK_idMuni_sercicio FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio), 
 idEmpresaCliente INT, 
 CONSTRAINT FK_idEmpresaC_servicio FOREIGN KEY (idEmpresaCliente) REFERENCES EmpresaCliente(idEmpresaCliente), 
 NoSerieProducto VARCHAR(30) DEFAULT 'No aplica',  
 CONSTRAINT FK_NoSerieProducto_servicio FOREIGN KEY (NoSerieProducto) REFERENCES EquipoRefacciones(NoSerieProducto), 
 NoEmpleado INT, 
 CONSTRAINT FK_NoEmp_servicio FOREIGN KEY (NoEmpleado) REFERENCES Empleado(NoEmpleado), 
 ActividadesRealizadas VARCHAR(130), 
 Herramientas VARCHAR(MAX), 
 NoEmpleadoInvitado INT NULL 
)

select * from Municipio
select * from Estado
***********************************************************************************************************************************
INSERTS 
***********************************************************************************************************************************

INSERT INTO TipoServicio VALUES(1,'Mantenimiento')
INSERT INTO TipoUsuario VALUES(1,'Administrador')
INSERT INTO EmpresaCliente VALUES(1,'Bancomer','81293456','','Banca/Finanzas')
INSERT INTO Sucursal VALUES(1,'','',1)
INSERT INTO TipoMovProducto VALUES(1,'Reemplazo')
INSERT INTO EquipoRefacciones VALUES('T129','Telefono',1)
INSERT INTO Estado VALUES(1, 'Nuevo Leon')
INSERT INTO Municipio VALUES(1, 'Monterrey', 1)
INSERT INTO Empleado VALUES(1,'paco','x','x','2021-04-16 00:26:00.053','292839',1,'calle lirio 215',1000000,'ejemplo@gmail.com',NULL,'privado','M')
INSERT INTO Usuario VALUES('P017858','12134',1,1,NULL)
INSERT INTO Servicio(NoServicio,FechaInicio,Duracion,FechaFin,FechaAsignacion,Prioridad,Estatus,Sitio,NoSerieProducto)
		VALUES (1,GETDATE(),'23:29:56',GETDATE(),GETDATE(),'Alta','Terminado','calle lirio 215','T129')
**********************************************************************************************************************************
SPS
*************************************************************************************************************************************
USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Insertar]    Script Date: 19/11/2020 13:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 15 de abril 2020
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Empleado_Insertar] 
    
	 @psNombre VARCHAR(20),
	 @psPaterno VARCHAR(20),
	 @psMaterno VARCHAR(20),
	 @pdFechaIngreso SMALLDATETIME, 
	 @psTelefono VARCHAR(10), 
	 @pnIdMunicipio INT, 
	 @psDireccion VARCHAR(50), 
	 @pmSueldo MONEY, 
	 @psEmail VARCHAR(40),
	 @pdFechaNacimiento SMALLDATETIME, 
	 @psMetodoTransporte VARCHAR(10), 
	 @psSexo VARCHAR(1)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nNoEmpleado INT  = 0 

		SELECT @nNoEmpleado = @nNoEmpleado + 1

		
		INSERT INTO Empleado
		VALUES(@nNoEmpleado,@psNombre,@psPaterno,@psMaterno,@pdFechaIngreso,@psTelefono, @pnIdMunicipio,@psDireccion,@pmSueldo,@psEmail,@pdFechaNacimiento,@psMetodoTransporte,@psSexo)
	
	END

	SET NOCOUNT OFF

END

/**
sp_Empleado_Insertar @psNombre = 'paco',@psPaterno='x',@psMaterno='x',@pdFechaIngreso='2021-04-16 00:24:33.010',@psTelefono= '292839', @pnIdMunicipio= 1,@psDireccion = 'calle lirio 215',@pmSueldo= 10000.00,@psEmail=' ',@pdFechaNacimiento=null ,@psMetodoTransporte='privado',@psSexo='M'
	
select * from Empleado



ALTER TABLE Empleado
ALTER COLUMN FechaIngreso DATETIME 

SELECT GETDATE()
**/

___________________________________________________________________________________________________________________________________________________________________

USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Insertar]    Script Date: 16/04/2021 1:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 15 de abril 2020
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Estado_Insertar] 
    
	@NombreEstado varchar(30)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @idEstado INT  = 0 

		SELECT @idEstado = @idEstado + 1

		
		INSERT INTO Estado(idEstado,Nombre) 
		VALUES(@idEstado,@NombreEstado)
	
	END

	SET NOCOUNT OFF

END

/**
sp_Municipio_Insert @NombreMunicipio= 'Guadalupe', @idEstado = 1



**/
_____________________________________________________________________________________________________________________________________________

USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Insert]    Script Date: 16/04/2021 1:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 15 de abril 2020
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Municipio_Insert] 
    
	@NombreMunicipio varchar(30),
	@idEstado int

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nidMunicipio INT  = 0 

		SELECT @nidMunicipio = @nidMunicipio + 1

		
		INSERT INTO Municipio (idMunicipio, NombreMunicipio, idEstado) 
		VALUES(@nidMunicipio, @NombreMunicipio, @idEstado)
	
	END

	SET NOCOUNT OFF

END

/**
sp_SucursalRecolecta_Opciones @pnOpcion= 1, @pnNoSucursalR = 1



**/
________________________________________________________________________________________________________________________________
USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Servicio_InsertarPrueba]    Script Date: 16/04/2021 1:15:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 15 de abril 2020
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Servicio_InsertarPrueba] 
    
	 @pdFechaInicio  DATETIME,
	 @ptDuracion     TIME,
	 @pdFechaFin     DATETIME,
	 @pdFechaAsginacion  DATETIME,
	 @pdFechaSolicitud  DATETIME, 
	 @psPrioridad   VARCHAR(10), 
	 @psEstatus VARCHAR(10), 
	 @psSitio   VARCHAR(50), 
	 @pmSueldo MONEY, 
	 @psResponsableSitio VARCHAR(50),
	 @psAsunto VARCHAR(50), 
	 @psRutaDescarga VARCHAR(MAX),
	 @psRutaSubuda VARCHAR(MAX), 
	 @pnIdTipoServicio INT, 
	 @piIdMinicipio INT, 
	 @pnIdEmpresaCliente INT, 
	 @psNoSerieProducto VARCHAR(50), 
	 @pnNoEmpleado INT, 
	 @psActividadesRealizadas VARCHAR(130), 
	 @psHerramientas VARCHAR(MAX), 
	 @pnNoEmpInvitado INT


AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nNoDeServicio INT  = 0 

		SELECT @nNoDeServicio = @nNoDeServicio + 1

		INSERT INTO Servicio
		VALUES (@nNoDeServicio,@pdFechaInicio,@ptDuracion,@pdFechaFin,@pdFechaAsginacion,@psPrioridad,@psEstatus, @psSitio,@pmSueldo,@psResponsableSitio, @psAsunto,
		@psRutaDescarga,@psRutaSubuda, @pnIdTipoServicio, @piIdMinicipio, @pnIdEmpresaCliente, @psNoSerieProducto, @pnNoEmpleado, @psActividadesRealizadas, @psHerramientas, @pnNoEmpInvitado)

	
	END

	SET NOCOUNT OFF

END

/**
INSERT INTO Servicio(NoServicio,FechaInicio,Duracion,FechaFin,FechaAsignacion,Prioridad,Estatus,Sitio,NoSerieProducto)
		VALUES (1,GETDATE(),'23:29:56',GETDATE(),GETDATE(),'Alta','Terminado','calle lirio 215','T129')
select * from Empleado



ALTER TABLE Empleado
ALTER COLUMN FechaIngreso DATETIME 

SELECT GETDATE()
select * from Servicio
**/

USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Delete]    Script Date: 25/04/2021 16:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Diego Zepeda
-- Create date: 15 de abril 2021
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Empleado_Delete] 
    
	@pnNoEmpleado INT

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		DELETE FROM Empleado 
		WHERE NoEmpleado = @pnNoEmpleado
	
		SELECT 'Informacion eliminada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

















