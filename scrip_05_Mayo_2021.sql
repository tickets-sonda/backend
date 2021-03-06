USE [master]
GO
/****** Object:  Database [ProyectoSonda_PIAIngenieria]    Script Date: 04/05/2021 18:34:20 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ConsultaParaDetalle]    Script Date: 04/05/2021 18:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA PIA BD4
-- Created by:  Yadira Jimenez
-- Create date: 18 de febrero 2020
-- Description: Sp para correr cuando el cliente de clic en el boton de enviar solicitud 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_ConsultaParaDetalle] 

@pnNoServicio INT


AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY 

		SELECT A.NoServicio,A.FechaInicio,A.Duracion,A.FechaFin,A.FechaAsignacion,A.FechaDeSolicitud,A.Prioridad,A.Estatus,
		A.Sitio,A.ubicacion,A.ResponsableDelSitio,A.Asunto,A.RutaDescarga,A.RutaSubida, T.NombreTipoServicio ,A.idMunicipio,E.NombreCliente
		FROM Servicio AS A LEFT OUTER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio
		LEFT OUTER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
		WHERE NoServicio = @pnNoServicio

		--SELECT servicio.idTipoServicio,tiposervicio.idTipoServicio FROM servicio,TipoServicio
		
	END TRY 
	BEGIN CATCH

	END CATCH
	SET NOCOUNT OFF

END

/**


sp_ConsultaParaDetalle @pnNoServicio = 5


SELECT * FROM Servicio 

update servicio 
set ubicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28751.068976016853!2d-100.20958541076516!3d25.741361906650383!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8662ebe11253f1f5%3A0x9a31ed0565e01ff3!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619664075265!5m2!1ses-419!2smx'
where NoServicio = 3

sp_TablasVistaDeServicios  @psidUser = 'JUAGA22', @psEstatus = 'Nuevo'--, @psVariable='3'
select * from servicio
where estatus = 'En curso'

SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),
				(CONVERT(VARCHAR(50),A.FechaInicio,1)),(CONVERT(VARCHAR(50),A.FechaFin,1))
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio

**/

GO
/****** Object:  StoredProcedure [dbo].[sp_ContdorServiciosTerm_Pendientes_Totales]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_ContdorServiciosTerm_Pendientes_Totales] 
    
	@pndNoEmpleado VARCHAR(10) 

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY 
		DECLARE @sTerminados VARCHAR(10),
			    @sPendientes VARCHAR(10)


		IF ( SELECT idTipoUsuario
		     FROM Usuario 
			 WHERE NoEmpleado = @pndNoEmpleado
			) = 3
		BEGIN 
			SELECT COUNT(*) 'Terminados'
			FROM Servicio
			WHERE Estatus ='Finalizado'
			AND NoEmpleado = @pndNoEmpleado
			AND FechaFin = GETDATE()

			SELECT COUNT(*) 'Pendientes'
			FROM Servicio
			WHERE Estatus = 'En curso' OR Estatus = 'Asignado' 
			AND NoEmpleado = @pndNoEmpleado
			AND FechaAsignacion = GETDATE()
			OR FechaInicio = GETDATE()

		END 
		ELSE IF( SELECT idTipoUsuario
				 FROM Usuario 
				 WHERE NoEmpleado = @pndNoEmpleado
				) = 2
		BEGIN 
			SELECT COUNT(*) 'Terminados'
			FROM Servicio
			WHERE Estatus ='Finalizado'
			AND FechaFin = GETDATE()

			SELECT COUNT(*) 'En curso'
			FROM Servicio
			WHERE Estatus = 'En curso'
			AND FechaInicio = GETDATE() 

		END 
			
	END TRY 
	BEGIN CATCH 

	
	END CATCH
	SET NOCOUNT OFF

END
/**

sp_ContdorServiciosTerm_Pendientes_Totales

select * from Usuario,tipoUsuario
**/
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearSolicitud_SucursalCombo]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_CrearSolicitud_SucursalCombo] 
    
	@idUsuario VARCHAR(10)
AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
	
		SELECT idSucursal,Sitio
		FROM Sucursal AS S INNER JOIN Usuario AS U ON S.idEmpresaCliente = U.idEmpresaCliente
		WHERE idUser = @idUsuario

		/**
		SELECT * 
		FROM Sucursal AS S inner join EmpresaCliente as e on e.idEmpresaCliente = s.idEmpresaCliente
		**/
	
	END
	SET NOCOUNT OFF

