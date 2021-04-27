USE [master]
GO
/****** Object:  Database [ProyectoSonda_PIAIngenieria]    Script Date: 27/04/2021 18:31:15 ******/
CREATE DATABASE [ProyectoSonda_PIAIngenieria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoSonda_PIAIngenieria', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoSonda_PIAIngenieria.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoSonda_PIAIngenieria_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoSonda_PIAIngenieria_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoSonda_PIAIngenieria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Delete]    Script Date: 27/04/2021 18:31:15 ******/
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

/**
sp_Municipio_Delete @idMunicipio = 2

select * from municipio,estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Insertar]    Script Date: 27/04/2021 18:31:15 ******/
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
	 @pdFechaIngreso DATETIME, 
	 @psTelefono VARCHAR(10), 
	 @pnIdMunicipio INT, 
	 @psDireccion VARCHAR(50), 
	 @pmSueldo MONEY, 
	 @psEmail VARCHAR(40),
	 @pdFechaNacimiento DATETIME, 
	 @psMetodoTransporte VARCHAR(10), 
	 @psSexo VARCHAR(1)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nNoEmpleado INT  = (SELECT COUNT(*) FROM Empleado)

		SELECT @nNoEmpleado = @nNoEmpleado + 1

		
		INSERT INTO Empleado
		VALUES(@nNoEmpleado,@psNombre,@psPaterno,@psMaterno,@pdFechaIngreso,@psTelefono, @pnIdMunicipio,@psDireccion,@pmSueldo,@psEmail,@pdFechaNacimiento,@psMetodoTransporte,@psSexo)
	
	END

	SET NOCOUNT OFF

END

/**
sp_Empleado_Insertar @psNombre = 'Sutanito',@psPaterno='x',@psMaterno='x',@pdFechaIngreso='2021-04-16 00:24:33.010',@psTelefono= '292839', @pnIdMunicipio= 1,@psDireccion = 'calle lirio 215',@pmSueldo= 10000.00,@psEmail=' ',@pdFechaNacimiento=null ,@psMetodoTransporte='privado',@psSexo='M'
	
select * from Empleado



ALTER TABLE Empleado
ALTER COLUMN FechaIngreso DATETIME 

SELECT GETDATE()
**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Update]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Empleado_Update] 
    
	@pnNoEmpleado INT,
	@psNombreEmpleado VARCHAR(20),
	@psPaterno VARCHAR(20),
	@psMaterno VARCHAR(20), 
	@pdFechaIngreso DATETIME,
	@psTelefono VARCHAR(10),
	@pnidMunicipio INT, 
	@psDireccion VARCHAR(50), 
	@pmSueldo MONEY, 
	@psEmail VARCHAR(40),
	@pdFechaNacimiento DATETIME, 
	@psMetodoTransporte VARCHAR(10),
	@psSexo VARCHAR(1)

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		UPDATE Empleado SET Nombre = @psNombreEmpleado, Paterno = @psPaterno, Materno = @psMaterno,
							FechaIngreso =  @pdFechaIngreso, Telefono = @psTelefono, idMunicipio = @pnidMunicipio,
							Direccion = @psDireccion, Sueldo = @pmSueldo, Email= @psEmail, FechaNacimiento=@pdFechaNacimiento,
							MetodoTransporte = @psMetodoTransporte, Sexo = @psSexo
		WHERE NoEmpleado = @pnNoEmpleado
	
		SELECT 'Informacion actualizada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Ver]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Empleado_Ver] 
    
	@pidEmpleado INT = NULL

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  

		IF  @pidEmpleado > 0
		BEGIN 
			SELECT m.NombreMunicipio,m.idMunicipio, m.idEstado ,e.Nombre AS 'Estado'
			FROM Municipio AS M INNER JOIN Estado AS E ON M.idEstado = E.idEstado
			--WHERE @pidEmpleado = idMunicipio FALTA MODIFICACIONES
		END
		ELSE 
			SELECT m.NombreMunicipio,m.idMunicipio AS 'Municipio', m.idEstado ,e.Nombre AS 'Estado'
			FROM Municipio AS M INNER JOIN Estado AS E ON M.idEstado = E.idEstado
		
	
	END

	SET NOCOUNT OFF

END

/**
sp_Empleado_Ver @pidEmpleado= 'Coahuila'

select * from empleado

**/

GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Delete]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Estado_Delete] 
    
	@pnidEstado     INT

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		DELETE FROM Estado
		WHERE idEstado = @pnidEstado
	
		SELECT 'Informacion eliminada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**
