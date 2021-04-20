USE [ProyectoSonda_PIAIngenieria]
GO
/****** Object:  StoredProcedure [dbo].[sp_Municipio_Insert]    Script Date: 18/04/2021 11:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================== 
-- CREADO POR EQUIPO PARA Proyecto sonda
-- Created by:  Yadira Jimenez
-- Create date: 18 de abril 2020
-- Description: 
-- ==========================================================================  

ALTER PROCEDURE [dbo].[sp_Municipio_Estado_ver] 
    
	@nidMunicipio INT--,
--	@idEstado INT 

AS 
BEGIN 
	SET NOCOUNT ON 	
	BEGIN  
		

		SELECT NombreMunicipio AS 'Municipio',Nombre AS 'Estado'
		FROM Municipio AS M INNER JOIN Estado AS E ON M.idEstado = E.idEstado
		WHERE @nidMunicipio = idMunicipio
		
	END

	SET NOCOUNT OFF

END

/**
sp_Municipio_Estado_ver @nidMunicipio = 1



**/