END

/**

select * from usuario

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Insertar]    Script Date: 04/05/2021 18:34:21 ******/
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

--declare 

	 @psNombre VARCHAR(20),
	 @psPaterno VARCHAR(20),
	 @psMaterno VARCHAR(20),
	 @pdFechaIngreso DATE, 
	 @psTelefono VARCHAR(10), 
	 @pnIdMunicipio INT = 1, 
	 @psDireccion VARCHAR(50), 
	 @pmSueldo MONEY, 
	 @psEmail VARCHAR(40),
	 @pdFechaNacimiento DATE, 
	 @psMetodoTransporte VARCHAR(10), 
	 @psSexo VARCHAR(1),
	 @pnTipoUsuario INT, 
	 @pnClaveUser INT

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @nNoEmpleado INT  = (SELECT MAX(NoEmpleado) FROM Empleado) 
		SET @nNoEmpleado = @nNoEmpleado + 1

		DECLARE @sNomUs   VARCHAR(3)= @psNombre, 
				@sPatUs   VARCHAR(1)= @psPaterno, 
				@sMatUs   VARCHAR(1)= @psMaterno,
				@nNoEmpUs INT=  @nNoEmpleado, 
				@sTipoUs INT= @pnTipoUsuario, 
				@idUser VARCHAR(10) = ''

		
		INSERT INTO Empleado
		VALUES(  @nNoEmpleado,@psNombre,@psPaterno,@psMaterno,@pdFechaIngreso,@psTelefono, @pnIdMunicipio,
		 @psDireccion,@pmSueldo,@psEmail,@pdFechaNacimiento,@psMetodoTransporte,@psSexo)
		
		SET  @idUser = (@sNomUs  + @sPatUs + @sMatUs + (CAST(@nNoEmpUs AS VARCHAR(1)) + (CAST(@sTipoUs AS VARCHAR(1)))))

		
		INSERT INTO Usuario(idUser,ClaveUsuario,idTipoUsuario,NoEmpleado,Email)
		VALUES(upper(@idUser),@pnClaveUser,@pnTipoUsuario,@nNoEmpleado,@psEmail)
		
		SELECT idUser 
		FROM Usuario 
		WHERE NoEmpleado = @nNoEmpleado
		
	END

	SET NOCOUNT OFF

END

/**
sp_Empleado_Insertar @psNombre = 'juan',@psPaterno='Garcia',@psMaterno='Ayala',@pdFechaIngreso='2021-04-16',@psTelefono= '292839', @pnIdMunicipio= 1,@psDireccion = 'calle lirio 215',
	@pmSueldo= 10000.00,@psEmail='alguien@gmail.com',@pdFechaNacimiento= '1998-04-16',@psMetodoTransporte='privado',@psSexo='M', @pnTipoUsuario = 2, @pnClaveUser=12345
	
select * from Empleado

ALTER TABLE Empleado
ALTER COLUMN FechaIngreso DATETIME 

SELECT GETDATE()

select * from empresacliente
SELECT * FROM Usuario 
DELETE FROM Usuario 
where idUser= 'JUAGA42'


**/


GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Update]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Ver]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EmpresaCliente_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_EmpresaCliente_Delete] 
     
	@pnIdEmpresaCliente INT,
	@psNombreCliente VARCHAR(50),
	@psTelefono VARCHAR(10), 
	@psEmail VARCHAR(30),
	@psDescripcionRama VARCHAR(40)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		IF EXISTS (SELECT idEmpresaCliente FROM EmpresaCliente WHERE idEmpresaCliente = @pnIdEmpresaCliente)
		BEGIN  
			DELETE FROM EmpresaCliente
			WHERE idEmpresaCliente =  @pnIdEmpresaCliente

			SELECT 'Empresa cliente borrada correctamente'
		END
		ELSE
			
			SELECT 'La empresa no existe'
		
	
	END TRY
	BEGIN CATCH
		
		SELECT 'Algo no funciono'

	END CATCH 
	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @NombreEstado= 'Coahuila'



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpresaCliente_Insert]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_EmpresaCliente_Insert] 
     
	@psNombreCliente VARCHAR(50),
	@psTelefono VARCHAR(10), 
	@psEmail VARCHAR(30),
	@psDescripcionRama VARCHAR(40)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		
		DECLARE @idEmpresaCliente INT  = (SELECT MAX(idEmpresaCliente) FROM EmpresaCliente)

		SET @idEmpresaCliente = @idEmpresaCliente + 1

		INSERT INTO EmpresaCliente(idEmpresaCliente,NombreCliente,Telefono,Email,DescripcionRama) 
		VALUES(@idEmpresaCliente,@psNombreCliente,@psTelefono,@psEmail,@psDescripcionRama)
		
		SELECT @idEmpresaCliente
	
	END

	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @NombreEstado= 'Coahuila'



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpresaCliente_Update]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_EmpresaCliente_Update] 
     
	@pnIdEmpresaCliente INT,
	@psNombreCliente VARCHAR(50) = null,
	@psTelefono VARCHAR(10) = null, 
	@psEmail VARCHAR(30) = null,
	@psDescripcionRama VARCHAR(40) = null

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY  
		
		IF EXISTS (SELECT idEmpresaCliente FROM EmpresaCliente WHERE idEmpresaCliente = @pnIdEmpresaCliente)
		BEGIN  
			UPDATE EmpresaCliente
			SET NombreCliente = @psNombreCliente, Telefono = @psTelefono, Email = @psEmail, DescripcionRama = @psDescripcionRama
			WHERE idEmpresaCliente =  @pnIdEmpresaCliente

			SELECT 'Empresa cliente modificada correctamente'

		END
		ELSE
			
			SELECT 'La empresa no existe'
		
	
	END TRY
	BEGIN CATCH
		
		SELECT 'Algo no funciono asegurese de escribir la informacion correcta'

	END CATCH 
	SET NOCOUNT OFF

END

/**

sp_EmpresaCliente_Update @pnIdEmpresaCliente = 1, @psNombreCliente = 'Banorte', @psTelefono = '81293456', @psDescripcionRama = 'Banca/Finanzas'

SELECT * FROM EMPRESACLIENTE

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_EnviarSolicitud_ServicioInsert_1]    Script Date: 04/05/2021 18:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA PIA BD4
-- Created by:  Yadira Jimenez
-- Create date: 18 de febrero 2020
-- Description: Sp para correr cuando el cliente de clic en el boton de enviar solicitud 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_EnviarSolicitud_ServicioInsert_1] 
    
	@pnIdEmpresaCliente INT, 
	@psidUser			VARCHAR(10),
	@pdFechaSolicitud   DATETIME, 
	@psAsunto			VARCHAR(200),
	@psResponsableSitio VARCHAR(30),
	@pidSucursal		INT,
	@psEmail		    VARCHAR(50)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY 
	
		DECLARE @nNoServicio INT = (SELECT MAX(NoServicio) FROM Servicio), 
				@sSitio VARCHAR(MAX), 
				@sUbicacionMapa VARCHAR(MAX)


		SET @nNoServicio = @nNoServicio + 1

		SELECT @sSitio = Sitio, @sUbicacionMapa = Ubicacion 
		FROM Sucursal
		WHERE idSucursal = @pidSucursal

		--SELECT @nNoServicio

	--/**
		--select @nNoServicio,@pnIdEmpresaCliente,@psidUser,@pdFechaSolicitud,@psAsunto,@psResponsableSitio,@pidSucursal,@sSitio,@sUbicacionMapa,@psEmail
		INSERT INTO Servicio(NoServicio,Estatus,idEmpresaCliente,FechaDeSolicitud,Asunto,ResponsableDelSitio,Sitio,ubicacion,Email,NoSerieProducto)
		VALUES(@nNoServicio,'Nuevo',@pnIdEmpresaCliente,@pdFechaSolicitud,@psAsunto,@psResponsableSitio,@sSitio,@sUbicacionMapa,@psEmail,null)
		
	--**/	

	
	--	select * from Servicio where NoServicio = @nNoServicio
		SELECT CONCAT('Se ingreso correctamente su solicitud, este es su numero de servicio: ', @nNoServicio)


	END TRY 
	BEGIN CATCH 

		SELECT 'Algo no funciono, asegurese de escribir los datos correctos'

	END CATCH
	SET NOCOUNT OFF

END