sp_Municipio_Delete @idMunicipio = 2

select * from municipio,estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Insertar]    Script Date: 27/04/2021 18:31:15 ******/
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
    
	@psNombreEstado varchar(30)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @idEstado INT  = (SELECT (COUNT(*)) FROM Estado)

		SELECT @idEstado = @idEstado + 1

		
		INSERT INTO Estado(idEstado,Nombre) 
		VALUES(@idEstado,@psNombreEstado)

		SELECT 'Se ingresó correctamente'
	
	END

	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @psNombreEstado= 'Oaxaca'



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Update]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Estado_Update] 
    
	@pnidEstado     INT,
	@psNombreEstado VARCHAR(30)
	

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		UPDATE Estado SET Nombre=@psNombreEstado
		WHERE idEstado=@pnidEstado
	
		SELECT 'Informacion actualizada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**
sp_Municipio_Delete @idMunicipio = 2

select * from municipio,estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Delete]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Municipio_Delete] 
    
	@idMunicipio INT
	

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		DELETE FROM Municipio
		WHERE idMunicipio = @idMunicipio
	
		SELECT 'Informacion borrada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**
sp_Municipio_Delete @idMunicipio = 2

select * from municipio,estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Estado_ver]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Municipio_Estado_ver] 
 
	@nidMunicipio INT = NULL--,
--	@idEstado INT 

AS 

BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		IF  @nidMunicipio > 0
		BEGIN 
			SELECT m.NombreMunicipio,m.idMunicipio, m.idEstado ,e.Nombre AS 'Estado'
			FROM Municipio AS M INNER JOIN Estado AS E ON M.idEstado = E.idEstado
			WHERE @nidMunicipio = idMunicipio
		END
		ELSE 
			SELECT m.NombreMunicipio,m.idMunicipio AS 'Municipio', m.idEstado ,e.Nombre AS 'Estado'
			FROM Municipio AS M INNER JOIN Estado AS E ON M.idEstado = E.idEstado
	END
	SET NOCOUNT OFF 

	--SELECT '1' id, 'apodaca' nombre, '11' idEstado
END
/**
sp_Municipio_Estado_ver @nidMunicipio = 1

@niOpcion = 0 ,

select * from municipio



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Insert]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 15 de abril 2021
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Municipio_Insert] 
    
	@NombreMunicipio varchar(30),
	@idEstado int

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nidMunicipio INT  = (SELECT (COUNT(*)) FROM Municipio)

		SELECT @nidMunicipio = @nidMunicipio + 1

		
		INSERT INTO Municipio (idMunicipio, NombreMunicipio, idEstado) 
		VALUES(@nidMunicipio, @NombreMunicipio, @idEstado)
	
	END

	SET NOCOUNT OFF

END

/**
sp_Municipio_Insert @NombreMunicipio = , @idEstado =



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Update]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_Municipio_Update] 
    
	@idMunicipio INT,
	@NombreMunicipio VARCHAR(30),
	@idEstado int
	

AS 
BEGIN 
	SET NOCOUNT ON 
	
	BEGIN TRY 
		
		UPDATE Municipio SET NombreMunicipio=@NombreMunicipio, idEstado=@idEstado
		WHERE idMunicipio= @idMunicipio
	
		SELECT 'Informacion actualizada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**
sp_Municipio_Update @NombreMunicipio = ,
	@idEstado = ,
	@idMunicipio = 

select * from municipio



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Servicio_InsertarPrueba]    Script Date: 27/04/2021 18:31:15 ******/
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
		
		DECLARE @nNoDeServicio INT  = (SELECT (COUNT(*)) FROM Servicio)

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




