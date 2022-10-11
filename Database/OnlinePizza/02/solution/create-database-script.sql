USE [master]
GO
CREATE DATABASE [OnlinePizza]
GO
USE OnlinePizza
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/10/2022 6:57:34 PM ******/
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
/****** Object:  Table [dbo].[ExtraIngredience]    Script Date: 10/10/2022 6:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraIngredience](
	[OrderRowId] [int] NOT NULL,
	[IngredienceId] [int] NOT NULL,
 CONSTRAINT [PK_ExtraIngredience] PRIMARY KEY CLUSTERED 
(
	[OrderRowId] ASC,
	[IngredienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredience]    Script Date: 10/10/2022 6:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredience](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ingredience] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/10/2022 6:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[PizzeriaId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[DeliveredAt] [datetime] NULL,
	[Note] [varchar](8000) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRow]    Script Date: 10/10/2022 6:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRow](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[PizzaId] [int] NOT NULL,
	[Note] [varchar](8000) NULL,
 CONSTRAINT [PK_OrderRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 10/10/2022 6:57:34 PM ******/
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
/****** Object:  Table [dbo].[Pizzeria]    Script Date: 10/10/2022 6:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzeria](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Pizzeria] PRIMARY KEY CLUSTERED 
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
INSERT [dbo].[ExtraIngredience] ([OrderRowId], [IngredienceId]) VALUES (408, 201)
GO
INSERT [dbo].[ExtraIngredience] ([OrderRowId], [IngredienceId]) VALUES (409, 202)
GO
INSERT [dbo].[ExtraIngredience] ([OrderRowId], [IngredienceId]) VALUES (409, 203)
GO
INSERT [dbo].[Ingredience] ([Id], [Name], [Price]) VALUES (201, N'Pommes frites', CAST(20 AS Decimal(18, 0)))
GO
INSERT [dbo].[Ingredience] ([Id], [Name], [Price]) VALUES (202, N'Double dough', CAST(40 AS Decimal(18, 0)))
GO
INSERT [dbo].[Ingredience] ([Id], [Name], [Price]) VALUES (203, N'Garlic sause', CAST(15 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [PizzeriaId], [CustomerId], [CreatedAt], [DeliveredAt], [Note]) VALUES (501, 601, 1, CAST(N'2022-10-10T12:00:00.000' AS DateTime), CAST(N'2022-10-10T12:25:00.000' AS DateTime), N'Vegan!')
GO
INSERT [dbo].[Order] ([Id], [PizzeriaId], [CustomerId], [CreatedAt], [DeliveredAt], [Note]) VALUES (502, 601, 2, CAST(N'2022-10-10T12:02:00.000' AS DateTime), CAST(N'2022-10-10T12:15:00.000' AS DateTime), N'Hurry up!')
GO
INSERT [dbo].[Order] ([Id], [PizzeriaId], [CustomerId], [CreatedAt], [DeliveredAt], [Note]) VALUES (503, 601, 3, CAST(N'2022-10-10T12:05:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (401, 501, 101, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (402, 501, 101, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (403, 501, 102, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (404, 501, 102, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (405, 501, 102, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (406, 502, 102, N'Without cheese')
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (407, 502, 103, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (408, 502, 103, NULL)
GO
INSERT [dbo].[OrderRow] ([Id], [OrderId], [PizzaId], [Note]) VALUES (409, 503, 104, NULL)
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (101, N'Margarita', CAST(89 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (102, N'Fungi', CAST(94 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (103, N'Vesuvio', CAST(94 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizza] ([Id], [Name], [Price]) VALUES (104, N'Hawaii', CAST(99 AS Decimal(18, 0)))
GO
INSERT [dbo].[Pizzeria] ([Id], [Name], [Address], [CityId]) VALUES (601, N'Formaggio', N'Flemingsgatan 73', 301)
GO
INSERT [dbo].[Pizzeria] ([Id], [Name], [Address], [CityId]) VALUES (602, N'Pizzeria Venedig', N'Risbrinksgatan 4', 302)
GO
INSERT [dbo].[Pizzeria] ([Id], [Name], [Address], [CityId]) VALUES (603, N'Pizzeria Mini Mac', N'Fjällgatan 28', 303)
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
ALTER TABLE [dbo].[ExtraIngredience]  WITH CHECK ADD  CONSTRAINT [FK_ExtraIngredience_Ingredience] FOREIGN KEY([IngredienceId])
REFERENCES [dbo].[Ingredience] ([Id])
GO
ALTER TABLE [dbo].[ExtraIngredience] CHECK CONSTRAINT [FK_ExtraIngredience_Ingredience]
GO
ALTER TABLE [dbo].[ExtraIngredience]  WITH CHECK ADD  CONSTRAINT [FK_ExtraIngredience_OrderRow] FOREIGN KEY([OrderRowId])
REFERENCES [dbo].[OrderRow] ([Id])
GO
ALTER TABLE [dbo].[ExtraIngredience] CHECK CONSTRAINT [FK_ExtraIngredience_OrderRow]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Pizzeria] FOREIGN KEY([PizzeriaId])
REFERENCES [dbo].[Pizzeria] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Pizzeria]
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
ALTER TABLE [dbo].[Pizzeria]  WITH CHECK ADD  CONSTRAINT [FK_Pizzeria_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Pizzeria] CHECK CONSTRAINT [FK_Pizzeria_City]
GO
USE [master]
GO
ALTER DATABASE [OnlinePizzaSingle] SET  READ_WRITE 
GO
