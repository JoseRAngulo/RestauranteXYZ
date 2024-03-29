USE [master]
GO
/****** Object:  Database [RestauranteXYZ]    Script Date: 02-Aug-17 3:59:17 AM ******/
CREATE DATABASE [RestauranteXYZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestauranteXYZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\RestauranteXYZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestauranteXYZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\RestauranteXYZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RestauranteXYZ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestauranteXYZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestauranteXYZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestauranteXYZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestauranteXYZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestauranteXYZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestauranteXYZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestauranteXYZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestauranteXYZ] SET  MULTI_USER 
GO
ALTER DATABASE [RestauranteXYZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestauranteXYZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestauranteXYZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestauranteXYZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestauranteXYZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestauranteXYZ] SET QUERY_STORE = OFF
GO
USE [RestauranteXYZ]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RestauranteXYZ]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Telefono] [varchar](9) NOT NULL,
	[Correo] [nvarchar](30) NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[IdSexo] [int] NOT NULL,
	[IdTipoEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[NombreCliente] [nvarchar](20) NULL,
	[RTN] [nvarchar](14) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](35) NOT NULL,
	[Precio] [money] NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [Pk_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Factura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_Factura]
AS
Select f.IdFactura, convert(date, f.Fecha) as 'Fecha', e.IdEmpleado ,e.Nombre + ' ' + e.Apellido as 'Mesero', p.Nombre as 'Nombre Producto', p.Precio, d.Cantidad, p.Precio * d.Cantidad as 'Total' 
From Factura f inner join DetalleFactura d on f.IdFactura = d.IdFactura
			   inner join Producto p on p.IdProducto = d.IdProducto
			   inner join Empleado e on f.IdEmpleado = e.IdEmpleado
GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[IdAuditLog] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](300) NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAuditLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[IdMesa] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Capacidad] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[IdSexo] [int] IDENTITY(1,1) NOT NULL,
	[Sexo] [nvarchar](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[IdTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[TipoEmpleado] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[IdTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[TipoProducto] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](20) NOT NULL,
	[Contrasena] [nvarchar](100) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleFactura] ADD  DEFAULT ((1)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[Mesa] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[Mesa] ADD  DEFAULT (NULL) FOR [IdEmpleado]
GO
ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD  CONSTRAINT [Fk_AuditLog_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[AuditLog] CHECK CONSTRAINT [Fk_AuditLog_Usuario]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [Fk_DetalleFactura_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [Fk_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [Fk_DetalleFactura_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [Fk_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Fk_Empleado_Sexo] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[Sexo] ([IdSexo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Fk_Empleado_Sexo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Fk_Empleado_TipoEmpleado] FOREIGN KEY([IdTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([IdTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Fk_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [Fk_Factura_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [Fk_Factura_Empleado]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [Fk_Mesa_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [Fk_Mesa_Empleado]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_Producto_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([IdTipoProducto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Fk_Usuario_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Fk_Usuario_Empleado]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarMesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_ActualizarMesa]
	@IdMesa int,
	@Estado bit,
	@Capacidad int, 
	@IdEmpleado int
AS
BEGIN
	Set nocount off
	UPDATE Mesa
	Set Estado = @Estado,
		Capacidad = @Capacidad,
		IdEmpleado = @IdEmpleado
	Where IdMesa = @IdMesa
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_BuscarEmpleadoId]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_BuscarEmpleadoId]
    @IdEmpleado int
As
    Begin
        Set nocount on
        Select e.IdEmpleado, e.Nombre, e.Apellido, e.Telefono, e.Correo, e.Direccion, s.Sexo, t.TipoEmpleado
        From Empleado e inner join TipoEmpleado t
            on e.IdTipoEmpleado= T.IdTipoEmpleado
            inner join Sexo s
            on e.IdSexo = s.IdSexo
        Where e.IdEmpleado = @IdEmpleado
    End
GO
/****** Object:  StoredProcedure [dbo].[Sp_EliminarDFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_EliminarDFactura]
@IdFactura int 

	As 
	Begin 
	Set nocount off
	Delete 
	From DetalleFactura
	Where IdFactura=@IdFactura
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_EliminarEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_EliminarEmpleado]
    @IdEmpleado int
As
Begin
    Set nocount off
    Delete 
    From Empleado
    Where IdEmpleado = @IdEmpleado
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_EliminarFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_EliminarFactura]
@IdFactura int 

	As 
	Begin 
	Set nocount off
	exec Sp_EliminarDFactura @IdFactura
	Delete 
	From Factura
	Where IdFactura=@IdFactura
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_EliminarMesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_EliminarMesa]
	@IdMesa int
AS
BEGIN
	Set nocount off
	Delete
	From Mesa
	Where IdMesa = @IdMesa
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EliminarProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_EliminarProducto]
@IdProducto int 

	As 
	Begin 
	Set nocount off
	Delete 
	From Producto
	Where IdProducto=@IdProducto
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_EstadoMesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_EstadoMesa]
@IdMesa int

AS
BEGIN
	SET NOCOUNT OFF
	Select Estado
	From Mesa
	Where IdMesa = @IdMesa
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarDFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_InsertarDFactura]
@IdFactura int,
@IdProducto int,
@Cantidad int

As
	Begin
	Set nocount off
	Insert into DetalleFactura
	Values (@IdFactura,@IdProducto,@Cantidad)
	End
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento almacenado para insertar
Create Procedure [dbo].[Sp_InsertarEmpleado]
    @Nombre nvarchar(20),
    @Apellido nvarchar(20),
    @Telefono varchar(9),
    @Correo nvarchar(30),
    @Direccion nvarchar(200),
    @IdSexo int,
    @IdTipoEmpleado int
As
Begin
    Set nocount off
    Insert into Empleado
    values (@Nombre, @Apellido, @Telefono, @Correo, @Direccion, @IdSexo, @IdTipoEmpleado)
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_InsertarFactura]
@IdEmpleado int,
@Fecha datetime

As 
	Begin
	Set nocount off
	Insert into Factura
	Values(@IdEmpleado,'','',@Fecha)
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarMesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_InsertarMesa]
	@Estado bit,
	@Capacidad int,
	@IdEmpleado int
AS
BEGIN
	Set nocount off
	Insert into Mesa
	values (@Estado, @Capacidad, @IdEmpleado)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_InsertarProducto]
  @Nombre nvarchar(35), 
  @Precio money , 
  @IdTipoProducto int	
	 AS BEGIN 
		Set nocount off
			Insert into Producto
     Values(@Nombre,@Precio,@IdTipoProducto)
	  END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListarSexo]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_ListarSexo]
AS
BEGIN
	Set nocount on
	Select * 
	From Sexo
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListarTipoEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Sp_ListarTipoEmpleado]
AS
BEGIN
	SELECT *
	From TipoEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MaxFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MaxFactura]
as
BEGIN
	SELECT max(IdFactura)
	FROM Factura
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModEstadoMesa]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ModEstadoMesa]
@IdMesa int,
@Estado bit

AS
BEGIN
	SET NOCOUNT OFF
	Update Mesa
	Set Estado = @Estado
	Where IdMesa = @IdMesa
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarDFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_ModificarDFactura]
@IdFactura int,
@IdProducto int,
@Cantidad int

As 
	Begin 
	Set nocount off
	Update DetalleFactura
		Set IdFactura=@IdFactura,
			IdProducto=@IdProducto,
			Cantidad=@Cantidad
	Where IdFactura=@IdFactura
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_ModificarEmpleado] 
    @IdEmpleado int, 
    @Nombre nvarchar(20),
    @Apellido nvarchar(20),
    @Telefono varchar(9),
    @Correo nvarchar(30),
    @Direccion nvarchar(200),
    @IdSexo int,
    @IdTipoEmpleado int
As
Begin
    Set nocount off
    Update Empleado
    Set Nombre = @Nombre,
        Apellido = @Apellido,
        Telefono = @Telefono,
        Correo = @Correo,
        Direccion = @Direccion,
        IdSexo = @IdSexo, 
        IdTipoEmpleado = @IdTipoEmpleado
    Where IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_ModificarFactura]
@IdFactura int,
@NombreCliente nvarchar(20),
@RTN nvarchar(14)


As 
Begin
	Set nocount off
	Update Factura
	Set NombreCliente = @NombreCliente, RTN = @RTN
	WHERE IdFactura = @IdFactura
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_ModificarProducto]
@IdProducto int,
@Nombre nvarchar(35),
@Precio money ,
@IdTipoProducto int 

	As
	Begin 
		Set nocount off
		Update Producto
		Set Nombre=@Nombre,
			Precio=@Precio,
			IdTipoProducto=@IdTipoProducto
		Where IdProducto=@IdProducto
	End
GO
/****** Object:  StoredProcedure [dbo].[Sp_MostrarDFactura]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_MostrarDFactura]
As BEGIN
	  Set nocount on  
	  Select a.IdFactura,p.Nombre,p.Precio,a.Cantidad
	  	   From DetalleFactura a inner Join Producto p  
	           on a.IdProducto = p.IdProducto 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MostrarDFacturaId]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_MostrarDFacturaId]
@IdFactura INT
As BEGIN
	  Set nocount on  
	  Select p.Nombre,p.Precio,a.Cantidad, a.Cantidad * p.Precio as 'Total'
	  	   From DetalleFactura a inner Join Producto p  
	           on a.IdProducto = p.IdProducto 
			   Where a.IdFactura = @IdFactura
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MostrarEmpleados]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_MostrarEmpleados]
As
Begin
    Set nocount on
    Select e.IdEmpleado, e.Nombre, e.Apellido, e.Telefono, e.Correo, e.Direccion, s.Sexo, t.TipoEmpleado
    From Empleado e inner join TipoEmpleado t
        on e.IdTipoEmpleado= T.IdTipoEmpleado
        inner join Sexo s
        on e.IdSexo = s.IdSexo
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_MostrarProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_MostrarProducto]
	As BEGIN
	  Set nocount on  
	  Select a.IdProducto, a.Nombre,a.Precio,p.IdTipoProducto
	   From Producto a inner Join TipoProducto p   
	           on a.IdTipoProducto = p.IdTipoProducto 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_NombreProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_NombreProducto]
@IdProducto int
AS
Begin
	Select Nombre
	from Producto
	WHERE IdProducto = @IdProducto
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_NombreUsuarioEmpleadoId]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_NombreUsuarioEmpleadoId]
@Usuario NVARCHAR(20)
as
Begin
	Select e.IdEmpleado
	FROM Empleado e INNER JOIN Usuario u on e.IdEmpleado = u.IdEmpleado
	WHERE u.Usuario = @Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_PrecioProducto]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_PrecioProducto]
@IdProducto int
AS
Begin
	Select Precio
	from Producto
	WHERE IdProducto = @IdProducto
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_UsuarioNombreEmpleado]    Script Date: 02-Aug-17 3:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_UsuarioNombreEmpleado]
@idUsuario INT
as
BEGIN
	SELECT e.Nombre + ' ' + e.Apellido as 'Nombre'
	From Usuario u inner JOIN Empleado e on u.IdEmpleado = e.IdEmpleado
	WHERE u.IdEmpleado = @idUsuario
END
GO
USE [master]
GO
ALTER DATABASE [RestauranteXYZ] SET  READ_WRITE 
GO