/**


sp_EnviarSolicitud_ServicioInsert_1 @pnIdEmpresaCliente = 1, 
@psidUser = 'CLIBA1', 
@pdFechaSolicitud = getdate,
@psAsunto = 'Mala conexion',
@psResponsableSitio = 'Jose Martinez',
@pidSucursal = 1, 
@psEmail = 'juanito@gmail.com'

SELECT * FROM Usuario



sp_EnviarSolicitud_ServicioInsert_1 @pnIdEmpresaCliente = 1, 
@psidUser = 'CLIBA1', 
@pdFechaSolicitud = '2021-05-03 00:26:57.513' ,
@psAsunto = 'Mala coneccion de red',
@psResponsableSitio = 'Jose Martinez',
@pidSucursal = 1, 
@psEmail = 'juanito@gmail.com'


SELECT GETDATE()


INSERT INTO Servicio(NoServicio,Estatus,idEmpresaCliente,FechaDeSolicitud,Asunto,ResponsableDelSitio,Sitio,ubicacion,Email,NoSerieProducto)
VALUES(5,'Nuevo,',1,'2021-05-03 00:26:57.513','No funciona mi cable de red','Jose Martinez','Banorte Apodaca','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28751.068976016853!2d-100.20958541076516!3d25.741361906650383!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8662ebe11253f1f5%3A0x9a31ed0565e01ff3!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619664075265!5m2!1ses-419!2smx','juanito@gmail.com',null)


select * from servicio
**/


GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Estado_Insertar]    Script Date: 04/05/2021 18:34:21 ******/
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
		
		DECLARE @idEstado INT  = (SELECT MAX(idEstado) FROM Estado)

		SET @idEstado = @idEstado + 1

		IF EXISTS(SELECT Nombre FROM Estado WHERE Nombre = @psNombreEstado )
		BEGIN 
			SELECT 'Ese estado ya existe'
		END
		ELSE
		BEGIN 
			INSERT INTO Estado(idEstado,Nombre) 
			VALUES(@idEstado,@psNombreEstado)

			SELECT 'Se ingresó correctamente'
		END

	
	END
	SET NOCOUNT OFF

END

/**
sp_Estado_Insertar @psNombreEstado= 'Sonora'

select * from estado
DELETE from estado 
WHERE id= 'Toluca'




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Estado_Update]    Script Date: 04/05/2021 18:34:21 ******/
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
		WHERE idEstado= @pnidEstado
	
		SELECT 'Informacion actualizada correctamente'
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**

select * from estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)



sp_Estado_Update @pnidEstado = 2, @psNombreEstado = 1



**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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
	
	IF EXISTS( Select idMunicipio from Municipio where idMunicipio = @idMunicipio)
	BEGIN 
		DELETE FROM Municipio
		WHERE idMunicipio = @idMunicipio
		SELECT 'Informacion borrada correctamente'
	END 
		
	
	
	END TRY 
	BEGIN CATCH 

	SELECT 'No se pudo completar el proceso'

	END CATCH
END

/**
sp_Municipio_Delete @idMunicipio = 28

select * from municipio,estado
INSERT INTO Municipio VALUES(2,'Santa catarina',1)




**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Estado_ver]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Insert]    Script Date: 04/05/2021 18:34:21 ******/
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

		IF EXISTS(SELECT NombreMunicipio FROM Municipio WHERE NombreMunicipio = @NombreMunicipio )
		BEGIN 
			SELECT 'Ese municipio ya existe'
		END
		ELSE
		BEGIN 
			INSERT INTO Municipio (idMunicipio, NombreMunicipio, idEstado) 
			VALUES(@nidMunicipio, @NombreMunicipio, @idEstado)

			SELECT 'Se ingresó correctamente la información'
		END
	END

	SET NOCOUNT OFF

END

/**
sp_Municipio_Insert @NombreMunicipio = 'San pedro', @idEstado = 1

select * from municipio

delete from municipio 
where NombreMunicipio = 'San pedro'


**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Update]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NoServicioParaBotonVer]    Script Date: 04/05/2021 18:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA PIA BD4
-- Created by:  Yadira Jimenez
-- Create date: 18 de febrero 2020
-- Description: Sp para correr cuando el cliente de clic en el boton de enviar solicitud 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_NoServicioParaBotonVer] 

 
 @pnNoServicio INT = 1

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY 
		
		
		SELECT @pnNoServicio = NoServicio
		FROM Servicio
		WHERE NoServicio = @pnNoServicio
		
		SELECT @pnNoServicio  

	END TRY 
	BEGIN CATCH

	END CATCH
	SET NOCOUNT OFF

END
/**

sp_NoServicioParaBotonVer @pnNoServicio = 1

**/ 

