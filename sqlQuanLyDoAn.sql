USE [master]
GO
/****** Object:  Database [sqlQuanLyBanDoAn]    Script Date: 10/18/2024 12:16:41 PM ******/
CREATE DATABASE [sqlQuanLyBanDoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sqlQuanLyBanDoAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\sqlQuanLyBanDoAn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sqlQuanLyBanDoAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\sqlQuanLyBanDoAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sqlQuanLyBanDoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET RECOVERY FULL 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET  MULTI_USER 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sqlQuanLyBanDoAn', N'ON'
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET QUERY_STORE = ON
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sqlQuanLyBanDoAn]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[iOrderID] [int] IDENTITY(1,1) NOT NULL,
	[dOrderDate] [datetime] NOT NULL,
	[sCustomerName] [nvarchar](50) NOT NULL,
	[sCustomerPhone] [nvarchar](20) NOT NULL,
	[sCustomerAddress] [nvarchar](200) NOT NULL,
	[fTotal] [float] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[iOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[iDetailID] [int] IDENTITY(1,1) NOT NULL,
	[iDetailOrderID] [int] NOT NULL,
	[iDetailProductID] [int] NOT NULL,
	[fDetailPrice] [float] NOT NULL,
	[iDetailQuantity] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[iDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[iProductID] [int] IDENTITY(1,1) NOT NULL,
	[sProductName] [nvarchar](50) NOT NULL,
	[iProductCategoryId] [int] NOT NULL,
	[fPrice] [float] NOT NULL,
	[sImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[iProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductCategory]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductCategory](
	[iCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[sCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[iCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[iRoleID] [int] IDENTITY(1,1) NOT NULL,
	[sRoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[iRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[iUserID] [int] IDENTITY(1,1) NOT NULL,
	[sUserName] [nvarchar](100) NOT NULL,
	[sUserPassword] [nvarchar](100) NOT NULL,
	[iUserRoleID] [int] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[iUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrder] ADD  DEFAULT (getdate()) FOR [dOrderDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ((2)) FOR [iUserRoleID]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([iDetailOrderID])
REFERENCES [dbo].[tblOrder] ([iOrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([iDetailProductID])
REFERENCES [dbo].[tblProduct] ([iProductID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblProductCategory] FOREIGN KEY([iProductCategoryId])
REFERENCES [dbo].[tblProductCategory] ([iCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblProductCategory]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([iUserRoleID])
REFERENCES [dbo].[tblRole] ([iRoleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
/****** Object:  StoredProcedure [dbo].[spGetFeatureProduct]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetFeatureProduct] AS
BEGIN
	SELECT TOP 4 tblProduct.iProductID, tblProduct.sProductName, tblProduct.iProductCategoryId, tblProduct.fPrice, tblProduct.sImageUrl
	FROM tblProduct;
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetOrderDetailByOrderID]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetOrderDetailByOrderID] @id int AS
BEGIN
	SELECT tblOrderDetail.iDetailID, tblOrderDetail.iDetailOrderID, tblOrderDetail.iDetailProductID, 
		tblProduct.sProductName, tblOrderDetail.iDetailQuantity, tblOrderDetail.fDetailPrice
	FROM tblOrderDetail
	JOIN tblProduct ON tblOrderDetail.iDetailProductID = tblProduct.iProductID
	WHERE tblOrderDetail.iDetailOrderID = @id;
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetProductByID]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetProductByID] @id int AS
BEGIN
	SELECT tblProduct.iProductID, tblProduct.sProductName, tblProductCategory.sCategoryName, tblProduct.fPrice, tblProduct.sImageUrl
	FROM tblProduct
	JOIN tblProductCategory ON tblProduct.iProductCategoryId = tblProductCategory.iCategoryID
	WHERE tblProduct.iProductID = @id;
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetProductVM]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetProductVM] AS
BEGIN
	SELECT tblProduct.iProductID, tblProduct.sProductName, tblProductCategory.sCategoryName, tblProduct.fPrice, tblProduct.sImageUrl
	FROM tblProduct
	JOIN tblProductCategory ON tblProduct.iProductCategoryId = tblProductCategory.iCategoryID
	ORDER BY tblProduct.iProductID;
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetRelatedProduct]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetRelatedProduct] @categoryID int AS
BEGIN
	SELECT TOP 4 tblProduct.iProductID, tblProduct.sProductName, tblProduct.iProductCategoryId, tblProduct.fPrice, tblProduct.sImageUrl
	FROM tblProduct
	WHERE tblProduct.iProductCategoryId = @categoryID;
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetUserVM]    Script Date: 10/18/2024 12:16:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetUserVM] AS
BEGIN
	SELECT tblUser.iUserID, tblUser.sUserName, tblUser.sUserPassword, tblRole.sRoleName
	FROM tblUser
	JOIN tblRole ON tblUser.iUserRoleID = tblRole.iRoleID
	ORDER BY tblUser.iUserID;
END;

GO
USE [master]
GO
ALTER DATABASE [sqlQuanLyBanDoAn] SET  READ_WRITE 
GO
