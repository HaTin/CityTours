USE [master]
GO
/****** Object:  Database [touristDB]    Script Date: 8/8/2018 3:19:07 AM ******/
CREATE DATABASE [touristDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'touristDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\touristDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'touristDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\touristDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [touristDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [touristDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [touristDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [touristDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [touristDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [touristDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [touristDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [touristDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [touristDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [touristDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [touristDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [touristDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [touristDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [touristDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [touristDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [touristDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [touristDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [touristDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [touristDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [touristDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [touristDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [touristDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [touristDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [touristDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [touristDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [touristDB] SET  MULTI_USER 
GO
ALTER DATABASE [touristDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [touristDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [touristDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [touristDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [touristDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [touristDB] SET QUERY_STORE = OFF
GO
USE [touristDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [touristDB]
GO
/****** Object:  Table [dbo].[account]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](30) NULL,
	[password] [nvarchar](255) NULL,
	[firstName] [nvarchar](40) NULL,
	[lastName] [nvarchar](40) NULL,
	[phone] [nvarchar](20) NULL,
	[role] [nvarchar](30) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[main] [int] NULL,
	[src] [varchar](150) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[tour_cre_id] [int] NULL,
	[adult_quantity] [int] NULL,
	[child_quantity] [int] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[total_price] [float] NULL,
	[creation_date] [date] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_category]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_category](
	[catId] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[catId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_cre]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_cre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tourId] [int] NULL,
	[childPrice] [float] NULL,
	[price] [float] NULL,
	[startDate] [datetime] NULL,
	[remainQuantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_description]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_description](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dayDesc] [nvarchar](max) NULL,
	[tourInfoId] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_location]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_location](
	[locId] [int] IDENTITY(1,1) NOT NULL,
	[locName] [nvarchar](50) NULL,
	[catId] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[locId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourInfo]    Script Date: 8/8/2018 3:19:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tourInfo](
	[tourId] [int] IDENTITY(1,1) NOT NULL,
	[tourName] [nvarchar](100) NULL,
	[category] [int] NULL,
	[originId] [int] NULL,
	[destinationId] [int] NULL,
	[duration] [int] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[tourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (1, N'admin@gmail.com', N'123456', N'Ha Trong', N'Tyn', N'01664437256', N'admin', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (2, N'katosan@fpt.edu.vn', N'123456789', N'jason', N'madela', N'0914934574', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (3, N'tungbeo@gmail.com.vn', N'tindeptrai12', N'minh', N'tu', N'0914907689', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (4, N'jonathanking@gmail.com', N'tindeptrai', N'Jonathan', N'King', N'123456789', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (6, N'myha@gmail.com', N'12345678', N'ha', N'my', N'01645875122', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (8, N'tramnguyen@gmail.com', N'tindeptrai12', N'van', N'thinh', N'091490769', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (9, N'nguyenthitet@gmail.com', N'123456789', N'tin', N'ha', N'0914907522', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (10, N'vuhuynh@gmail.com', N'123456789', N'vu', N'huynh', N'09149121542', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (25, N'tynytin091@gmail.com', N'tindeptrai', N'tran', N'tu', N'0914947629', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (26, N'tyntin091@gmail.com', N'tindeptrai12', N'sktta', N'faker', N'0914088655', N'user', 0)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (27, N'trannguyen@gmail.com', N'tindeptrai', N'tran', N'nguyen', N'0914907645', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (28, N'taixe@gmail.com', N'1234567', N'nguyen ', N'thi', N'091408862', N'user', 0)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (29, N'trinhsang@gmail.com', N'123478412', N'trinh', N'suong', N'091497512', N'user', 1)
INSERT [dbo].[account] ([id], [email], [password], [firstName], [lastName], [phone], [role], [status]) VALUES (30, N'kingbdd@gmail.com', N'tindeptrai', N'mih', N'thuy', N'0914088652', N'user', 1)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[images] ON 

INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (1, 1, 1, N'img/product/50.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (2, 2, 1, N'img/product/2.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (7, 3, 1, N'img/product/3.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (8, 4, 1, N'img/product/4.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (9, 5, 1, N'img/product/5.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (10, 6, 1, N'img/product/6.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (11, 6, 0, N'img/product/7.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (12, 6, 0, N'img/product/8.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (13, 6, 0, N'img/product/9.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (14, 1, 0, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (15, 1, 0, N'img/product/27.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (16, 1, 0, N'img/product/25.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (17, 1, 0, N'img/product/3.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (18, 2, 0, N'img/product/13.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (19, 2, 0, N'img/product/14.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (20, 2, 0, N'img/product/15.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (21, 2, 0, N'img/product/16.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (22, 2, 0, N'img/product/17.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (23, 3, 0, N'img/product/18.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (24, 3, 0, N'img/product/19.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (25, 3, 0, N'img/product/20.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (26, 3, 0, N'img/product/21.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (27, 4, 0, N'img/product/22.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (28, 4, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (29, 4, 0, N'img/product/24.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (30, 5, 0, N'img/product/15.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (31, 5, 0, N'img/product/20.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (32, 5, 0, N'img/product/25.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (33, 6, 0, N'img/product/28.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (34, 6, 0, N'img/product/29.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (137, 27, 1, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (138, 27, 0, N'img/product/29.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (139, 27, 0, N'img/product/3.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (140, 27, 0, N'img/product/6.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (141, 27, 0, N'img/product/7.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (143, 27, 0, N'img/product/9.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (144, 28, 1, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (145, 28, 0, N'img/product/1.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (146, 28, 0, N'img/product/10.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (147, 29, 1, N'img/product/29.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (148, 29, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (149, 29, 0, N'img/product/24.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (150, 29, 0, N'img/product/25.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (151, 29, 0, N'img/product/26.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (152, 29, 0, N'img/product/27.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (153, 30, 1, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (154, 30, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (155, 30, 0, N'img/product/25.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (156, 30, 0, N'img/product/26.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (157, 30, 0, N'img/product/27.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (158, 31, 1, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (159, 31, 0, N'img/product/1.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (160, 31, 0, N'img/product/16.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (161, 31, 0, N'img/product/17.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (162, 31, 0, N'img/product/22.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (163, 31, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (164, 1, 0, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (165, 3, 0, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (166, 4, 0, N'img/product/15.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (167, 4, 0, N'img/product/16.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (168, 5, 0, N'img/product/17.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (169, 5, 0, N'img/product/18.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (170, 28, 0, N'img/product/16.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (171, 28, 0, N'img/product/20.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (172, 28, 0, N'img/product/21.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (173, 32, 1, N'img/product/11.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (174, 32, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (175, 32, 0, N'img/product/24.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (176, 32, 0, N'img/product/25.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (177, 32, 0, N'img/product/29.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (178, 32, 0, N'img/product/32.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (179, 4, 0, N'img/product/13.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (180, 32, 0, N'img/product/18.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (181, 1, 0, N'img/product/3.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (182, 1, 0, N'img/product/12.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (184, 1, 0, N'img/product/19.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (185, 33, 1, N'img/product/12.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (186, 33, 0, N'img/product/17.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (187, 33, 0, N'img/product/18.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (188, 33, 0, N'img/product/2.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (189, 6, 0, N'img/product/20.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (190, 6, 0, N'img/product/28.jpg', 0)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (191, 34, 1, N'img/product/17.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (192, 34, 0, N'img/product/22.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (193, 34, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (194, 34, 0, N'img/product/24.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (195, 34, 0, N'img/product/25.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (196, 34, 0, N'img/product/27.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (197, 35, 1, N'img/product/10.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (198, 35, 0, N'img/product/23.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (199, 36, 1, N'img/product/16.jpg', 1)
INSERT [dbo].[images] ([id], [tour_id], [main], [src], [status]) VALUES (200, 36, 0, N'img/product/23.jpg', 1)
SET IDENTITY_INSERT [dbo].[images] OFF
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (1, 1, 5, 2, 1, 1000, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (2, 1, 9, 3, 2, 1600, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (3, 2, 9, 2, 0, 800, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (4, 2, 12, 2, 0, 1000, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (5, 3, 12, 2, 0, 1000, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (6, 4, 9, 2, 1, 1000, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (7, 5, 23, 8, 5, 1325, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (8, 6, 27, 2, 1, 750, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (9, 6, 13, 3, 1, 1400, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (10, 9, 5, 2, 1, 1000, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (11, 10, 22, 2, 1, 380, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (12, 10, 11, 1, 0, 520, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (13, 11, 32, 1, 2, 700, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (14, 12, 6, 2, 1, 600, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (15, 12, 26, 2, 1, 600, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [tour_cre_id], [adult_quantity], [child_quantity], [total], [status]) VALUES (16, 13, 26, 1, 1, 350, 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (1, 3, 2600, CAST(N'2018-03-10' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (2, 3, 1800, CAST(N'2018-03-10' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (3, 27, 1000, CAST(N'2018-03-10' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (4, 3, 1000, CAST(N'2018-03-15' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (5, 3, 1325, CAST(N'2018-03-16' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (6, 1, 2150, CAST(N'2018-03-17' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (9, 3, 1000, CAST(N'2018-03-18' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (10, 3, 900, CAST(N'2018-03-18' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (11, 1, 700, CAST(N'2018-03-18' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (12, 27, 1200, CAST(N'2018-03-18' AS Date), 1)
INSERT [dbo].[Orders] ([id], [userId], [total_price], [creation_date], [status]) VALUES (13, 3, 350, CAST(N'2018-03-27' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[tour_category] ON 

INSERT [dbo].[tour_category] ([catId], [catName], [status]) VALUES (1, N'Domestic travel', 1)
INSERT [dbo].[tour_category] ([catId], [catName], [status]) VALUES (2, N'International travel', 1)
SET IDENTITY_INSERT [dbo].[tour_category] OFF
SET IDENTITY_INSERT [dbo].[tour_cre] ON 

INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (1, 1, 200, 400, CAST(N'2018-03-08T06:30:00.000' AS DateTime), 6, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (2, 3, 100, 200, CAST(N'2018-03-28T07:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (3, 3, 100, 200, CAST(N'2018-03-25T07:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (4, 4, 200, 400, CAST(N'2018-03-25T06:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (5, 4, 200, 400, CAST(N'2018-03-26T06:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (6, 5, 120, 240, CAST(N'2018-05-02T07:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (7, 6, 100, 200, CAST(N'2018-03-20T07:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (8, 1, 210, 420, CAST(N'2018-04-02T07:30:00.000' AS DateTime), 0, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (9, 1, 200, 400, CAST(N'2018-05-02T08:30:00.000' AS DateTime), 2, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (10, 2, 300, 500, CAST(N'2018-03-02T10:30:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (11, 2, 310, 520, CAST(N'2018-04-02T04:30:00.000' AS DateTime), 0, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (12, 2, 300, 500, CAST(N'2018-05-02T08:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (13, 1, 200, 400, CAST(N'2018-05-02T08:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (21, 4, 100, 200, CAST(N'2018-03-29T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (22, 1, 70, 155, CAST(N'2018-03-21T02:00:00.000' AS DateTime), 12, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (23, 1, 17, 155, CAST(N'2018-03-16T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (24, 6, 100, 155, CAST(N'2018-03-16T03:15:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (25, 1, 100, 145, CAST(N'2018-03-30T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (26, 1, 100, 250, CAST(N'2018-03-29T05:30:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (27, 6, 150, 300, CAST(N'2018-03-29T04:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (28, 27, 200, 400, CAST(N'2018-03-19T07:00:00.000' AS DateTime), 10, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (29, 32, 150, 300, CAST(N'2018-03-27T08:00:00.000' AS DateTime), 20, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (30, 32, 150, 350, CAST(N'2018-03-22T04:00:00.000' AS DateTime), 19, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (31, 32, 100, 200, CAST(N'2018-03-20T05:00:00.000' AS DateTime), 20, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (32, 33, 200, 400, CAST(N'2018-03-20T00:00:00.000' AS DateTime), 16, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (33, 34, 130, 235, CAST(N'2018-03-30T00:00:00.000' AS DateTime), 20, 0)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (34, 1, 20, 200, CAST(N'2018-09-05T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (35, 2, 12, 20, CAST(N'2018-08-23T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[tour_cre] ([id], [tourId], [childPrice], [price], [startDate], [remainQuantity], [status]) VALUES (36, 1, 12, 200, CAST(N'2018-08-08T00:00:00.000' AS DateTime), 15, 1)
SET IDENTITY_INSERT [dbo].[tour_cre] OFF
SET IDENTITY_INSERT [dbo].[tour_description] ON 

INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (1, N'Gather at Tan Son Nhat Airport, column 04 at the Domestic Terminal so that tour guide makes the procedures for you to catch a flight to Hanoi. Vietravel coach shall pick you up at Noi Bai Airport, then depart to Yen Bai. Along the way, stop in Phu Tho to visit the Hung Temple', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (2, N'Check out, depart to Mu Cang Chai, across Tu Le, you will smell the faintly fragrance of "new rice" along the wind from the roof chimney; this place is famous for sweet rice and grean rice. To the Khau Pha Pass, you shall stop to take photos and watch the beautiful Lim Mong Village located at the foot of the pass. This is a H''Mong village and a home to the most beautiful rice field in Mu Cang Chai. Across the Khau Pha Pass to the territory of Mu Cang Chai', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (3, N'Visit the Silver Falls, O Quy Ho Pass - the boundary between the two provinces of Lao Cai and Lai Chau winding around Hoang Lien Range, also known as the Heaven Gate. Here, you can admire the panoramic picture of extremely majestic and impressive northwestern mountains from above. Take a coach to visit and conquer the majestic Fansipan mountain
', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (4, N'Check out, then depart to Dien Bien, and admire the northwest mountains and forests along the Nam Na River and wetlands formed by water rising of Son La hydroelectric plant at the confluence of: Da River, Nam Na River and Nam Rom River. On arrival at Muong Lay, eat lunch
', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (5, N'Check out, and then depart to Son LA. Along the way, you will admire the majestic scenery of Northwest mountain from the peak of Pha Din Pass - One of the "big four pass" of Northwest region and ranked in most impressive group of 6 passes in Vietnam. Upon arrival in Son La, have lunch. Then, depart to Moc Chau. Next, visit Dai Yem Waterfall - also called Nang Waterfall
', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (6, N'Have breakfast at hotel and check out. You visit Happy Land Moc Chau. Depart to Hoa Binh and enjoy lunch. Then, return to Hanoi, you shall take a coach to Noi Bai airport for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport', 1, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (7, N'You are present at the Tan Son Nhat Airport, Column 4, Domestic Terminal. The tour guide shall make the procedures for you to catch a flight to Hanoi. Upon arrival at the Noi Bai airport, Vietravel''s coach shall pick up and take you to Ha Giang. On the way, you will admire the romantic and charming natural scenery of northeastern mountains with the tea hills, lush palm forests, and terraced fields on the hillsides
', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (8, N'After breakfast, depart to Dong Van. Along the way, you admire the spectacular views of the Viet Bac mountains, then stop to rest in Quan Ba Heaven Gate - the contiguous zone between heaven and earth, watch the Tam Son town and Twins Mountain. Then, continue to Dong Van, enjoy lunch at Yen Minh (Eat at the local canteen). On the way, visit the Sung La - where is known for a context in the famous film "Love Story of Pao"
', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (9, N'After breakfast, depart to Lung Cu, then visit and take photos with Lung Cu flag tower - the northernmost point with a 54m2 flag representing 54 ethnic groups. Depart to Meo Vac, and stop to watch the Nho Que River running through Pu San canyon when crossing the Ma Phi Leng Pass. All is like an imposing landscape painting. On arrival in Meo Vac, have lunch. Continue to Cao Bang on the street with wild beauty with rolling mountains on the banks of Nhiem River, Gam River, etc', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (10, N'After breakfast, you take a coach to visit Ban Gioc Waterfall. On the way, stop to visit Nguom Ngao Cave, here you can imagine and explore the spectacular features of limestone caves with diversified shapes, characterized by Viet Bac region, as one of the longest and beautiful caves in Vietnam. Continue to visit the Ban Gioc Waterfall and a milestone in Vietnam-China border, Ban Gioc Waterfall is a popular tourist attraction and is considered as the most majestic and beautiful waterfall in the Vietnam', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (11, N'You depart to Pac Bo Historical Site - where President Ho Chi Minh used to live and work with poetic and charming scenery. Blue and dreaming stream before the cave gate was named Lenin Stream by Uncle Ho, next to the majestic mountain Marx Mount. Back to Cao Bang, enjoy lunch, then depart to Ba according to highway 3 to Ba Be National Park, with the charming natural landscape. Check in and stay overnight in Ba Be', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (12, N'The coach shall take you to a wharf, you get on a boat to visit the Ba Be Lake - one of the 20 largest natural freshwater lakes in the world, located between the limestone mountains. Here, you have the opportunity to discover the extremely vivid charming pictures thanks to mirror-like water surface with shapes of sky and mountains, which attracts tourists. Thereby, you can feel that nature and people are intertwined harmoniously
', 2, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (13, N'You are present at the Tan Son Nhat Airport, Column 4, Domestic Terminal. The tour guide shall make the procedures to catch a flight to Hanoi. Vietravel''s coach shall pick you up at Noi Bai airport, and then depart to Sa Pa on the modern and longest highway in Vietnam, connecting Hanoi and Lao Cai through Vinh Phuc, Phu Tho, Yen Bai. Upon arrial in Sapa, check in and free at leisure. In the afternoon, visit the Ta Van - Lao Chai Village. The road into Ta Van is winding with a side of Muong Hoa valley with fertile terraced fields adorned by the green of maize and rice. Upon arrival at Ta Van Village, visit the houses of the Mong, Dao, Giay', 3, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (14, N'Visit the Silver Falls, O Quy Ho Pass - the boundary between the two provinces of Lao Cai and Lai Chau winding around Hoang Lien Range, also known as the Heaven Gate. Here, you can admire the panoramic picture of  extremely majestic and impressive northwestern mountains from above. Take a coach to visit and conquer the majestic Fansipan mountain (expense excluded) - which was named as "Roof of Indochina" with a height of 3.143m. Here, you will travel by cable cars which currently owns 2 Guinness', 3, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (15, N'Check out, then visit the border gate of Vietnam - China "Lao Cai - Hekou", go shopping at Coc Leu market. Return to Hanoi and check in. The coach shall take you to take a stroll around Sword Lake and watch Turtle Tower, Ngoc Son Temple, The Huc Bridge. In the evening, you are free to explore the old town at night. Stay overnight in Hanoi', 3, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (16, N'Continue to visit and understand about the life and work of the father of the nation at the Ho Chi Minh Mausoleum (it is not open for visiting on weekly Mondays and Fridays), Uncle Ho''s Stilt House, Ho Chi Minh Museum, One Pillar Pagoda. Then, visit the Temple of Literature - where worships the Confucius and the Confucian sages - the first University of Vietnam. Continue the journey to Halong, visit the Yen Tu Mountain (cable car costs excluded) - a natural attraction that was preserved with many historical sites and is known as "the land of Buddhism in Vietnam"', 3, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (17, N'Go to the wharf and take a cruise to go sightseeing in Ha Long Bay -  a beautiful natural and extremely vivid scene, which was a UNESCO World Heritage Site in 1994. Then, visit and explore the magnificence and luxury of the Heaven Palace Cave. From the cruise, you can watch the islands in Halong Bay, including: Ga Choi Island, Lu Huong Island, etc
', 3, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (18, N'You gather at Tan Son Nhat Airport, at the Domestic Terminal. The tour guide shall make the procedures for you to catch a flight to Da Nang. At Da Nang Airport, Vietravel''s coach and tour guide shall take a look around the Son Tra Peninsula, admire the Tien Sa Port, visit the Linh Ung Bai But Pagoda - the largest pagoda in Da Nang - with a statue of the tallest Guan Yin Buddha statue in Vietnam (67m). Standing here, you will admire the panoramic view of the city, mountain and Son Tra Island in a perfect way. Have lunch. Check in and free at leisure.
', 4, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (19, N'n the afternoon, the coach takes you to visit Ngu Hanh Son: Linh Ung Pagoda, Tang Chon Cave, Hoa Nghiem Cave,Non Nuoc Pagoda,etc. Then the coach takes you to visit Hoi An Old Town: Bridge Pagoda, Phung Hung Ancient House, Phuoc Kien Assembly Hall, Crafts establishments… then roam freely on the streets of colorful lanterns and buy souvenirs, test your skills in traditional games such as breaking earthen pot', 4, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (20, N'Eat buffet breakfast at the hotel. You are free to explore Da Nang, relax at the hotel or the coach take you to visit Ba Na - Suoi Mo, upon arrival, take the world''s longest one-rope cable car to the Ba Na Mountain (cable car expenses excluded), enjoy the chilly air of the “Da Lat in the Central”, then free to visit or travel by the hiking train (expenses excluded) visit: Linh Ung Pagoda, Debay Cellars, Le Jardin D''Amour Gardenetc', 4, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (21, N'Next, visit a new spiritual area of ​​Ba Na and visit Linh Chua Linh Tu Temple - located atop Chua Mountain, where worships the goddess of the highlands, visit the Bell Tower, Linh Phong Tu Tower. Continue to the Fantasy Park: with strange adventure games to enjoy thrilling experiences such as: Love Wheel, Skiver Pilot, Fire Racetracks, Ghost House and exhibition area of over 40 wax - including wax of the famous singers, actors, scientists, leaders in the world
', 4, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (22, N'You are present at the Tan Son Nhat Airport, Column 10 - Vietravel''s counter, Domestic Terminal. Vietravel''s tour guide shall support you in procedures to catch a flight to Da Nang. At the Da Nang Airport, Vietravel''s coach and tour guide shall welcome and take you for buffet breakfast, then go through the Hai Van Tunnel to Hue. Upon arrival in Hue, visit the Tomb of Tu Duc - with charming landscapes and to be one of the tombs with the most beautiful architecture of the Nguyen Kings. Have lunch. Check in and rest at the hotel', 5, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (23, N'Check in and rest at the hotel. In the afternoon, take a coach to visit the Hue Imperial City - the ancient palace of 13 Kings of the Nguyen Dynasty, visit Ngo Mon Gate, Thai Hoa Palace, Purple Forbidden City, The Temple, Hien Lam, Cuu Dinh, then, continue to visit the Thien Mu Pagoda-  which is considered as the oldest pagoda in Hue and has preserved many valuable artifacts not only in term of history but also in art. Enjoy dinner. In the evening, you are free to sit down the Dragon Boat to travel on the Perfume River and enjoy Hue songs', 5, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (24, N'Eat buffet breakfast at the hotel. You depart early to Dong Hoi (Quang Binh), stop along the way to visit the Truong Son Martyrs'' Cemetery. Upon arrival in Dong Hoi, have lunch. Then, continue to Phong Nha Cave - which is considered as the "fairyland" by being hidden in the limestone, covered by tropical forests, magnificent cave system with the longest underground river in the world, next visit: Bi Ky Cave, Toc Tien Cave, Palace Cave', 5, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (25, N'Continue to visit the new cave in the World Heritage Site of Phong Nha - Ke Bang: Paradise Cave - Viewed as an underground palace, thanks to beautiful  and dreamy limestone caves, with a record length of more than 30 km. Return to Dong Hoi, after dinner you are free to walk around Nhat Le Beach, eat seafood (expense excluded). Stay overnight in Quang Binh', 5, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (26, N'Eat buffet breakfast at the hotel. Check out. Depart to Hue, on the way, stop to visit the Quang Tri ancient citadel, listen to explanation on Demilitarized Zone DMZ and Hien Luong Bridge - Ben Hai River (17th parallel), then continue the journey to the La Vang Holy Land. Have lunch in Hue. Continue the journey to Da Nang, stop to visit and take photos at Lang Co - one of the most beautiful bays in the world before going through Hai Van Tunnel to Da Nang City', 6, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (27, N'In the morning, the coach takes you to visit White Sand Doc Let Resort – With the very green lawn and typical coconut palms in the space of mixing the sunshine, white sand and the scenery for dreamlike scene in the luxury resort. Freely swim and do the sea games: Jet skiing, parasailing, waterskiing, windsurfing, etc. or taste seafood (at your own expense). The coach shall take you to return to Nha Trang', 6, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (28, N'After breakfast, you are free for visiting Nha Trang and check out. The coach shall take you to the Nha Trang airport for a flight to Da Nang. At the Da Nang Airport, Vietravel''s coach shall take you and depart to Hue. Upon arrival in Hue in afternoon, have dinner and free at leisure or export Hue City at night. Stay overnight in Hue', 6, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (29, N'Vietravel''s coach shall pick you up at the hotel, visit the Tomb of Tu Duc - with charming landscapes and to be one of the tombs with the most beautiful architecture of the Nguyen Kings. Have lunch. Check in and free at leisure. In the afternoon, take a coach to visit the Hue Imperial City - the ancient palace of 13 Kings of the Nguyen Dynasty, visit Ngo Mon Gate, Thai Hoa Palace, Purple Forbidden City, The Temple, Hien Lam, Cuu Dinh, then, continue to visit the Thien Mu Pagoda-  which is considered as the oldest pagoda in Hue and has preserved many valuable artifacts not only in term of history but also in art. Enjoy dinner', 6, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (66, N'Check out, depart to Mu Cang Chai, across Tu Le, you will smell the faintly fragrance of "new rice" along the wind from the roof chimney; this place is famous for sweet rice and grean rice. To the Khau Pha Pass, you shall stop to take photos and watch the beautiful Lim Mong Village located at the foot of the pass. This is a H''Mong village and a home to the most beautiful rice field in Mu Cang Chai. Across the Khau Pha Pass to the territory of Mu Cang Chai', 27, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (67, N'Gather at Tan Son Nhat Airport, column 04 at the Domestic Terminal so that tour guide makes the procedures for you to catch a flight to Hanoi. Vietravel coach shall pick you up at Noi Bai Airport, then depart to Yen Bai. Along the way, stop in Phu Tho to visit the Hung Temple', 27, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (68, N'a', 28, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (69, N'a', 29, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (70, N'b', 29, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (71, N'1', 30, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (72, N'asdasd', 31, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (73, N'asdasdasd', 31, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (74, N'asdasd', 31, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (75, N'asdasd', 31, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (76, N'Have breakfast at hotel and check out. You visit Happy Land Moc Chau. Depart to Hoa Binh and enjoy lunch. Then, return to Hanoi, you shall take a coach to Noi Bai airport for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport', 28, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (77, N'Then, return to Hanoi, you shall take a coach to Noi Bai airport for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport', 28, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (78, N'Then, return to Hanoi, you shall take a coach to Noi Bai airport for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport', 28, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (79, N'You gather at Tan Son Nhat Airport, Vietravel Counter, Column 10 at the Domestic Terminal. The tour guide shall make the procedures for you to catch a flight toDa Nang. The coach picks you up at Co Ong Airport to the hotel for luggage. You visitPhu Hai Prison, France - America Cage,visit Hang Duong Martyrs'' Cemetery
', 28, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (80, N'From the main road, you walk on the trait to the beach far from 1.5km. On the way, you stop to burn incense to visit Cau Temple - which worships Prince Cai, the son of Nguyen Anh and Phi Yen. Upon arrival at beach', 28, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (81, N'The coach takes you to visit Dam Trau beach - One of the most pristine and beautiful beaches inCon Daowith fine sand, blue sea. From the main road, you walk on the trait to the beach far from 1.5km. On the way, you stop to burn incense to visit Cau Temple - which worships Prince Cai, the son of Nguyen Anh and Phi Yen. Upon arrival at beach, you are free at leisure, relax, swim. In the afternoon, you visit Ben Dam port the largest port in Con Dao', 27, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (82, N'the peak shapes as the couple talking that nature has given to Con Dao. Continuously, you visit Nhat Beach - A beach is affected by the tide, when the water is down, there will be a beach with white sand. In the evening, you are free to relax, walk and admire Wharf 914 and explore Con Dao at night', 27, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (83, N'Coach and tour guide of Vietravel pick you up at airport to take the flight to Bangkok. Upon arrival at Suvarnabhumi/Don Moung airport, coach and local guide will pick you up and transfer to 4-star hotel for check-in. Dinner and enjoy Nanta show before back to hotel.
', 32, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (84, N'Breakfast at hotel. Get on speedboat and depart for Coral Island - the largest of Pattaya''s archipelago which covers an area of about 4 km2 with the beautiful and clear water beaches, here you can spend the day viewing abundant coral reefs and colourful underwater world from the glass-bot', 32, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (85, N'Breakfast at hotel. Depart for Bangkok. On the way, visit Snake Farm. In Bangkok, visit Safari World - 170 acre park offers many opportunities for fun and excitement as getting close to wild animals roaming free or see others performing tricks. The main attraction is as the name says traveling through the open spaces where wild animals can be seen in their natural habitat from the windows of a tour coach', 32, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (86, N'Breakfast at hotel, then visit Sealife Bangkok Ocean World and The Golden Buddha - the world''s largest golden seated Buddha measuring nearly five metres in height and weighing five and a half tons, and believed to be 700 to 800 years old. Visit the Chocolate Store – where you can buy some souvenir for your family', 32, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (87, N'a', 33, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (88, N'b', 33, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (89, N'a', 34, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (90, N'b', 34, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (91, N'c', 34, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (92, N'd', 34, 0)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (93, N'c', 34, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (94, N'1', 35, 1)
INSERT [dbo].[tour_description] ([id], [dayDesc], [tourInfoId], [status]) VALUES (95, N'a', 36, 1)
SET IDENTITY_INSERT [dbo].[tour_description] OFF
SET IDENTITY_INSERT [dbo].[tour_location] ON 

INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (1, N'Ho Chi Minh', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (2, N'Ha Noi', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (3, N'Da Nang', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (4, N'Binh Dinh', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (5, N'Nha Trang', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (6, N'America', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (7, N'China', 2, 0)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (8, N'Korea', 2, 0)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (9, N'Da lat', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (10, N'Ca Mau', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (11, N'Can Tho', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (12, N'Hai Phong', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (13, N'Phu Quoc', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (14, N'Quy nhon', 1, 0)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (15, N'Long Xuyen', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (16, N'Vung Tau', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (17, N'Thanh Hoa', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (18, N'Binh Thuan', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (19, N'Japan', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (20, N'Wakanda', 2, 0)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (23, N'Bien Hoa', 1, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (24, N'Wakanda', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (25, N'Germany', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (26, N'Thailand', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (27, N'China', 2, 1)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (28, N'Taiwannes', 2, 0)
INSERT [dbo].[tour_location] ([locId], [locName], [catId], [status]) VALUES (29, N'My tho', 1, 1)
SET IDENTITY_INSERT [dbo].[tour_location] OFF
SET IDENTITY_INSERT [dbo].[tourInfo] ON 

INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (1, N'Northwest of Vietnam: Nghia Lo - Tu Le - Mu Cang Chai - Yen Bai - Sapa', 1, 1, 2, 6, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (2, N'Northeast of Vietnam: Ha Giang - Lung Cu - Dong Van - Ma Li Leng - Meo Vac - Cao Bang', 1, 1, 2, 6, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (3, N'North of Vietnam: Ha noi - Lao Cai - Sapa - Fansipan', 1, 1, 2, 4, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (4, N'Da Nang - Ba Na - Son Tra - Hoi An - La Vang - Phong Nha cave', 1, 1, 3, 4, 10, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (5, N'Da Nang - Ba Na - Hoi An - La Vang - Thien Duong Cave', 1, 1, 3, 4, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (6, N'Central of Vietnam: Nha Trang - Hon Mun - Vinpearl land', 1, 4, 5, 4, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (27, N'Los Angeles - Hollywood - Las Vegas - Hoover Dam. 01 day Free & Easy', 2, 1, 6, 2, 15, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (28, N'Mekong Delta: Chau Doc - Tra Su Cajuput Forest - Ha Tien - Rach Gia - Can Tho', 1, 1, 16, 3, 9, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (29, N'Mekong Delta: Sa Dec - Can Tho - Ca Mau - Bac Lieu - Soc Trang', 1, 10, 16, 2, 10, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (30, N'asdf', 1, 1, 2, 1, 1, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (31, N'Ho Chi Minh - Quy Nhon', 2, 1, 4, 4, 18, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (32, N'Bangkok – Pattaya - 4 star & 3 Star Hotel (Special deal)', 2, 1, 26, 4, 20, 1)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (33, N'china', 2, 1, 27, 2, 20, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (34, N'a', 1, 1, 18, 3, 20, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (35, N'as', 1, 1, 29, 1, 1, 0)
INSERT [dbo].[tourInfo] ([tourId], [tourName], [category], [originId], [destinationId], [duration], [quantity], [status]) VALUES (36, N'saigon dalat', 1, 1, 9, 1, 20, 1)
SET IDENTITY_INSERT [dbo].[tourInfo] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__AB6E616478FE2CDE]    Script Date: 8/8/2018 3:19:07 AM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__B43B145FF79D661E]    Script Date: 8/8/2018 3:19:07 AM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tourInfo] ([tourId])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [Fk_key] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [Fk_key]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [Fk_key_tour] FOREIGN KEY([tour_cre_id])
REFERENCES [dbo].[tour_cre] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [Fk_key_tour]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[tour_cre]  WITH CHECK ADD FOREIGN KEY([tourId])
REFERENCES [dbo].[tourInfo] ([tourId])
GO
ALTER TABLE [dbo].[tour_description]  WITH CHECK ADD FOREIGN KEY([tourInfoId])
REFERENCES [dbo].[tourInfo] ([tourId])
GO
ALTER TABLE [dbo].[tour_location]  WITH CHECK ADD FOREIGN KEY([catId])
REFERENCES [dbo].[tour_category] ([catId])
GO
ALTER TABLE [dbo].[tourInfo]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[tour_category] ([catId])
GO
ALTER TABLE [dbo].[tourInfo]  WITH CHECK ADD FOREIGN KEY([destinationId])
REFERENCES [dbo].[tour_location] ([locId])
GO
ALTER TABLE [dbo].[tourInfo]  WITH CHECK ADD FOREIGN KEY([originId])
REFERENCES [dbo].[tour_location] ([locId])
GO
USE [master]
GO
ALTER DATABASE [touristDB] SET  READ_WRITE 
GO
