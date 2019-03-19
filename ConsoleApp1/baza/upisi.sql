USE [master]
GO
/****** Object:  Database [upisi]    Script Date: 19.3.2019. 18:13:41 ******/
CREATE DATABASE [upisi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'upisi', FILENAME = N'C:\Users\pmrvic\Code\AlgebraCSharp2019\ConsoleApp1\baza\upisi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'upisi_log', FILENAME = N'C:\Users\pmrvic\Code\AlgebraCSharp2019\ConsoleApp1\baza\upisi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [upisi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [upisi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [upisi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [upisi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [upisi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [upisi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [upisi] SET ARITHABORT OFF 
GO
ALTER DATABASE [upisi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [upisi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [upisi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [upisi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [upisi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [upisi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [upisi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [upisi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [upisi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [upisi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [upisi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [upisi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [upisi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [upisi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [upisi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [upisi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [upisi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [upisi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [upisi] SET  MULTI_USER 
GO
ALTER DATABASE [upisi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [upisi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [upisi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [upisi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [upisi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [upisi] SET QUERY_STORE = OFF
GO
USE [upisi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [upisi]
GO
/****** Object:  Table [dbo].[polaznici]    Script Date: 19.3.2019. 18:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[polaznici](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[ime] [nchar](50) NOT NULL,
	[prezime] [varchar](50) NOT NULL,
	[mjesto_stanovanja] [nchar](25) NULL,
	[broj_telefona] [nchar](10) NULL,
 CONSTRAINT [PK_polaznici] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tecajevi]    Script Date: 19.3.2019. 18:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tecajevi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](50) NOT NULL,
	[cijena] [money] NULL,
 CONSTRAINT [PK_tecajevi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[upisi]    Script Date: 19.3.2019. 18:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[upisi](
	[tecajevi_id] [int] NOT NULL,
	[polaznici_id] [int] NOT NULL,
 CONSTRAINT [PK_upisi] PRIMARY KEY CLUSTERED 
(
	[tecajevi_id] ASC,
	[polaznici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[polaznici] ON 

INSERT [dbo].[polaznici] ([id], [ime], [prezime], [mjesto_stanovanja], [broj_telefona]) VALUES (1, N'Lidija                                            ', N'Lidic', N'Višnjevac                ', NULL)
INSERT [dbo].[polaznici] ([id], [ime], [prezime], [mjesto_stanovanja], [broj_telefona]) VALUES (2, N'Lidija                                            ', N'Lidic', N'Višnjevac                ', NULL)
INSERT [dbo].[polaznici] ([id], [ime], [prezime], [mjesto_stanovanja], [broj_telefona]) VALUES (3, N'Juliška                                           ', N'Engdrehazy', N'Mohach                   ', NULL)
INSERT [dbo].[polaznici] ([id], [ime], [prezime], [mjesto_stanovanja], [broj_telefona]) VALUES (4, N'Fata                                              ', N'Izbosne', N'Doboj                    ', NULL)
SET IDENTITY_INSERT [dbo].[polaznici] OFF
SET IDENTITY_INSERT [dbo].[tecajevi] ON 

INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (1, N'osnove rada', 1233.0000)
INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (2, N'Microsoft word', 2323.0000)
INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (3, N'SQl osnove', 4342.0000)
INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (4, N'Racunalni oper.', 2122.0000)
INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (5, N'Speci.', 3223.0000)
INSERT [dbo].[tecajevi] ([id], [naziv], [cijena]) VALUES (6, N'Graf.', 1233.0000)
SET IDENTITY_INSERT [dbo].[tecajevi] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_polaznici]    Script Date: 19.3.2019. 18:13:42 ******/
CREATE NONCLUSTERED INDEX [IX_polaznici] ON [dbo].[polaznici]
(
	[prezime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[upisi]  WITH CHECK ADD  CONSTRAINT [FK__upisi__polaznici__5070F446] FOREIGN KEY([polaznici_id])
REFERENCES [dbo].[polaznici] ([id])
GO
ALTER TABLE [dbo].[upisi] CHECK CONSTRAINT [FK__upisi__polaznici__5070F446]
GO
ALTER TABLE [dbo].[upisi]  WITH CHECK ADD  CONSTRAINT [FK_upisi_tecajevi] FOREIGN KEY([tecajevi_id])
REFERENCES [dbo].[tecajevi] ([id])
GO
ALTER TABLE [dbo].[upisi] CHECK CONSTRAINT [FK_upisi_tecajevi]
GO
ALTER TABLE [dbo].[polaznici]  WITH CHECK ADD  CONSTRAINT [chk_sifra] CHECK  (([id]>=(1) AND [id]<=(1000)))
GO
ALTER TABLE [dbo].[polaznici] CHECK CONSTRAINT [chk_sifra]
GO
USE [master]
GO
ALTER DATABASE [upisi] SET  READ_WRITE 
GO