GO
/****** Object:  StoredProcedure [dbo].[sp_Sucursal_ver]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 19 de abril 2021
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Sucursal_ver] 

	@nidSucursal INT = NULL

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		IF  @nidSucursal > 0
		BEGIN 
			SELECT s.idSucursal,s.Latitud,s.Longitud,e.idEmpresaCliente,e.NombreCliente
			FROM Sucursal AS S INNER JOIN EmpresaCliente AS E ON S.idEmpresaCliente = E.idEmpresaCliente
			WHERE @nidSucursal = idSucursal
		END
		ELSE 
			SELECT s.idSucursal,s.Latitud,s.Longitud,e.idEmpresaCliente,e.NombreCliente
			FROM Sucursal AS S INNER JOIN EmpresaCliente AS E ON S.idEmpresaCliente = E.idEmpresaCliente
		END
	SET NOCOUNT OFF

END
/**
sp_Sucursal_ver @nidSucursal = 1

SELECT * FROM EMPRESACLIENTE
SELECT * FROM TipoServicio

INSERT INTO EmpresaCliente VALUES(1,'Bancomer','81293456','','Banca/Finanzas')
INSERT INTO Sucursal VALUES(1,'','',1)
INSERT INTO Sucursal VALUES(2,'','',1)

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Delete]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoServicio_Delete] 
     
	 @pnidTipoServicio INT

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		DELETE FROM TipoServicio 
		WHERE idTipoServicio = @pnidTipoServicio
		
		SELECT 'Informacion eliminada correctamente'
	END TRY 
	BEGIN CATCH 

		SELECT 'No se pudo completar el proceso'

	END CATCH
	SET NOCOUNT OFF

END

/**

***************** sp_TipoServicio_Insert @psNombreTipoServicio = 'Prueba para borrar' 
sp_TipoServicio_Delete @pnidTipoServicio = 4

SELECT * FROM TipoServicio

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Insert]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoServicio_Insert] 
     
	 @psNombreTipoServicio VARCHAR(40)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nidTipoServicio INT  = (SELECT (COUNT(*)) FROM TipoServicio)

		SELECT @nidTipoServicio = @nidTipoServicio + 1


		INSERT INTO TipoServicio(idTipoServicio,NombreTipoServicio) 
		VALUES(@nidTipoServicio,@psNombreTipoServicio)
	
	END

	SET NOCOUNT OFF

END

/**
sp_TipoServicio_Insert @psNombreTipoServicio = 'Mantenimiento correctivo'
sp_TipoServicio_Insert @psNombreTipoServicio = 'Mantenimiento preventivo'
sp_TipoServicio_Insert @psNombreTipoServicio = 'Instalacion'

SELECT * FROM TipoServicio

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Update]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoServicio_Update] 
     
	 @pnidTipoServicio INT, 
	 @psNombreTipoServicio VARCHAR(40)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		UPDATE TipoServicio SET NombreTipoServicio = @psNombreTipoServicio
		WHERE idTipoServicio = @pnidTipoServicio
		
		SELECT 'Informacion modificada correctamente'
	END TRY 
	BEGIN CATCH 

		SELECT 'No se pudo completar el proceso'

	END CATCH
	SET NOCOUNT OFF

END

/**

******PRUBA DE INSERT PARA BORRAR Y MODIFICAR*********** 
sp_TipoServicio_Insert @psNombreTipoServicio = 'Prueba para borrar' 
************************************************************************
sp_TipoServicio_Update @pnidTipoServicio = 4, @psNombreTipoServicio = 'Prueba modificar'

SELECT * FROM TipoServicio

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Delete]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoUsuario_Delete] 
     
	@pnidTipoUser INT

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		DELETE FROM TipoUsuario 
		WHERE idTipoUsuario=@pnidTipoUser
		
		SELECT 'Informacion eliminada correctamente'
	END TRY 
	BEGIN CATCH 

		SELECT 'No se pudo completar el proceso'

	END CATCH

	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @NombreEstado= 'Coahuila'



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Insert]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoUsuario_Insert] 
     
	@psNombreTipoUser VARCHAR(30),
	@psAbreviatura VARCHAR(5)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nidTipoUsuario INT  = (SELECT (COUNT(*)) FROM TipoUsuario)

		SELECT @nidTipoUsuario = @nidTipoUsuario + 1

		/**ejemplo
		INSERT INTO TipoUsuario (idTipoUsuario,NombreTipoUser,Abreviatura)
		VALUES(1,'Administrador de sistema','ADMIN')
		**/

		INSERT INTO TipoUsuario(idTipoUsuario,NombreTipoUser,Abreviatura) 
		VALUES(@nidTipoUsuario,@psNombreTipoUser,@psAbreviatura)
	
	END

	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @NombreEstado= 'Coahuila'



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Update]    Script Date: 27/04/2021 18:31:15 ******/
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

