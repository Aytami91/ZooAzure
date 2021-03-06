USE [Modulo3AHB]
GO
/****** Object:  Table [dbo].[Coches]    Script Date: 06/07/2017 17:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[matricula] [nvarchar](10) NOT NULL,
	[idMarca] [bigint] NOT NULL,
	[idTipoCombustible] [bigint] NOT NULL,
	[color] [nvarchar](20) NULL,
	[cilindrada] [decimal](4, 2) NULL,
	[nPlazas] [smallint] NOT NULL,
	[fechaMatriculacion] [date] NULL,
 CONSTRAINT [PK_Coches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TiposCombustible]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCombustible](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCombustible] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nif] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellidos] [nvarchar](75) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](16) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[Coches] ON 

INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTipoCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (2, N'TF-1001-BG', 1, 1, N'negro', CAST(11.00 AS Decimal(4, 2)), 4, CAST(N'1996-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Coches] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (1, N'Seat')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (2, N'Toyota')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (3, N'Ferrari')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (4, N'Mercedez-Benz')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (5, N'Volvo')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (6, N'Citroen')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[TiposCombustible] ON 

INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (1, N'Gasolina')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (2, N'Diesel')
SET IDENTITY_INSERT [dbo].[TiposCombustible] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (2, N'22222A', N'manolo', N'delbombo', N'manolo@manolo.com', N'123456', CAST(N'1982-05-15' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (3, N'33333A', N'fulano', N'detal', N'fulano@fulano.com', N'123456', CAST(N'1975-01-09' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (4, N'44444A', N'mengano', N'decual', N'mengano@mengano.com', N'123456', CAST(N'1996-09-17' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (5, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (6, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (7, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (8, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (9, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (10, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
INSERT [dbo].[Usuarios] ([idUsuario], [nif], [nombre], [apellidos], [email], [password], [fechaNacimiento]) VALUES (11, N'1111A', N'Pepe', N'Pepillo', N'test@test.com', N'123456', CAST(N'1991-10-03' AS Date))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Coches] ADD  DEFAULT ((5)) FOR [nPlazas]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMarca]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarMarca]

    @id BIGINT 
    ,@denominacion NVARCHAR(50)
AS
BEGIN
    UPDATE Marcas SET

        denominacion = @denominacion

    WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarMarca]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarMarca]
    @denominacion nvarchar(50)
AS
BEGIN
    INSERT INTO Marcas (denominacion) VALUES (@denominacion)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarTipoCombustible]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AgregarTipoCombustible]
    @denominacion nvarchar(50)
AS
BEGIN
    INSERT INTO TiposCombustible (denominacion) VALUES (@denominacion)
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMarca]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarMarca]
    @id bigint
AS
BEGIN
    DELETE FROM Marcas WHERE id = @id 
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarTipoCombustible]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarTipoCombustible]
    @id bigint
AS
BEGIN
    DELETE FROM TiposCombustible WHERE id = @id 
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
    @idUsuario int
AS
BEGIN
    DELETE FROM Usuarios WHERE idUsuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[GetCoches]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCoches]
AS
BEGIN

    SELECT 
        TC.denominacion as Combustible
        ,M.denominacion as Marca
        ,C.id
        ,C.matricula
        ,C.color
        ,C.nPlazas
        ,C.cilindrada
        ,C.fechaMatriculacion
    FROM Coches C
        inner join Marcas M on C.idMarca = M.id
        inner join TiposCombustible TC on C.idTipoCombustible = TC.id
	END
GO
/****** Object:  StoredProcedure [dbo].[GetMarca]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMarca]
AS
BEGIN
SELECT id, denominacion FROM Marcas
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarcasPorId]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMarcasPorId]
    @id bigint
AS
BEGIN
    SELECT id, denominacion FROM Marcas WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetTiposCombustible]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTiposCombustible]
AS
BEGIN
SELECT id, denominacion FROM TiposCombustible
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarios]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsuarios]
AS
BEGIN
SELECT * FROM Usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 06/07/2017 17:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]
	@email nvarchar(255),
	@password nvarchar(16)
AS
BEGIN
SELECT * FROM Usuarios
WHERE email = @email and password = @password
END
GO
