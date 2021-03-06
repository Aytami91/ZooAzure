USE [zooDb]
GO
/****** Object:  User [userzoo]    Script Date: 30/06/2017 17:38:21 ******/
CREATE USER [userzoo] FOR LOGIN [userzoo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [userzoo]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificaciones](
	[idClasificacion] [int] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clasificaciones] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Especies]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[idEspecie] [bigint] IDENTITY(1,1) NOT NULL,
	[idClasificacion] [int] NOT NULL,
	[idTipoAnimal] [bigint] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[nPatas] [smallint] NOT NULL,
	[esMascota] [bit] NOT NULL,
 CONSTRAINT [PK_Especies] PRIMARY KEY CLUSTERED 
(
	[idEspecie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposAnimal]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposAnimal](
	[idTipoAnimal] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IdTipoAnimal] PRIMARY KEY CLUSTERED 
(
	[idTipoAnimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Clasificaciones] ON 

INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (1, N'Hervivoro')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (2, N'Carnivoro')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (3, N'Omnivoro')
SET IDENTITY_INSERT [dbo].[Clasificaciones] OFF
SET IDENTITY_INSERT [dbo].[Especies] ON 

INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (2, 2, 1, N'Tiburon', 0, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (3, 3, 2, N'Loro', 2, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (4, 1, 3, N'Toro', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (5, 1, 3, N'Gato', 4, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (6, 3, 3, N'Perro', 4, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (7, 1, 3, N'Elefante', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (8, 2, 1, N'Orca', 0, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (9, 2, 2, N'Aguila', 2, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (10, 1, 3, N'Hamster', 4, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (12, 2, 3, N'Serpiente', 0, 1)
SET IDENTITY_INSERT [dbo].[Especies] OFF
SET IDENTITY_INSERT [dbo].[TiposAnimal] ON 

INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (1, N'acuatico')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (2, N'volador')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (3, N'terrestre')
SET IDENTITY_INSERT [dbo].[TiposAnimal] OFF
ALTER TABLE [dbo].[Clasificaciones]  WITH CHECK ADD  CONSTRAINT [relacion] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[Clasificaciones] ([idClasificacion])
GO
ALTER TABLE [dbo].[Clasificaciones] CHECK CONSTRAINT [relacion]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [relacionclasificacionespecies] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[Clasificaciones] ([idClasificacion])
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [relacionclasificacionespecies]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [relaciontipoespecie] FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TiposAnimal] ([idTipoAnimal])
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [relaciontipoespecie]
GO
/****** Object:  StoredProcedure [dbo].[AgregarClasificacion]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarClasificacion]
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO Clasificaciones(denominacion) VALUES (@denominacion)

END
GO
/****** Object:  StoredProcedure [dbo].[AgregarEspecie]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEspecie]
	@idEspecie nvarchar(50)
AS
BEGIN
	INSERT INTO Especies(idEspecie) VALUES (@idEspecie)

END
GO
/****** Object:  StoredProcedure [dbo].[AgregarTipoAnimal]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarTipoAnimal]
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO TiposAnimal(denominacion) VALUES (@denominacion)

END
GO
/****** Object:  StoredProcedure [dbo].[DAME_LISTA_ESPECIES_POR_ID]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DAME_LISTA_ESPECIES_POR_ID]
	
	AS
BEGIN
	SELECT idEspecie FROM Especies
END
GO
/****** Object:  StoredProcedure [dbo].[GET_CLASIFICACION]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_CLASIFICACION]
AS
BEGIN
SELECT idClasificacion, denominacion FROM Clasificaciones
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ESPECIE]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ESPECIE]
AS
BEGIN
SELECT * FROM Especies
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ESPECIE_CLASIFICACION]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ESPECIE_CLASIFICACION]
	@tiposAnimal bigint,
	@clasificacion int,
	@especie bigint
AS
BEGIN
	SELECT 
		  Clasificaciones.denominacion as denominacionClasificaciones
		, TiposAnimal.denominacion as denominacionTiposAnimal
		, Especies.idClasificacion
		, Especies.idTipoAnimal
		, Especies.idEspecie, Especies.idClasificacion, Especies.idTipoAnimal, Especies.nombre
		, Especies.nPatas, Especies.esMascota
	FROM Clasificaciones
		INNER JOIN Especies on Clasificaciones.idClasificacion = Especies.idClasificacion
		INNER JOIN TiposAnimal on Especies.idTipoAnimal = TiposAnimal.idTipoAnimal
	WHERE  Especies.idTipoAnimal = @tiposAnimal AND
		   Especies.idClasificacion = @clasificacion AND
		   Especies.idEspecie = @especie
 
	ORDER BY Clasificaciones.denominacion

END
GO
/****** Object:  StoredProcedure [dbo].[GET_ESPECIE_TIPO_ANIMAL]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ESPECIE_TIPO_ANIMAL]
	@tiposAnimal bigint,
	@clasificacion bigint,
	@especie bigint
	AS
	BEGIN
	SELECT 
		  TiposAnimal.idTipoAnimal as idTiposAnimal
		, TiposAnimal.denominacion as denominacionTiposAnimal
		, Especies.idClasificacion
		, Especies.idTipoAnimal
		, Especies.idEspecie, Especies.idClasificacion, Especies.idTipoAnimal, Especies.nombre
		, Especies.nPatas, Especies.esMascota
	FROM TiposAnimal
		INNER JOIN Especies on TiposAnimal.idTipoAnimal = Especies.idTipoAnimal
		INNER JOIN Clasificaciones on Especies.idTipoAnimal = TiposAnimal.idTipoAnimal
	WHERE  Especies.idTipoAnimal = @tiposAnimal AND
		   Especies.idClasificacion = @clasificacion AND
		   Especies.idEspecie = @especie
 
	ORDER BY Clasificaciones.denominacion

END
GO
/****** Object:  StoredProcedure [dbo].[GET_TIPO_ANIMAL]    Script Date: 30/06/2017 17:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TIPO_ANIMAL]
AS
BEGIN
SELECT IdTipoAnimal, denominacion
FROM TiposAnimal
END
GO