CREATE PROCEDURE [dbo].[sp_TipoUsuario_Update] 
     
	@pnidTipoUser INT,
	@psNombreTipoUser VARCHAR(30),
	@psAbreviatura VARCHAR(5)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		UPDATE TipoUsuario SET NombreTipoUser = @psNombreTipoUser, Abreviatura = @psAbreviatura
		WHERE idTipoUsuario=@pnidTipoUser
		
		SELECT 'Informacion modificada correctamente'
	END TRY 
	BEGIN CATCH 

		SELECT 'No se pudo completar el proceso'

	END CATCH

	SET NOCOUNT OFF

END

/**




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Login]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 19 de abril 2021
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Usuario_Login] 

	@psidUser VARCHAR(10) = NULL,
	@psClaveUsuario VARCHAR(8), 
	@pnidTipoUsuario INT

AS 
BEGIN 
	SET NOCOUNT ON 
	BEGIN TRY 
		
		IF EXISTS (SELECT *
				   FROM Usuario WHERE idUser = @psidUser 
				   AND ClaveUsuario = @psClaveUsuario 
				   AND idTipoUsuario = @pnidTipoUsuario)
		BEGIN 
			IF @pnidTipoUsuario = 4
			BEGIN 
				SELECT u.idUser,u.ClaveUsuario,u.idTipoUsuario,T.NombreTipoUser,u.NoEmpleado,e.Nombre,e.Paterno,e.Materno,U.idEmpresaCliente,C.NombreCliente
				FROM Usuario AS U INNER JOIN Empleado AS E ON U.NoEmpleado = E.NoEmpleado
				LEFT OUTER JOIN
				EmpresaCliente AS C ON U.idEmpresaCliente = C.idEmpresaCliente
				INNER JOIN TipoUsuario AS T ON U.idTipoUsuario = T.idTipoUsuario
				WHERE @psidUser = idUser
			END
			ELSE 
			BEGIN 
				SELECT u.idUser,u.ClaveUsuario,CAST(u.idTipoUsuario AS nvarchar(10)) AS idTipoUsuario,T.NombreTipoUser,CAST(u.NoEmpleado AS nvarchar(10)) as NoEmpleado ,e.Nombre,e.Paterno,e.Materno--,U.idEmpresaCliente,C.NombreCliente
				FROM Usuario AS U INNER JOIN Empleado AS E ON U.NoEmpleado = E.NoEmpleado
			--	LEFT OUTER JOIN
			--	EmpresaCliente AS C ON U.idEmpresaCliente = C.idEmpresaCliente
				INNER JOIN TipoUsuario AS T ON U.idTipoUsuario = T.idTipoUsuario
				WHERE @psidUser = idUser

			END
		END
		ELSE 

			SELECT 'El usuario no existe'	

	END TRY 
	BEGIN CATCH 

		SELECT 'Algo no funciono, asegurese de escribir los datos correctos'

	END CATCH

	SET NOCOUNT OFF

END
/**
sp_Usuario_Login @psidUser = 'P017858', @psClaveUsuario ='12134',@pnidTipoUsuario=1

SELECT * FROM Usuario
SELECT * FROM TipoUsuario
SELECT * FROM Empleado

INSERT INTO TipoUsuario Values(2,'MDA')
INSERT INTO Usuario VALUES('MDADY13','12345',2,3,null)
**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Vista]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 19 de abril 2021
-- Description: 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_Usuario_Vista] 

	@psidUser VARCHAR(10) = NULL

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		

		IF (SELECT @psidUser) IS NULL
		BEGIN 
			SELECT u.idUser,u.ClaveUsuario,u.idTipoUsuario,T.NombreTipoUser,u.NoEmpleado,e.Nombre,e.Paterno,U.idEmpresaCliente,C.NombreCliente
			FROM Usuario AS U INNER JOIN Empleado AS E ON U.NoEmpleado = E.NoEmpleado
			LEFT OUTER JOIN
			EmpresaCliente AS C ON U.idEmpresaCliente = C.idEmpresaCliente
			INNER JOIN TipoUsuario AS T ON U.idTipoUsuario = T.idTipoUsuario
			ORDER BY NoEmpleado 
		END
		ELSE 	
			SELECT u.idUser,u.ClaveUsuario,u.idTipoUsuario,T.NombreTipoUser,u.NoEmpleado,e.Nombre,e.Paterno,U.idEmpresaCliente,C.NombreCliente
			FROM Usuario AS U INNER JOIN Empleado AS E ON U.NoEmpleado = E.NoEmpleado
			LEFT OUTER JOIN
			EmpresaCliente AS C ON U.idEmpresaCliente = C.idEmpresaCliente
			INNER JOIN TipoUsuario AS T ON U.idTipoUsuario = T.idTipoUsuario
			WHERE @psidUser = idUser
		
	END
	SET NOCOUNT OFF

END
/**
sp_Usuario_Ver @psidUser = 'MDADY13'

SELECT * FROM Usuario
SELECT * FROM TipoUsuario
SELECT * FROM Empleado

INSERT INTO TipoUsuario Values(2,'MDA')
INSERT INTO Usuario VALUES('MDADY13','12345',2,3,null)
**/
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[NoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Paterno] [varchar](20) NOT NULL,
	[Materno] [varchar](20) NOT NULL,
	[FechaIngreso] [datetime] NULL,
	[Telefono] [varchar](10) NULL,
	[idMunicipio] [int] NULL,
	[Direccion] [varchar](50) NULL,
	[Sueldo] [money] NULL,
	[Email] [varchar](40) NULL,
	[FechaNacimiento] [datetime] NULL,
	[MetodoTransporte] [varchar](10) NULL,
	[Sexo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpresaCliente]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpresaCliente](
	[idEmpresaCliente] [int] NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[Telefono] [varchar](10) NULL,
	[Email] [varchar](30) NULL,
	[DescripcionRama] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpresaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipoRefacciones]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipoRefacciones](
	[NoSerieProducto] [varchar](30) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
	[idTipoMovProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NoSerieProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[idEstado] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipio](
	[idMunicipio] [int] NOT NULL,
	[NombreMunicipio] [varchar](30) NOT NULL,
	[idEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicio](
	[NoServicio] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[Duracion] [time](7) NULL,
	[FechaFin] [datetime] NULL,
	[FechaAsignacion] [datetime] NULL,
	[FechaDeSolicitud] [datetime] NULL,
	[Prioridad] [varchar](15) NULL,
	[Estatus] [varchar](20) NULL,
	[Sitio] [varchar](50) NOT NULL,
	[ResponsableDelSitio] [varchar](30) NULL,
	[Asunto] [varchar](200) NULL,
	[RutaDescarga] [varchar](max) NULL,
	[RutaSubida] [varchar](max) NULL,
	[idTipoServicio] [int] NULL,
	[idMunicipio] [int] NULL,
	[idEmpresaCliente] [int] NULL,
	[NoSerieProducto] [varchar](30) NULL,
	[NoEmpleado] [int] NULL,
	[ActividadesRealizadas] [varchar](130) NULL,
	[Herramientas] [varchar](max) NULL,
	[NoEmpleadoInvitado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] NOT NULL,
	[Latitud] [varchar](50) NULL,
	[Longitud] [varchar](50) NULL,
	[idEmpresaCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoMovProducto]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMovProducto](
	[idTipoMovProducto] [int] NOT NULL,
	[NombreTipoMovP] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoMovProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[idTipoServicio] [int] NOT NULL,
	[NombreTipoServicio] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] NOT NULL,
	[NombreTipoUser] [varchar](30) NOT NULL,
	[Abreviatura] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/04/2021 18:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUser] [varchar](10) NOT NULL,
	[ClaveUsuario] [varchar](8) NOT NULL,
	[idTipoUsuario] [int] NULL,
	[NoEmpleado] [int] NULL,
	[idEmpresaCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Servicio] ADD  DEFAULT ('No aplica') FOR [NoSerieProducto]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_idMunicipioEmp] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_idMunicipioEmp]