GO
/****** Object:  StoredProcedure [dbo].[sp_Servicio_InsertarPrueba]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Sucursal_Insertar]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_Sucursal_Insertar] 
    
	@psidEmpresaCliente INT, 
	@psUbicacion VARCHAR(MAX), 
	@psSitio VARCHAR(MAX),
	@psNombreMunicipio VARCHAR(30)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  TRY

		DECLARE @nidSucursal INT  = (SELECT MAX(idSucursal) FROM Sucursal), 
				@nidMunicipio INT

			
		SET @nidMunicipio = (SELECT idMunicipio
							 FROM Municipio 
							 WHERE NombreMunicipio = @psNombreMunicipio)

		SET @nidSucursal = @nidSucursal + 1

		IF EXISTS(SELECT Sitio FROM Sucursal WHERE Sitio = @psSitio )
		BEGIN 
			SELECT 'Esa sucursal ya existe'
		END
		ELSE
		BEGIN 
			INSERT INTO Sucursal(idSucursal,idEmpresaCliente,Ubicacion,Sitio,idMunicipio) 
			VALUES(@nidSucursal,@psidEmpresaCliente,@psUbicacion,@psSitio,@nidMunicipio)

			SELECT 'Se ingresó la información correctamente'
		END 

	
	END TRY 
	BEGIN CATCH 
		
		SELECT 'Asegurese de ingresar correctamente la informacion'

	END CATCH
	SET NOCOUNT OFF

END

/**
sp_Sucursal_Insertar @psidEmpresaCliente = 1, 
	@psUbicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d115002.77890567873!2d-100.242828503163!3d25.742908689753943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xba45f74ad8740332!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619887393058!5m2!1ses-419!2smx', 
	@psSitio = 'Banorte escobedo, Av. Sendero Divisorio # 1001, Privadas de Anáhuac, Cerradas De Anahuac, 66059 Cd Gral Escobedo, N.L.'



sp_Sucursal_Insertar @psidEmpresaCliente = 1, 
	@psUbicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28772.190394632795!2d-100.39479927085799!3d25.653925698677874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x882821c299d1cce2!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619888161623!5m2!1ses-419!2smx', 
	@psSitio = 'Banorte San pedro, Avenida Santa Barbara, Avenida José Vasconcelos # 708, 66230 San Pedro Garza García, N.L.'

SELECT * FROM EmpresaCliente
SELECT * FROM sucursal
select * from estado
DELETE from estado 
WHERE id= 'Toluca'


select * from municipio

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Sucursal_Update]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_Sucursal_Update] 
    
	@pnIdSucursal INT,
	@psidEmpresaCliente INT, 
	@psUbicacion VARCHAR(MAX), 
	@psSitio VARCHAR(MAX),
	@psNombreMunicipio VARCHAR(30)

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  TRY

		DECLARE @nidMunicipio INT

		SET  @nidMunicipio = (SELECT idMunicipio 
							  FROM Municipio 
							  WHERE NombreMunicipio = @psNombreMunicipio)

		UPDATE Sucursal SET idEmpresaCliente = @psidEmpresaCliente, Ubicacion = @psUbicacion, Sitio = @psSitio, idMunicipio = @nidMunicipio
		WHERE idSucursal = @pnIdSucursal


			SELECT 'Se modifico la información correctamente'

	END TRY 
	BEGIN CATCH 
		
		SELECT 'Asegurese de ingresar correctamente la informacion'

	END CATCH
	SET NOCOUNT OFF

END

/**
sp_Sucursal_Insertar @psidEmpresaCliente = 1, 
	@psUbicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d115002.77890567873!2d-100.242828503163!3d25.742908689753943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xba45f74ad8740332!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619887393058!5m2!1ses-419!2smx', 
	@psSitio = 'Banorte escobedo, Av. Sendero Divisorio # 1001, Privadas de Anáhuac, Cerradas De Anahuac, 66059 Cd Gral Escobedo, N.L.',
	@psNombreMunicipio = 'Escobedo'



sp_Sucursal_Insertar @psidEmpresaCliente = 1, 
	@psUbicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28772.190394632795!2d-100.39479927085799!3d25.653925698677874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x882821c299d1cce2!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619888161623!5m2!1ses-419!2smx', 
	@psSitio = 'Banorte San pedro, Avenida Santa Barbara, Avenida José Vasconcelos # 708, 66230 San Pedro Garza García, N.L.',
	@psNombreMunicipio  = 'San pedro'

SELECT * FROM EmpresaCliente
SELECT * FROM sucursal
select * from estado
DELETE from estado 
WHERE id= 'Toluca'

DELETE FROM Sucursal 
where idSucursal = 2 


select * from municipio

sp_Sucursal_Update @pnIdSucursal = 1,
	@psidEmpresaCliente = 1, 
	@psUbicacion = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28751.068976016853!2d-100.20958541076516!3d25.741361906650383!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8662ebe11253f1f5%3A0x9a31ed0565e01ff3!2sGrupo%20Financiero%20Banorte%20Sucursal!5e0!3m2!1ses-419!2smx!4v1619664075265!5m2!1ses-419!2smx', 
	@psSitio = 'Banorte Apodaca',
	@psNombreMunicipio = 'Apodaca'

**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Sucursal_ver]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TablasVistaDeServicios]    Script Date: 04/05/2021 18:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA PIA BD4
-- Created by:  Yadira Jimenez
-- Create date: 18 de febrero 2020
-- Description: Sp para correr cuando el cliente de clic en el boton de enviar solicitud 
-- ==========================================================================  

CREATE PROCEDURE [dbo].[sp_TablasVistaDeServicios] 

 @psidUser VARCHAR(10), 
 @psEstatus VARCHAR(10),
 @psVariable VARCHAR(MAX) = NULL


AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN TRY 

		DECLARE @tmpTablaServicios TABLE (
		 NoServicio     VARCHAR(MAX), 
		 NoEmpleado     VARCHAR(MAX), 
		 TipoServicio   VARCHAR(20), 
		 Prioridad      VARCHAR(20),
		 EmailCliente   VARCHAR(50), 
		 Municipio		VARCHAR(20), 
		 Cliente		VARCHAR(50),
		 FechaSolicitud VARCHAR(50),
		 FechaInicio    VARCHAR(50),
		 FechaFin		VARCHAR(50),
		 Sucursal       VARCHAR(MAX),	
		 FechaAsignacion VARCHAR(50), 
		 Estatus        VARCHAR(30)
		)
		
		DECLARE  @nNoEmpleado VARCHAR(MAX)
		/** 
		 NoServicio     VARCHAR(MAX), 
		 TipoServicio   VARCHAR(20), 
		 Prioridad      VARCHAR(20),
		 EmailCliente   VARCHAR(50), 
		 Municipio		VARCHAR(20), 
		 Cliente		VARCHAR(50),
		 FechaSolicitud VARCHAR(50),
		 Sucursal       VARCHAR(MAX),
		 FechaAsignacion VARCHAR(50) 
		**/ 
		SET @nNoEmpleado = (select NoEmpleado
							from Usuario 
							where idUser = @psidUser)

		IF (SELECT idTipoUsuario 
			FROM Usuario
			WHERE @psidUser = idUser
			) = 2 -- Tipo de usuario mesa de ayuda 
		BEGIN	
			IF @psEstatus = 'Nuevo' -- PARA MOSTRAR EN 'NUEVO SERVICIO ASIGNACION' 
			BEGIN 
				INSERT INTO @tmpTablaServicios(NoServicio,EmailCliente,Municipio,Cliente,FechaSolicitud)
				SELECT CONVERT(VARCHAR(MAX),A.NoServicio),CONVERT(VARCHAR(50),A.Email),CONVERT(VARCHAR(20),M.NombreMunicipio),CONVERT(VARCHAR(50),E.NombreCliente),CONVERT(VARCHAR(50),A.FechaDeSolicitud,1)
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				WHERE a.Estatus = 'Nuevo'	
					
			END
			--/**
			ELSE IF @psEstatus = 'En curso' -- PARA MOSTRAR EN LA PANTALLA DE 'EN CURSO' MDA 
			BEGIN 
				INSERT INTO @tmpTablaServicios(NoServicio,NoEmpleado,TipoServicio,Prioridad,Sucursal,Cliente,FechaAsignacion)
				SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(MAX),A.NoEmpleado)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),(CONVERT(VARCHAR(50),A.FechaAsignacion,1))--,(A.Estatus)
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio
				WHERE a.Estatus = 'En curso'
			END 
			--**/
			ELSE IF @psEstatus = 'En revision' -- PARA MOSTRAR EN LA PANTALLA DE 'EN REVISION' MDA 
			BEGIN 
				INSERT INTO @tmpTablaServicios(NoServicio,NoEmpleado,TipoServicio,Prioridad,Sucursal,Cliente,FechaAsignacion)
				SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(MAX),A.NoEmpleado)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),(CONVERT(VARCHAR(50),A.FechaAsignacion,1))--,(A.Estatus)
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio
				WHERE a.Estatus = 'En revision'
			END 
		END
		ELSE IF (SELECT idTipoUsuario 
				 FROM Usuario
				 WHERE @psidUser = idUser
			     ) = 3 -- Tipo de usuario Ingeniero de campo
		BEGIN 
			
			IF @psEstatus = 'Aprobado/Terminado'
			BEGIN 
				--select 'estatus aprob'
				INSERT INTO @tmpTablaServicios(NoServicio,TipoServicio,Prioridad,Sucursal,Cliente,FechaInicio,FechaFin)
				SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),
				(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),
				(CONVERT(VARCHAR(50),A.FechaInicio,1)),(CONVERT(VARCHAR(50),A.FechaFin,1))
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio
				WHERE a.Estatus = 'Aprobado/Terminado'
				AND A.NoEmpleado =  @nNoEmpleado 
			END
			IF @psEstatus = 'En curso' or @psEstatus = 'En revision' or  @psEstatus ='Asignado'
			BEGIN 
				
				--select 'en curso o revision o asignado'
			
				INSERT INTO @tmpTablaServicios(NoServicio,TipoServicio,Prioridad,Sucursal,Cliente,FechaInicio,FechaFin)
				SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),
				(CONVERT(VARCHAR(50),A.FechaInicio,1)),(CONVERT(VARCHAR(50),A.FechaFin,1))
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio
				WHERE A.Estatus = 'En curso' 
				OR A.Estatus = 'En revision'
				OR A.Estatus = 'Asignado'
				AND 
				 A.NoEmpleado = @nNoEmpleado
				--ORDER BY NoServicio DESC 
			END
		END

		--select 'fuera if'
	
		/**
		IF @psVariable is not null
		BEGIN 
			 SELECT * FROM @tmpTablaServicios
			 WHERE @psVariable IN ( NoServicio, NoEmpleado,TipoServicio,Prioridad ,EmailCliente , Municipio,Cliente	,FechaSolicitud ,FechaInicio,Sucursal ,FechaAsignacion)
		END										 
		*/
		SELECT * FROM @tmpTablaServicios

	END TRY 
	BEGIN CATCH

	END CATCH
	SET NOCOUNT OFF

