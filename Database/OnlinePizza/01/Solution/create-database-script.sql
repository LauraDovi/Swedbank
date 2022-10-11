USE [master]
GO
/****** Object:  Database [OnlinePizzaSingle]    Script Date: 10/10/2022 2:57:05 PM ******/
CREATE DATABASE [OnlinePizzaSingle]
GO
USE [OnlinePizzaSingle]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/10/2022 2:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/10/2022 2:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/10/2022 2:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[IsDelivered] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRow]    Script Date: 10/10/2022 2:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRow](
	[OrderId] [int] NOT NULL,
	[PizzaId] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderRow] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[PizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 10/10/2022 2:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Pizza] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (301, N'Stockholm')
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (302, N'Linköping')
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (303, N'Göteborg')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CityId], [PhoneNumber]) VALUES (1, N'Alice', N'Storgatan 3', 301, N'073-111 2222')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CityId], [PhoneNumber]) VALUES (2, N'Wilma', N'Lilla torget 4B', 302, N'070 - 222 3333')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CityId], [PhoneNumber]) VALUES (3, N'Lukas', N'Fjällgatan 5', 303, N'070 - 666 7777')
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [IsDelivered]) VALUES (501, 1, 1)
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [IsDelivered]) VALUES (502, 2, 1)
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [IsDelivered]) VALUES (503, 3, 0)
GO
INSERT [dbo].[OrderRow] ([OrderId], [PizzaId], [Quantity]) VALUES (501, 101, 2)
GO
INSERT [dbo].[OrderRow] ([OrderId], [PizzaId], [Quantity]) VALUES (501, 102, 3)
GO
INSERT [dbo].[OrderRow] ([OrderId], [PizzaId], [Quantity]) VALUES (502, 102, 1)
GO
INSERT [dbo].[OrderRow] ([OrderId], [PizzaId], [Quantity]) VALUES (502, 103, 2)
GO
INSERT [dbo].[OrderRow] ([OrderId], [PizzaId], [Quantity]) VALUES (503, 104, 1)
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (101, N'Margarita', CAST(89 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (102, N'Fungi', CAST(94 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (103, N'Vesuvio', CAST(94 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (104, N'Hawaii', CAST(99 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderRow]  WITH CHECK ADD  CONSTRAINT [FK_OrderRow_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderRow] CHECK CONSTRAINT [FK_OrderRow_Order]
GO
ALTER TABLE [dbo].[OrderRow]  WITH CHECK ADD  CONSTRAINT [FK_OrderRow_Pizza] FOREIGN KEY([PizzaId])
REFERENCES [dbo].[Pizza] ([Id])
GO
ALTER TABLE [dbo].[OrderRow] CHECK CONSTRAINT [FK_OrderRow_Pizza]
GO
USE [master]
GO
ALTER DATABASE [OnlinePizzaSingle] SET  READ_WRITE 
GO