GO
ALTER TABLE [dbo].[EquipoRefacciones]  WITH CHECK ADD  CONSTRAINT [FK_idTipoMovProd_EqRefacciones] FOREIGN KEY([idTipoMovProducto])
REFERENCES [dbo].[TipoMovProducto] ([idTipoMovProducto])
GO
ALTER TABLE [dbo].[EquipoRefacciones] CHECK CONSTRAINT [FK_idTipoMovProd_EqRefacciones]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_IDESTADO_MUNICIPIO] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([idEstado])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_IDESTADO_MUNICIPIO]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_idEmpresaC_servicio] FOREIGN KEY([idEmpresaCliente])
REFERENCES [dbo].[EmpresaCliente] ([idEmpresaCliente])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_idEmpresaC_servicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_idMuni_sercicio] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_idMuni_sercicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_idTipoServicio_servicio] FOREIGN KEY([idTipoServicio])
REFERENCES [dbo].[TipoServicio] ([idTipoServicio])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_idTipoServicio_servicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_NoEmp_servicio] FOREIGN KEY([NoEmpleado])
REFERENCES [dbo].[Empleado] ([NoEmpleado])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_NoEmp_servicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_NoSerieProducto_servicio] FOREIGN KEY([NoSerieProducto])
REFERENCES [dbo].[EquipoRefacciones] ([NoSerieProducto])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_NoSerieProducto_servicio]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_SucursalEmpresaCliente] FOREIGN KEY([idEmpresaCliente])
REFERENCES [dbo].[EmpresaCliente] ([idEmpresaCliente])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_SucursalEmpresaCliente]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaCliente] FOREIGN KEY([idEmpresaCliente])
REFERENCES [dbo].[EmpresaCliente] ([idEmpresaCliente])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_EmpresaCliente]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_idTipoUsuario_User] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_idTipoUsuario_User]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_NoEmp_User] FOREIGN KEY([NoEmpleado])
REFERENCES [dbo].[Empleado] ([NoEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_NoEmp_User]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [CK_MetodoTransEmp] CHECK  (([MetodoTransporte]='PUBLICO' OR [MetodoTransporte]='PRIVADO'))
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [CK_MetodoTransEmp]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [CK_SexoEmp] CHECK  (([Sexo]='M' OR [Sexo]='F'))
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [CK_SexoEmp]
GO
USE [master]
GO
ALTER DATABASE [ProyectoSonda_PIAIngenieria] SET  READ_WRITE 
GO
