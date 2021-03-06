USE [master]
GO
/****** Object:  Database [newcon]    Script Date: 12/12/2021 15:30:23 ******/
CREATE DATABASE [newcon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'newcon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\newcon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'newcon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\newcon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [newcon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [newcon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [newcon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [newcon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [newcon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [newcon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [newcon] SET ARITHABORT OFF 
GO
ALTER DATABASE [newcon] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [newcon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [newcon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [newcon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [newcon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [newcon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [newcon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [newcon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [newcon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [newcon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [newcon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [newcon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [newcon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [newcon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [newcon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [newcon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [newcon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [newcon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [newcon] SET  MULTI_USER 
GO
ALTER DATABASE [newcon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [newcon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [newcon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [newcon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [newcon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [newcon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [newcon] SET QUERY_STORE = OFF
GO
USE [newcon]
GO
/****** Object:  Table [dbo].[tb_cidade]    Script Date: 12/12/2021 15:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cidade](
	[cod_cidade] [int] IDENTITY(1,1) NOT NULL,
	[nome_cidade] [varchar](30) NOT NULL,
	[estado_cidade] [varchar](30) NOT NULL,
	[cep_ini] [varchar](20) NOT NULL,
	[cep_final] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 12/12/2021 15:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[cod_cli] [int] IDENTITY(1,1) NOT NULL,
	[cpf_cli] [varchar](15) NOT NULL,
	[nome_cli] [varchar](50) NOT NULL,
	[tel_cli] [varchar](15) NOT NULL,
	[end_cli] [varchar](30) NOT NULL,
	[bairro_cli] [varchar](30) NULL,
	[comp_cli] [varchar](30) NULL,
	[email_cli] [varchar](30) NULL,
	[cod_cid_cli] [int] NULL,
	[cep_cli] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[cidade_relat]    Script Date: 12/12/2021 15:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cidade_relat](
 @ini    int,
 @final  int)
 as
select  cod_cli, nome_cli, nome_cidade,estado_cidade from tb_cidade inner join tb_cliente
on cod_cid_cli = cod_cidade
where cod_cidade between @ini and @final
order by nome_cidade asc
GO
/****** Object:  StoredProcedure [dbo].[cli_relat]    Script Date: 12/12/2021 15:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cli_relat](
 @ini    int,
 @final  int)
 as
select  cod_cli, nome_cli, nome_cidade,estado_cidade from tb_cidade inner join tb_cliente
on cod_cid_cli = cod_cidade
where cod_cli between @ini and @final
order by nome_cli
GO
/****** Object:  StoredProcedure [dbo].[estado_relat]    Script Date: 12/12/2021 15:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[estado_relat](
 @ini  VARCHAR(30))
 as
select cod_cli, nome_cli, nome_cidade,estado_cidade  from tb_cidade inner join tb_cliente
on cod_cid_cli = cod_cidade
where estado_cidade = @ini
order by estado_cidade
GO
USE [master]
GO
ALTER DATABASE [newcon] SET  READ_WRITE 
GO