END

/**

select * from sucursal
SELECT * FROM Usuario
select idEmpresaCliente from servicio

select * from TipoServicio



sp_TablasVistaDeServicios  @psidUser = 'EDUGA33', @psEstatus = 'En curso'--, @psVariable='3'
select * from servicio
where estatus = 'En curso'

SELECT (CONVERT(VARCHAR(MAX),A.NoServicio)),(CONVERT(VARCHAR(50),T.NombreTipoServicio)),(CONVERT(VARCHAR(20),A.Prioridad)),(CONVERT(VARCHAR(MAX),S.Sitio)),(CONVERT(VARCHAR(50),E.NombreCliente)),
				(CONVERT(VARCHAR(50),A.FechaInicio,1)),(CONVERT(VARCHAR(50),A.FechaFin,1))
				FROM Sucursal AS S INNER JOIN Municipio AS M ON S.idMunicipio = M.idMunicipio
				INNER JOIN Servicio as A ON A.Sitio = S.Sitio
				INNER JOIN EmpresaCliente AS E ON A.idEmpresaCliente = E.idEmpresaCliente
				INNER JOIN TipoServicio AS T ON A.idTipoServicio = T.idTipoServicio

**/

GO
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Insert]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TipoServicio_Update]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Delete]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Insert]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Update]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateServicioAsignacion]    Script Date: 04/05/2021 18:34:21 ******/
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

CREATE PROCEDURE [dbo].[sp_UpdateServicioAsignacion] 
	
	@psAccion VARCHAR(50),
	@pnNoServicioA			 INT, 
	@psPrioridad			 VARCHAR(10) = NULL, 
	@pnIdTipoServicio		 INT = NULL, 
	@pdFechaAsignacion		 DATETIME = NULL, 
	@psHerramientas			 VARCHAR(MAX) = NULL, 
	@psDescripcion			 VARCHAR(30)  = NULL, 
	@pnNumSerieProducto		 VARCHAR(30) = NULL,
	@idTipoMovProducto		 INT = NULL, 
	@pnNoEmpleadoAsig		 INT = NULL, 
	@pnNoEmpleadoInvi		 INT = NULL, 
	@psActividadesRealizadas VARCHAR(MAX)
AS 
BEGIN 
	SET NOCOUNT ON 
	BEGIN TRY 
		
		DECLARE @tmpCacharServicio TABLE(
		NoServicio INT 
		)
		--DECLARE @nNoServicio INT 

		/**
		INSERT INTO @tmpCacharServicio(NoServicio)
		EXEC sp_NoServicioParaBotonVer @pnNoServicio = @nNoServicio 
		
		SELECT @nNoServicio --FROM @tmpCacharServicio
		**/ 

		IF (SELECT Estatus FROM Servicio 
			WHERE NoServicio = @pnNoServicioA) = 'Nuevo'
		BEGIN 
			UPDATE Servicio
			SET Prioridad = @psPrioridad, idTipoServicio = @pnIdTipoServicio,FechaAsignacion = @pdFechaAsignacion, Herramientas = @psHerramientas, 
			NoSerieProducto = @pnNumSerieProducto, NoEmpleado = @pnNoEmpleadoAsig, NoEmpleadoInvitado = @pnNoEmpleadoInvi, Estatus = 'Asignado'
			WHERE NoServicio = @pnNoServicioA

			--SELECT * FROM EquipoRefacciones,TipoMovProducto
			INSERT INTO EquipoRefacciones(NoSerieProducto,Descripcion,idTipoMovProducto)
			VALUES(@pnNumSerieProducto,@psDescripcion,@idTipoMovProducto)	
		END 
		/**ELSE IF (SELECT Estatus FROM Servicio 
				WHERE NoServicio = @pnNoServicioA) = 'Asignado'
		BEGIN 

		END

		**/

	END TRY 
	BEGIN CATCH 

		SELECT 'Algo no funciono, asegurese de escribir los datos correctos'

	END CATCH

	SET NOCOUNT OFF

END
/**
sp_UpdateServicioAsignacion 

SELECT * FROM Usuario
SELECT * FROM TipoUsuario
SELECT * FROM EmpresaCliente

INSERT INTO TipoUsuario Values(2,'MDA')
INSERT INTO Usuario VALUES('MDADY13','12345',2,3,null)
**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Login]    Script Date: 04/05/2021 18:34:21 ******/
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
				SELECT u.idUser,u.ClaveUsuario,u.idTipoUsuario,T.NombreTipoUser,''AS NoEmpleado,U.idEmpresaCliente,C.NombreCliente
				FROM Usuario AS U
				INNER JOIN
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
sp_Usuario_Login @psidUser = 'CLIBA1', @psClaveUsuario ='1234',@pnidTipoUsuario=4

SELECT * FROM Usuario
SELECT * FROM TipoUsuario
SELECT * FROM EmpresaCliente

INSERT INTO TipoUsuario Values(2,'MDA')
INSERT INTO Usuario VALUES('MDADY13','12345',2,3,null)
**/
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Vista]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 04/05/2021 18:34:21 ******/
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
	[FechaIngreso] [date] NULL,
	[Telefono] [varchar](10) NULL,
	[idMunicipio] [int] NULL,
	[Direccion] [varchar](50) NULL,
	[Sueldo] [money] NULL,
	[Email] [varchar](40) NULL,
	[FechaNacimiento] [date] NULL,
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
/****** Object:  Table [dbo].[EmpresaCliente]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[EquipoRefacciones]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[Municipio]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 04/05/2021 18:34:21 ******/
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
	[Sitio] [varchar](max) NULL,
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
	[ubicacion] [varchar](max) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 04/05/2021 18:34:21 ******/
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
	[Ubicacion] [nvarchar](max) NULL,
	[Sitio] [varchar](max) NULL,
	[idMunicipio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoMovProducto]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 04/05/2021 18:34:21 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/05/2021 18:34:21 ******/
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
	[Email] [varchar](40) NULL,
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
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_MunicipioSucursal] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_MunicipioSucursal]
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
