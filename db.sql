USE [master]
GO
/****** Object:  Database [Signaaldich]    Script Date: 1/21/2019 5:45:24 PM ******/
CREATE DATABASE [Signaaldich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Signaaldich', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCAL2016\MSSQL\DATA\Signaaldich.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Signaaldich_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCAL2016\MSSQL\DATA\Signaaldich_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Signaaldich] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Signaaldich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Signaaldich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Signaaldich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Signaaldich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Signaaldich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Signaaldich] SET ARITHABORT OFF 
GO
ALTER DATABASE [Signaaldich] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Signaaldich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Signaaldich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Signaaldich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Signaaldich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Signaaldich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Signaaldich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Signaaldich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Signaaldich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Signaaldich] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Signaaldich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Signaaldich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Signaaldich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Signaaldich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Signaaldich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Signaaldich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Signaaldich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Signaaldich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Signaaldich] SET  MULTI_USER 
GO
ALTER DATABASE [Signaaldich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Signaaldich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Signaaldich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Signaaldich] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Signaaldich] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Signaaldich', N'ON'
GO
ALTER DATABASE [Signaaldich] SET QUERY_STORE = OFF
GO
USE [Signaaldich]
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
USE [Signaaldich]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/21/2019 5:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryURL] [nvarchar](max) NULL,
	[Processed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/21/2019 5:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[ID_Link] [varchar](max) NULL,
	[name] [varchar](max) NULL,
	[Volume] [varchar](max) NULL,
	[Density] [varchar](max) NULL,
	[AmountInKG] [varchar](max) NULL,
	[PricePerKG] [varchar](max) NULL,
	[Assay] [varchar](max) NULL,
	[CASnumber] [varchar](max) NULL,
	[InChlkey] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Biologicalsource] [varchar](max) NULL,
	[Synonyms] [varchar](max) NULL,
	[Linearformula] [varchar](max) NULL,
	[Molecularweight] [varchar](max) NULL,
	[ECnumber] [varchar](max) NULL,
	[Beilsteinnumber] [varchar](max) NULL,
	[PubChemID] [varchar](max) NULL,
	[Processed] [bit] NOT NULL,
	[ProductUrl] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Packaging]    Script Date: 1/21/2019 5:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Packaging](
	[ProductID] [int] NOT NULL,
	[Packaging] [varchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Product___3214EC27CB2D2D1C] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_SKU]    Script Date: 1/21/2019 5:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_SKU](
	[ProductID] [int] NOT NULL,
	[SKU] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
	[PricePerKG] [float] NULL,
	[AmountInKg] [float] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/21/2019 5:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](max) NULL,
	[SubCategoryURL] [nvarchar](max) NULL,
	[Processed] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (1, N'Amino Acids', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=16282308', 1)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (2, N'Antibodies', N'https://www.sigmaaldrich.com/life-science/cell-biology/antibodies.html', 1)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (3, N'Antibiotics', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=14572853', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (4, N'Biological Buffers', N'https://www.sigmaaldrich.com/life-science/core-bioreagents/biological-buffers.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (5, N'Carbohydrates', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=16184116', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (6, N'Detergents', N'https://www.sigmaaldrich.com/life-science/detergents.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (7, N'Enzymes, Inhibitors, and Substrates', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=14572942', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (8, N'Life Science Labware', N'https://www.sigmaaldrich.com/life-science/labware-and-equipment.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (9, N'Lipids', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=15823826', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (10, N'Peptides', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14573360', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (11, N'Proteins &amp; Derivatives', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=16192431', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (12, N'Stable Isotopes', N'https://www.sigmaaldrich.com/chemistry/stable-isotopes-isotec.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (13, N'Additional Biochemicals &amp; Reagents', N'https://www.sigmaaldrich.com/life-science/biochemicals.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (14, N'Automation Reagents', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=16181998', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (15, N'Cell Culture', N'https://www.sigmaaldrich.com/life-science/cell-culture.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (16, N'Cell and Cell-Based Assays', N'https://www.sigmaaldrich.com/life-science/cells-and-cell-based-assays.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (17, N'Chromatography', N'https://www.sigmaaldrich.com/analytical-chromatography/analytical-chromatography-catalog.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (18, N'Cloning &amp; Expression', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=12698483', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (19, N'Detection', N'https://www.sigmaaldrich.com/life-science/biochemicals/biochemical-products.html?TablePage=16187697', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (20, N'Electrophoresis', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=9622194', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (21, N'Hematology &amp; Histology', N'https://www.sigmaaldrich.com/life-science/cell-biology/hematology-and-histology.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (22, N'Mass Spectrometry', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=9627456', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (23, N'Nucleic Acid Purification', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=9617497', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (24, N'PCR &amp; Purification', N'No-LinkPCR &amp; Purification', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (25, N'Post-Trans. Modification', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=9620230', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (26, N'Protein Purification &amp; Detection', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=14561992', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (27, N'Super-Resolution Microscopy', N'https://www.sigmaaldrich.com/life-science/cell-biology/detection/abberior-dyes.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (28, N'Cancer Research', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14938461', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (29, N'Cell Biology/Cell Signaling', N'https://www.sigmaaldrich.com/life-science/cell-biology.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (30, N'Drug Discovery', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9626783', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (31, N'Epigenetics', N'https://www.sigmaaldrich.com/life-science/epigenetics.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (32, N'Functional Genomics &amp; RNAi', N'https://www.sigmaaldrich.com/life-science/molecular-biology/molecular-biology-products.html?TablePage=14561739', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (33, N'Metabolomics', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14576108', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (34, N'Microbiology', N'https://www.sigmaaldrich.com/analytical-chromatography/microbiology.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (35, N'Molecular Biology', N'https://www.sigmaaldrich.com/life-science/molecular-biology.html', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (36, N'Nutritional Research', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14576653', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (37, N'Obesity Research', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14576686', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (38, N'Plant Biotechnology', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14258352', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (39, N'Proteomics', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14561989', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (40, N'Stem Cell Biology', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=19923402', 0)
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (41, N'Synthetic Biology', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=119241921', 0)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1, 1, N'1.00289 EMD Millipore EMD Millipore', N'L-Glutamine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 99.0 - 101.0 %', N'56-85-9', NULL, N'L-Glutamine for biochemistry. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for biochemistry', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100289?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (2, 1, N'1.00291 EMD Millipore EMD Millipore EMD Millipore', N'L-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): = 99.0 %', N'56-86-0', NULL, N'L-Glutamic acid for biochemistry. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for biochemistry', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100291?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (3, 1, N'1.00590 EMD Millipore EMD Millipore', N'Glycine cryst.', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'56-40-6', NULL, N'EMPROVE® EXPERT Ph Eur,BP,JP,USP,  EMPROVE® EXPERT Ph Eur,BP,JP,USP', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100590?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (4, 1, N'1.01544 EMD Millipore EMD Millipore', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'1119-34-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP, suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101544?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (5, 1, N'1.01587 EMD Millipore EMD Millipore', N'L-Arginine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'74-79-3', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,JP,USP', NULL, N'Arg', N'C6H14N4O2', N'174.2 g/mol', N'200-811-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101587?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (6, 1, N'1.02735 EMD Millipore EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'EMPROVE® ESSENTIAL Ph Eur,USP', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102735?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (7, 1, N'1.02836 EMD Millipore EMD Millipore EMD Millipore', N'L-Cystine', NULL, NULL, NULL, NULL, N'Assay (ex N, calc. on dried substance): 98.5 - 101.5 %', N'56-89-3', NULL, N'L-Cystine suitable for biopharmaceutical production FCC. CAS 56-89-3, molar mass 240.30 g/mol., suitable for biopharmaceutical production FCC', NULL, N'Cys', N'C6H12N2O4S2', N'240.30 g/mol', N'200-296-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102836?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (8, 1, N'1.02838 EMD Millipore EMD Millipore', N'L-Cysteine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): = 99.0', N'52-90-4', NULL, N'L-Cysteine for biochemistry. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for biochemistry', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102838?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (9, 1, N'1.02839 EMD Millipore EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'for biochemistry', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102839?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (10, 1, N'1.04351 EMD Millipore EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 99.0 - 101.0 %', N'71-00-1', NULL, N'L-Histidine for biochemistry. CAS 71-00-1, pH 7.7 (10 g/l, H2O, 20 °C)., for biochemistry', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104351?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (11, 1, N'1.04352 EMD Millipore EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 98.5 - 101.0 %', N'71-00-1', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP, suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104352?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (12, 1, N'1.04354 EMD Millipore EMD Millipore', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'5934-29-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104354?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (13, 1, N'1.05701 EMD Millipore', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'657-27-2', NULL, N'EMPROVE® ESSENTIAL Ph Eur,BP,USP', NULL, N'Lys', N'C6H15ClN2O2', N'182.64 g/mol', N'211-519-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/105701?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (14, 1, N'106425 EMD Millipore EMD Millipore', N'N-Acetyl-L-cysteine - CAS 616-91-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'616-91-1', NULL, N'Mucolytic agent and thiol-based antioxidant that has a protective effect against oxygen free radicals in early septic shock.', NULL, N'LNAC', N'C5H9NO3S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/106425?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (15, 1, N'1250 EMD Millipore EMD Millipore', N'L-Alanine - CAS 56-41-7 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'A non-essential amino acid.', NULL, N'Ala', N'C3H7NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (16, 1, N'181003 EMD Millipore EMD Millipore', N'L-Arginine, Hydrochloride - CAS 1119-34-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'', NULL, N'Arg, HCl', N'C6H14N4O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/181003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (17, 1, N'1820 EMD Millipore EMD Millipore', N'L-Arginine, Free Base - CAS 74-79-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'Substrate for nitric oxide synthase. Reverses the inhibition of nitric oxide synthase caused by arginine analogs. Causes the release of insulin from pancreatic ß cells by a nitric oxide-dependent mechanism.', NULL, N'Arg', N'C6H14N4O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1820?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (18, 1, N'2240-OP EMD Millipore EMD Millipore', N'OmniPur® Casamino Acids - CAS 65072-00-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'65072-00-6', NULL, N'', NULL, N'Casein', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2240op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (19, 1, N'243005 EMD Millipore EMD Millipore', N'L-Cysteine, Free Base - CAS 52-90-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'Naturally-occurring non-essential amino acid.', NULL, N'Cys', N'C3H7NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/243005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (20, 1, N'2430-M EMD Millipore EMD Millipore', N'L-Cysteine, Hydrochloride - CAS 52-89-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-89-1', NULL, N'', NULL, N'Cys, HCI', N'C3H7NO2S · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2430m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (21, 1, N'2470 EMD Millipore EMD Millipore', N'L-Cystine - CAS 56-89-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'', NULL, N'(Cys)2', N'C6H12N2O4S2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2470?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (22, 1, N'356790 EMD Millipore EMD Millipore', N'Glyphosine - CAS 2439-99-8 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'2439-99-8', NULL, N'A plant growth regulator that also enhances anti-B:9-23 TCR-dependent T cell activation by modulating murine class II MHC I-Ag7-mediated B:9-23 presentation on APCs.', NULL, N'Polaris, Cp41845, N,N-bis(Phosphonomethyl)glycine, 2-(bis(Phosphonomethyl)amino)acetic acid', N'C4H11NO8P2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/356790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (23, 1, N'3570 EMD Millipore EMD Millipore', N'Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'A non-essential, optically inactive, non-chiral amino acid. Acts as an inhibitory neurotransmitter, particularly in brain stem and medulla.', NULL, N'Gly', N'C2H5NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/3570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (24, 1, N'4160 EMD Millipore EMD Millipore', N'L-Isoleucine - CAS 73-32-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'An essential branched chain amino acid.', NULL, N'Ile', N'C6H13NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4160?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (25, 1, N'4330 EMD Millipore EMD Millipore', N'L-Leucine - CAS 61-90-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'An essential branched chain amino acid.', NULL, N'Leu', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4330?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (26, 1, N'4400-M EMD Millipore EMD Millipore', N'L-Lysine, Hydrochloride - CAS 657-27-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'An essential amino acid.', NULL, N'Lys, HCl', N'C6H14N2O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4400m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (27, 1, N'4500-M EMD Millipore EMD Millipore', N'L-Methionine - CAS 63-68-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'An essential amino acid, useful as a methyl group donor.', NULL, N'Met', N'C5H11NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4500m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (28, 1, N'4810-OP EMD Millipore EMD Millipore', N'OmniPur® Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'', NULL, N'Aminoacetic Acid', N'H2NCH2COOH', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4810op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (29, 1, N'5202 EMD Millipore EMD Millipore', N'L-Phenylalanine - CAS 63-91-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'', NULL, N'Phe', N'C9H11NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5202?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (30, 1, N'5370 EMD Millipore EMD Millipore', N'L-Proline - CAS 147-85-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'A non-essential amino acid. Precursor of hydroxyproline in collagen.', NULL, N'Pro', N'C5H9NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (31, 1, N'5450-OP EMD Millipore EMD Millipore', N'OmniPur® L-Histidine - Calbiochem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5450op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (32, 1, N'561505 EMD Millipore EMD Millipore', N'L-Selenomethionine - CAS 3211-76-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'3211-76-5', NULL, N'L Selenomethionine increases the expression of glutathione peroxidase.', NULL, N'SeMet', N'C5H11NO2Se', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/561505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (33, 1, N'5650 EMD Millipore EMD Millipore', N'L-Serine - CAS 56-45-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'', NULL, N'Ser', N'C3H7NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5650?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (34, 1, N'6540-M EMD Millipore EMD Millipore', N'L-Tryptophan - CAS 73-22-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'', NULL, N'Trp', N'C11H12N2O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6540m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (35, 1, N'6570 EMD Millipore EMD Millipore', N'L-Tyrosine, Free Base - CAS 60-18-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'Non-essential amino acid for human development. Precursor for the synthesis of thyroid hormones and select neurotransmitters, such as dopamine and norepinephrine.', NULL, N'Tyr', N'C9H11NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (36, 1, N'8.14599 EMD Millipore EMD Millipore', N'N-Acetyl-DL-valine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'3067-19-4', NULL, N'N-Acetyl-DL-valine for synthesis. CAS 3067-19-4, molar mass 159.18 g/mol., for synthesis', NULL, NULL, N'C7H13NO3', N'159.18 g/mol', N'221-321-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (37, 1, N'8.14986 EMD Millipore EMD Millipore', N'DL-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'328-39-2', NULL, N'DL-Leucine for synthesis. CAS 328-39-2, molar mass 131.17 g/mol., for synthesis', NULL, N'DL-2-Aminmo-4-methylvalerianic acid, DL-2-Aminmo-4-methylpentanoic acid', N'C6H13NO2', N'131.17 g/mol', N'206-328-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814986?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (38, 1, N'8.16000 EMD Millipore EMD Millipore', N'(S)-(+)-Alanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-41-7', NULL, N'(S)-(+)-Alanine for synthesis. CAS 56-41-7, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'2-Aminopropionic acid, Ala', N'C3H7NO2', N'89.09 g/mol', N'200-273-8', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (39, 1, N'8.16001 EMD Millipore EMD Millipore', N'(S)-(+)-Arginine hydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'1119-34-2', NULL, N'(S)-(+)-Arginine hydrochloride for synthesis. CAS 1119-34-2, chemical formula C6H14N4O2*HCl., for synthesis', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (40, 1, N'8.16003 EMD Millipore EMD Millipore', N'(S)-(+)-Aspartic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-84-8', NULL, N'(S)-(+)-Aspartic acid for synthesis. CAS 56-84-8, pH 2.5 - 3.5 (4 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-a-Aminosuccinic acid, L-alpha-Aminosuccinic acid, Asp', N'C4H7NO4', N'133.1 g/mol', N'200-291-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (41, 1, N'8.16004 EMD Millipore EMD Millipore', N'(S)-(+)-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-86-0', NULL, N'(S)-(+)-Glutamic acid for synthesis. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for synthesis', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816004?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (42, 1, N'8.16005 EMD Millipore EMD Millipore', N'(S)-(+)-Histidine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'5934-29-2', NULL, N'(S)-(+)-Histidine hydrochloride monohydrate for synthesis. CAS 5934-29-2, pH 3.5 - 4.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (43, 1, N'8.16006 EMD Millipore EMD Millipore', N'(S)-(+)-Valine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-18-4', NULL, N'(S)-(+)-Valine for synthesis. CAS 72-18-4, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Val', N'C5H11NO2', N'117.15 g/mol', N'200-773-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (44, 1, N'8.16007 EMD Millipore EMD Millipore', N'(S)-(-)-trans-4-Hydroxyproline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'51-35-4', NULL, N'(S)-(-)-trans-4-Hydroxyproline for synthesis. CAS 51-35-4, pH 5.5 - 6.5 (50 g/l, H2O, 20 °C)., for synthesis', NULL, N'L(-)-4-Hydroxypyrrolidine-2-carboxylic acid, Hyp', N'C5H9NO3', N'131.13 g/mol', N'200-091-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (45, 1, N'8.16008 EMD Millipore EMD Millipore', N'(S)-(+)-Isoleucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-32-5', NULL, N'(S)-(+)-Isoleucine for synthesis. CAS 73-32-5, pH 5.5 - 6.5 (40 g/l, H2O, 20 °C)., for synthesis', NULL, N'iso-Leucine, Ile', N'C6H13NO2', N'131.17 g/mol', N'200-798-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816008?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (46, 1, N'8.16009 EMD Millipore EMD Millipore', N'(S)-(+)-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'61-90-5', NULL, N'(S)-(+)-Leucine for synthesis. CAS 61-90-5, pH 5.5 - 6.5 (20 g/l, H2O, 20 °C)., for synthesis', NULL, N'Leu', N'C6H13NO2', N'131.18 g/mol', N'200-522-0', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (47, 1, N'8.16010 EMD Millipore EMD Millipore', N'L-Methionine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-68-3', NULL, N'L-Methionine for synthesis. CAS 63-68-3, pH 5 - 7 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Met', N'C5H11NO2S', N'149.2 g/mol', N'200-562-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (48, 1, N'8.16011 EMD Millipore EMD Millipore', N'(S)-(-)-Phenylalanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-91-2', NULL, N'(S)-(-)-Phenylalanine for synthesis. CAS 63-91-2, pH 5.4 - 6.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Phe, 2-Amino-3-phenylpropionic acid', N'C9H11NO2', N'165.19 g/mol', N'200-568-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (49, 1, N'8.16012 EMD Millipore EMD Millipore', N'(2S,3R)-(-)-Threonine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-19-5', NULL, N'(2S,3R)-(-)-Threonine for synthesis. CAS 72-19-5, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Thr, 2-Amino-3-hydroxybutanoic acid', N'C4H9NO3', N'119.12 g/mol', N'200-774-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816012?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (50, 1, N'8.16013 EMD Millipore EMD Millipore', N'Glycine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-40-6', NULL, N'Glycine for synthesis. CAS 56-40-6, EC Number 200-272-2, chemical formula H2NCH2COOH., for synthesis', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816013?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (51, 1, N'8.16014 EMD Millipore EMD Millipore', N'(R)-(+)-Cysteine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'52-90-4', NULL, N'(R)-(+)-Cysteine for synthesis. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816014?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (52, 1, N'8.16016 EMD Millipore EMD Millipore', N'(S)-(+)-Glutamine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-85-9', NULL, N'(S)-(+)-Glutamine for synthesis. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816016?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (53, 1, N'8.16017 EMD Millipore EMD Millipore', N'(S)-(-)-Tryptophan', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-22-3', NULL, N'(S)-(-)-Tryptophan for synthesis. CAS 73-22-3, pH 5.5 - 7.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Trp', N'C11H12N2O2', N'204.23 g/mol', N'200-795-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816017?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (54, 1, N'8.16018 EMD Millipore EMD Millipore', N'(S)-(+)-Lysine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'657-27-2', NULL, N'(S)-(+)-Lysine monohydrochloride for synthesis. CAS 657-27-2, pH 5.5 - 6.0 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Lys', N'C6H15ClN2O2', N'182.64 g/mol', N'211-519-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816018?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (55, 1, N'8.16019 EMD Millipore EMD Millipore', N'(S)-(-)-Proline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'147-85-3', NULL, N'(S)-(-)-Proline for synthesis. CAS 147-85-3, pH 5 - 7 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Pro', N'C5H9NO2', N'115.13 g/mol', N'205-702-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816019?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (56, 1, N'8.16020 EMD Millipore EMD Millipore', N'(S)-(+)-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-45-1', NULL, N'(S)-(+)-Serine for synthesis. CAS 56-45-1, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'3-Hydroxy-L-alanine, Ser', N'C3H7NO3', N'105.09 g/mol', N'200-274-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816020?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (57, 1, N'8.16021 EMD Millipore EMD Millipore', N'(S)-(-)-Tyrosine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'60-18-4', NULL, N'(S)-(-)-Tyrosine for synthesis. CAS 60-18-4, pH 6.5 (0.1 g/l, H2O)., for synthesis', NULL, N'4-Hydroxyphenylalanine, Tyr', N'C9H11NO3', N'181.19 g/mol', N'200-460-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (58, 1, N'8.18263 EMD Millipore EMD Millipore', N'(+)-N-Formyl-D-tert-leucine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'92571-59-0', NULL, N'(+)-N-Formyl-D-tert-leucine for synthesis. CAS 92571-59-0, chemical formula (CH3)3CCH(NHCHO)COOH., for synthesis', NULL, N'(+)-N-Formyl-3-methyl-D-valine', N'C7H13NO3', N'159.18 g/mol', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/818263?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (59, 1, N'8.20649 EMD Millipore EMD Millipore', N'Hippuric acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 98.0 %', N'495-69-2', NULL, N'Hippuric acid for synthesis. CAS 495-69-2, pH 2.5 - 3.5 (10 g/l, H2O, 20 °C) (slurry)., for synthesis', NULL, N'Benzamidoacetic acid, Benzoylglycine, Benzoylaminoacetic acid', N'C9H9NO3', N'179.17 g/mol', N'207-806-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/820649?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (60, 1, N'8.41235 EMD Millipore EMD Millipore', N'DL-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'302-84-1', NULL, N'DL-Serine for synthesis. CAS 302-84-1, molar mass 105.09 g/mol., for synthesis', NULL, N'DL-2-Amino-3-hydroxypropionic acid, Ser', N'C3H7NO3', N'105.09 g/mol', N'206-130-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841235?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (61, 1, N'8.41505 EMD Millipore EMD Millipore', N'L-Norvaline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'6600-40-4', NULL, N'L-Norvaline for synthesis. CAS 6600-40-4, molar mass 117.15 g/mol., for synthesis', NULL, NULL, N'C5H11NO2', N'117.15 g/mol', N'229-543-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (62, 1, N'A6251 Sigma-Aldrich Sigma-Aldrich', N'N-Acetyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'87-32-1', NULL, N'', NULL, NULL, NULL, N'246.26', N'201-739-3', N'89478', N'24891071', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (63, 1, N'A7377 Sigma-Aldrich Sigma-Aldrich', N'D-Alanine', NULL, NULL, NULL, NULL, NULL, N'338-69-2', NULL, N'=98% (HPLC)', NULL, N'(R)-2-Aminopropionic acid', N'CH3CH(NH2)CO2H', N'89.09', N'206-418-1', N'1720249', N'24891121', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (64, 1, N'A7469 Sigma-Aldrich Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24891241', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (65, 1, N'A4349 SAFC SAFC', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24890849', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4349?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (66, 1, N'05129 Sigma-Aldrich Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (67, 1, N'A7502 Sigma-Aldrich Sigma-Aldrich', N'DL-Alanine', NULL, NULL, NULL, NULL, NULL, N'302-72-7', NULL, N'=99% (HPLC)', NULL, N'(±)-2-Aminopropionic acid', N'CH3CH(NH2)COOH', N'89.09', N'206-126-4', N'1720250', N'24891244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7502?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (68, 1, N'596906 Sigma-Aldrich Sigma-Aldrich', N'Algal amino acid mixture-15N,d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'97 atom % D, 98 atom % 15N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/596906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (69, 1, N'LAA21 Supelco Supelco', N'L-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa21?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (70, 1, N'LAA10 Supelco Supelco', N'L-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa10?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (71, 1, N'09416 Sigma-Aldrich Sigma-Aldrich', N'21 L-Amino acids + Glycine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'=99.0% (NT)', NULL, NULL, NULL, NULL, N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09416?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (72, 1, N'A9781 Supelco Supelco', N'Amino acid standards for protein hydrolysates', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9781?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (73, 1, N'A2908 Supelco Supelco', N'Amino acid standards for protein hydrolysates containing norleucine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a2908?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (74, 1, N'A6407 Supelco Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics and neutrals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6407?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (75, 1, N'A9906 Supelco Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics, neutrals, and basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (76, 1, N'A6282 Supelco Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6282?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (77, 1, N'A8094 Sigma-Aldrich Sigma-Aldrich', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'24891316', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8094?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (78, 1, N'A4474 SAFC SAFC', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'57653850', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (79, 1, N'11009 Sigma Sigma', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (80, 1, N'A5131 Sigma-Aldrich Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'reagent grade, =98% (HPLC), powder', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24890944', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a5131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (81, 1, N'A6969 Sigma-Aldrich Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'not synthetic, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24891160', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6969?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (82, 1, N'A4599 SAFC SAFC', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57653852', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (83, 1, N'11039 Sigma-Aldrich Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (84, 1, N'A4881 Sigma-Aldrich Sigma-Aldrich', N'DL-Arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'32042-43-6', NULL, N'=98% (TLC)', NULL, NULL, NULL, N'210.66', N'250-903-0', NULL, N'24890747', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4881?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (85, 1, N'RES10070-A7 SAFC SAFC', N'L-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'PharmaGrade, meets FCC testing specifications, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(S)-2-Aminosuccinic acid 4-amide,
		
	
		(S)-(+)-2-Aminosuccinamic acid,
		
	
		L-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'200-735-9', N'1723527', N'329824249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res10070a7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (86, 1, N'A8381 Sigma-Aldrich Sigma-Aldrich', N'L-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'=99% (TLC)', NULL, N'(S)-2-Aminosuccinic acid 4-amide,
		
	
		(S)-(+)-2-Aminosuccinamic acid,
		
	
		L-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'200-735-9', N'1723527', N'24891338', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8381?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (87, 1, N'A8131 Sigma-Aldrich Sigma-Aldrich', N'D-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-24-1', NULL, N'=99% (TLC)', NULL, N'(R)-2-Aminosuccinic acid 4-amide,
		
	
		(R)-(-)-2-Aminosuccinamic acid,
		
	
		(D)-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'218-163-3', N'1723526', N'24891320', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (88, 1, N'A5474 SAFC SAFC', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'24890976', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (89, 1, N'A8949 Sigma-Aldrich Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioXtra, =99% (HPLC)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'24891385', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8949?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (90, 1, N'11189 Sigma-Aldrich Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (91, 1, N'A9006 Sigma-Aldrich Sigma-Aldrich', N'DL-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'617-45-8', NULL, N'=99% (TLC)', NULL, N'(±)-2-Aminosuccinic acid', N'HOOCCH2CH(NH2)COOH', N'133.10', N'210-513-3', N'774618', N'24891394', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a9006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (92, 1, N'A2025 Sigma-Aldrich Sigma-Aldrich', N'DL-Aspartic acid potassium salt', NULL, NULL, NULL, NULL, NULL, N'14434-35-6', NULL, N'', NULL, NULL, N'C4H6NO4K', N'171.19', N'238-407-2', NULL, N'24890616', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2025?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (93, 1, N'B6766 Sigma-Aldrich Sigma-Aldrich', N'BME Amino Acids Solution 50×', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b6766?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (94, 1, N'30170 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'23537-25-9', NULL, N'=99.0% (T)', NULL, N'(R)-2-Amino-3-sulfopropionic acid', N'HO3SCH2CH(NH2)CO2H·H2O', N'187.17', NULL, N'3714036', N'24858207', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30170?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (95, 1, N'C5360 SAFC SAFC', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'PharmaGrade, Ajinomoto, from non-animal source, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'24892777', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5360?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (96, 1, N'30089 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (97, 1, N'C7880 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'reagent grade, =98% (TLC)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'24892992', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c7880?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (98, 1, N'C6852 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'from non-animal source, cell culture tested, meets EP, USP testing specifications', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'24892902', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c6852?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (99, 1, N'C5610 SAFC SAFC', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57654026', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5610?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (100, 1, N'30129 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (101, 1, N'C9768 Sigma-Aldrich Sigma-Aldrich', N'DL-Cysteine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'10318-18-0', NULL, N'=95% (TLC), anhydrous', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl', N'157.62', N'233-698-2', N'4150473', N'24893195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9768?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (102, 1, N'C7602 Sigma-Aldrich Sigma-Aldrich', N'L-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(R,R)-3,3''-Dithiobis(2-aminopropionicacid)', N'[-SCH2CH(NH2)CO2H]2', N'240.30', N'200-296-3', N'1728094', N'24892973', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c7602?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (103, 1, N'C8630 Sigma-Aldrich Sigma-Aldrich', N'DL-Cystine', NULL, NULL, NULL, NULL, NULL, N'923-32-0', NULL, N'', NULL, N'(±)-3,3''-Dithiobis(2-aminopropionicacid)', N'HOOCCH(NH2)CH2SSCH2CH(NH2)COOH', N'240.30', N'213-094-5', N'1728095', N'24893084', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c8630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (104, 1, N'RES1520C-A7 SAFC SAFC', N'L-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'PharmaGrade, EP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(R,R)-3,3''-Dithiobis(2-aminopropionicacid),
		
	
		L-Cystine', N'[-SCH2CH(NH2)CO2H]2', N'240.30', N'200-296-3', N'1728094', N'329824261', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1520ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (105, 1, N'RES1513C-A7 SAFC SAFC', N'L-Cystine dihydrochloride, non-animal derived', NULL, NULL, NULL, NULL, NULL, N'30925-07-6', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'L-Cystine dihydrochloride', NULL, N'313.22', N'250-391-9', NULL, N'329824260', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1513ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (106, 1, N'G5667 SAFC SAFC', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'PharmaGrade, Ajinomoto, EP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895223', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5667?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (107, 1, N'G8415 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-100.5%', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895340', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8415?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (108, 1, N'49449 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (109, 1, N'G1251 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895052', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (110, 1, N'G1126 Sigma-Aldrich Sigma-Aldrich', N'DL-Glutamic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'19285-83-7', NULL, N'=98% (HPLC)', NULL, N'(±)-2-Aminoglutaric acid,
		
	
		(±)-2-Aminopentanedioic acid', N'HOOCCH2CH2CH(NH2)COOH · H2O', N'165.14', N'210-522-2', N'4155097', N'24895039', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (111, 1, N'RES5063G-A7 SAFC SAFC', N'L-Glutamic acid, monosodium salt, Low Endotoxin', NULL, NULL, NULL, NULL, NULL, N'6106-04-3', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'L-2-Aminopentanedioic acid,
		
	
		L-Glutamic acid monosodium salt monohydrate,
		
	
		MSG,
		
	
		Sodium L-glutamate', N'NaOOCCH2CH2CH(NH2)COOH · H2O', N'187.13', N'205-538-1', N'4164348', N'329824272', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res5063ga7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (112, 1, N'G3126 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24277983', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g3126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (113, 1, N'G5792 SAFC SAFC', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'PharmaGrade, Ajinomoto, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24895232', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5792?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (114, 1, N'G8540 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'meets USP testing specifications, cell culture tested, 99.0-101.0%, from non-animal source', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24895342', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8540?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (115, 1, N'49419 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (116, 1, N'G5417 SAFC SAFC SAFC SAFC', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895210', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5417?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (117, 1, N'G7126 Sigma-Aldrich Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895290', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (118, 1, N'50046 Sigma-Aldrich Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (119, 1, N'G7403 Sigma-Aldrich Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioXtra, =99% (titration)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895306', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (120, 1, N'G8790 Sigma-Aldrich Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, =98.5%', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895353', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (121, 1, N'H3751 Sigma-Aldrich Sigma-Aldrich', N'D-Histidine', NULL, NULL, NULL, NULL, NULL, N'351-50-8', NULL, N'=98% (TLC)', NULL, N'(R)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		D-a-Amino-ß-(4-imidazolyl)propionic acid', NULL, N'155.15', N'206-513-8', N'84089', N'24895591', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (122, 1, N'H6034 Sigma-Aldrich Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'cell culture tested, meets EP, USP testing specifications, from non-animal source', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'24895728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6034?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (123, 1, N'H3911 SAFC SAFC', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57654248', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3911?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (124, 1, N'53319 Sigma-Aldrich Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (125, 1, N'53340 Sigma-Aldrich Sigma-Aldrich', N'L-Histidine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6027-02-7', NULL, N'=99.0% (AT)', NULL, NULL, NULL, N'228.08', N'227-890-5', N'6119230', N'57651406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53340?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (126, 1, N'H4036 SAFC SAFC', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'L-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'57654249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h4036?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (127, 1, N'53370 Sigma-Aldrich Sigma-Aldrich', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'=99.0% (AT)', NULL, N'L-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'329757872', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (128, 1, N'H7750 Sigma-Aldrich Sigma-Aldrich', N'DL-Histidine', NULL, NULL, NULL, NULL, NULL, N'4998-57-6', NULL, N'=99% (TLC)', NULL, N'(±)-2-Amino-3-(4-imidazolyl)propionic acid', NULL, N'155.15', N'225-660-9', N'7800', N'24895803', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7750?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (129, 1, N'H7875 Sigma-Aldrich Sigma-Aldrich', N'DL-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'123333-71-1', NULL, N'=99% (TLC)', NULL, N'DL-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', N'229-266-8', N'4161354', N'24895808', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (130, 1, N'H1007 Sigma-Aldrich Sigma-Aldrich', N'L-Homoarginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1483-01-8', NULL, N'unnatural arginine analog', NULL, N'(S)-2-Amino-6-guanidinohexanoic acid hydrochloride', N'H2NC(=NH)NH(CH2)4CH(NH2)CO2H · HCl', N'224.69', N'216-045-6', N'4016621', N'24895420', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h1007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (131, 1, N'69453 Sigma-Aldrich Sigma-Aldrich', N'L-Homocysteine', NULL, NULL, NULL, NULL, NULL, N'6027-13-0', NULL, N'=98.0% (NT)', NULL, N'(S)-2-Amino-4-mercaptobutyric acid', N'HSCH2CH2CH(NH2)COOH', N'135.18', N'227-891-0', NULL, N'329761669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/69453?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (132, 1, N'I5281 SAFC SAFC', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57654304', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i5281?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (133, 1, N'I7403 Sigma-Aldrich Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'24896115', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (134, 1, N'58879 Sigma-Aldrich Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (135, 1, N'L8543 Sigma-Aldrich Sigma-Aldrich', N'DL-Lanthionine', NULL, NULL, NULL, NULL, NULL, N'3183-08-2', NULL, N'=98% (TLC)', NULL, N'DL-3,3''-Thiodialanine,
		
	
		S-(2-Amino-2-carboxyethyl)-DL-cysteine', NULL, N'208.24', N'221-676-5', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8543?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (136, 1, N'L8912 Sigma-Aldrich Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'24896510', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8912?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (137, 1, N'L8000 Sigma-Aldrich Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'24896488', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (138, 1, N'L6914 SAFC SAFC SAFC', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57654329', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6914?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (139, 1, N'61819 Sigma-Aldrich Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (140, 1, N'L7875 Sigma-Aldrich Sigma-Aldrich', N'DL-Leucine', NULL, NULL, NULL, NULL, NULL, N'328-39-2', NULL, N'=99% (HPLC)', NULL, N'(±)-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'206-328-2', N'636005', N'24896484', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (141, 1, N'L8021 Sigma-Aldrich Sigma-Aldrich', N'D-Lysine', NULL, NULL, NULL, NULL, NULL, N'923-27-3', NULL, N'=98% (HPLC)', NULL, N'(R)-2,6-Diaminocaproic acid', N'H2N(CH2)4CH(NH2)CO2H', N'146.19', N'213-091-9', N'1722530', N'24896491', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (142, 1, N'L5876 Sigma-Aldrich Sigma-Aldrich', N'D-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'7274-88-6', NULL, N'=98% (TLC)', NULL, N'(R)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'230-691-6', N'4356907', N'24896421', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (143, 1, N'L1884 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine acetate salt', NULL, NULL, NULL, NULL, NULL, N'57282-49-2', NULL, N'=98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid', NULL, N'206.24', N'260-664-4', NULL, N'329817395', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l1884?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (144, 1, N'L5751 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-26-1', NULL, N'=98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid dihydrochloride', N'NH2(CH2)4CH(NH2)COOH · 2HCl', N'219.11', N'211-518-3', N'4539715', N'24896413', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (145, 1, N'L5626 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896408', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/l5626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (146, 1, N'L8662 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896502', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8662?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (147, 1, N'L7039 SAFC SAFC', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'57654336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (148, 1, N'62929 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (149, 1, N'L6001 Sigma-Aldrich Sigma-Aldrich', N'DL-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'70-53-1', NULL, N'=98% (HPLC)', NULL, N'DL-2,6-Diaminohexanoic acid monohydrochloride', N'NH2(CH2)4CH(NH2)COOH · HCl', N'182.65', N'200-739-0', N'4711993', N'24896425', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (150, 1, N'M5550 Sigma-Aldrich Sigma-Aldrich', N'MEM Amino Acids (50x) solution', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, liquid, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5550?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (151, 1, N'M9375 Sigma-Aldrich Sigma-Aldrich', N'D-Methionine', NULL, NULL, NULL, NULL, NULL, N'348-67-4', NULL, N'=98% (HPLC)', NULL, N'(R)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		D-2-Amino-4-(methylthio)butanoic acid', NULL, N'149.21', N'206-483-6', N'1722293', N'24897327', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (152, 1, N'M9625 Sigma-Aldrich Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'24897343', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/m9625?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (153, 1, N'M5308 Sigma-Aldrich Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'24896818', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5308?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (154, 1, N'M8439 SAFC SAFC', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57654418', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8439?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (155, 1, N'64319 Sigma-Aldrich Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (156, 1, N'M9500 Sigma-Aldrich Sigma-Aldrich', N'DL-Methionine', NULL, NULL, NULL, NULL, NULL, N'59-51-8', NULL, N'=99%', NULL, N'(±)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		DL-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)COOH', N'149.21', N'200-432-1', N'636185', N'24897336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9500?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (157, 1, N'75440 Sigma-Aldrich Sigma-Aldrich', N'L-Ornithine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6211-16-1', NULL, N'=99.0% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid dihydrochloride', NULL, N'205.08', N'228-277-5', N'4538819', N'329766423', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75440?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (158, 1, N'75469 Sigma-Aldrich Sigma-Aldrich', N'L-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (159, 1, N'P5482 Sigma-Aldrich Sigma-Aldrich', N'L-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-3-phenylpropionic acid', N'C6H5CH2CH(NH2)CO2H', N'165.19', N'200-568-1', N'1910408', N'24898657', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5482?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (160, 1, N'P8740 SAFC SAFC', N'L-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-phenylpropionic acid', N'C6H5CH2CH(NH2)CO2H', N'165.19', N'200-568-1', N'1910408', N'57654567', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8740?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (161, 1, N'P5607 Sigma-Aldrich Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'24898677', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5607?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (162, 1, N'P8865 SAFC SAFC', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57654568', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8865?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (163, 1, N'81709 Sigma-Aldrich Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (164, 1, N'R7131 Sigma-Aldrich Sigma-Aldrich', N'RPMI 1640 Amino Acids Solution (50×)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/r7131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (165, 1, N'RES0908S-A7 SAFC SAFC', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, JP, Manufactured under appropriate controls for use in pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'329824244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res0908sa7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (166, 1, N'S4311 Sigma-Aldrich Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'24899599', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4311?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (167, 1, N'84959 Sigma-Aldrich Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (168, 1, N'S4375 Sigma-Aldrich Sigma-Aldrich', N'DL-Serine', NULL, NULL, NULL, NULL, NULL, N'302-84-1', NULL, N'=98% (TLC)', NULL, N'(±)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)COOH', N'105.09', N'206-130-6', N'1721405', N'24899600', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (169, 1, N'SMB00395 Sigma-Aldrich Sigma-Aldrich', N'L-Theanine', NULL, NULL, NULL, NULL, NULL, N'3081-61-6', NULL, N'=98% (HPLC)', NULL, N'N?-Ethyl-L-glutamine,
		
	
		L-Glutamic acid ?-(ethylamide),
		
	
		Suntheanine', NULL, N'174.20', N'221-379-0', NULL, N'329824989', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/smb00395?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (170, 1, N'T8250 Sigma-Aldrich Sigma-Aldrich', N'D-Threonine', NULL, NULL, NULL, NULL, NULL, N'632-20-2', NULL, N'=98% (TLC)', NULL, N'(2R,3S)-2-Amino-3-hydroxybutyric acid,
		
	
		D-a-Amino-ß-hydroxybutyric acid', NULL, N'119.12', N'211-171-8', N'1721643', N'24900513', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (171, 1, N'T8441 Sigma-Aldrich Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'24900531', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8441?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (172, 1, N'T4071 SAFC SAFC', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57654668', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4071?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (173, 1, N'89179 Sigma-Aldrich Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (174, 1, N'T8375 Sigma-Aldrich Sigma-Aldrich', N'DL-Threonine', NULL, NULL, NULL, NULL, NULL, N'80-68-2', NULL, N'=95% (titration)', NULL, N'(±)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)COOH', N'119.12', N'201-300-6', N'1721647', N'24900522', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (175, 1, N'T8941 Sigma-Aldrich Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'24900575', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8941?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (176, 1, N'T4196 SAFC SAFC', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57654669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4196?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (177, 1, N'93659 Sigma-Aldrich Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (178, 1, N'T3300 Sigma-Aldrich Sigma-Aldrich', N'DL-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'54-12-6', NULL, N'=99% (HPLC)', NULL, N'(±)-a-Amino-3-indolepropionic acid,
		
	
		(±)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		DL-3ß-Indolylalanine', NULL, N'204.23', N'200-194-9', N'86199', N'24900128', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3300?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (179, 1, N'T3629 Sigma-Aldrich Sigma-Aldrich', N'DL-m-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'775-06-4', NULL, N'crystalline', NULL, N'(±)-2-Amino-3-(3-hydroxyphenyl)propionic acid,
		
	
		3-(3-Hydroxyphenyl)-DL-alanine', N'HOC6H4CH2CH(NH2)CO2H', N'181.19', N'212-270-9', N'2416853', N'24900153', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3629?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (180, 1, N'T8566 Sigma-Aldrich Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'24900543', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8566?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (181, 1, N'T4321 SAFC SAFC', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57654670', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4321?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (182, 1, N'93829 Sigma-Aldrich Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (183, 1, N'V0513 Sigma-Aldrich Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'24900696', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v0513?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (184, 1, N'V4638 SAFC SAFC', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57654728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v4638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (185, 1, N'94619 Sigma-Aldrich Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (186, 2, N'05159 Sigma-Aldrich Sigma-Aldrich', N'ß-Alanine', NULL, NULL, NULL, NULL, NULL, N'107-95-9', NULL, N'BioUltra, =99.0% (NT)', NULL, N'ß-Ala,
		
	
		3-Aminopropionic acid', N'NH2CH2CH2COOH', N'89.09', N'203-536-5', N'906793', N'329747648', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05159?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (187, 2, N'05129 Sigma-Aldrich Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (188, 2, N'11009 Sigma Sigma', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (189, 2, N'11039 Sigma-Aldrich Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (190, 2, N'11189 Sigma-Aldrich Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (191, 2, N'30089 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (192, 2, N'30129 Sigma-Aldrich Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (193, 2, N'49449 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (194, 2, N'49419 Sigma-Aldrich Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (195, 2, N'50046 Sigma-Aldrich Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (196, 2, N'50239 Sigma-Aldrich Sigma-Aldrich', N'Gly-Gly-Gly', NULL, NULL, NULL, NULL, NULL, N'556-33-2', NULL, N'BioUltra, =99.0% (NT)', NULL, N'Glycyl-glycyl-glycine,
		
	
		Triglycine', N'NH2CH2CONHCH2CONHCH2COOH', N'189.17', N'209-122-0', N'1711130', N'57651245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50239?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (197, 2, N'53319 Sigma-Aldrich Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (198, 2, N'58879 Sigma-Aldrich Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (199, 2, N'61819 Sigma-Aldrich Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (200, 2, N'62929 Sigma-Aldrich Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (201, 2, N'64319 Sigma-Aldrich Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (202, 2, N'75469 Sigma-Aldrich Sigma-Aldrich', N'L-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (203, 2, N'81709 Sigma-Aldrich Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (204, 2, N'84959 Sigma-Aldrich Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (205, 2, N'89179 Sigma-Aldrich Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (206, 2, N'93659 Sigma-Aldrich Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (207, 2, N'93829 Sigma-Aldrich Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (208, 2, N'94619 Sigma-Aldrich Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (962, 1, N'1.00289 EMD Millipore', N'L-Glutamine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 99.0 - 101.0 %', N'56-85-9', NULL, N'L-Glutamine for biochemistry. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for biochemistry', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100289?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (963, 1, N'1.00291 EMD Millipore', N'L-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): = 99.0 %', N'56-86-0', NULL, N'L-Glutamic acid for biochemistry. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for biochemistry', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100291?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (964, 1, N'1.00590 EMD Millipore', N'Glycine cryst.', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'56-40-6', NULL, N'EMPROVE® EXPERT Ph Eur,BP,JP,USP,  EMPROVE® EXPERT Ph Eur,BP,JP,USP', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100590?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (965, 1, N'1.01544 EMD Millipore', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'1119-34-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP, suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101544?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (966, 1, N'1.01587 EMD Millipore', N'L-Arginine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'74-79-3', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,JP,USP', NULL, N'Arg', N'C6H14N4O2', N'174.2 g/mol', N'200-811-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101587?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (967, 1, N'1.02735 EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'EMPROVE® ESSENTIAL Ph Eur,USP', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102735?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (968, 1, N'1.02836 EMD Millipore', N'L-Cystine', NULL, NULL, NULL, NULL, N'Assay (ex N, calc. on dried substance): 98.5 - 101.5 %', N'56-89-3', NULL, N'L-Cystine suitable for biopharmaceutical production FCC. CAS 56-89-3, molar mass 240.30 g/mol., suitable for biopharmaceutical production FCC', NULL, N'Cys', N'C6H12N2O4S2', N'240.30 g/mol', N'200-296-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102836?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (969, 1, N'1.02838 EMD Millipore', N'L-Cysteine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): = 99.0', N'52-90-4', NULL, N'L-Cysteine for biochemistry. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for biochemistry', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102838?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (970, 1, N'1.02839 EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'for biochemistry', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102839?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (971, 1, N'1.04351 EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 99.0 - 101.0 %', N'71-00-1', NULL, N'L-Histidine for biochemistry. CAS 71-00-1, pH 7.7 (10 g/l, H2O, 20 °C)., for biochemistry', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104351?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (972, 1, N'1.04352 EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 98.5 - 101.0 %', N'71-00-1', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP, suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104352?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (973, 1, N'1.04354 EMD Millipore', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'5934-29-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104354?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (974, 1, N'1.05701 EMD Millipore', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'657-27-2', NULL, N'EMPROVE® ESSENTIAL Ph Eur,BP,USP', NULL, N'Lys', N'C6H15ClN2O2', N'182.64 g/mol', N'211-519-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/105701?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (975, 1, N'106425 EMD Millipore', N'N-Acetyl-L-cysteine - CAS 616-91-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'616-91-1', NULL, N'Mucolytic agent and thiol-based antioxidant that has a protective effect against oxygen free radicals in early septic shock.', NULL, N'LNAC', N'C5H9NO3S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/106425?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (976, 1, N'1250 EMD Millipore', N'L-Alanine - CAS 56-41-7 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'A non-essential amino acid.', NULL, N'Ala', N'C3H7NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (977, 1, N'181003 EMD Millipore', N'L-Arginine, Hydrochloride - CAS 1119-34-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'', NULL, N'Arg, HCl', N'C6H14N4O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/181003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (978, 1, N'1820 EMD Millipore', N'L-Arginine, Free Base - CAS 74-79-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'Substrate for nitric oxide synthase. Reverses the inhibition of nitric oxide synthase caused by arginine analogs. Causes the release of insulin from pancreatic ß cells by a nitric oxide-dependent mechanism.', NULL, N'Arg', N'C6H14N4O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1820?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (979, 1, N'2240-OP EMD Millipore', N'OmniPur® Casamino Acids - CAS 65072-00-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'65072-00-6', NULL, N'', NULL, N'Casein', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2240op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (980, 1, N'243005 EMD Millipore', N'L-Cysteine, Free Base - CAS 52-90-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'Naturally-occurring non-essential amino acid.', NULL, N'Cys', N'C3H7NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/243005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (981, 1, N'2430-M EMD Millipore', N'L-Cysteine, Hydrochloride - CAS 52-89-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-89-1', NULL, N'', NULL, N'Cys, HCI', N'C3H7NO2S · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2430m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (982, 1, N'2470 EMD Millipore', N'L-Cystine - CAS 56-89-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'', NULL, N'(Cys)2', N'C6H12N2O4S2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2470?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (983, 1, N'356790 EMD Millipore', N'Glyphosine - CAS 2439-99-8 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'2439-99-8', NULL, N'A plant growth regulator that also enhances anti-B:9-23 TCR-dependent T cell activation by modulating murine class II MHC I-Ag7-mediated B:9-23 presentation on APCs.', NULL, N'Polaris, N,N-bis(Phosphonomethyl)glycine, 2-(bis(Phosphonomethyl)amino)acetic acid, Cp41845', N'C4H11NO8P2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/356790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (984, 1, N'3570 EMD Millipore', N'Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'A non-essential, optically inactive, non-chiral amino acid. Acts as an inhibitory neurotransmitter, particularly in brain stem and medulla.', NULL, N'Gly', N'C2H5NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/3570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (985, 1, N'4160 EMD Millipore', N'L-Isoleucine - CAS 73-32-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'An essential branched chain amino acid.', NULL, N'Ile', N'C6H13NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4160?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (986, 1, N'4330 EMD Millipore', N'L-Leucine - CAS 61-90-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'An essential branched chain amino acid.', NULL, N'Leu', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4330?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (987, 1, N'4400-M EMD Millipore', N'L-Lysine, Hydrochloride - CAS 657-27-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'An essential amino acid.', NULL, N'Lys, HCl', N'C6H14N2O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4400m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (988, 1, N'4500-M EMD Millipore', N'L-Methionine - CAS 63-68-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'An essential amino acid, useful as a methyl group donor.', NULL, N'Met', N'C5H11NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4500m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (989, 1, N'4810-OP EMD Millipore', N'OmniPur® Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'', NULL, N'Aminoacetic Acid', N'H2NCH2COOH', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4810op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (990, 1, N'5202 EMD Millipore', N'L-Phenylalanine - CAS 63-91-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'', NULL, N'Phe', N'C9H11NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5202?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (991, 1, N'5370 EMD Millipore', N'L-Proline - CAS 147-85-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'A non-essential amino acid. Precursor of hydroxyproline in collagen.', NULL, N'Pro', N'C5H9NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (992, 1, N'5450-OP EMD Millipore', N'OmniPur® L-Histidine - Calbiochem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5450op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (993, 1, N'561505 EMD Millipore', N'L-Selenomethionine - CAS 3211-76-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'3211-76-5', NULL, N'L Selenomethionine increases the expression of glutathione peroxidase.', NULL, N'SeMet', N'C5H11NO2Se', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/561505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (994, 1, N'5650 EMD Millipore', N'L-Serine - CAS 56-45-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'', NULL, N'Ser', N'C3H7NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5650?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (995, 1, N'6540-M EMD Millipore', N'L-Tryptophan - CAS 73-22-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'', NULL, N'Trp', N'C11H12N2O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6540m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (996, 1, N'6570 EMD Millipore', N'L-Tyrosine, Free Base - CAS 60-18-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'Non-essential amino acid for human development. Precursor for the synthesis of thyroid hormones and select neurotransmitters, such as dopamine and norepinephrine.', NULL, N'Tyr', N'C9H11NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (997, 1, N'8.14599 EMD Millipore', N'N-Acetyl-DL-valine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'3067-19-4', NULL, N'N-Acetyl-DL-valine for synthesis. CAS 3067-19-4, molar mass 159.18 g/mol., for synthesis', NULL, NULL, N'C7H13NO3', N'159.18 g/mol', N'221-321-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (998, 1, N'8.14986 EMD Millipore', N'DL-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'328-39-2', NULL, N'DL-Leucine for synthesis. CAS 328-39-2, molar mass 131.17 g/mol., for synthesis', NULL, N'DL-2-Aminmo-4-methylvalerianic acid, DL-2-Aminmo-4-methylpentanoic acid', N'C6H13NO2', N'131.17 g/mol', N'206-328-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814986?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (999, 1, N'8.16000 EMD Millipore', N'(S)-(+)-Alanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-41-7', NULL, N'(S)-(+)-Alanine for synthesis. CAS 56-41-7, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'2-Aminopropionic acid, Ala', N'C3H7NO2', N'89.09 g/mol', N'200-273-8', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1000, 1, N'8.16001 EMD Millipore', N'(S)-(+)-Arginine hydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'1119-34-2', NULL, N'(S)-(+)-Arginine hydrochloride for synthesis. CAS 1119-34-2, chemical formula C6H14N4O2*HCl., for synthesis', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1001, 1, N'8.16003 EMD Millipore', N'(S)-(+)-Aspartic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-84-8', NULL, N'(S)-(+)-Aspartic acid for synthesis. CAS 56-84-8, pH 2.5 - 3.5 (4 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-a-Aminosuccinic acid, L-alpha-Aminosuccinic acid, Asp', N'C4H7NO4', N'133.1 g/mol', N'200-291-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1002, 1, N'8.16004 EMD Millipore', N'(S)-(+)-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-86-0', NULL, N'(S)-(+)-Glutamic acid for synthesis. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for synthesis', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816004?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1003, 1, N'8.16005 EMD Millipore', N'(S)-(+)-Histidine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'5934-29-2', NULL, N'(S)-(+)-Histidine hydrochloride monohydrate for synthesis. CAS 5934-29-2, pH 3.5 - 4.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1004, 1, N'8.16006 EMD Millipore', N'(S)-(+)-Valine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-18-4', NULL, N'(S)-(+)-Valine for synthesis. CAS 72-18-4, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Val', N'C5H11NO2', N'117.15 g/mol', N'200-773-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1005, 1, N'8.16007 EMD Millipore', N'(S)-(-)-trans-4-Hydroxyproline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'51-35-4', NULL, N'(S)-(-)-trans-4-Hydroxyproline for synthesis. CAS 51-35-4, pH 5.5 - 6.5 (50 g/l, H2O, 20 °C)., for synthesis', NULL, N'L(-)-4-Hydroxypyrrolidine-2-carboxylic acid, Hyp', N'C5H9NO3', N'131.13 g/mol', N'200-091-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1006, 1, N'8.16008 EMD Millipore', N'(S)-(+)-Isoleucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-32-5', NULL, N'(S)-(+)-Isoleucine for synthesis. CAS 73-32-5, pH 5.5 - 6.5 (40 g/l, H2O, 20 °C)., for synthesis', NULL, N'iso-Leucine, Ile', N'C6H13NO2', N'131.17 g/mol', N'200-798-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816008?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1007, 1, N'8.16009 EMD Millipore', N'(S)-(+)-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'61-90-5', NULL, N'(S)-(+)-Leucine for synthesis. CAS 61-90-5, pH 5.5 - 6.5 (20 g/l, H2O, 20 °C)., for synthesis', NULL, N'Leu', N'C6H13NO2', N'131.18 g/mol', N'200-522-0', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1008, 1, N'8.16010 EMD Millipore', N'L-Methionine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-68-3', NULL, N'L-Methionine for synthesis. CAS 63-68-3, pH 5 - 7 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Met', N'C5H11NO2S', N'149.2 g/mol', N'200-562-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1009, 1, N'8.16011 EMD Millipore', N'(S)-(-)-Phenylalanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-91-2', NULL, N'(S)-(-)-Phenylalanine for synthesis. CAS 63-91-2, pH 5.4 - 6.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Phe, 2-Amino-3-phenylpropionic acid', N'C9H11NO2', N'165.19 g/mol', N'200-568-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1010, 1, N'8.16012 EMD Millipore', N'(2S,3R)-(-)-Threonine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-19-5', NULL, N'(2S,3R)-(-)-Threonine for synthesis. CAS 72-19-5, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Thr, 2-Amino-3-hydroxybutanoic acid', N'C4H9NO3', N'119.12 g/mol', N'200-774-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816012?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1011, 1, N'8.16013 EMD Millipore', N'Glycine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-40-6', NULL, N'Glycine for synthesis. CAS 56-40-6, EC Number 200-272-2, chemical formula H2NCH2COOH., for synthesis', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816013?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1012, 1, N'8.16014 EMD Millipore', N'(R)-(+)-Cysteine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'52-90-4', NULL, N'(R)-(+)-Cysteine for synthesis. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816014?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1013, 1, N'8.16016 EMD Millipore', N'(S)-(+)-Glutamine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-85-9', NULL, N'(S)-(+)-Glutamine for synthesis. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816016?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1014, 1, N'8.16017 EMD Millipore', N'(S)-(-)-Tryptophan', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-22-3', NULL, N'(S)-(-)-Tryptophan for synthesis. CAS 73-22-3, pH 5.5 - 7.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Trp', N'C11H12N2O2', N'204.23 g/mol', N'200-795-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816017?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1015, 1, N'8.16018 EMD Millipore', N'(S)-(+)-Lysine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'657-27-2', NULL, N'(S)-(+)-Lysine monohydrochloride for synthesis. CAS 657-27-2, pH 5.5 - 6.0 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Lys', N'C6H15ClN2O2', N'182.64 g/mol', N'211-519-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816018?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1016, 1, N'8.16019 EMD Millipore', N'(S)-(-)-Proline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'147-85-3', NULL, N'(S)-(-)-Proline for synthesis. CAS 147-85-3, pH 5 - 7 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Pro', N'C5H9NO2', N'115.13 g/mol', N'205-702-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816019?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1017, 1, N'8.16020 EMD Millipore', N'(S)-(+)-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-45-1', NULL, N'(S)-(+)-Serine for synthesis. CAS 56-45-1, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'3-Hydroxy-L-alanine, Ser', N'C3H7NO3', N'105.09 g/mol', N'200-274-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816020?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1018, 1, N'8.16021 EMD Millipore', N'(S)-(-)-Tyrosine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'60-18-4', NULL, N'(S)-(-)-Tyrosine for synthesis. CAS 60-18-4, pH 6.5 (0.1 g/l, H2O)., for synthesis', NULL, N'4-Hydroxyphenylalanine, Tyr', N'C9H11NO3', N'181.19 g/mol', N'200-460-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1019, 1, N'8.18263 EMD Millipore', N'(+)-N-Formyl-D-tert-leucine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'92571-59-0', NULL, N'(+)-N-Formyl-D-tert-leucine for synthesis. CAS 92571-59-0, chemical formula (CH3)3CCH(NHCHO)COOH., for synthesis', NULL, N'(+)-N-Formyl-3-methyl-D-valine', N'C7H13NO3', N'159.18 g/mol', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/818263?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1020, 1, N'8.20649 EMD Millipore', N'Hippuric acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 98.0 %', N'495-69-2', NULL, N'Hippuric acid for synthesis. CAS 495-69-2, pH 2.5 - 3.5 (10 g/l, H2O, 20 °C) (slurry)., for synthesis', NULL, N'Benzamidoacetic acid, Benzoylglycine, Benzoylaminoacetic acid', N'C9H9NO3', N'179.17 g/mol', N'207-806-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/820649?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1021, 1, N'8.41235 EMD Millipore', N'DL-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'302-84-1', NULL, N'DL-Serine for synthesis. CAS 302-84-1, molar mass 105.09 g/mol., for synthesis', NULL, N'DL-2-Amino-3-hydroxypropionic acid, Ser', N'C3H7NO3', N'105.09 g/mol', N'206-130-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841235?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1022, 1, N'8.41505 EMD Millipore', N'L-Norvaline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'6600-40-4', NULL, N'L-Norvaline for synthesis. CAS 6600-40-4, molar mass 117.15 g/mol., for synthesis', NULL, NULL, N'C5H11NO2', N'117.15 g/mol', N'229-543-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1023, 1, N'A6251 Sigma-Aldrich', N'N-Acetyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'87-32-1', NULL, N'', NULL, NULL, NULL, N'246.26', N'201-739-3', N'89478', N'24891071', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1024, 1, N'A7377 Sigma-Aldrich', N'D-Alanine', NULL, NULL, NULL, NULL, NULL, N'338-69-2', NULL, N'=98% (HPLC)', NULL, N'(R)-2-Aminopropionic acid', N'CH3CH(NH2)CO2H', N'89.09', N'206-418-1', N'1720249', N'24891121', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1025, 1, N'A7469 Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24891241', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1026, 1, N'A4349 SAFC', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24890849', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4349?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1027, 1, N'05129 Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1028, 1, N'A7502 Sigma-Aldrich', N'DL-Alanine', NULL, NULL, NULL, NULL, NULL, N'302-72-7', NULL, N'=99% (HPLC)', NULL, N'(±)-2-Aminopropionic acid', N'CH3CH(NH2)COOH', N'89.09', N'206-126-4', N'1720250', N'24891244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7502?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1029, 1, N'596906 Sigma-Aldrich', N'Algal amino acid mixture-15N,d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'97 atom % D, 98 atom % 15N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/596906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1030, 1, N'LAA21 Supelco', N'L-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa21?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1031, 1, N'LAA10 Supelco', N'L-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa10?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1032, 1, N'09416 Sigma-Aldrich', N'21 L-Amino acids + Glycine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'=99.0% (NT)', NULL, NULL, NULL, NULL, N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09416?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1033, 1, N'A9781 Supelco', N'Amino acid standards for protein hydrolysates', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9781?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1034, 1, N'A2908 Supelco', N'Amino acid standards for protein hydrolysates containing norleucine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a2908?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1035, 1, N'A6407 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics and neutrals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6407?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1036, 1, N'A9906 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics, neutrals, and basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1037, 1, N'A6282 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6282?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1038, 1, N'A8094 Sigma-Aldrich', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'24891316', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8094?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1039, 1, N'A4474 SAFC', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'57653850', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1040, 1, N'11009 Sigma', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1041, 1, N'A5131 Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'reagent grade, =98% (HPLC), powder', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24890944', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a5131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1042, 1, N'A6969 Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'not synthetic, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24891160', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6969?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1043, 1, N'A4599 SAFC', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57653852', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1044, 1, N'11039 Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1045, 1, N'A4881 Sigma-Aldrich', N'DL-Arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'32042-43-6', NULL, N'=98% (TLC)', NULL, NULL, NULL, N'210.66', N'250-903-0', NULL, N'24890747', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4881?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1046, 1, N'RES10070-A7 SAFC', N'L-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'PharmaGrade, meets FCC testing specifications, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(S)-2-Aminosuccinic acid 4-amide,
		
	
		(S)-(+)-2-Aminosuccinamic acid,
		
	
		L-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'200-735-9', N'1723527', N'329824249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res10070a7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1047, 1, N'A8381 Sigma-Aldrich', N'L-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'=99% (TLC)', NULL, N'(S)-2-Aminosuccinic acid 4-amide,
		
	
		(S)-(+)-2-Aminosuccinamic acid,
		
	
		L-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'200-735-9', N'1723527', N'24891338', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8381?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1048, 1, N'A8131 Sigma-Aldrich', N'D-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-24-1', NULL, N'=99% (TLC)', NULL, N'(R)-2-Aminosuccinic acid 4-amide,
		
	
		(R)-(-)-2-Aminosuccinamic acid,
		
	
		(D)-Aspartic acid 4-amide', N'NH2COCH2CH(NH2)COOH · H2O', N'150.13', N'218-163-3', N'1723526', N'24891320', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1049, 1, N'A5474 SAFC', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'24890976', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1050, 1, N'A8949 Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioXtra, =99% (HPLC)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'24891385', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8949?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1051, 1, N'11189 Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1052, 1, N'A9006 Sigma-Aldrich', N'DL-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'617-45-8', NULL, N'=99% (TLC)', NULL, N'(±)-2-Aminosuccinic acid', N'HOOCCH2CH(NH2)COOH', N'133.10', N'210-513-3', N'774618', N'24891394', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a9006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1053, 1, N'A2025 Sigma-Aldrich', N'DL-Aspartic acid potassium salt', NULL, NULL, NULL, NULL, NULL, N'14434-35-6', NULL, N'', NULL, NULL, N'C4H6NO4K', N'171.19', N'238-407-2', NULL, N'24890616', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2025?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1054, 1, N'B6766 Sigma-Aldrich', N'BME Amino Acids Solution 50×', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b6766?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1055, 1, N'30170 Sigma-Aldrich', N'L-Cysteic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'23537-25-9', NULL, N'=99.0% (T)', NULL, N'(R)-2-Amino-3-sulfopropionic acid', N'HO3SCH2CH(NH2)CO2H·H2O', N'187.17', NULL, N'3714036', N'24858207', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30170?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1056, 1, N'C5360 SAFC', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'PharmaGrade, Ajinomoto, from non-animal source, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'24892777', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5360?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1057, 1, N'30089 Sigma-Aldrich', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1058, 1, N'C7880 Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'reagent grade, =98% (TLC)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'24892992', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c7880?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1059, 1, N'C6852 Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'from non-animal source, cell culture tested, meets EP, USP testing specifications', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'24892902', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c6852?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1060, 1, N'C5610 SAFC', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57654026', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5610?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1061, 1, N'30129 Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1062, 1, N'C9768 Sigma-Aldrich', N'DL-Cysteine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'10318-18-0', NULL, N'=95% (TLC), anhydrous', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl', N'157.62', N'233-698-2', N'4150473', N'24893195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9768?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1063, 1, N'C7602 Sigma-Aldrich', N'L-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(R,R)-3,3''-Dithiobis(2-aminopropionicacid)', N'[-SCH2CH(NH2)CO2H]2', N'240.30', N'200-296-3', N'1728094', N'24892973', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c7602?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1064, 1, N'C8630 Sigma-Aldrich', N'DL-Cystine', NULL, NULL, NULL, NULL, NULL, N'923-32-0', NULL, N'', NULL, N'(±)-3,3''-Dithiobis(2-aminopropionicacid)', N'HOOCCH(NH2)CH2SSCH2CH(NH2)COOH', N'240.30', N'213-094-5', N'1728095', N'24893084', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c8630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1065, 1, N'RES1520C-A7 SAFC', N'L-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'PharmaGrade, EP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(R,R)-3,3''-Dithiobis(2-aminopropionicacid),
		
	
		L-Cystine', N'[-SCH2CH(NH2)CO2H]2', N'240.30', N'200-296-3', N'1728094', N'329824261', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1520ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1066, 1, N'RES1513C-A7 SAFC', N'L-Cystine dihydrochloride, non-animal derived', NULL, NULL, NULL, NULL, NULL, N'30925-07-6', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'L-Cystine dihydrochloride', NULL, N'313.22', N'250-391-9', NULL, N'329824260', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1513ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1067, 1, N'G5667 SAFC', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'PharmaGrade, Ajinomoto, EP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895223', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5667?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1068, 1, N'G8415 Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-100.5%', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895340', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8415?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1069, 1, N'49449 Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1070, 1, N'G1251 Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'24895052', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1071, 1, N'G1126 Sigma-Aldrich', N'DL-Glutamic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'19285-83-7', NULL, N'=98% (HPLC)', NULL, N'(±)-2-Aminoglutaric acid,
		
	
		(±)-2-Aminopentanedioic acid', N'HOOCCH2CH2CH(NH2)COOH · H2O', N'165.14', N'210-522-2', N'4155097', N'24895039', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1072, 1, N'RES5063G-A7 SAFC', N'L-Glutamic acid, monosodium salt, Low Endotoxin', NULL, NULL, NULL, NULL, NULL, N'6106-04-3', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'L-2-Aminopentanedioic acid,
		
	
		L-Glutamic acid monosodium salt monohydrate,
		
	
		MSG,
		
	
		Sodium L-glutamate', N'NaOOCCH2CH2CH(NH2)COOH · H2O', N'187.13', N'205-538-1', N'4164348', N'329824272', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res5063ga7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1073, 1, N'G3126 Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24277983', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g3126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1074, 1, N'G5792 SAFC', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'PharmaGrade, Ajinomoto, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24895232', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5792?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1075, 1, N'G8540 Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'meets USP testing specifications, cell culture tested, 99.0-101.0%, from non-animal source', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'24895342', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8540?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1076, 1, N'49419 Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1077, 1, N'G5417 SAFC', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895210', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5417?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1078, 1, N'G7126 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'ReagentPlus®, =99% (HPLC)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895290', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1079, 1, N'50046 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1080, 1, N'G7403 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioXtra, =99% (titration)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895306', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1081, 1, N'G8790 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, =98.5%', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'24895353', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1082, 1, N'H3751 Sigma-Aldrich', N'D-Histidine', NULL, NULL, NULL, NULL, NULL, N'351-50-8', NULL, N'=98% (TLC)', NULL, N'(R)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		D-a-Amino-ß-(4-imidazolyl)propionic acid', NULL, N'155.15', N'206-513-8', N'84089', N'24895591', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1083, 1, N'H6034 Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'cell culture tested, meets EP, USP testing specifications, from non-animal source', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'24895728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6034?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1084, 1, N'H3911 SAFC', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57654248', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3911?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1085, 1, N'53319 Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1086, 1, N'53340 Sigma-Aldrich', N'L-Histidine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6027-02-7', NULL, N'=99.0% (AT)', NULL, NULL, NULL, N'228.08', N'227-890-5', N'6119230', N'57651406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53340?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1087, 1, N'H4036 SAFC', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'L-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'57654249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h4036?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1088, 1, N'53370 Sigma-Aldrich', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'=99.0% (AT)', NULL, N'L-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'329757872', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1089, 1, N'H7750 Sigma-Aldrich', N'DL-Histidine', NULL, NULL, NULL, NULL, NULL, N'4998-57-6', NULL, N'=99% (TLC)', NULL, N'(±)-2-Amino-3-(4-imidazolyl)propionic acid', NULL, N'155.15', N'225-660-9', N'7800', N'24895803', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7750?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1090, 1, N'H7875 Sigma-Aldrich', N'DL-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'123333-71-1', NULL, N'=99% (TLC)', NULL, N'DL-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', N'229-266-8', N'4161354', N'24895808', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1091, 1, N'H1007 Sigma-Aldrich', N'L-Homoarginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1483-01-8', NULL, N'unnatural arginine analog', NULL, N'(S)-2-Amino-6-guanidinohexanoic acid hydrochloride', N'H2NC(=NH)NH(CH2)4CH(NH2)CO2H · HCl', N'224.69', N'216-045-6', N'4016621', N'24895420', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h1007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1092, 1, N'69453 Sigma-Aldrich', N'L-Homocysteine', NULL, NULL, NULL, NULL, NULL, N'6027-13-0', NULL, N'=98.0% (NT)', NULL, N'(S)-2-Amino-4-mercaptobutyric acid', N'HSCH2CH2CH(NH2)COOH', N'135.18', N'227-891-0', NULL, N'329761669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/69453?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1093, 1, N'I5281 SAFC', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57654304', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i5281?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1094, 1, N'I7403 Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'24896115', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1095, 1, N'58879 Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1096, 1, N'L8543 Sigma-Aldrich', N'DL-Lanthionine', NULL, NULL, NULL, NULL, NULL, N'3183-08-2', NULL, N'=98% (TLC)', NULL, N'DL-3,3''-Thiodialanine,
		
	
		S-(2-Amino-2-carboxyethyl)-DL-cysteine', NULL, N'208.24', N'221-676-5', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8543?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1097, 1, N'L8912 Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'24896510', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8912?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1098, 1, N'L8000 Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'24896488', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1099, 1, N'L6914 SAFC', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57654329', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6914?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1100, 1, N'61819 Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1101, 1, N'L7875 Sigma-Aldrich', N'DL-Leucine', NULL, NULL, NULL, NULL, NULL, N'328-39-2', NULL, N'=99% (HPLC)', NULL, N'(±)-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'206-328-2', N'636005', N'24896484', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1102, 1, N'L8021 Sigma-Aldrich', N'D-Lysine', NULL, NULL, NULL, NULL, NULL, N'923-27-3', NULL, N'=98% (HPLC)', NULL, N'(R)-2,6-Diaminocaproic acid', N'H2N(CH2)4CH(NH2)CO2H', N'146.19', N'213-091-9', N'1722530', N'24896491', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1103, 1, N'L5876 Sigma-Aldrich', N'D-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'7274-88-6', NULL, N'=98% (TLC)', NULL, N'(R)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'230-691-6', N'4356907', N'24896421', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1104, 1, N'L1884 Sigma-Aldrich', N'L-Lysine acetate salt', NULL, NULL, NULL, NULL, NULL, N'57282-49-2', NULL, N'=98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid', NULL, N'206.24', N'260-664-4', NULL, N'329817395', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l1884?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1105, 1, N'L5751 Sigma-Aldrich', N'L-Lysine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-26-1', NULL, N'=98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid dihydrochloride', N'NH2(CH2)4CH(NH2)COOH · 2HCl', N'219.11', N'211-518-3', N'4539715', N'24896413', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1106, 1, N'L5626 Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896408', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/l5626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1107, 1, N'L8662 Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896502', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8662?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1108, 1, N'L7039 SAFC', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'57654336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1109, 1, N'62929 Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1110, 1, N'L6001 Sigma-Aldrich', N'DL-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'70-53-1', NULL, N'=98% (HPLC)', NULL, N'DL-2,6-Diaminohexanoic acid monohydrochloride', N'NH2(CH2)4CH(NH2)COOH · HCl', N'182.65', N'200-739-0', N'4711993', N'24896425', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1111, 1, N'M5550 Sigma-Aldrich', N'MEM Amino Acids (50x) solution', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, liquid, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5550?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1112, 1, N'M9375 Sigma-Aldrich', N'D-Methionine', NULL, NULL, NULL, NULL, NULL, N'348-67-4', NULL, N'=98% (HPLC)', NULL, N'(R)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		D-2-Amino-4-(methylthio)butanoic acid', NULL, N'149.21', N'206-483-6', N'1722293', N'24897327', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1113, 1, N'M9625 Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'24897343', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/m9625?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1114, 1, N'M5308 Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'24896818', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5308?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1115, 1, N'M8439 SAFC', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57654418', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8439?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1116, 1, N'64319 Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1117, 1, N'M9500 Sigma-Aldrich', N'DL-Methionine', NULL, NULL, NULL, NULL, NULL, N'59-51-8', NULL, N'=99%', NULL, N'(±)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		DL-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)COOH', N'149.21', N'200-432-1', N'636185', N'24897336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9500?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1118, 1, N'75440 Sigma-Aldrich', N'L-Ornithine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6211-16-1', NULL, N'=99.0% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid dihydrochloride', NULL, N'205.08', N'228-277-5', N'4538819', N'329766423', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75440?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1119, 1, N'75469 Sigma-Aldrich', N'L-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1120, 1, N'P5482 Sigma-Aldrich', N'L-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-3-phenylpropionic acid', N'C6H5CH2CH(NH2)CO2H', N'165.19', N'200-568-1', N'1910408', N'24898657', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5482?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1121, 1, N'P8740 SAFC', N'L-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-phenylpropionic acid', N'C6H5CH2CH(NH2)CO2H', N'165.19', N'200-568-1', N'1910408', N'57654567', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8740?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1122, 1, N'P5607 Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'24898677', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5607?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1123, 1, N'P8865 SAFC', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57654568', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8865?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1124, 1, N'81709 Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1125, 1, N'R7131 Sigma-Aldrich', N'RPMI 1640 Amino Acids Solution (50×)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/r7131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1126, 1, N'RES0908S-A7 SAFC', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, JP, Manufactured under appropriate controls for use in pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'329824244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res0908sa7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1127, 1, N'S4311 Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'24899599', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4311?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1128, 1, N'84959 Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1129, 1, N'S4375 Sigma-Aldrich', N'DL-Serine', NULL, NULL, NULL, NULL, NULL, N'302-84-1', NULL, N'=98% (TLC)', NULL, N'(±)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)COOH', N'105.09', N'206-130-6', N'1721405', N'24899600', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1130, 1, N'SMB00395 Sigma-Aldrich', N'L-Theanine', NULL, NULL, NULL, NULL, NULL, N'3081-61-6', NULL, N'=98% (HPLC)', NULL, N'N?-Ethyl-L-glutamine,
		
	
		L-Glutamic acid ?-(ethylamide),
		
	
		Suntheanine', NULL, N'174.20', N'221-379-0', NULL, N'329824989', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/smb00395?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1131, 1, N'T8250 Sigma-Aldrich', N'D-Threonine', NULL, NULL, NULL, NULL, NULL, N'632-20-2', NULL, N'=98% (TLC)', NULL, N'(2R,3S)-2-Amino-3-hydroxybutyric acid,
		
	
		D-a-Amino-ß-hydroxybutyric acid', NULL, N'119.12', N'211-171-8', N'1721643', N'24900513', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1132, 1, N'T8441 Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'24900531', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8441?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1133, 1, N'T4071 SAFC', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57654668', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4071?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1134, 1, N'89179 Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1135, 1, N'T8375 Sigma-Aldrich', N'DL-Threonine', NULL, NULL, NULL, NULL, NULL, N'80-68-2', NULL, N'=95% (titration)', NULL, N'(±)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)COOH', N'119.12', N'201-300-6', N'1721647', N'24900522', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1136, 1, N'T8941 Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'24900575', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8941?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1137, 1, N'T4196 SAFC', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57654669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4196?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1138, 1, N'93659 Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1139, 1, N'T3300 Sigma-Aldrich', N'DL-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'54-12-6', NULL, N'=99% (HPLC)', NULL, N'(±)-a-Amino-3-indolepropionic acid,
		
	
		(±)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		DL-3ß-Indolylalanine', NULL, N'204.23', N'200-194-9', N'86199', N'24900128', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3300?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1140, 1, N'T3629 Sigma-Aldrich', N'DL-m-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'775-06-4', NULL, N'crystalline', NULL, N'(±)-2-Amino-3-(3-hydroxyphenyl)propionic acid,
		
	
		3-(3-Hydroxyphenyl)-DL-alanine', N'HOC6H4CH2CH(NH2)CO2H', N'181.19', N'212-270-9', N'2416853', N'24900153', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3629?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1141, 1, N'T8566 Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'24900543', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8566?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1142, 1, N'T4321 SAFC', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57654670', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4321?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1143, 1, N'93829 Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1144, 1, N'V0513 Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'24900696', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v0513?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1145, 1, N'V4638 SAFC', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57654728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v4638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1146, 1, N'94619 Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1147, 2, N'05159 Sigma-Aldrich', N'ß-Alanine', NULL, NULL, NULL, NULL, NULL, N'107-95-9', NULL, N'BioUltra, =99.0% (NT)', NULL, N'ß-Ala,
		
	
		3-Aminopropionic acid', N'NH2CH2CH2COOH', N'89.09', N'203-536-5', N'906793', N'329747648', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05159?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1148, 2, N'05129 Sigma-Aldrich', N'L-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopropionic acid,
		
	
		L-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1149, 2, N'11009 Sigma', N'L-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-5-guanidinopentanoic acid', N'H2NC(=NH)NH(CH2)3CH(NH2)CO2H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1150, 2, N'11039 Sigma-Aldrich', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-(+)-2-Amino-5-[(aminoiminomethyl)amino]pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1151, 2, N'11189 Sigma-Aldrich', N'L-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(S)-(+)-Aminosuccinic acid,
		
	
		(S)-Aminobutanedioic acid', N'HO2CCH2CH(NH2)CO2H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1152, 2, N'30089 Sigma-Aldrich', N'L-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(R)-2-Amino-3-mercaptopropionic acid', N'HSCH2CH(NH2)CO2H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1153, 2, N'30129 Sigma-Aldrich', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH2CH(NH2)COOH · HCl · H2O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1154, 2, N'49449 Sigma-Aldrich', N'L-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO2CCH2CH2CH(NH2)CO2H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1155, 2, N'49419 Sigma-Aldrich', N'L-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2,5-Diamino-5-oxopentanoic acid,
		
	
		L-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H2NCOCH2CH2CH(NH2)CO2H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1156, 2, N'50046 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH2CH2COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1157, 2, N'50239 Sigma-Aldrich', N'Gly-Gly-Gly', NULL, NULL, NULL, NULL, NULL, N'556-33-2', NULL, N'BioUltra, =99.0% (NT)', NULL, N'Glycyl-glycyl-glycine,
		
	
		Triglycine', N'NH2CH2CONHCH2CONHCH2COOH', N'189.17', N'209-122-0', N'1711130', N'57651245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50239?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1158, 2, N'53319 Sigma-Aldrich', N'L-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(4-imidazolyl)propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1159, 2, N'58879 Sigma-Aldrich', N'L-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2S,3S)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1160, 2, N'61819 Sigma-Aldrich', N'L-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-methylpentanoic acid', N'(CH3)2CHCH2CH(NH2)CO2H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1161, 2, N'62929 Sigma-Aldrich', N'L-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(S)-2,6-Diaminohexanoic acid monohydrochloride', N'H2N(CH2)4CH(NH2)CO2H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1162, 2, N'64319 Sigma-Aldrich', N'L-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-4-(methylmercapto)butyric acid,
		
	
		L-2-Amino-4-(methylthio)butanoic acid', N'CH3SCH2CH2CH(NH2)CO2H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1163, 2, N'75469 Sigma-Aldrich', N'L-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(S)-2,5-Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1164, 2, N'81709 Sigma-Aldrich', N'L-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-Pyrrolidine-2-carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1165, 2, N'84959 Sigma-Aldrich', N'L-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-hydroxypropionic acid', N'HOCH2CH(NH2)CO2H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1166, 2, N'89179 Sigma-Aldrich', N'L-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2S,3R)-2-Amino-3-hydroxybutyric acid', N'CH3CH(OH)CH(NH2)CO2H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1167, 2, N'93659 Sigma-Aldrich', N'L-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-2-Amino-3-(3-indolyl)propionic acid,
		
	
		L-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1168, 2, N'93829 Sigma-Aldrich', N'L-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(S)-2-Amino-3-(4-hydroxyphenyl)propionic acid,
		
	
		3-(4-Hydroxyphenyl)-L-alanine', N'4-(HO)C6H4CH2CH(NH2)CO2H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1169, 2, N'94619 Sigma-Aldrich', N'L-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(S)-a-Aminoisovaleric acid,
		
	
		L-2-Amino-3-methylbutanoic acid', N'(CH3)2CHCH(NH2)CO2H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1170, 14, N'A4375 Sigma-Aldrich', N'N-Acetyl-D-alanine', NULL, NULL, NULL, NULL, NULL, N'19436-52-3', NULL, N'', NULL, NULL, NULL, N'131.13', N'243-066-8', NULL, N'24890850', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1171, 14, N'A4625 Sigma-Aldrich', N'N-Acetyl-L-alanine', NULL, NULL, NULL, NULL, NULL, N'97-69-8', NULL, N'~99%', NULL, NULL, NULL, N'131.13', N'202-602-0', NULL, N'24890887', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4625?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1172, 14, N'A3133 Sigma-Aldrich', N'Na-Acetyl-L-arginine', NULL, NULL, NULL, NULL, NULL, N'155-84-0', NULL, N'', NULL, NULL, NULL, N'216.24', N'205-846-6', NULL, N'24890487', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3133?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1173, 14, N'A5625 Sigma-Aldrich', N'N-Acetyl-DL-aspartic acid', NULL, NULL, NULL, NULL, NULL, N'2545-40-6', NULL, N'=95%', NULL, NULL, NULL, N'175.14', N'219-827-5', NULL, N'24891002', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5625?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1174, 14, N'A1509 Sigma-Aldrich', N'Acetyl-DL-carnitine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2504-11-2', NULL, N'', NULL, N'(±)-3-Acetoxy-4-(trimethylammonio)butyrate hydrochloride', NULL, N'239.70', N'219-709-3', NULL, N'24890552', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1509?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1175, 14, N'A9125 Sigma-Aldrich', N'Na-Acetyl-L-glutamine', NULL, NULL, NULL, NULL, NULL, N'2490-97-3', NULL, N'', NULL, NULL, NULL, N'188.18', N'219-647-7', N'1727471', N'24891229', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a9125?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1176, 14, N'A0876 Sigma-Aldrich', N'N-Acetyl-D-leucine', NULL, NULL, NULL, NULL, NULL, N'19764-30-8', NULL, N'', NULL, NULL, NULL, N'173.21', NULL, NULL, N'24890460', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1177, 14, N'A0292 Sigma-Aldrich', N'N-Acetyl-L-leucine-p-nitroanilide', NULL, NULL, NULL, NULL, NULL, N'19746-40-8', NULL, N'', NULL, NULL, NULL, N'293.32', NULL, NULL, N'24890419', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0292?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1178, 14, N'A2010 Sigma-Aldrich', N'Na-Acetyl-L-lysine', NULL, NULL, NULL, NULL, NULL, N'1946-82-3', NULL, N'', NULL, NULL, N'H2N(CH2)4CH(NHCOCH3)CO2H', N'188.22', N'217-747-5', NULL, N'24890614', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1179, 14, N'A4021 Sigma-Aldrich', N'Ne-Acetyl-L-lysine', NULL, NULL, NULL, NULL, NULL, N'692-04-6', NULL, N'', NULL, NULL, N'CH3CONH(CH2)4CH(NH2)CO2H', N'188.22', N'211-725-9', NULL, N'24890737', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1180, 14, N'A1501 Sigma-Aldrich', N'N-Acetyl-D-methionine', NULL, NULL, NULL, NULL, NULL, N'1509-92-8', NULL, N'~99%', NULL, NULL, NULL, N'191.25', N'216-144-4', N'1725553', N'24890549', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1501?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1181, 14, N'A3626 Sigma-Aldrich', N'Na-Acetyl-L-ornithine', NULL, NULL, NULL, NULL, NULL, N'6205-08-9', NULL, N'', NULL, NULL, NULL, N'174.20', NULL, NULL, N'24890789', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1182, 14, N'01423 Sigma-Aldrich', N'N-Acetyl-D-penicillamine', NULL, NULL, NULL, NULL, NULL, N'15537-71-0', NULL, N'for HPLC derivatization, =99.0% (T)', NULL, N'N-Acetyl-3-mercapto-D-valine,
		
	
		NAP,
		
	
		NAPA', NULL, N'191.25', N'239-585-4', N'1724742', N'329747269', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/01423?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1183, 14, N'59891 Sigma-Aldrich', N'N-Acetyl-DL-ß-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'40638-98-0', NULL, N'=97.0% (HPLC)', NULL, N'(±)-3-(Acetylamino)-3-phenylpropionic acid,
		
	
		Hydrocinnamic acid', NULL, N'207.23', NULL, N'2726794', N'57651704', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/59891?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1184, 14, N'A3876 Sigma-Aldrich', N'N-Acetyl-D-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'10172-89-1', NULL, N'', NULL, NULL, NULL, N'207.23', N'233-447-7', NULL, N'24890820', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1185, 14, N'A4251 Sigma-Aldrich', N'N-Acetyl-L-phenylalanine ethyl ester', NULL, NULL, NULL, NULL, NULL, N'2361-96-8', NULL, N'', NULL, NULL, NULL, N'235.28', N'219-108-6', NULL, N'24890840', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1186, 14, N'A7512 Sigma-Aldrich', N'N-Acetyl-DL-phenylalanine ß-naphthyl ester', NULL, NULL, NULL, NULL, NULL, N'20874-31-1', NULL, N'', NULL, NULL, NULL, N'333.38', NULL, NULL, N'24891248', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7512?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1187, 14, N'A0783 Sigma-Aldrich', N'N-Acetyl-L-proline', NULL, NULL, NULL, NULL, NULL, N'68-95-1', NULL, N'', NULL, NULL, NULL, N'157.17', N'200-698-9', NULL, N'24890453', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0783?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1188, 14, N'A2638 Sigma-Aldrich', N'N-Acetyl-DL-serine', NULL, NULL, NULL, NULL, NULL, N'97-14-3', NULL, N'', NULL, NULL, NULL, N'147.13', NULL, NULL, N'24890681', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1189, 14, N'A6376 Sigma-Aldrich', N'N-Acetyl-L-tryptophan', NULL, NULL, NULL, NULL, NULL, N'1218-34-4', NULL, N'', NULL, NULL, NULL, N'246.26', N'214-935-9', NULL, N'24891081', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6376?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1190, 14, N'ARK2160C SAFC', N'N-Acetyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'87-32-1', NULL, N'PharmaGrade, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production., EP', NULL, NULL, NULL, N'246.26', NULL, N'89478', N'329773050', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/ark2160c?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1191, 14, N'A6501 Sigma-Aldrich', N'N-Acetyl-L-tryptophanamide', NULL, NULL, NULL, NULL, NULL, N'2382-79-8', NULL, N'', NULL, N'NATA', NULL, N'245.28', N'219-189-8', NULL, N'24891094', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6501?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1192, 14, N'T4446 SAFC', N'N-Acetyl-L-tyrosine', NULL, NULL, NULL, NULL, NULL, N'537-55-3', NULL, N'PharmaGrade, Ajinomoto, EP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, NULL, N'4-(HO)C6H4CH2CH(NHCOCH3)CO2H', N'223.23', N'208-671-3', N'2697172', N'57654671', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4446?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1193, 14, N'A6751 Sigma-Aldrich', N'N-Acetyl-L-tyrosine ethyl ester monohydrate', NULL, NULL, NULL, NULL, NULL, N'36546-50-6', NULL, N'', NULL, N'ATEE', NULL, N'269.29', N'212-663-5', N'2217900', N'24891134', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1194, 14, N'A7772 Sigma-Aldrich', N'S-(5''-Adenosyl)-L-cysteine', NULL, NULL, NULL, NULL, NULL, N'35899-53-7', NULL, N'', NULL, NULL, NULL, N'370.38', NULL, NULL, N'24891275', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7772?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1195, 14, N'A4377 Sigma', N'S-(5''-Adenosyl)-L-methionine iodide', NULL, NULL, NULL, NULL, NULL, N'3493-13-8', NULL, N'=80% (HPLC), =80% (spectrophotometric assay)', NULL, N'AdoMet,
		
	
		SAM', NULL, N'526.35', N'222-486-5', N'4120787', N'24890852', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1196, 14, N'05160 Sigma-Aldrich', N'ß-Alanine', NULL, NULL, NULL, NULL, NULL, N'107-95-9', NULL, N'BioXtra, =99.0% (NT)', NULL, N'ß-Ala,
		
	
		3-Aminopropionic acid,
		
	
		Beta-alanine', N'NH2CH2CH2COOH', N'89.09', N'203-536-5', N'906793', N'329747649', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05160?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1197, 14, N'A7652 Sigma-Aldrich', N'D-Alanine benzyl ester p-toluenesulfonate salt', NULL, NULL, NULL, NULL, NULL, N'41036-32-2', NULL, N'', NULL, NULL, N'C10H13NO2 · C7H8SO3', N'351.42', N'255-185-2', NULL, N'24891264', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7652?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1198, 14, N'A1139 Sigma-Aldrich', N'ß-Alanine benzyl ester p-toluenesulfonate salt', NULL, NULL, NULL, NULL, NULL, N'27019-47-2', NULL, N'', NULL, NULL, NULL, N'351.42', NULL, NULL, N'24890510', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1139?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1199, 14, N'A7877 Sigma-Aldrich', N'L-Alanine benzyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'5557-83-5', NULL, N'', NULL, NULL, NULL, N'215.68', N'226-920-4', NULL, N'24891287', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7877?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1200, 14, N'A3041 Sigma-Aldrich', N'ß-Alanine t-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'58620-93-2', NULL, N'', NULL, NULL, NULL, N'181.66', NULL, NULL, N'24890719', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3041?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1201, 14, N'A2005 Sigma-Aldrich', N'DL-Alaninol hydrochloride', NULL, NULL, NULL, NULL, NULL, N'17016-92-1', NULL, N'=98%, crystalline', NULL, N'2-Amino-1-propanol', NULL, N'111.57', NULL, NULL, N'24890612', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1202, 14, N'A8378 Sigma-Aldrich', N'DL-2-Allylglycine', NULL, NULL, NULL, NULL, NULL, N'7685-44-1', NULL, N'', NULL, N'(±)-2-Amino-4-pentenoic acid,
		
	
		DL-C-Allylglycine', N'H2C=CHCH2CH(NH2)CO2H', N'115.13', N'231-689-8', N'1748645', N'24891336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8378?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1203, 14, N'A8137 Sigma-Aldrich', N'D-Allylglycine', NULL, NULL, NULL, NULL, NULL, N'54594-06-8', NULL, N'', NULL, N'(R)-(+)-2-Amino-4-pentenoic acid,
		
	
		D-2-Amino-4-pentenoic acid', NULL, N'115.13', NULL, N'1721511', N'24891321', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8137?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1204, 14, N'A0879 Sigma-Aldrich', N'N-(4-Aminobenzoyl)-L-glutamic acid', NULL, NULL, NULL, NULL, NULL, N'4271-30-1', NULL, N'=98% (TLC)', NULL, N'N-(p-Aminobenzoyl)glutamic acid', NULL, N'266.25', N'224-261-7', N'2816320', N'24890463', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1205, 14, N'A0664 Sigma-Aldrich', N'4-Aminobutylphosphonic acid', NULL, NULL, NULL, NULL, NULL, N'35622-27-6', NULL, N'=99%', NULL, NULL, NULL, N'153.12', NULL, NULL, N'24890444', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0664?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1206, 14, N'A1879 Sigma-Aldrich', N'L-2-Aminobutyric acid', NULL, NULL, NULL, NULL, NULL, N'1492-24-6', NULL, N'=99% (titration)', NULL, N'L-a-Aminobutyric acid', NULL, N'103.12', N'216-083-3', N'1720935', N'24890595', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1207, 14, N'A2636 Sigma-Aldrich', N'S-(2-Aminoethyl)-L-cysteine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'4099-35-8', NULL, N'=98% (TLC)', NULL, N'L-4-Thialysine hydrochloride', NULL, N'200.69', N'223-862-1', N'3697262', N'24890680', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2636?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1208, 14, N'A5402 Sigma-Aldrich', N'L-2-Amino-3-guanidinopropionic acid hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1482-99-1', NULL, N'', NULL, N'L-a-Amino-ß-guanidinopropionic acid hydrochloride', NULL, N'182.61', N'216-044-0', N'6317820', N'24890971', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5402?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1209, 14, N'A1422 Sigma-Aldrich', N'p-Aminohippuric acid', NULL, NULL, NULL, NULL, NULL, N'61-78-9', NULL, N'=99%', NULL, N'4-Aminohippuric acid,
		
	
		N-(4-Aminobenzoyl)glycine', N'NH2C6H4C(O)NHCH2COOH', N'194.19', N'200-518-9', N'1213676', N'24890544', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1422?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1210, 14, N'A3759 Sigma-Aldrich', N'p-Aminohippuric acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'94-16-6', NULL, N'', NULL, N'N-(p-Aminobenzoyl)glycine', N'C9H9N2O3Na', N'216.17', N'202-309-8', NULL, N'24890806', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3759?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1211, 14, N'A9075 Sigma-Aldrich', N'(2S,3R)-3-Amino-2-hydroxy-4-phenylbutyric acid hydrochloride', NULL, NULL, NULL, NULL, NULL, N'128223-55-2', NULL, N'', NULL, N'(2S,3R)-AHPA', NULL, N'231.68', NULL, NULL, N'24891224', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a9075?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1212, 14, N'A7902 Sigma-Aldrich', N'2-Amino-2-norbornanecarboxylic acid', NULL, NULL, NULL, NULL, NULL, N'20448-79-7', NULL, N'amino acid transport inhibitor', NULL, N'2-Aminobicyclo[2.2.1]heptane-2-carboxylic acid,
		
	
		BCH', NULL, N'155.19', NULL, NULL, N'24891291', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7902?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1213, 14, N'A5338 Sigma-Aldrich', N'p-Amino-D-phenylalanine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'196408-63-6', NULL, N'', NULL, NULL, NULL, N'216.66', NULL, NULL, N'329770873', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5338?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1214, 14, N'A6553 Sigma-Aldrich', N'DL-2-Amino-5-phosphonovaleric acid lithium salt', NULL, NULL, NULL, NULL, NULL, N'125229-62-1', NULL, N'~95%', NULL, N'DL-2-Amino-5-phosphonopentanoic acid,
		
	
		AP-5', N'C5H11NO5PLi', N'203.06', NULL, NULL, N'24891104', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6553?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1215, 14, N'A3913 Sigma-Aldrich', N'L-Argininamide dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'14975-30-5', NULL, N'', NULL, NULL, NULL, N'246.14', NULL, NULL, N'24890827', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a3913?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1216, 14, N'A2883 Sigma-Aldrich', N'L-Arginine ethyl ester dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'36589-29-4', NULL, N'', NULL, NULL, NULL, N'275.18', NULL, NULL, N'24890700', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2883?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1217, 14, N'A1057 Sigma-Aldrich', N'L-Aspartic acid ß-(7-amido-4-methylcoumarin)', NULL, NULL, NULL, NULL, NULL, N'133628-73-6', NULL, N'fluorescent amino acid', NULL, N'L-Aspartic acid ß-(4-methyl-7-coumarinylamide),
		
	
		L-Aspartic acid 4-(4-methyl-7-coumarinylamide)', NULL, N'290.27', NULL, NULL, N'24890500', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1057?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1218, 14, N'B2129 Sigma-Aldrich', N'L-Aspartic acid ß-benzyl ester', NULL, NULL, NULL, NULL, NULL, N'2177-63-1', NULL, N'', NULL, N'ß-Benzyl L-aspartate,
		
	
		L-Aspartic acid 4-benzyl ester', N'C6H5CH2OCOCH2CH(NH2)COOH', N'223.23', N'218-541-8', N'1983183', N'24891628', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b2129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1219, 14, N'A0877 Sigma-Aldrich', N'L-Aspartic acid di-tert-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1791-13-5', NULL, N'', NULL, NULL, NULL, N'281.78', NULL, N'5652807', N'24890461', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a0877?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1220, 14, N'A6508 Sigma-Aldrich', N'L-Aspartic acid ß-hydroxamate', NULL, NULL, NULL, NULL, NULL, N'1955-68-6', NULL, N'serine racemase inhibitor', NULL, N'AAH,
		
	
		HDX,
		
	
		LAH', NULL, N'148.12', NULL, NULL, N'24891095', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6508?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1221, 14, N'A8291 Sigma-Aldrich', N'L-Aspartic acid ß-methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'16856-13-6', NULL, N'', NULL, NULL, NULL, N'183.59', N'240-880-5', NULL, N'24891327', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8291?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1222, 14, N'A1632 Sigma-Aldrich', N'DL-7-Azatryptophan hydrate', NULL, NULL, NULL, NULL, NULL, N'7303-50-6', NULL, N'', NULL, NULL, NULL, N'205.21', NULL, NULL, N'24890571', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a1632?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1223, 14, N'B4261 Sigma-Aldrich', N'Biocytin', NULL, NULL, NULL, NULL, NULL, N'576-19-2', NULL, N'=98% (TLC)', NULL, N'Bct,
		
	
		Ne-(+)-Biotinyl-L-lysine', NULL, N'372.48', NULL, N'97197', N'24891762', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b4261?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1224, 14, N'B1758 Sigma-Aldrich', N'Biocytin hydrochloride', NULL, NULL, NULL, NULL, NULL, N'98930-70-2', NULL, N'=98% (TLC)', NULL, N'Ne-Biotinyl-L-lysine', NULL, N'372.48 (free base basis)', NULL, NULL, N'24891609', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b1758?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1225, 14, N'C3205 Sigma-Aldrich', N'Na,Na-Bis(carboxymethyl)-L-lysine trifluoroacetate salt', NULL, NULL, NULL, NULL, NULL, N'160369-83-5', NULL, N'=95% (TLC)', NULL, N'N-(5-Amino-1-carboxypentyl)iminodiacetic acid', N'C10H18N2O6 · C2F3O2H', N'376.28', NULL, NULL, N'329775026', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c3205?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1226, 14, N'T4631 Sigma-Aldrich', N'N,N''-Bis(trifluoroacetyl)-L-lysine methyl ester', NULL, NULL, NULL, NULL, NULL, N'1478-74-6', NULL, N'~98% (Any lower purity will be indicated on the label.)', NULL, NULL, NULL, N'352.23', NULL, NULL, N'24900059', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4631?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1227, 14, N'B1403 Sigma-Aldrich', N'Boc-L-alaninal', NULL, NULL, NULL, NULL, NULL, N'79069-50-4', NULL, N'=98%', NULL, N'Boc-L-alanine aldehyde', NULL, N'173.21', NULL, NULL, N'24891592', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b1403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1228, 14, N'B7144 Sigma-Aldrich', N'a-Boc-Arg(N?-Mesitylenesulfonyl)-OH cyclohexylammonium salt', NULL, NULL, NULL, NULL, NULL, N'68262-71-5', NULL, N'', NULL, NULL, NULL, N'555.73', NULL, NULL, N'24891973', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b7144?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1229, 14, N'B7032 Sigma-Aldrich', N'Boc-5-Cyclohexylstatine', NULL, NULL, NULL, NULL, NULL, N'98105-45-4', NULL, N'=98% (TLC)', NULL, N'Boc-(3S,4S)-4-amino-5-cyclohexyl-3-hydroxypentanoic acid', NULL, N'315.41', NULL, NULL, N'24891969', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b7032?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1230, 14, N'B2511 Sigma-Aldrich', N'Boc-3,4-Dehydro-L-proline', NULL, NULL, NULL, NULL, NULL, N'51154-06-4', NULL, N'', NULL, NULL, NULL, N'213.23', NULL, NULL, N'24891653', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b2511?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1231, 14, N'B9266 Sigma-Aldrich', N'Boc-Ethylmercapto-L-cysteine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'25461-00-1', NULL, N'', NULL, NULL, NULL, N'462.71', NULL, NULL, N'329773315', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b9266?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1232, 14, N'B9003 Sigma-Aldrich', N'Boc-Glu-OBzl', NULL, NULL, NULL, NULL, NULL, N'30924-93-7', NULL, N'', NULL, N'Boc-L-glutamic acid 1-benzyl ester', NULL, N'337.37', NULL, N'2482076', N'24892112', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b9003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1233, 14, N'B2522 Sigma-Aldrich', N'Boc-Glu-OtBu', NULL, NULL, NULL, NULL, NULL, N'24277-39-2', NULL, N'', NULL, N'Boc-L-glutamic acid 1-tert-butyl ester', NULL, N'303.35', NULL, N'3653769', N'24891656', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b2522?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1234, 14, N'B4645 Sigma-Aldrich', N'Boc-Homoser-OH', NULL, NULL, NULL, NULL, NULL, N'41088-86-2', NULL, N'', NULL, N'Boc-L-homoserine', NULL, N'219.23', NULL, NULL, N'24891796', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b4645?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1235, 14, N'B8254 Sigma-Aldrich', N'Boc-Lys(Z)-OH', NULL, NULL, NULL, NULL, NULL, N'2389-45-9', NULL, N'', NULL, N'Na-Boc-Ne-Cbz-L-lysine,
		
	
		Na-Boc-Ne-Z-L-lysine,
		
	
		Ne-Z-Na-Boc-L-lysine', NULL, N'380.44', N'219-221-0', N'1917222', N'24892063', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b8254?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1236, 14, N'09794 Sigma-Aldrich', N'Boc-ß-Phe-OH', NULL, NULL, NULL, NULL, NULL, N'161024-80-2', NULL, N'=96.0% (HPLC)', NULL, N'(R)-3-(Boc-amino)-3-phenylpropionic acid,
		
	
		Boc-L-ß-phenylalanine', NULL, N'265.30', NULL, N'5404389', N'329748832', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/09794?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1237, 14, N'B5890 Sigma-Aldrich', N'S-tert-Butylmercapto-L-cysteine', NULL, NULL, NULL, NULL, NULL, N'30044-51-0', NULL, N'', NULL, N'3-(tert-Butyldithio)-L-alanine,
		
	
		S-(tert-Butylthio)-L-cysteine', NULL, N'209.33', N'250-012-7', N'2247500', N'24891874', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b5890?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1238, 14, N'B2519 Sigma-Aldrich', N'O-t-Butyl-L-tyrosine t-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'17083-23-7', NULL, N'', NULL, NULL, NULL, N'329.86', NULL, NULL, N'24891655', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b2519?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1239, 14, N'10942 Sigma-Aldrich', N'N-Butyryl-DL-homocysteine thiolactone', NULL, NULL, NULL, NULL, NULL, N'39837-08-6', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'187.26', NULL, NULL, N'57646863', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10942?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1240, 14, N'09945 Sigma-Aldrich', N'N-Butyryl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'98426-48-3', NULL, N'=96.0% (HPLC)', NULL, NULL, NULL, N'171.19', NULL, N'6375', N'329748866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09945?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1241, 14, N'C4375 Sigma-Aldrich', N'N-Carbamyl-L-glutamic acid', NULL, NULL, NULL, NULL, NULL, N'1188-38-1', NULL, N'', NULL, NULL, NULL, N'190.15', NULL, NULL, N'24892688', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c4375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1242, 14, N'C4272 Sigma-Aldrich', N'?-Carboxy-D-glutamic acid', NULL, NULL, NULL, NULL, NULL, N'64153-47-5', NULL, N'', NULL, NULL, NULL, N'191.14', NULL, NULL, N'24892682', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c4272?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1243, 14, N'C7757 Sigma-Aldrich', N'S-Carboxymethyl-L-cysteine', NULL, NULL, NULL, NULL, NULL, N'638-23-3', NULL, N'', NULL, NULL, NULL, N'179.19', N'211-327-5', N'1725012', N'24892985', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c7757?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1244, 14, N'C9500 Sigma-Aldrich', N'(±)-Carnitine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'461-05-2', NULL, N'=98% (TLC)', NULL, N'ß-Hydroxy-?-(trimethylammonio)butyrate hydrochloride,
		
	
		(±)-Carnitine chloride,
		
	
		DL-Carnitine hydrochloride', N'(CH3)3N(Cl)CH2CH(OH)CH2COOH', N'197.66', N'207-309-1', N'4163212', N'24893161', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9500?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1245, 14, N'C2253 Sigma-Aldrich', N'N-Chloroacetyl-L-valine', NULL, NULL, NULL, NULL, NULL, N'2279-16-5', NULL, N'', NULL, NULL, NULL, N'193.63', NULL, NULL, N'24892482', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c2253?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1246, 14, N'BOCCCK Sigma-Aldrich', N'Cholecystokinin Fragment Kit, Boc Protected', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/boccck?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1247, 14, N'C9650 Sigma-Aldrich', N'ß-Cyano-L-alanine', NULL, NULL, NULL, NULL, NULL, N'6232-19-5', NULL, N'=95%', NULL, NULL, NULL, N'114.10', NULL, NULL, N'24893182', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9650?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1248, 14, N'C3633 Sigma-Aldrich', N'Cystathionine', NULL, NULL, NULL, NULL, NULL, N'535-34-2', NULL, N'=90% (HPLC)', NULL, N'DL,DL-allo-Cystathionine,
		
	
		S-(2-Amino-2-carboxyethyl)homocysteine', N'HOOCCH(NH2)CH2CH2SCH2CH(NH2)COOH', N'222.26', N'208-613-7', NULL, N'24892630', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c3633?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1249, 14, N'C2196 Sigma-Aldrich', N'L-Cysteine S-sulfate', NULL, NULL, NULL, NULL, NULL, N'1637-71-4', NULL, N'=98% (TLC)', NULL, N'S-Sulfo-L-cysteine', NULL, N'201.22', NULL, N'1726832', N'24892471', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c2196?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1250, 14, N'D0125 Sigma-Aldrich', N'Dansyl-L-alanine cyclohexylammonium salt', NULL, NULL, NULL, NULL, NULL, N'53332-27-7', NULL, N'fluorescent amino acid', NULL, N'N-[[5-(Dimethylamino)-1-naphthalenyl]sulfonyl]- L-alanine cyclohexylammonium salt', NULL, N'421.55', N'258-478-3', NULL, N'329798584', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0125?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1251, 14, N'D0250 Sigma-Aldrich', N'a-Dansyl-L-arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'28217-22-3 (free base)', NULL, N'', NULL, NULL, NULL, N'443.95', N'248-904-6', NULL, N'24893219', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1252, 14, N'D0875 Sigma-Aldrich', N'Dansylglycine', NULL, NULL, NULL, NULL, NULL, N'1091-85-6', NULL, N'fluorescent amino acid', NULL, NULL, NULL, N'308.35', N'214-129-7', NULL, N'24893302', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1253, 14, N'D0756 Sigma-Aldrich', N'Dansyl-DL-norleucine cyclohexylammonium salt', NULL, NULL, NULL, NULL, NULL, N'84540-65-8', NULL, N'', NULL, NULL, NULL, N'463.63', N'283-160-6', NULL, N'329798636', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0756?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1254, 14, N'D2000 Sigma-Aldrich', N'N-Dansyl-L-serine cyclohexylammonium salt', NULL, NULL, NULL, NULL, NULL, N'53332-28-8', NULL, N'', NULL, NULL, NULL, N'437.55', N'258-479-9', NULL, N'24893587', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d2000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1255, 14, N'17248 Sigma-Aldrich', N'N-Decanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-36-2', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'255.35', NULL, N'1644700', N'57647621', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/17248?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1256, 14, N'D4893 Sigma-Aldrich', N'3,4-Dehydro-L-proline', NULL, NULL, NULL, NULL, NULL, N'4043-88-3', NULL, N'', NULL, N'(S)-3-Pyrroline-2-carboxylic acid,
		
	
		3,4-Didehydro-L-proline', NULL, N'113.11', N'223-738-7', N'5376764', N'24893903', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d4893?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1257, 14, N'D5018 Sigma-Aldrich', N'3,4-Dehydro-L-proline methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'51827-12-4', NULL, N'', NULL, NULL, NULL, N'163.60', NULL, NULL, N'24893916', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d5018?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1258, 14, N'19589 Sigma-Aldrich', N'L-2,4-Diaminobutyric acid monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1482-98-0', NULL, N'=98.0% (AT), =98.0% (TLC)', NULL, N'DAB', NULL, N'154.60', NULL, N'6086583', N'57647801', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/19589?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1259, 14, N'D3758 Sigma-Aldrich', N'DL-2,4-Diaminobutyric acid dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'65427-54-5', NULL, N'', NULL, NULL, N'NH2CH2CH2CH(NH2)COOH · 2HCl', N'191.06', N'265-774-6', N'4708499', N'24893779', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d3758?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1260, 14, N'D0778 Sigma-Aldrich', N'6-Diazo-5-oxo-D-norleucine', NULL, NULL, NULL, NULL, NULL, N'71629-86-2', NULL, N'', NULL, NULL, NULL, N'171.15', NULL, NULL, N'24893296', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0778?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1261, 14, N'D0629 Sigma-Aldrich', N'3,5-Diiodo-L-thyronine', NULL, NULL, NULL, NULL, NULL, N'1041-01-6', NULL, N'thyroid hormone analog', NULL, N'3,5-Diiodo-4-(4-hydroxyphenoxy)-L-phenylalanine,
		
	
		3,5-T2,
		
	
		O-(4-Hydroxyphenyl)-3,5-diiodo-L-tyrosine', NULL, N'525.08', N'213-867-7', N'2707891', N'24893248', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0629?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1262, 14, N'D0754 Sigma-Aldrich', N'3,5-Diiodo-L-tyrosine dihydrate', NULL, NULL, NULL, NULL, NULL, N'18835-59-1', NULL, N'crystalline', NULL, NULL, NULL, N'469.01', N'206-092-0', N'2218691', N'24893289', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d0754?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1263, 14, N'D6382 Sigma-Aldrich', N'N,N-Dimethylglycine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2491-06-7', NULL, N'', NULL, N'N,N-Dimethylaminoacetic acid hydrochloride', N'(CH3)2NCH2COOH · HCl', N'139.58', N'219-648-2', N'3910578', N'24894022', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d6382?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1264, 14, N'D9408 Sigma-Aldrich', N'L-5,5-Dimethylthiazolidine-4-carboxylic acid', NULL, NULL, NULL, NULL, NULL, N'72778-00-8', NULL, N'', NULL, N'DTC', NULL, N'161.22', NULL, NULL, N'24894292', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/d9408?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1265, 14, N'17247 Sigma-Aldrich', N'N-Dodecanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'18627-38-8', NULL, N'=97.0% (HPLC)', NULL, N'N-Lauroyl-DL-homoserine lactone', NULL, N'283.41', NULL, NULL, N'57647620', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/17247?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1266, 14, N'E6005 Sigma-Aldrich', N'Ethionamide', NULL, NULL, NULL, NULL, NULL, N'536-33-4', NULL, N'', NULL, N'2-Ethyl-4-pyridinecarbothioamide', NULL, N'166.24', N'208-628-9', NULL, N'24894350', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/e6005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1267, 14, N'E5139 Sigma-Aldrich', N'DL-Ethionine', NULL, NULL, NULL, NULL, NULL, N'67-21-0', NULL, N'=95% (TLC)', NULL, N'DL-2-Amino-4-(ethylthio)butyric acid', N'C2H5SCH2CH2CH(NH2)COOH', N'163.24', N'200-647-0', N'1722529', N'24894606', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/e5139?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1268, 14, N'F5126 Sigma-Aldrich', N'm-Fluoro-DL-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'456-88-2', NULL, N'', NULL, N'3-Fluoro-DL-phenylalanine', N'FC6H4CH2CH(NH2)COOH', N'183.18', N'220-104-1', N'2939807', N'24894882', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f5126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1269, 14, N'F4391 Sigma-Aldrich', N'p-Fluoro-D-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'18125-46-7', NULL, N'', NULL, N'4-Fluoro-D-phenylalanine', NULL, N'183.18', NULL, N'2416149', N'24894862', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f4391?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1270, 14, N'F5251 Sigma-Aldrich', N'p-Fluoro-DL-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'51-65-0', NULL, N'', NULL, NULL, N'FC6H4CH2CH(NH2)COOH', N'183.18', N'200-113-7', N'2938793', N'24894885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f5251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1271, 14, N'F7376 Sigma-Aldrich', N'4-Fluoro-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'25631-05-4', NULL, N'crystalline', NULL, NULL, NULL, N'222.22', NULL, NULL, N'24894938', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f7376?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1272, 14, N'F0896 Sigma-Aldrich', N'5-Fluoro-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'154-08-5', NULL, N'powder', NULL, NULL, NULL, N'222.22', N'205-822-5', N'22753', N'24894736', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f0896?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1273, 14, N'F4505 Sigma-Aldrich', N'm-Fluoro-DL-tyrosine', NULL, NULL, NULL, NULL, NULL, N'403-90-7', NULL, N'', NULL, NULL, N'FC6H3-4-(OH)CH2CH(NH2)CO2H', N'199.18', N'206-964-0', NULL, N'24894865', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f4505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1274, 14, N'95727 Sigma-Aldrich', N'Fmoc-D-Homoser(Trt)-OH', NULL, NULL, NULL, NULL, NULL, N'257886-01-4', NULL, N'=98.0% (HPLC)', NULL, N'Na-Fmoc-O-trityl-D-homoserine', NULL, N'583.67', NULL, NULL, N'57653697', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/95727?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1275, 14, N'F0148 Sigma-Aldrich', N'Fmoc-Ser(tBu)-ODhbt', NULL, NULL, NULL, NULL, NULL, N'109434-27-7', NULL, N'', NULL, N'Fmoc-O-tert-butyl-L-serine 3,4-dihydro-4-oxo-1,2,3-benzotriazin-3-ylester', NULL, N'528.56', NULL, N'4283373', N'24894352', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f0148?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1276, 14, N'F3377 Sigma-Aldrich', N'N-Formyl-L-methionine', NULL, NULL, NULL, NULL, NULL, N'4289-98-9', NULL, N'', NULL, N'fMet', NULL, N'177.22', NULL, NULL, N'24894839', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/f3377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1277, 14, N'G1763 Sigma-Aldrich', N'ß-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'1948-48-7', NULL, N'', NULL, N'3-Aminopentanedioic acid', NULL, N'147.13', NULL, NULL, N'24895076', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1763?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1278, 14, N'G7501 Sigma-Aldrich', N'L-Glutamic acid di-tert-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'32677-01-3', NULL, N'', NULL, NULL, NULL, N'295.80', NULL, N'3573738', N'24895307', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7501?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1279, 14, N'G2253 Sigma-Aldrich', N'L-Glutamic acid ?-monohydroxamate', NULL, NULL, NULL, NULL, NULL, N'1955-67-5', NULL, N'', NULL, N'L-?-Glutamylhydroxamic acid,
		
	
		L-5-N-Hydroxyglutamine', NULL, N'162.14', NULL, NULL, N'24895091', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g2253?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1280, 14, N'G5529 Sigma-Aldrich', N'L-Glutamic acid ?-(2,2,2-trichloroethyl) ester', NULL, NULL, NULL, NULL, NULL, N'92739-23-6', NULL, N'', NULL, NULL, NULL, N'278.52', NULL, NULL, N'24895218', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5529?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1281, 14, N'G9375 Sigma-Aldrich', N'L-Glutamine t-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'39741-62-3', NULL, N'crystalline', NULL, NULL, NULL, N'238.71', NULL, NULL, N'24895370', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g9375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1282, 14, N'G3894 Sigma-Aldrich', N'?-D-Glutamylaminomethylsulfonic acid', NULL, NULL, NULL, NULL, NULL, N'90237-02-8', NULL, N'', NULL, N'GAMS', NULL, N'240.23', NULL, NULL, N'24895142', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g3894?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1283, 14, N'50070 Sigma-Aldrich', N'Glycinamide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1668-10-6', NULL, N'=99.0% (AT)', NULL, NULL, N'NH2CH2CONH2 · HCl', N'110.54', N'216-789-1', N'3554199', N'329757566', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/50070?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1284, 14, N'G7251 Sigma-Aldrich', N'Glycine anhydride', NULL, NULL, NULL, NULL, NULL, N'106-57-0', NULL, N'cyclic dipeptide', NULL, N'2,5-Diketopiperazine,
		
	
		2,5-Piperazinedione', NULL, N'114.10', N'203-411-5', N'112112', N'24895298', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1285, 14, N'G3267 Sigma-Aldrich', N'Glycine benzyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2462-31-9', NULL, N'', NULL, N'Benzyl glycinate', NULL, N'201.65', NULL, NULL, N'24895118', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g3267?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1286, 14, N'G5761 Sigma-Aldrich', N'Glycine ß-naphthylamide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1208-12-4', NULL, N'', NULL, NULL, NULL, N'236.70', N'214-899-4', NULL, N'24895227', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5761?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1287, 14, N'G6503 Sigma', N'4-Guanidinobutyric acid', NULL, NULL, NULL, NULL, NULL, N'463-00-3', NULL, N'=98%', NULL, N'?-Guanidinobutyric acid', N'NH=C(NH2)NHCH2CH2CH2COOH', N'145.16', N'207-331-1', N'1766447', N'24895259', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g6503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1288, 14, N'G6878 Sigma-Aldrich', N'3-Guanidinopropionic acid', NULL, NULL, NULL, NULL, NULL, N'353-09-3', NULL, N'', NULL, N'ß-Guanidinopropionic acid', N'HN=C(NH2)NHCH2CH2COOH', N'131.13', N'206-530-0', N'1705262', N'24895277', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g6878?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1289, 14, N'10939 Sigma-Aldrich', N'N-Heptanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-26-0', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'213.27', NULL, NULL, N'57646861', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10939?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1290, 14, N'09926 Sigma-Aldrich', N'N-Hexanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-28-2', NULL, N'=97.0% (HPLC)', NULL, N'N-Caproyl-DL-homoserine lactone', NULL, N'199.25', NULL, N'1640340', N'329748862', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09926?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1291, 14, N'80666 Sigma-Aldrich', N'Hexarelin', NULL, NULL, NULL, NULL, NULL, N'140703-51-1', NULL, N'=90% (HPLC)', NULL, N'L-Histidyl-2-methyl-D-tryptophyl-L-alanyl-L-tryptophyl-D-phenylalanyl-L-lysinamide,
		
	
		Examorelin,
		
	
		HEX', NULL, N'887.04', NULL, NULL, N'329769022', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/80666?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1292, 14, N'H6759 Sigma-Aldrich', N'L-Histidine ß-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'7424-15-9', NULL, N'powder', NULL, NULL, NULL, N'280.32', N'231-052-4', NULL, N'24895761', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6759?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1293, 14, N'H6503 Sigma-Aldrich', N'L-Homocysteine thiolactone hydrochloride', NULL, NULL, NULL, NULL, NULL, N'31828-68-9', NULL, N'=98% (TLC)', NULL, N'L-2-Amino-4-mercaptobutyric acid 1,4-thiolactone hydrochloride', NULL, N'153.63', N'250-824-1', N'3911455', N'24895745', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1294, 14, N'H5134 Sigma-Aldrich', N'D-Homocystine', NULL, NULL, NULL, NULL, NULL, N'6027-15-2', NULL, N'', NULL, N'(R,R)-4,4''-Dithiobis(2-aminobutanoic acid)', NULL, N'268.35', NULL, NULL, N'24895672', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h5134?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1295, 14, N'H6010 Sigma-Aldrich', N'L-Homocystine', NULL, NULL, NULL, NULL, NULL, N'626-72-2', NULL, N'=98% (HPLC)', NULL, N'L-4,4''-Dithiobis(2-aminobutanoic acid)', NULL, N'268.35', N'210-962-5', N'1728583', N'24895724', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1296, 14, N'H0501 Sigma-Aldrich', N'DL-Homocystine', NULL, NULL, NULL, NULL, NULL, N'870-93-9', NULL, N'', NULL, N'meso-4,4''-Dithio-bis(2-aminobutanoic acid)', N'HOOCCH(NH2)CH2CH2SSCH2CH2CH(NH2)COOH', N'268.35', N'212-803-5', N'1728581', N'24895403', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h0501?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1297, 14, N'03768 Sigma-Aldrich', N'''L-ß-Homoproline'' hydrochloride', NULL, NULL, NULL, NULL, NULL, N'53912-85-9', NULL, N'=98.0% (TLC)', NULL, N'(S)-2-(2-Pyrrolidinyl)acetic acid hydrochloride', NULL, N'165.62', NULL, N'471672', N'329747805', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/03768?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1298, 14, N'H4021 Sigma-Aldrich', N'D-Homoserine', NULL, NULL, NULL, NULL, NULL, N'6027-21-0', NULL, N'', NULL, N'(R)-(+)-2-Amino-4-hydroxybutyric acid', N'HOCH2CH2CH(NH2)CO2H', N'119.12', NULL, N'1721680', N'24895614', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h4021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1299, 14, N'H7890 Sigma-Aldrich', N'L-Homoserine lactone hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2185-02-6', NULL, N'', NULL, NULL, NULL, N'137.56', NULL, NULL, N'24895811', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7890?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1300, 14, N'H0377 Sigma-Aldrich', N'DL-5-Hydroxylysine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'13204-98-3', NULL, N'', NULL, N'2,6-Diamino-5-hydroxycaproic acid hydrochloride,
		
	
		2,6-Diamino-5-hydroxyhexanoic acid hydrochloride', N'NH2CH2CH(OH)CH2CH2CH(NH2)COOH · HCl', N'198.65', N'236-168-9', N'3914368', N'24895397', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h0377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1301, 14, N'H4002 Sigma-Aldrich', N'DL-3-Hydroxynorvaline', NULL, NULL, NULL, NULL, NULL, N'2280-42-4', NULL, N'=98% (TLC)', NULL, N'a-Amino-ß-hydroxyvaleric acid,
		
	
		2-Amino-3-hydroxypentanoic acid,
		
	
		3-Hydroxy-2-aminopentanoic acid,
		
	
		DL-ß-Hydroxynorvaline,
		
	
		HNV', NULL, N'133.15', NULL, N'1722350', N'24895609', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h4002?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1302, 14, N'H5877 Sigma-Aldrich', N'cis-4-Hydroxy-D-proline', NULL, NULL, NULL, NULL, NULL, N'2584-71-6', NULL, N'', NULL, N'(2R,4R)-(+)-4-Hydroxy-2-pyrrolidinecarboxylic acid,
		
	
		D-allo-Hydroxyproline', NULL, N'131.13', N'219-963-5', N'81439', N'24895713', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h5877?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1303, 14, N'H1637 Sigma-Aldrich', N'cis-4-Hydroxy-L-proline', NULL, NULL, NULL, NULL, NULL, N'618-27-9', NULL, N'collagen synthesis inhibitor', NULL, N'(2S,4S)-(-)-4-Hydroxy-2-pyrrolidinecarboxylic acid,
		
	
		CHP', NULL, N'131.13', N'210-542-1', N'81440', N'24895470', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h1637?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1304, 14, N'H7259 Sigma-Aldrich', N'trans-4-Hydroxy-L-proline ß-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'3326-64-5', NULL, N'', NULL, N'HydroxyPro-betaNA', NULL, N'256.30', N'222-045-7', NULL, N'24895789', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7259?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1305, 15, N'10942 Sigma-Aldrich', N'N-Butyryl-DL-homocysteine thiolactone', NULL, NULL, NULL, NULL, NULL, N'39837-08-6', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'187.26', NULL, NULL, N'57646863', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10942?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1306, 15, N'09945 Sigma-Aldrich', N'N-Butyryl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'98426-48-3', NULL, N'=96.0% (HPLC)', NULL, NULL, NULL, N'171.19', NULL, N'6375', N'329748866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09945?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1307, 15, N'17248 Sigma-Aldrich', N'N-Decanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-36-2', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'255.35', NULL, N'1644700', N'57647621', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/17248?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1308, 15, N'17247 Sigma-Aldrich', N'N-Dodecanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'18627-38-8', NULL, N'=97.0% (HPLC)', NULL, N'N-Lauroyl-DL-homoserine lactone', NULL, N'283.41', NULL, NULL, N'57647620', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/17247?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1309, 15, N'10939 Sigma-Aldrich', N'N-Heptanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-26-0', NULL, N'=97.0% (HPLC)', NULL, NULL, NULL, N'213.27', NULL, NULL, N'57646861', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10939?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1310, 15, N'09926 Sigma-Aldrich', N'N-Hexanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-28-2', NULL, N'=97.0% (HPLC)', NULL, N'N-Caproyl-DL-homoserine lactone', NULL, N'199.25', NULL, N'1640340', N'329748862', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09926?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1311, 15, N'10940 Sigma-Aldrich', N'N-Octanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-30-6', NULL, N'=97.0% (HPLC)', NULL, N'N-Capryloyl-DL-homoserine lactone', NULL, N'227.30', NULL, N'1642628', N'57646862', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10940?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1312, 15, N'O9014 Sigma-Aldrich', N'N-(3-Oxodecanoyl)-L-homoserine lactone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, N'269.34', NULL, NULL, N'329818933', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o9014?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1313, 15, N'O9139 Sigma-Aldrich', N'N-(3-Oxododecanoyl)-L-homoserine lactone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'quorum sensing signaling molecule', NULL, N'3-Oxo-C12-HSL', NULL, N'297.39', NULL, NULL, N'329818935', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o9139?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1314, 15, N'O9264 Sigma-Aldrich', N'N-(3-Oxotetradecanoyl)-L-homoserine lactone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, N'325.44', NULL, NULL, N'329818937', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o9264?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1315, 15, N'10937 Sigma-Aldrich', N'N-Tetradecanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'98206-80-5', NULL, N'=97.0% (HPLC)', NULL, N'N-Myristoyl-DL-homoserine lactone', NULL, N'311.46', NULL, N'1649579', N'57646860', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10937?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1316, 16, N'I8757 Sigma-Aldrich', N'4-Iodo-L-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'24250-85-9', NULL, N'', NULL, N'(S)-2-Amino-3-(4-iodophenyl)propanoic acid', NULL, N'291.09', NULL, N'4411317', N'24896144', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i8757?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1317, 16, N'I7634 Sigma-Aldrich', N'D-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'319-78-8', NULL, N'=98% (TLC)', NULL, N'(2R, 3R)-2-Amino-3-methylpentanoic acid', N'C2H5CH(CH3)CH(NH2)CO2H', N'131.17', N'206-269-2', NULL, N'24896122', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i7634?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1318, 16, N'I0380 Sigma-Aldrich', N'D-allo-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'1509-35-9', NULL, N'', NULL, N'(2R,3S)-2-Amino-3-methylpentanoic acid', N'CH3CH2CH(CH3)CH(NH2)CO2H', N'131.17', N'216-143-9', N'1721794', N'24895900', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i0380?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1319, 16, N'I8754 Sigma-Aldrich', N'L-allo-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'1509-34-8', NULL, N'', NULL, N'(2S,3R)-2-Amino-3-methylpentanoic acid,
		
	
		L-Alloisoleucine', NULL, N'131.17', N'216-142-3', N'1721791', N'24896143', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i8754?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1320, 16, N'I4879 Sigma-Aldrich', N'L-Isoleucine ß-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'732-84-3', NULL, N'', NULL, NULL, NULL, N'256.34', NULL, NULL, N'24896063', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i4879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1321, 16, N'K2380 Sigma-Aldrich', N'D-Kynurenine', NULL, NULL, NULL, NULL, NULL, N'13441-51-5', NULL, N'', NULL, N'ß-Anthraniloyl-D-alanine,
		
	
		D-2-Amino-4-(2-aminophenyl)-4-oxobutanoic acid', NULL, N'208.21', NULL, NULL, N'24896220', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/k2380?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1322, 16, N'K3750 Sigma-Aldrich', N'L-Kynurenine sulfate salt', NULL, NULL, NULL, NULL, NULL, N'16055-80-4', NULL, N'crystalline', NULL, N'ß-Anthraniloyl-L-alanine,
		
	
		L-2-Amino-4-(2-aminophenyl)-4-oxobutanoic acid', N'C10H12N2O3 · H2SO4', N'306.29', NULL, NULL, N'24896233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/k3750?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1323, 16, N'L8543 Sigma-Aldrich', N'DL-Lanthionine', NULL, NULL, NULL, NULL, NULL, N'3183-08-2', NULL, N'=98% (TLC)', NULL, N'DL-3,3''-Thiodialanine,
		
	
		S-(2-Amino-2-carboxyethyl)-DL-cysteine', NULL, N'208.24', N'221-676-5', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8543?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1324, 16, N'61726 Sigma-Aldrich', N'N-Lauroyl-L-alanine', NULL, NULL, NULL, NULL, NULL, N'52558-74-4', NULL, N'=99.0% (TLC)', NULL, NULL, N'CH3(CH2)10CONHCH(CH3)COOH', N'271.40', NULL, N'1728158', N'329759671', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61726?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1325, 16, N'L8250 Sigma-Aldrich', N'DL-Leucinamide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'10466-60-1', NULL, N'', NULL, NULL, NULL, N'166.65', NULL, NULL, N'24896497', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1326, 16, N'L2125 Sigma-Aldrich', N'L-Leucine tert-butyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2748-02-9', NULL, N'', NULL, NULL, N'(CH3)2CHCH2CH(NH2)COOC(CH3)3 · HCl', N'223.74', NULL, N'3697141', N'24896301', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l2125?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1327, 16, N'L9384 Sigma-Aldrich', N'L-Leucine 3-carboxy-4-hydroxyanilide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'73801-31-7', NULL, N'', NULL, NULL, NULL, N'302.75', NULL, NULL, N'24896522', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l9384?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1328, 16, N'L1636 Sigma-Aldrich', N'L-Leucine chloromethyl ketone hydrochloride', NULL, NULL, NULL, NULL, NULL, N'54518-92-2', NULL, N'', NULL, N'Leu-CMK HCl', NULL, N'200.11', NULL, NULL, N'24896287', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l1636?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1329, 16, N'L0645 Sigma-Aldrich', N'L-Lysine methyl ester dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'26348-70-9', NULL, N'', NULL, NULL, NULL, N'233.14', N'247-625-7', NULL, N'24896262', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l0645?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1330, 16, N'L7002 Sigma-Aldrich', N'L-Lysine p-nitroanilide dihydrobromide', NULL, NULL, NULL, NULL, NULL, N'40492-96-4', NULL, N'', NULL, NULL, NULL, N'428.12', NULL, NULL, N'24896389', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7002?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1331, 16, N'M6635 Sigma-Aldrich', N'N-(2-Mercaptopropionyl)glycine', NULL, NULL, NULL, NULL, NULL, N'1953-02-2', NULL, N'', NULL, N'Tiopronin', N'CH3CH(SH)CONHCH2COOH', N'163.19', N'217-778-4', N'1859822', N'24897101', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6635?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1332, 16, N'64382 Sigma-Aldrich', N'DL-Methionine methylsulfonium chloride', NULL, NULL, NULL, NULL, NULL, N'3493-12-7', NULL, N'=99.0% (AT)', NULL, N'(3-Amino-3-carboxypropyl)dimethyl sulfonium chloride,
		
	
		MMS,
		
	
		Methyl-methionine sulphonium chloride,
		
	
		Vitamin U', NULL, N'199.70', N'222-484-4', N'4163617', N'57651981', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64382?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1333, 16, N'M3529 Sigma-Aldrich', N'L-Methionine p-nitroanilide', NULL, NULL, NULL, NULL, NULL, N'6042-04-2', NULL, N'', NULL, NULL, NULL, N'269.32', NULL, NULL, N'24896851', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m3529?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1334, 16, N'M0876 Sigma-Aldrich', N'L-Methionine sulfone', NULL, NULL, NULL, NULL, NULL, N'7314-32-1', NULL, N'', NULL, N'L-2-Amino-4-(methylsulfonyl)butanoic acid', NULL, N'181.21', N'230-774-7', N'1725510', N'24896574', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m0876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1335, 16, N'M1126 Sigma-Aldrich', N'L-Methionine sulfoxide', NULL, NULL, NULL, NULL, NULL, N'3226-65-1', NULL, N'', NULL, N'L-2-Amino-4-(methylsulfinyl)butanoic acid', NULL, N'165.21', N'221-758-0', N'4129939', N'24896617', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m1126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1336, 16, N'M3379 Sigma-Aldrich', N'DL-Methioninol', NULL, NULL, NULL, NULL, NULL, N'16720-80-2', NULL, N'=95%, viscous liquid', NULL, N'4-Methylmercapto-2-amino-1-butanol', NULL, N'135.23', NULL, NULL, N'24896835', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m3379?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1337, 16, N'M4001 Sigma-Aldrich', N'5-Methoxy-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'28052-84-8', NULL, N'', NULL, NULL, NULL, N'234.25', N'248-800-0', N'26781', N'24896893', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m4001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1338, 16, N'M4255 Sigma-Aldrich', N'3-Methoxy-L-tyrosine monohydrate', NULL, NULL, NULL, NULL, NULL, N'200630-46-2', NULL, N'powder', NULL, N'4-Hydroxy-3-methoxy-L-phenylalanine,
		
	
		L-3-O-Methyl-DOPA', NULL, N'229.23', NULL, NULL, N'24896916', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m4255?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1339, 16, N'M0506 Sigma-Aldrich', N'N-Methyl-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'600-21-5', NULL, N'', NULL, NULL, NULL, N'103.12', NULL, NULL, N'24896557', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m0506?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1340, 16, N'A4802 Sigma-Aldrich', N'Methyl 1-aminocyclopropanecarboxylate hydrochloride', NULL, NULL, NULL, NULL, NULL, N'72784-42-0', NULL, N'', NULL, N'1-Aminocyclopropanecarboxylic acid methyl ester hydrochloride', NULL, N'151.59', NULL, NULL, N'24890910', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4802?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1341, 16, N'A8754 Sigma-Aldrich', N'Methyl a-aminoisobutyrate hydrochloride', NULL, NULL, NULL, NULL, NULL, N'15028-41-8', NULL, N'', NULL, N'a-Aminoisobutyric acid methyl ester hydrochloride', NULL, N'153.61', NULL, NULL, N'24891362', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8754?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1342, 16, N'M2383 Sigma-Aldrich', N'a-(Methylamino)isobutyric acid', NULL, NULL, NULL, NULL, NULL, N'2566-34-9', NULL, N'=97% (titration)', NULL, N'2,N-Dimethylalanine,
		
	
		2-(Methylamino)-2-methylpropionic acid', N'CH3NHC(CH3)2COOH', N'117.15', N'219-898-2', N'1746984', N'24896726', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m2383?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1343, 16, N'A5575 Sigma-Aldrich', N'Methyl d-aminolevulinate hydrochloride', NULL, NULL, NULL, NULL, NULL, N'79416-27-6', NULL, N'=98% (TLC)', NULL, N'5-Amino-4-oxopentanoic acid methyl ester,
		
	
		5-Aminolevulinic acid methyl ester', NULL, N'181.62', N'279-151-1', NULL, N'24890995', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5575?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1344, 16, N'M6001 Sigma-Aldrich', N'a-Methyl-DL-aspartic acid', NULL, NULL, NULL, NULL, NULL, N'2792-66-7', NULL, N'', NULL, N'2-Amino-2-methylsuccinic acid', NULL, N'147.13', NULL, NULL, N'24897063', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1345, 16, N'M6126 Sigma-Aldrich', N'DL-threo-ß-Methylaspartic acid', NULL, NULL, NULL, NULL, NULL, N'6667-60-3', NULL, N'', NULL, N'2-Amino-3-methylsuccinic acid', NULL, N'147.13', NULL, NULL, N'24897077', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1346, 16, N'M6626 Sigma-Aldrich', N'S-Methyl-L-cysteine', NULL, NULL, NULL, NULL, NULL, N'1187-84-4', NULL, N'substrate for methionine sulfoxide reductase A', NULL, N'(R)-2-Amino-3-(methylmercapto)propionic acid,
		
	
		SMLC', N'CH3SCH2CH(NH2)CO2H', N'135.18', N'214-701-6', N'1721675', N'24897098', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1347, 16, N'M9005 Sigma-Aldrich', N'3-Methyl-L-histidine', NULL, NULL, NULL, NULL, NULL, N'368-16-1', NULL, N'', NULL, N'p-Methyl-L-histidine,
		
	
		1-Methyl-L-histidine (archaic),
		
	
		3-(1-Methylimidazol-5-yl)-L-alanine', NULL, N'169.18', N'206-704-6', NULL, N'24897303', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1348, 16, N'M4252 Sigma-Aldrich', N'a-Methyl-DL-methionine', NULL, NULL, NULL, NULL, NULL, N'2749-07-7', NULL, N'', NULL, N'Methionine antagonist', NULL, N'163.24', NULL, NULL, N'24896913', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m4252?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1349, 16, N'M4377 Sigma-Aldrich', N'a-Methyl-m-methoxy-DL-phenylalanine', NULL, NULL, NULL, NULL, NULL, N'2349-31-7', NULL, N'', NULL, NULL, NULL, N'209.24', NULL, NULL, N'24896920', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m4377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1350, 16, N'M8021 Sigma-Aldrich', N'N-Methyl-L-proline', NULL, NULL, NULL, NULL, NULL, N'475-11-6', NULL, N'', NULL, NULL, NULL, N'129.16', NULL, NULL, N'24897214', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1351, 16, N'M6877 Sigma-Aldrich', N'a-Methyl-DL-serine', NULL, NULL, NULL, NULL, NULL, N'5424-29-3', NULL, N'', NULL, NULL, NULL, N'119.12', N'226-565-5', NULL, N'24897122', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6877?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1352, 16, N'M7378 Sigma-Aldrich', N'O-Methyl-DL-serine', NULL, NULL, NULL, NULL, NULL, N'19794-53-7', NULL, N'', NULL, NULL, NULL, N'119.12', NULL, NULL, N'24897157', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m7378?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1353, 16, N'M1630 Sigma-Aldrich', N'O-Methyl-L-threonine', NULL, NULL, NULL, NULL, NULL, N'4144-02-9', NULL, N'', NULL, N'L-Threonine methyl ether', NULL, N'133.15', NULL, N'1722343', N'24896675', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m1630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1354, 16, N'M8502 Sigma-Aldrich', N'4-Methyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'1954-45-6', NULL, N'', NULL, NULL, NULL, N'218.25', N'217-785-2', NULL, N'24897264', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8502?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1355, 16, N'M0534 Sigma-Aldrich', N'5-Methyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'951-55-3', NULL, N'tryptophan analog', NULL, NULL, NULL, N'218.25', N'213-453-6', N'20225', N'24896560', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m0534?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1356, 16, N'M8752 Sigma-Aldrich', N'6-Methyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'2280-85-5', NULL, N'crystalline', NULL, NULL, NULL, N'218.25', N'218-916-6', N'17684', N'24897284', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8752?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1357, 16, N'M8379 Sigma-Aldrich', N'7-Methyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'17332-70-6', NULL, N'crystalline', NULL, NULL, NULL, N'218.25', NULL, NULL, N'24897247', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8379?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1358, 16, N'M8377 Sigma-Aldrich', N'a-Methyl-DL-tryptophan', NULL, NULL, NULL, NULL, NULL, N'153-91-3', NULL, N'crystalline', NULL, NULL, NULL, N'218.25', NULL, NULL, N'24897245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1359, 16, N'M9377 Sigma-Aldrich', N'N-Methyl-DL-valine', NULL, NULL, NULL, NULL, NULL, N'2566-32-7', NULL, N'', NULL, NULL, NULL, N'131.17', NULL, NULL, N'24897329', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1360, 16, N'M3756 Sigma-Aldrich', N'MTH-DL-Arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'3119-96-8', NULL, N'', NULL, NULL, NULL, N'265.76', NULL, NULL, N'24896870', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m3756?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1361, 16, N'M5131 Sigma-Aldrich', N'MTH-DL-Methionine', NULL, NULL, NULL, NULL, NULL, N'877-49-6', NULL, N'', NULL, NULL, NULL, N'204.31', NULL, NULL, N'24896979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1362, 16, N'M5631 Sigma-Aldrich', N'MTH-DL-Proline', NULL, NULL, NULL, NULL, NULL, N'1968-34-9', NULL, N'', NULL, NULL, NULL, N'170.23', NULL, NULL, N'24897026', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5631?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1363, 16, N'M6131 Sigma-Aldrich', N'MTH-DL-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'886-26-0', NULL, N'', NULL, NULL, NULL, N'236.29', NULL, NULL, N'24897078', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m6131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1364, 16, N'N5637 Sigma-Aldrich', N'3-(1-Naphthyl)-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'28095-56-9', NULL, N'', NULL, NULL, NULL, N'215.25', NULL, NULL, N'24897744', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5637?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1365, 16, N'N5762 Sigma-Aldrich', N'3-(2-Naphthyl)-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'14108-60-2', NULL, N'', NULL, NULL, NULL, N'215.25', NULL, NULL, N'24897750', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5762?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1366, 16, N'N2268 Sigma-Aldrich', N'N?-Nitro-L-arginine p-nitroanilide hydrobromide', NULL, NULL, NULL, NULL, NULL, N'85697-89-8', NULL, N'', NULL, NULL, NULL, N'420.22', NULL, NULL, N'24897564', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n2268?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1367, 16, N'N4503 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-alanine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'7675-46-9', NULL, N'crystalline', NULL, NULL, NULL, N'423.57', N'231-650-5', NULL, N'329818643', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1368, 16, N'N4753 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-?-aminobutyric acid (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'104809-33-8', NULL, N'powder', NULL, N'NPS-GABA', NULL, N'437.60', NULL, NULL, N'329818647', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4753?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1369, 16, N'N4878 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-asparagine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'7675-59-4', NULL, N'crystalline', NULL, NULL, NULL, N'466.59', NULL, NULL, N'329818649', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4878?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1370, 16, N'N5378 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)glycine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'7675-47-0', NULL, N'powder', NULL, NULL, NULL, N'409.54', N'231-651-0', NULL, N'329818654', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5378?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1371, 16, N'N5503 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-hydroxyproline (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'7675-54-9', NULL, N'', NULL, NULL, NULL, N'465.61', NULL, NULL, N'24897736', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1372, 16, N'N1390 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-serine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'2418-89-5', NULL, N'', NULL, NULL, NULL, N'439.57', NULL, NULL, N'329818575', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n1390?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1373, 16, N'N6503 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-threonine (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'14921-33-6', NULL, N'crystalline', NULL, NULL, NULL, N'453.60', NULL, NULL, N'24897676', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n6503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1374, 16, N'N6753 Sigma-Aldrich', N'N-(2-Nitrophenylsulfenyl)-L-tryptophan (dicyclohexylammonium) salt', NULL, NULL, NULL, NULL, NULL, N'7675-55-0', NULL, N'crystalline', NULL, NULL, NULL, N'538.70', NULL, NULL, N'24897789', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n6753?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1375, 16, N'N4140 Sigma-Aldrich', N'N-(3-Nitro-2-pyridinesulfenyl)-L-aspartic acid ß-t-butyl ester', NULL, NULL, NULL, NULL, NULL, N'108312-24-9', NULL, N'', NULL, NULL, NULL, N'343.36', NULL, NULL, N'24897670', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4140?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1376, 16, N'N5890 Sigma-Aldrich', N'N-(3-Nitro-2-pyridinesulfenyl)-O-t-butyl-L-tyrosine', NULL, NULL, NULL, NULL, NULL, N'76863-84-8', NULL, N'', NULL, NULL, NULL, N'391.44', NULL, NULL, N'24897759', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5890?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1377, 16, N'N4390 Sigma-Aldrich', N'N-(3-Nitro-2-pyridinesulfenyl)-L-glutamic acid ?-t-butyl ester', NULL, NULL, NULL, NULL, NULL, N'108312-25-0', NULL, N'', NULL, NULL, NULL, N'357.38', NULL, NULL, N'24897703', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4390?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1378, 16, N'N4765 Sigma-Aldrich', N'N-(3-Nitro-2-pyridinesulfenyl)-L-leucine', NULL, NULL, NULL, NULL, NULL, N'76863-77-9', NULL, N'', NULL, NULL, NULL, N'285.32', NULL, NULL, N'24897711', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n4765?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1379, 16, N'N5640 Sigma-Aldrich', N'Na-(3-Nitro-2-pyridinesulfenyl)-N-im-tosyl-L-histidine', NULL, NULL, NULL, NULL, NULL, N'108312-26-1', NULL, N'', NULL, NULL, NULL, N'463.49', NULL, NULL, N'24897745', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n5640?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1380, 16, N'N1018 Sigma-Aldrich', N'3-Nitro-L-tyrosine ethyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'66737-54-0', NULL, N'=99% (titration)', NULL, NULL, NULL, N'290.70', N'266-466-4', NULL, N'24897453', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n1018?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1381, 16, N'N6627 Sigma-Aldrich', N'D-Norleucine', NULL, NULL, NULL, NULL, NULL, N'327-56-0', NULL, N'', NULL, N'(R)-2-Aminocaproic acid,
		
	
		(R)-2-Aminohexanoic acid', NULL, N'131.17', N'206-320-9', N'1721749', N'24897785', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n6627?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1382, 16, N'N6877 Sigma-Aldrich', N'L-Norleucine', NULL, NULL, NULL, NULL, NULL, N'327-57-1', NULL, N'=98% (TLC)', NULL, N'(S)-(+)-2-Aminohexanoic acid,
		
	
		(S)-2-Aminocaproic acid', N'CH3(CH2)3CH(NH2)CO2H', N'131.17', N'206-321-4', N'1721750', N'24897796', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n6877?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1383, 16, N'N1398 Sigma-Aldrich', N'DL-Norleucine', NULL, NULL, NULL, NULL, NULL, N'616-06-8', NULL, N'', NULL, N'(±)-2-Aminocaproic acid,
		
	
		2-Aminohexanoic acid', N'CH3(CH2)3CH(NH2)COOH', N'131.17', N'210-462-7', N'1721748', N'24897485', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n1398?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1384, 16, N'N7627 Sigma-Aldrich', N'L-Norvaline', NULL, NULL, NULL, NULL, NULL, N'6600-40-4', NULL, N'arginase inhibitor', NULL, N'(S)-2-Aminovaleric acid,
		
	
		(S)-(+)-2-Aminopentanoic acid', N'CH3CH2CH2CH(NH2)CO2H', N'117.15', N'229-543-3', N'1721162', N'24897833', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n7627?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1385, 16, N'N7502 Sigma-Aldrich', N'DL-Norvaline', NULL, NULL, NULL, NULL, NULL, N'760-78-1', NULL, N'', NULL, N'(±)-2-Aminopentanoic acid', N'CH3CH2CH2CH(NH2)COOH', N'117.15', N'212-082-7', N'1721163', N'24897829', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/n7502?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1386, 16, N'10940 Sigma-Aldrich', N'N-Octanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'106983-30-6', NULL, N'=97.0% (HPLC)', NULL, N'N-Capryloyl-DL-homoserine lactone', NULL, N'227.30', NULL, N'1642628', N'57646862', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10940?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1387, 16, N'O5250 Sigma-Aldrich', N'D-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'16682-12-5', NULL, N'~98%', NULL, N'(R)-2,5-Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'240-729-3', N'4153339', N'24898012', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o5250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1388, 16, N'O7125 Sigma-Aldrich', N'L-Ornithine L-aspartate salt', NULL, NULL, NULL, NULL, NULL, N'3230-94-2', NULL, N'powder', NULL, N'(S)-2,5-Diaminopentanoic acid L-aspartate salt', NULL, N'265.26', N'221-772-7', NULL, N'329818920', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o7125?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1389, 16, N'O6254 Sigma-Aldrich', N'(R)-(-)-2-Oxothiazolidine-4-carboxylic acid', NULL, NULL, NULL, NULL, NULL, N'19771-63-2', NULL, N'=98% (titration), =97% (TLC)', NULL, N'L-(-)-2-Oxothiazolidine-4-carboxylic acid', NULL, N'147.15', NULL, N'4179169', N'24898032', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/o6254?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1390, 16, N'P1883 Sigma-Aldrich', N'L-Phenylalaninamide', NULL, NULL, NULL, NULL, NULL, N'5241-58-7', NULL, N'', NULL, NULL, NULL, N'164.20', NULL, N'6270941', N'24898253', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1883?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1391, 16, N'79710 Sigma-Aldrich', N'O-Phospho-DL-serine', NULL, NULL, NULL, NULL, NULL, N'17885-08-4', NULL, N'=98.0% (NT)', NULL, N'DL-2-Amino-3-hydroxypropanoic acid 3-phosphate,
		
	
		DL-SOP,
		
	
		DL-Serine monophosphoric acid', NULL, N'185.07', N'241-834-7', N'1726828', N'57652815', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/79710?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1392, 16, N'P1053 Sigma-Aldrich', N'O-Phospho-L-threonine', NULL, NULL, NULL, NULL, NULL, N'1114-81-4', NULL, N'', NULL, N'(S)-2-Amino-3-hydroxybutanoic acid 3-phosphate,
		
	
		L-Threonine O-phosphate', NULL, N'199.10', N'214-217-5', N'1727078', N'24898147', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1053?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1393, 16, N'P9405 Sigma-Aldrich', N'O-Phospho-L-tyrosine', NULL, NULL, NULL, NULL, NULL, N'21820-51-9', NULL, N'', NULL, N'L-3-(4-Hydroxyphenyl)alanine 4''-phosphate,
		
	
		L-Tyrosine-O-phosphate', NULL, N'261.17', NULL, N'3150815', N'24899034', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9405?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1394, 16, N'P4628 Sigma-Aldrich', N'N-Phthaloyl-DL-methionine', NULL, NULL, NULL, NULL, NULL, N'52881-96-6', NULL, N'', NULL, NULL, NULL, N'279.31', NULL, NULL, N'24898561', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4628?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1395, 16, N'P2519 Sigma-Aldrich', N'L-Pipecolic acid', NULL, NULL, NULL, NULL, NULL, N'3105-95-1', NULL, N'99% (titration)', NULL, N'(S)-(-)-2-Piperidinecarboxylic acid,
		
	
		L-Homoproline', NULL, N'129.16', N'221-462-1', N'81093', N'24898330', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2519?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1396, 16, N'03567 Sigma-Aldrich', N'(S)-2-Piperazinecarboxylic acid dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'158663-69-5', NULL, N'=98.0% (T)', NULL, NULL, NULL, N'203.07', NULL, N'7312035', N'329747733', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/03567?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1397, 16, N'P5010 Sigma-Aldrich', N'L-Prolinamide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'42429-27-6', NULL, N'', NULL, NULL, NULL, N'150.61', N'255-818-2', N'3693546', N'24898579', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1398, 16, N'P7764 Sigma-Aldrich', N'L-Proline t-butyl ester', NULL, NULL, NULL, NULL, NULL, N'2812-46-6', NULL, N'', NULL, NULL, NULL, N'171.24', N'220-558-0', NULL, N'24898875', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7764?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1399, 16, N'P1380 Sigma-Aldrich', N'L-Proline ß-naphthylamide hydrochloride', NULL, NULL, NULL, NULL, NULL, N'97216-16-5', NULL, N'=99%', NULL, NULL, NULL, N'276.76', NULL, NULL, N'24898192', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1380?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1400, 16, N'P5267 Sigma-Aldrich', N'L-Proline p-nitroanilide trifluoroacetate salt', NULL, NULL, NULL, NULL, NULL, N'108321-19-3', NULL, N'prolyl aminopeptidase substrate', NULL, N'N-(4-Nitrophenyl)pyrrolidine-2-carboxamide,
		
	
		P-pNA,
		
	
		Pro-pNA', NULL, N'349.26', NULL, NULL, N'329820223', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5267?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1401, 16, N'P7888 Sigma-Aldrich', N'DL-Propargylglycine', NULL, NULL, NULL, NULL, NULL, N'64165-64-6', NULL, N'cystathionine ?-lyase inhibitor', NULL, N'2-Amino-4-pentynoic acid,
		
	
		PAG', NULL, N'113.11', NULL, NULL, N'24898885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7888?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1402, 16, N'81838 Sigma-Aldrich', N'L-C-Propargylglycine', NULL, NULL, NULL, NULL, NULL, N'23235-01-0', NULL, N'=99.0% (TLC)', NULL, N'(S)-2-Amino-4-pentynoic acid,
		
	
		L-Propargylglycine', NULL, N'113.11', NULL, N'2347861', N'57652892', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81838?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1403, 16, N'P5960 Sigma-Aldrich', N'L-Pyroglutamic acid', NULL, NULL, NULL, NULL, NULL, N'98-79-3', NULL, N'BioXtra', NULL, N'(S)-(-)-2-Pyrrolidone-5-carboxylic acid,
		
	
		(S)-5-Oxo-2-pyrrolidinecarboxylic acid', NULL, N'129.11', N'202-700-3', N'82132', N'24898722', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5960?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1404, 16, N'P5891 Sigma-Aldrich', N'L-Pyroglutamic acid 2-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'22155-91-5', NULL, N'=99% (TLC)', NULL, N'L-Pyroglutamic acid ß-naphthylamide,
		
	
		L-Pyrrolidonyl-ß-naphthylamide,
		
	
		N1-(2-Naphthyl)-L-pyroglutamic acid,
		
	
		PYR', NULL, N'254.28', N'244-809-9', N'5066652', N'329820238', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5891?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1405, 16, N'S7672 Sigma-Aldrich', N'Sarcosine', NULL, NULL, NULL, NULL, NULL, N'107-97-1', NULL, N'BioXtra', NULL, N'N-Methylglycine', N'CH3NHCH2COOH', N'89.09', N'203-538-6', N'1699442', N'24899761', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s7672?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1406, 16, N'S0520 Sigma-Aldrich', N'Selenocystamine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'3542-13-0', NULL, N'powder', NULL, NULL, NULL, N'318.99', NULL, NULL, N'24899440', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s0520?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1407, 16, N'S3875 Sigma-Aldrich', N'Seleno-DL-methionine', NULL, NULL, NULL, NULL, NULL, N'1464-42-2', NULL, N'=99% (TLC)', NULL, NULL, NULL, N'196.11', N'215-977-0', N'1758204', N'24899572', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s3875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1408, 16, N'S4503 Sigma-Aldrich', N'DL-Serine hydroxamate', NULL, NULL, NULL, NULL, NULL, N'55779-32-3', NULL, N'seryl-tRNA synthetase inhibitor', NULL, N'SHX', NULL, N'120.11', NULL, NULL, N'24899606', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4503?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1409, 16, N'S5000 Sigma-Aldrich', N'DL-Serine methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'5619-04-5', NULL, N'', NULL, NULL, N'HOCH2CH(NH2)CO2CH3·HCl', N'155.58', N'227-047-1', NULL, N'24899625', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s5000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1410, 16, N'S4630 Sigma-Aldrich', N'L-Serine ß-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'888-74-4', NULL, N'', NULL, NULL, NULL, N'230.26', NULL, NULL, N'24899611', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1411, 16, N'H9380 Sigma-Aldrich', N'Sodium hippurate hydrate', NULL, NULL, NULL, NULL, NULL, N'532-94-5', NULL, N'=99%', NULL, N'Benzoylaminoacetic acid sodium salt,
		
	
		Hippuric acid sodium salt hydrate,
		
	
		N-Benzoylglycine sodium salt', N'C6H5CONHCH2COONa · xH2O', N'201.15 (anhydrous basis)', N'208-548-4', N'3638470', N'24895851', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h9380?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1412, 16, N'S7001 Sigma-Aldrich', N'Strychnine hemisulfate salt', NULL, NULL, NULL, NULL, NULL, N'60-41-3', NULL, N'', NULL, NULL, N'C21H22N2O2 · 1/2H2SO4', N'383.45', N'200-477-7', NULL, N'329824573', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s7001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1413, 16, N'S7129 Sigma-Aldrich', N'O-Succinyl-L-homoserine', NULL, NULL, NULL, NULL, NULL, N'1492-23-5', NULL, N'', NULL, NULL, NULL, N'219.19', NULL, NULL, N'24899732', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s7129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1414, 16, N'10937 Sigma-Aldrich', N'N-Tetradecanoyl-DL-homoserine lactone', NULL, NULL, NULL, NULL, NULL, N'98206-80-5', NULL, N'=97.0% (HPLC)', NULL, N'N-Myristoyl-DL-homoserine lactone', NULL, N'311.46', NULL, N'1649579', N'57646860', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/10937?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1415, 16, N'T6259 Sigma-Aldrich', N'DL-4-Thiaisoleucine', NULL, NULL, NULL, NULL, NULL, N'443-80-1', NULL, N'', NULL, N'2-Amino-3-(methylthio)butyric acid', NULL, N'149.21', NULL, NULL, N'24900361', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t6259?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1416, 16, N'T2634 Sigma-Aldrich', N'ß-(2-Thiazolyl)-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'1596-65-2', NULL, N'', NULL, N'(±)-2-Amino-3-(2-thiazolyl)propionic acid', NULL, N'172.20', NULL, NULL, N'24900050', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t2634?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1417, 16, N'T8910 Sigma-Aldrich', N'ß-(2-Thienyl)-D-alanine', NULL, NULL, NULL, NULL, NULL, N'139-86-6', NULL, N'', NULL, NULL, NULL, N'171.22', N'205-378-2', NULL, N'24900572', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8910?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1418, 16, N'T8028 Sigma-Aldrich', N'D-a-(2-Thienyl)glycine', NULL, NULL, NULL, NULL, NULL, N'43189-45-3', NULL, N'', NULL, NULL, NULL, N'157.19', N'256-134-7', NULL, N'24900494', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8028?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1419, 16, N'T8653 Sigma-Aldrich', N'L-a-(3-Thienyl)glycine', NULL, NULL, NULL, NULL, NULL, N'1194-87-2', NULL, N'', NULL, NULL, NULL, N'157.19', NULL, NULL, N'24900547', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8653?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1420, 16, N'T8528 Sigma-Aldrich', N'DL-a-(3-Thienyl)glycine', NULL, NULL, NULL, NULL, NULL, N'38150-49-1', NULL, N'', NULL, NULL, NULL, N'157.19', NULL, NULL, N'24900537', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8528?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1421, 16, N'T5000 Sigma-Aldrich', N'DL-ß-(2-Thienyl)serine', NULL, NULL, NULL, NULL, NULL, N'32595-59-8', NULL, N'', NULL, NULL, NULL, N'187.22', N'251-122-8', NULL, N'24900249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t5000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1422, 16, N'T5898 Sigma-Aldrich', N'L-Threonine methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'39994-75-7', NULL, N'', NULL, NULL, N'CH3CH(OH)CH(NH2)COOCH3 · HCl', N'169.61', N'254-738-5', N'3562717', N'24900327', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t5898?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1423, 16, N'T5905 Sigma-Aldrich', N'L-Thyronine', NULL, NULL, NULL, NULL, NULL, N'1596-67-4', NULL, N'', NULL, N'3-(p-[p-Hydroxyphenoxy]phenyl)-L-alanine', NULL, N'273.28', N'216-483-8', NULL, N'24900328', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t5905?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1424, 16, N'T4626 Sigma-Aldrich', N'Na-p-Tosyl-L-arginine methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1784-03-8', NULL, N'', NULL, N'TAME hydrochloride', N'H2NC(=NH)NH(CH2)3CH(NHSO2C6H4CH3)CO2CH3 · HCl', N'378.87', N'217-235-1', N'3922357', N'24900058', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1425, 16, N'T1286 Sigma-Aldrich', N'Ne-p-Tosyl-L-lysine', NULL, NULL, NULL, NULL, NULL, N'2130-76-9', NULL, N'', NULL, NULL, NULL, N'300.37', NULL, NULL, N'24899954', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t1286?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1426, 16, N'T5012 Sigma-Aldrich', N'Na-p-Tosyl-L-lysine methyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'5266-48-8', NULL, N'', NULL, N'N-(p-Toluenesulfonyl)-L-lysine methyl ester', NULL, N'350.86', NULL, NULL, N'24900251', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t5012?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1427, 16, N'T9299 Sigma-Aldrich', N'ß-(1,2,4-Triazol-3-yl)-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'10109-05-4', NULL, N'', NULL, N'(±)-2-Amino-3-(1,2,4-triazol-3-yl)propionic acid,
		
	
		DL-1,2,4-Triazole-3-alanine', NULL, N'156.14', N'233-301-2', NULL, N'24900592', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t9299?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1428, 16, N'53604 Sigma-Aldrich', N'Ne-Trifluoroacetyl-L-lysine', NULL, NULL, NULL, NULL, NULL, N'10009-20-8', NULL, N'=96.0% (TLC)', NULL, N'e-TFA-lysine', NULL, N'242.20', NULL, N'2122429', N'57651423', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53604?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1429, 16, N'T4011 Sigma-Aldrich', N'N-Trifluoroacetyl-L-methionine methyl ester', NULL, NULL, NULL, NULL, NULL, N'1830-73-5', NULL, N'~98% (TLC)', NULL, NULL, NULL, N'259.25', NULL, NULL, N'24900187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1430, 16, N'T5006 Sigma-Aldrich', N'N-Trifluoroacetyl-L-phenylalanine methyl ester', NULL, NULL, NULL, NULL, NULL, N'23635-30-5', NULL, N'~98% (TLC)', NULL, NULL, NULL, N'275.22', NULL, NULL, N'24900250', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t5006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1431, 16, N'L512818 Sigma-Aldrich', N'N-(2,2,2-trifluoromethyl)-L-Tryptamine Ethyl Ester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AldrichCPR', NULL, NULL, NULL, N'314.30', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/l512818?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1432, 16, N'L512826 Sigma-Aldrich', N'N-(2,2,2-trifluoromethyl)-L-Tyrosine Ethyl Ester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AldrichCPR', NULL, NULL, NULL, N'291.27', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/l512826?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1433, 16, N'L512834 Sigma-Aldrich', N'N-(2,2,2-trifluoromethyl)-L-Valine Ethyl Ester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AldrichCPR', NULL, NULL, NULL, N'227.22', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/l512834?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1434, 16, N'T0281 Sigma-Aldrich', N'3,3'',5''-Triiodo-L-thyronine', NULL, NULL, NULL, NULL, NULL, N'5817-39-0', NULL, N'thyroid hormone analog', NULL, N'Reverse T3,
		
	
		rT(3)', NULL, N'650.97', NULL, NULL, N'24899878', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t0281?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1435, 16, N'T0286 Sigma-Aldrich', N'N-(Trimethylamine-boranecarbonyl)proline methyl ester', NULL, NULL, NULL, NULL, NULL, N'125893-97-2', NULL, N'', NULL, NULL, NULL, N'228.10', NULL, NULL, N'329826600', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t0286?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1436, 16, N'T3879 Sigma-Aldrich', N'L-Tyrosinamide', NULL, NULL, NULL, NULL, NULL, N'4985-46-0', NULL, N'', NULL, NULL, NULL, N'180.20', NULL, NULL, N'24900175', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1437, 16, N'T4879 Sigma-Aldrich', N'L-Tyrosine ethyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'4089-07-0', NULL, N'', NULL, NULL, N'HOC6H4CH2CH(NH2)COOC2H5 · HCl', N'245.70', N'223-820-2', N'4725904', N'24900232', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1438, 16, N'T3384 Sigma-Aldrich', N'L-Tyrosine ß-naphthylamide', NULL, NULL, NULL, NULL, NULL, N'4357-95-3', NULL, N'', NULL, NULL, NULL, N'306.36', N'224-432-6', NULL, N'24900136', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3384?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1439, 16, N'V0750 Sigma-Aldrich', N'L-Valine benzyl ester hydrochloride', NULL, NULL, NULL, NULL, NULL, N'2462-34-2', NULL, N'', NULL, NULL, NULL, N'243.73', NULL, NULL, N'24900698', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v0750?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1440, 16, N'C1376 Sigma-Aldrich', N'Z-ß-Ala-OH', NULL, NULL, NULL, NULL, NULL, N'2304-94-1', NULL, N'', NULL, N'N-Cbz-ß-alanine,
		
	
		Z-ß-alanine', NULL, N'223.23', N'218-967-4', N'1882542', N'24892406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c1376?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1441, 16, N'C7047 Sigma-Aldrich', N'1-(Z-amino)cyclopropanecarboxylic acid', NULL, NULL, NULL, NULL, NULL, N'84677-06-5', NULL, N'', NULL, NULL, NULL, N'235.24', NULL, NULL, N'24892925', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c7047?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1442, 16, N'C9783 Sigma-Aldrich', N'Z-His(Bzl)-OH', NULL, NULL, NULL, NULL, NULL, N'21929-66-8', NULL, N'', NULL, N'Na-Cbz-Nim-benzyl-L-histidine,
		
	
		Na-Z-N(im)-benzyl-L-histidine', NULL, N'379.41', NULL, N'55593', N'24893199', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9783?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1443, 16, N'C3647 Sigma-Aldrich', N'Z-L-Lys-SBzl hydrochloride', NULL, NULL, NULL, NULL, NULL, N'69861-89-8', NULL, N'', NULL, N'N-a-Cbz-L-lysine thiobenzyl ester hydrochloride', NULL, N'422.97', NULL, NULL, N'24892633', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c3647?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1444, 16, N'C0271 Sigma-Aldrich', N'Z-L-Phe p-nitroanilide', NULL, NULL, NULL, NULL, NULL, N'19647-71-3', NULL, N'', NULL, NULL, NULL, N'419.43', NULL, NULL, N'24892245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c0271?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1445, 16, N'C4127 Sigma-Aldrich', N'Z-D-Phe-OH', NULL, NULL, NULL, NULL, NULL, N'2448-45-5', NULL, N'', NULL, N'N-Cbz-D-phenylalanine,
		
	
		Z-D-phenylalanine', NULL, N'299.32', NULL, N'4355833', N'24892665', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c4127?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1446, 17, N'G5755 Sigma-Aldrich', N'Gly-Gly-Gly-Gly-Gly', NULL, NULL, NULL, NULL, NULL, N'7093-67-6', NULL, N'', NULL, N'Glycyl-glycyl-glycyl-glycyl-glycine,
		
	
		Pentaglycine', N'NH2CH2CO(NHCH2CO)3NHCH2COOH', N'303.27', N'230-398-3', N'1716946', N'24895226', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5755?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1447, 17, N'G5630 Sigma-Aldrich', N'Gly-Gly-Gly-Gly-Gly-Gly', NULL, NULL, NULL, NULL, NULL, N'3887-13-6', NULL, N'', NULL, N'Hexaglycine', NULL, N'360.32', NULL, NULL, N'24895220', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1448, 17, N'T1780 Sigma-Aldrich', N'Tyr-Tyr-Tyr-Tyr-Tyr-Tyr', NULL, NULL, NULL, NULL, NULL, N'6934-38-9', NULL, N'=98% (HPLC)', NULL, N'Hexa-L-tyrosine', NULL, N'997.05', NULL, NULL, N'24899991', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t1780?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1449, 18, N'P6516 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 4,000-15,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898773', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6516?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1450, 18, N'P1024 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt =300,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898143', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1024?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1451, 18, N'P1524 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt =300,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898211', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1524?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1452, 18, N'P2534 Sigma-Aldrich', N'Poly-L-histidine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'61857-39-4', NULL, N'mol wt =5000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898335', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2534?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1453, 18, N'P8035 Sigma-Aldrich', N'Poly(?-ethyl-L-glutamate)', NULL, NULL, NULL, NULL, NULL, N'25189-52-0', NULL, N'mol wt &gt;100,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8035?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1454, 18, N'P4638 Sigma-Aldrich', N'Poly-L-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27378-49-0', NULL, N'mol wt &gt;100,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1455, 18, N'P0671 Sigma-Aldrich', N'Poly-DL-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'82682-33-5', NULL, N'mol wt &gt;30,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898121', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0671?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1456, 18, N'P9404 Sigma-Aldrich', N'Poly-L-lysine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26124-78-7', NULL, N'mol wt &gt;30,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9404?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1457, 18, N'P3886 Sigma-Aldrich', N'Poly-L-proline', NULL, NULL, NULL, NULL, NULL, N'25191-13-3', NULL, N'mol wt &gt;30,000', NULL, NULL, NULL, N'115.13', NULL, NULL, N'24898465', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3886?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1458, 18, N'P4158 Sigma-Aldrich', N'Poly-DL-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'61686-25-7', NULL, N'mol wt &gt;40,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4158?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1459, 18, N'G0421 Sigma-Aldrich', N'Poly-L-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'26247-79-0', NULL, N'mol wt &gt;50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g0421?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1460, 18, N'P3513 Sigma-Aldrich', N'Poly-L-lysine, succinylated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mol wt &gt;50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3513?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1461, 18, N'P3892 Sigma-Aldrich', N'Poly-L-arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26982-20-7', NULL, N'mol wt &gt;70,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898466', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3892?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1462, 18, N'P2254 Sigma-Aldrich', N'Poly-L-proline', NULL, NULL, NULL, NULL, NULL, N'25191-13-3', NULL, N'mol wt 1,000-10,000', NULL, NULL, NULL, N'115.13', NULL, NULL, N'24898302', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2254?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1463, 18, N'P0296 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 1,000-5,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898091', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0296?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1464, 18, N'P9003 Sigma-Aldrich', N'Poly-DL-alanine', NULL, NULL, NULL, NULL, NULL, N'25281-63-4', NULL, N'mol wt 1,000-5,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24899001', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1465, 18, N'P0879 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 1,000-5,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898134', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1466, 18, N'P1818 Sigma-Aldrich', N'Poly-L-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'26247-79-0', NULL, N'mol wt 1,500-5,500 by MALLS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1818?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1467, 18, N'P1800 Sigma-Aldrich', N'Poly-L-tyrosine', NULL, NULL, NULL, NULL, NULL, N'25619-78-7', NULL, N'mol wt 10,000-40,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1800?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1468, 18, N'P7890 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 15,000-30,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898886', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7890?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1469, 18, N'P0421 Sigma-Aldrich', N'Poly-DL-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'82682-33-5', NULL, N'mol wt 15,000-30,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898102', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0421?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1470, 18, N'P2658 Sigma-Aldrich', N'Poly-L-lysine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26124-78-7', NULL, N'mol wt 15,000-30,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2658?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1471, 18, N'P2533 Sigma-Aldrich', N'Poly-L-ornithine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26982-21-8', NULL, N'mol wt 15,000-30,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898334', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2533?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1472, 18, N'P3543 Sigma-Aldrich', N'Poly-L-lysine–FITC Labeled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mol wt 15,000-30,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3543?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1473, 18, N'P4033 Sigma-Aldrich', N'Poly-D-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'30811-79-1', NULL, N'mol wt 15,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4033?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1474, 18, N'P4761 Sigma-Aldrich', N'Poly-L-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'26247-79-0', NULL, N'mol wt 15,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4761?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1475, 18, N'P7762 Sigma-Aldrich', N'Poly-L-arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26982-20-7', NULL, N'mol wt 15,000-70,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898874', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7762?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1476, 18, N'P1149 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 150,000-300,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898164', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1149?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1477, 18, N'P1399 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 150,000-300,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898197', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1399?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1478, 18, N'P5136 Sigma-Aldrich', N'Poly-?-benzyl-L-glutamate', NULL, NULL, NULL, NULL, NULL, N'25014-27-1', NULL, N'mol wt 150,000-350,000', NULL, N'PBLG', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5136?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1479, 18, N'P3418 Sigma-Aldrich', N'Poly-(a,ß)-DL-aspartic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'94525-01-6', NULL, N'mol wt 2,000-11,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3418?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1480, 18, N'P9917 Sigma-Aldrich', N'Poly-D-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'30811-79-1', NULL, N'mol wt 2,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9917?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1481, 18, N'P9011 Sigma-Aldrich', N'Poly-DL-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'61686-25-7', NULL, N'mol wt 25,000-40,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1482, 18, N'P8638 Sigma-Aldrich', N'Poly-DL-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'82682-33-5', NULL, N'mol wt 3,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898960', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1483, 18, N'P4636 Sigma-Aldrich', N'Poly-L-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'26247-79-0', NULL, N'mol wt 3,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4636?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1484, 18, N'P7886 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 30,000-70,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898884', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7886?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1485, 18, N'P2636 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 30,000-70,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898343', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2636?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1486, 18, N'P3655 Sigma-Aldrich', N'Poly-L-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27378-49-0', NULL, N'mol wt 30,000-70,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3655?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1487, 18, N'P5011 Sigma-Aldrich', N'Poly-?-benzyl-L-glutamate', NULL, NULL, NULL, NULL, NULL, N'25014-27-1', NULL, N'mol wt 30,000-70,000', NULL, N'PBLG', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1488, 18, N'P3069 Sigma-Aldrich', N'Poly-L-lysine–FITC Labeled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mol wt 30,000-70,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3069?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1489, 18, N'P6403 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 4,000-15,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898763', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1490, 18, N'P3995 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 40,000-60,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898477', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3995?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1491, 18, N'P4663 Sigma-Aldrich', N'Poly-L-arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'26982-20-7', NULL, N'mol wt 5,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898490', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4663?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1492, 18, N'P4538 Sigma-Aldrich', N'Poly-L-ornithine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27378-49-0', NULL, N'mol wt 5,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4538?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1493, 18, N'P8077 Sigma-Aldrich', N'Poly-L-threonine', NULL, NULL, NULL, NULL, NULL, N'82822-12-6', NULL, N'mol wt 5,000-15,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8077?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1494, 18, N'P0937 Sigma-Aldrich', N'Poly (a,ß-[N-(3-hydroxypropyl)-DL-aspartamide])', NULL, NULL, NULL, NULL, NULL, N'137629-32-4', NULL, N'=95% (TLC), mol wt 5,000-20,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0937?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1495, 18, N'P9386 Sigma-Aldrich', N'Poly-L-histidine', NULL, NULL, NULL, NULL, NULL, N'26062-48-6', NULL, N'mol wt 5,000-25,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24899031', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9386?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1496, 18, N'P4886 Sigma-Aldrich', N'Poly-L-glutamic acid sodium salt', NULL, NULL, NULL, NULL, NULL, N'26247-79-0', NULL, N'mol wt 50,000-100,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4886?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1497, 18, N'P4510 Sigma-Aldrich', N'Poly-e-Cbz-L-lysine', NULL, NULL, NULL, NULL, NULL, N'25931-47-9', NULL, N'mol wt 500-4,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4510?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1498, 18, N'P8791 Sigma-Aldrich', N'Polyglycine', NULL, NULL, NULL, NULL, NULL, N'25718-94-9', NULL, N'mol wt 500-5,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898980', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8791?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1499, 18, N'P1274 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 70,000-150,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898180', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1274?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1500, 18, N'P0899 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 70,000-150,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898137', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0899?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1501, 18, N'P5386 Sigma-Aldrich', N'Poly-?-benzyl-L-glutamate', NULL, NULL, NULL, NULL, NULL, N'25014-27-1', NULL, N'mol wt 70,000-150,000', NULL, N'PBLG', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5386?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1502, 18, N'P1691 Sigma-Aldrich', N'Poly(D,L-lactide)', NULL, NULL, NULL, NULL, NULL, N'26023-30-3', NULL, N'mol wt 75,000-120,000', NULL, NULL, N'(C3H4O2)n', NULL, NULL, NULL, N'24898237', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1691?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1503, 18, N'P1566 Sigma-Aldrich', N'Poly(L-lactide)', NULL, NULL, NULL, NULL, NULL, N'26161-42-2', NULL, N'mol wt 85,000-160,000', NULL, N'Lactel® B6002-2', NULL, NULL, NULL, NULL, N'24898218', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1566?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1504, 20, N'P0296 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 1,000-5,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898091', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0296?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1505, 20, N'P6403 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 4,000-15,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898763', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1506, 20, N'P7886 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 30,000-70,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898884', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7886?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1507, 20, N'P7280 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'average mol wt 30,000-70,000, lyophilized powder, ?-irradiated, BioReagent, suitable for cell culture', NULL, N'PDL', N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898835', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7280?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1508, 20, N'P0899 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 70,000-150,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898137', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0899?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1509, 20, N'P6407 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 70,000-150,000, lyophilized powder, ?-irradiated, BioReagent, suitable for cell culture', NULL, N'PDL', N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898764', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6407?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1510, 20, N'P1149 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt 150,000-300,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898164', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1149?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1511, 20, N'P1024 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt =300,000', NULL, NULL, N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898143', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1024?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1512, 20, N'P7405 Sigma-Aldrich', N'Poly-D-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'27964-99-4', NULL, N'mol wt &gt;300,000, lyophilized powder, ?-irradiated, BioReagent, suitable for cell culture', NULL, N'PDL', N'D-Lys-(D-Lys)n-D-Lys · xHBr', NULL, NULL, NULL, N'24898848', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7405?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1513, 20, N'P0879 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 1,000-5,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898134', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1514, 20, N'P6516 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 4,000-15,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898773', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6516?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1515, 20, N'P7890 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 15,000-30,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898886', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7890?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1516, 20, N'P2636 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 30,000-70,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898343', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p2636?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1517, 20, N'P9155 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 30,000-70,000, lyophilized powder, ?-irradiated, BioXtra, suitable for cell culture', NULL, N'PDL HBr', NULL, NULL, NULL, NULL, N'24899014', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9155?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1518, 20, N'P1274 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 70,000-150,000 by viscosity', NULL, NULL, NULL, NULL, NULL, NULL, N'24898180', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1274?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1519, 20, N'P6282 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 70,000-150,000, lyophilized powder, ?-irradiated, BioXtra, suitable for cell culture', NULL, N'PLL HBr', NULL, NULL, NULL, NULL, N'24898753', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6282?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1520, 20, N'P1399 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 150,000-300,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898197', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1399?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1521, 20, N'P1524 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt =300,000', NULL, NULL, NULL, NULL, NULL, NULL, N'24898211', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1524?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1522, 20, N'P5899 Sigma-Aldrich', N'Poly-L-lysine hydrobromide', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt =300,000, lyophilized powder, ?-irradiated, BioXtra, suitable for cell culture', NULL, N'PDL HBr', NULL, NULL, NULL, NULL, N'24898718', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5899?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1523, 20, N'P4707 Sigma-Aldrich', N'Poly-L-lysine solution', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 70,000-150,000, 0.01%, sterile-filtered, BioReagent, suitable for cell culture', NULL, N'PLL Solution', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4707?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1524, 20, N'P4832 Sigma-Aldrich', N'Poly-L-lysine solution', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'mol wt 150,000-300,000, 0.01%, sterile-filtered, BioReagent, suitable for cell culture', NULL, N'PLL Solution', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4832?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1525, 20, N'P8920 Sigma-Aldrich', N'Poly-L-lysine solution', NULL, NULL, NULL, NULL, NULL, N'25988-63-0', NULL, N'0.1 % (w/v) in H2O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8920?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1526, 20, N'127-2.5 Sigma-Aldrich', N'Poly-D-Lysine &amp; Laminin (2.5 ML)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/12725?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1527, 20, N'P4957 Sigma-Aldrich', N'Poly-L-ornithine solution', NULL, NULL, NULL, NULL, NULL, N'27378-49-0', NULL, N'mol wt 30,000-70,000, 0.01%, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, N'24898574', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4957?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1528, 21, N'P9431 Sigma-Aldrich', N'Poly(Arg, Pro, Thr) hydrochloride', NULL, NULL, NULL, NULL, NULL, N'133552-00-8', NULL, N'Arg:Pro:Thr (6:3:1), mol wt 10,000-30,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9431?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1529, 21, N'P1152 Sigma-Aldrich', N'Poly(Ala, Glu, Lys, Tyr) 6:2:5:1 hydrobromide', NULL, NULL, NULL, NULL, NULL, N'28704-27-0', NULL, N'Ala:Glu:Lys:Tyr (6:2:5:1), mol wt 20,000-30,000', NULL, N'(L-Ala, L-Glu, L-Lys, L-Tyr)n ·HBr,
		
	
		COP-1', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1152?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1530, 21, N'P7658 Sigma-Aldrich', N'Poly(D-Glu, D-Lys) hydrobromide', NULL, NULL, NULL, NULL, NULL, N'119039-80-4', NULL, N'D-Glu:D-Lys (6:4), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7658?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1531, 21, N'P3899 Sigma-Aldrich', N'Poly(Glu, Ala, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-01-6', NULL, N'Glu:Ala:Tyr (6:3:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3899?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1532, 21, N'P4149 Sigma-Aldrich', N'Poly(Glu, Ala, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-01-6', NULL, N'Glu:Ala:Tyr (1:1:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4149?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1533, 21, N'P4409 Sigma-Aldrich', N'Poly(Glu, Lys, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'118539-64-3', NULL, N'Glu:Lys:Tyr (6:3:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4409?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1534, 21, N'P0275 Sigma-Aldrich', N'Poly(Glu, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-00-5', NULL, N'Glu:Tyr (4:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0275?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1535, 21, N'P0151 Sigma-Aldrich', N'Poly(Glu, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-00-5', NULL, N'Glu:Tyr (1:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p0151?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1536, 21, N'81357 Sigma-Aldrich', N'Poly(Glu, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-00-5', NULL, N'mol wt 20,000-50,000, Glu:Tyr 4:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81357?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1537, 21, N'P3150 Sigma-Aldrich', N'Poly(Lys, Phe) 1:1 hydrobromide', NULL, NULL, NULL, NULL, NULL, N'26700-39-0', NULL, N'mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p3150?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1538, 21, N'P4659 Sigma-Aldrich', N'Poly(Lys, Tyr) hydrobromide', NULL, NULL, NULL, NULL, NULL, N'41705-04-8', NULL, N'Lys:Tyr (4:1), mol wt 20,000-50,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1539, 21, N'P9306 Sigma-Aldrich', N'Poly(Arg, Pro, Thr) hydrochloride', NULL, NULL, NULL, NULL, NULL, N'133552-00-8', NULL, N'Arg:Pro:Thr (1:1:1), mol wt 5,000-20,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p9306?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1540, 21, N'P7244 Sigma-Aldrich', N'Poly(Glu, Tyr) sodium salt', NULL, NULL, NULL, NULL, NULL, N'97105-00-5', NULL, N'Glu:Tyr (4:1), mol wt 5,000-20,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p7244?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1541, 21, N'P4274 Sigma-Aldrich', N'Poly(Lys, Tyr) hydrobromide', NULL, NULL, NULL, NULL, NULL, N'41705-04-8', NULL, N'Lys:Tyr (1:1), mol wt 50,000-150,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p4274?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1542, 21, N'P1941 Sigma-Aldrich', N'Poly(D,L-lactide-co-glycolide)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'lactide:glycolide (75:25), mol wt 66,000-107,000', NULL, N'LACTEL® B6007-1,
		
	
		PLGA', N'[C3H4O2]x[C2H2O2]y', NULL, NULL, NULL, N'24898256', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p1941?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1543, 21, N'P8619 Sigma-Aldrich', N'Poly(Glu, Lys) hydrobromide', NULL, NULL, NULL, NULL, NULL, N'119039-90-6', NULL, N'Glu:Lys (1:4), mol wt 75,000-125,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1544, 21, N'P6835 Sigma-Aldrich', N'Poly(Glu, Tyr)-Agarose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Glu:Tyr (4:1), saline suspension', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6835?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1545, 22, N'P6665 Sigma-Aldrich', N'Poly(Pro-Gly-Pro)', NULL, NULL, NULL, NULL, NULL, N'25104-46-5', NULL, N'mol wt 2,000-10,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p6665?lang=en&amp;region=US')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Packaging] ON 
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1, N'1 kg in Plastic bottle (1002891000)', 1)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1, N'10 kg in Plastic drum (1002899010)', 2)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (2, N'1 kg in Plastic bottle (1002911000)', 3)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (2, N'10 kg in Plastic drum (1002919010)', 4)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'1 kg in Plastic bottle (1005901000)', 5)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'12 kg in Bucket, plastic (1005909012)', 6)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'25 kg in Fibre carton (1005909025)', 7)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'3 x 1 kg in Fibre case (1005900001)', 8)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'5 kg in Plastic bottle (1005905000)', 9)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (3, N'50 kg in Plastic drum (1005909050)', 10)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (4, N'1 kg in Plastic bottle (1015441000)', 11)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (4, N'10 kg in Plastic drum (1015449010)', 12)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (4, N'3 x 1 kg in Plastic bottle (1015440001)', 13)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (4, N'5 kg in Plastic drum (1015445000)', 14)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (5, N'10 kg in Plastic drum (1015879010)', 15)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (5, N'3 x 1 kg in Plastic bottle (1015870001)', 16)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (6, N'10 kg in Plastic drum (1027359010)', 17)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (6, N'3 x 1 kg in Fibre case (1027350001)', 18)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (8, N'1 kg in Plastic bottle (1028381000)', 21)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (8, N'10 kg in Plastic drum (1028389010)', 22)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (9, N'1 kg in Plastic bottle (1028391000)', 23)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (9, N'10 kg in Plastic drum (1028399010)', 24)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (10, N'1 kg in Glass bottle (1043511000)', 25)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (11, N'0.5 kg in Plastic bottle (1043520500)', 26)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (11, N'10 kg in Plastic drum (1043529010)', 27)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (11, N'3 x 500 g in Plastic bottle (1043520001)', 28)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (12, N'10 kg in Plastic drum (1043549010)', 29)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (12, N'3 x 500 g in Plastic bottle (1043540001)', 30)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (13, N'1 kg in Plastic bottle (1057011000)', 31)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (13, N'25 kg in Fibre carton (1057019025)', 32)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (14, N'5 gm in Plastic ampoule (106425-5GM)', 33)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (15, N'100 gm in Glass bottle (1250-100GM)', 34)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (16, N'1 kg in Glass bottle (181003-1KG)', 35)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (16, N'250 gm in Glass bottle (181003-250GM)', 36)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (16, N'50 gm in Glass bottle (181003-50GM)', 37)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (17, N'100 gm in Glass bottle (1820-100GM)', 38)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (18, N'500 gm in Plastic bottle (2240-500GM)', 39)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (19, N'1 kg in Glass bottle (243005-1KG)', 40)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (19, N'100 gm in Glass bottle (243005-100GM)', 41)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (19, N'25 gm in Plastic ampoule (243005-25GM)', 42)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (20, N'1 kg in Glass bottle (2430-1KG)', 43)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (20, N'100 gm in Glass bottle (2430-100GM)', 44)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (21, N'25 gm in Glass bottle (2470-25GM)', 45)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (22, N'5 gm in Glass bottle (356790-5GM)', 46)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (23, N'1 kg in Glass bottle (3570-1KG)', 47)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (23, N'500 gm in Glass bottle (3570-500GM)', 48)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (24, N'100 gm in Glass bottle (4160-100GM)', 49)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (25, N'100 gm in Glass bottle (4330-100GM)', 50)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (26, N'1 kg in Glass bottle (4400-1KG)', 51)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (26, N'100 gm in Glass bottle (4400-100GM)', 52)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (27, N'100 gm in Glass bottle (4500-100GM)', 53)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (28, N'25 kg in Plastic barrel (4860-25KG)', 54)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (29, N'100 gm in Glass bottle (5202-100GM)', 55)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (30, N'100 gm in Glass bottle (5370-100GM)', 56)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (31, N'5 kg in Plastic drum (5450-5KG)', 57)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (32, N'1 gm in Glass bottle (561505-1GM)', 58)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (32, N'250 mg in Glass bottle (561505-250MG)', 59)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (33, N'100 gm in Glass bottle (5650-100GM)', 60)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (34, N'100 gm in Glass bottle (6540-100GM)', 61)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (35, N'100 gm in Glass bottle (6570-100GM)', 62)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (36, N'50 g in Plastic bottle (8145990050)', 63)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (37, N'50 g in Glass bottle (8149860050)', 64)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (38, N'25 g in Plastic bottle (8160000025)', 65)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (39, N'100 g in Plastic bottle (8160010100)', 66)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (40, N'100 g in Plastic bottle (8160030100)', 67)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (41, N'1 kg in Plastic bottle (8160041000)', 68)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (41, N'100 g in Plastic bottle (8160040100)', 69)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (42, N'25 g in Plastic bottle (8160050025)', 70)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (43, N'25 g in Plastic bottle (8160060025)', 71)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (44, N'5 g in Plastic bottle (8160070005)', 72)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (45, N'10 g in Plastic bottle (8160080010)', 73)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (46, N'25 g in Plastic bottle (8160090025)', 74)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (47, N'25 g in Plastic bottle (8160100025)', 75)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (48, N'10 g in Plastic bottle (8160110010)', 76)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (49, N'25 g in Plastic bottle (8160120025)', 77)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (50, N'250 g in Plastic bottle (8160130250)', 78)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (51, N'25 g in Plastic bottle (8160140025)', 79)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (52, N'25 g in Plastic bottle (8160160025)', 80)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (53, N'25 g in Plastic bottle (8160170025)', 81)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (54, N'100 g in Plastic bottle (8160180100)', 82)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (55, N'25 g in Plastic bottle (8160190025)', 83)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (56, N'25 g in Plastic bottle (8160200025)', 84)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (57, N'25 g in Plastic bottle (8160210025)', 85)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (59, N'100 g in Plastic bottle (8206490100)', 86)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (60, N'100 g in Plastic bottle (8412350100)', 87)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (61, N'1 g in Plastic bottle (8415050001)', 88)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (7, N'1 kg in Plastic bottle (1028361000)', 89)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (7, N'3 x 500 g in Plastic bottle (1028360001)', 90)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (962, N'1 kg in Plastic bottle (1002891000)', 91)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (962, N'10 kg in Plastic drum (1002899010)', 92)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (963, N'1 kg in Plastic bottle (1002911000)', 93)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (963, N'10 kg in Plastic drum (1002919010)', 94)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'1 kg in Plastic bottle (1005901000)', 95)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'12 kg in Bucket, plastic (1005909012)', 96)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'25 kg in Fibre carton (1005909025)', 97)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'3 x 1 kg in Fibre case (1005900001)', 98)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'5 kg in Plastic bottle (1005905000)', 99)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (964, N'50 kg in Plastic drum (1005909050)', 100)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (965, N'1 kg in Plastic bottle (1015441000)', 101)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (965, N'10 kg in Plastic drum (1015449010)', 102)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (965, N'3 x 1 kg in Plastic bottle (1015440001)', 103)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (965, N'5 kg in Plastic drum (1015445000)', 104)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (966, N'10 kg in Plastic drum (1015879010)', 105)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (966, N'3 x 1 kg in Plastic bottle (1015870001)', 106)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (967, N'10 kg in Plastic drum (1027359010)', 107)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (967, N'3 x 1 kg in Fibre case (1027350001)', 108)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (968, N'1 kg in Plastic bottle (1028361000)', 109)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (968, N'3 x 500 g in Plastic bottle (1028360001)', 110)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (969, N'1 kg in Plastic bottle (1028381000)', 111)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (969, N'10 kg in Plastic drum (1028389010)', 112)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (970, N'1 kg in Plastic bottle (1028391000)', 113)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (970, N'10 kg in Plastic drum (1028399010)', 114)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (971, N'1 kg in Glass bottle (1043511000)', 115)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (972, N'0.5 kg in Plastic bottle (1043520500)', 116)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (972, N'10 kg in Plastic drum (1043529010)', 117)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (972, N'3 x 500 g in Plastic bottle (1043520001)', 118)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (973, N'10 kg in Plastic drum (1043549010)', 119)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (973, N'3 x 500 g in Plastic bottle (1043540001)', 120)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (974, N'1 kg in Plastic bottle (1057011000)', 121)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (974, N'25 kg in Fibre carton (1057019025)', 122)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (975, N'5 gm in Plastic ampoule (106425-5GM)', 123)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (976, N'100 gm in Glass bottle (1250-100GM)', 124)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (977, N'1 kg in Glass bottle (181003-1KG)', 125)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (977, N'250 gm in Glass bottle (181003-250GM)', 126)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (977, N'50 gm in Glass bottle (181003-50GM)', 127)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (978, N'100 gm in Glass bottle (1820-100GM)', 128)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (979, N'500 gm in Plastic bottle (2240-500GM)', 129)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (980, N'1 kg in Glass bottle (243005-1KG)', 130)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (980, N'100 gm in Glass bottle (243005-100GM)', 131)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (980, N'25 gm in Plastic ampoule (243005-25GM)', 132)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (981, N'1 kg in Glass bottle (2430-1KG)', 133)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (981, N'100 gm in Glass bottle (2430-100GM)', 134)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (982, N'25 gm in Glass bottle (2470-25GM)', 135)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (983, N'5 gm in Glass bottle (356790-5GM)', 136)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (984, N'1 kg in Glass bottle (3570-1KG)', 137)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (984, N'500 gm in Glass bottle (3570-500GM)', 138)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (985, N'100 gm in Glass bottle (4160-100GM)', 139)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (986, N'100 gm in Glass bottle (4330-100GM)', 140)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (987, N'1 kg in Glass bottle (4400-1KG)', 141)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (987, N'100 gm in Glass bottle (4400-100GM)', 142)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (988, N'100 gm in Glass bottle (4500-100GM)', 143)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (989, N'25 kg in Plastic barrel (4860-25KG)', 144)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (990, N'100 gm in Glass bottle (5202-100GM)', 145)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (991, N'100 gm in Glass bottle (5370-100GM)', 146)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (992, N'5 kg in Plastic drum (5450-5KG)', 147)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (993, N'1 gm in Glass bottle (561505-1GM)', 148)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (993, N'250 mg in Glass bottle (561505-250MG)', 149)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (994, N'100 gm in Glass bottle (5650-100GM)', 150)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (995, N'100 gm in Glass bottle (6540-100GM)', 151)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (996, N'100 gm in Glass bottle (6570-100GM)', 152)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (997, N'50 g in Plastic bottle (8145990050)', 153)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (998, N'50 g in Glass bottle (8149860050)', 154)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (999, N'25 g in Plastic bottle (8160000025)', 155)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1000, N'100 g in Plastic bottle (8160010100)', 156)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1001, N'100 g in Plastic bottle (8160030100)', 157)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1002, N'1 kg in Plastic bottle (8160041000)', 158)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1002, N'100 g in Plastic bottle (8160040100)', 159)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1003, N'25 g in Plastic bottle (8160050025)', 160)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1004, N'25 g in Plastic bottle (8160060025)', 161)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1005, N'5 g in Plastic bottle (8160070005)', 162)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1006, N'10 g in Plastic bottle (8160080010)', 163)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1007, N'25 g in Plastic bottle (8160090025)', 164)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1008, N'25 g in Plastic bottle (8160100025)', 165)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1009, N'10 g in Plastic bottle (8160110010)', 166)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1010, N'25 g in Plastic bottle (8160120025)', 167)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1011, N'250 g in Plastic bottle (8160130250)', 168)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1012, N'25 g in Plastic bottle (8160140025)', 169)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1013, N'25 g in Plastic bottle (8160160025)', 170)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1014, N'25 g in Plastic bottle (8160170025)', 171)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1015, N'100 g in Plastic bottle (8160180100)', 172)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1016, N'25 g in Plastic bottle (8160190025)', 173)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1017, N'25 g in Plastic bottle (8160200025)', 174)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1018, N'25 g in Plastic bottle (8160210025)', 175)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1020, N'100 g in Plastic bottle (8206490100)', 176)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1021, N'100 g in Plastic bottle (8412350100)', 177)
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging], [ID]) VALUES (1022, N'1 g in Plastic bottle (8415050001)', 178)
GO
SET IDENTITY_INSERT [dbo].[Product_Packaging] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_SKU] ON 
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1, N'1002890025', N'31.25', NULL, NULL, 1)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1, N'1002890100', N'55.00', NULL, NULL, 2)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1, N'1002899010', N'2,096.00', 20960, 10, 3)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005901000', N'70.20', 70.2, 1, 4)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005900001', N'162.00', 486, 3, 5)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005905000', N'243.00', 1215, 5, 6)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005909012', N'434.00', 5208, 12, 7)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005909025', N'776.00', 19400, 25, 8)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (3, N'1005909050', N'1,430.00', 71500, 50, 9)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (4, N'1015441000', N'228.00', 228, 1, 10)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (4, N'1015440001', N'561.00', 1683, 3, 11)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (4, N'1015445000', N'869.00', 4345, 5, 12)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (4, N'1015449010', N'1,560.00', 15600, 10, 13)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (5, N'1015870001', N'507.00', 1521, 3, 14)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (5, N'1015879010', N'1,410.00', 14100, 10, 15)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (6, N'1027350001', N'506.00', 1518, 3, 16)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (6, N'1027359010', N'1,410.00', 14100, 10, 17)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (8, N'1028389010', N'2,480.00', 24800, 10, 18)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (9, N'1028390025', N'36.00', NULL, NULL, 19)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (11, N'1043520500', N'304.00', 152, 0.5, 20)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (11, N'1043520001', N'687.00', 1030.5, 1500, 21)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (11, N'1043529010', N'3,730.00', 37300, 10, 22)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (12, N'1043540001', N'484.00', 726, 1500, 23)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (12, N'1043549010', N'2,490.00', 24900, 10, 24)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (13, N'1057011000', N'131.00', 131, 1, 25)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (13, N'1057019025', N'1,680.00', 42000, 25, 26)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (36, N'8145990050', N'61.30', 3.065, 0.05, 27)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (37, N'8149860050', N'76.30', 3.815, 0.05, 28)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (38, N'8160000025', N'22.20', 0.555, 0.025, 29)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (38, N'8160000100', N'70.60', NULL, NULL, 30)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (39, N'8160010100', N'41.60', 4.16, 0.1, 31)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (40, N'8160030100', N'25.50', 2.55, 0.1, 32)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (40, N'8160030500', N'88.20', NULL, NULL, 33)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (41, N'8160040100', N'27.80', 2.78, 0.1, 34)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (41, N'8160041000', N'145.00', 145, 1, 35)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (42, N'8160050025', N'20.90', 0.5225, 0.025, 36)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (42, N'8160050100', N'69.60', NULL, NULL, 37)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (43, N'8160060025', N'23.90', 0.5975, 0.025, 38)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (43, N'8160060100', N'59.20', NULL, NULL, 39)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (44, N'8160070005', N'25.70', 0.1285, 0.005, 40)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (44, N'8160070025', N'92.90', NULL, NULL, 41)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (45, N'8160080010', N'25.00', 0.25, 0.01, 42)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (45, N'8160080025', N'50.20', NULL, NULL, 43)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (46, N'8160090025', N'19.80', 0.495, 0.025, 44)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (46, N'8160090100', N'55.00', NULL, NULL, 45)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (47, N'8160100025', N'19.80', 0.495, 0.025, 46)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (47, N'8160100100', N'61.80', NULL, NULL, 47)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (48, N'8160110010', N'21.90', 0.219, 0.01, 48)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (48, N'8160110050', N'35.80', NULL, NULL, 49)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (49, N'8160120025', N'60.80', 1.52, 0.025, 50)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (49, N'8160120100', N'191.00', NULL, NULL, 51)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (50, N'8160130250', N'28.30', 7.075, 0.25, 52)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (50, N'8160131000', N'86.60', NULL, NULL, 53)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (51, N'8160140025', N'26.80', 0.67, 0.025, 54)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (51, N'8160140100', N'90.30', NULL, NULL, 55)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (52, N'8160160025', N'22.70', 0.5675, 0.025, 56)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (52, N'8160160100', N'61.80', NULL, NULL, 57)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (53, N'8160170025', N'38.40', 0.96, 0.025, 58)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (53, N'8160170100', N'117.00', NULL, NULL, 59)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (54, N'8160180100', N'39.20', 3.92, 0.1, 60)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (54, N'8160180500', N'113.00', NULL, NULL, 61)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (55, N'8160190025', N'36.60', 0.915, 0.025, 62)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (55, N'8160190100', N'101.00', NULL, NULL, 63)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (56, N'8160200025', N'36.70', 0.9175, 0.025, 64)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (56, N'8160200100', N'101.00', NULL, NULL, 65)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (57, N'8160210025', N'33.30', 0.8325, 0.025, 66)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (57, N'8160210100', N'63.80', NULL, NULL, 67)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (59, N'8206490100', N'34.30', 3.43, 0.1, 68)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (59, N'8206490500', N'107.00', NULL, NULL, 69)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (60, N'8412350100', N'62.80', 6.28, 0.1, 70)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (61, N'8415050001', N'36.40', 0.0364, 0.001, 71)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (64, N'A7469-1KG', N'932.00', 932, 1, 72)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (67, N'A7502-5KG', N'869.00', 173.8, 5, 73)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (68, N'596906-1G', N'996.00', 996000, 0.001, 74)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (82, N'A4599-A150X', N'0.00', NULL, NULL, 75)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (82, N'A4599-25KG', N'5,890.00', 235.6, 25, 76)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (88, N'A5474-25KG', N'5,360.00', 214.4, 25, 77)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (97, N'C7880-5KG', N'2,190.00', 438, 5, 78)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (99, N'C5610-10KG', N'4,660.00', 466, 10, 79)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (99, N'C5610-25KG', N'10,590.00', 423.6, 25, 80)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (105, N'RES1513C-A702X', N'0.00', NULL, NULL, 81)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (105, N'RES1513C-A701X', N'180.00', NULL, NULL, 82)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (117, N'G7126-25KG', N'1,240.00', 49.6, 25, 83)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (123, N'H3911-1KG', N'1,200.00', 1200, 1, 84)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (123, N'H3911-25KG', N'15,900.00', 636, 25, 85)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (124, N'53319-100G', N'188.00', 1880, 0.1, 86)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (126, N'H4036-1KG', N'809.00', 809, 1, 87)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (134, N'58879-10G', N'68.10', 6810, 0.01, 88)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (141, N'L8021-25G', N'1,580.00', 63200, 0.025, 89)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (145, N'L5626-5KG', N'660.00', 132, 5, 90)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (147, N'L7039-10KG', N'2,080.00', 208, 10, 91)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (147, N'L7039-25KG', N'4,750.00', 190, 25, 92)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (154, N'M8439-25KG', N'10,140.00', 405.6, 25, 93)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (157, N'75440-100G', N'765.00', 7650, 0.1, 94)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (160, N'P8740-10KG', N'5,320.00', 532, 10, 95)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (160, N'P8740-25KG', N'12,080.00', 483.2, 25, 96)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (172, N'T4071-10KG', N'11,120.00', 1112, 10, 97)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (172, N'T4071-25KG', N'25,260.00', 1010.4, 25, 98)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (184, N'V4638-10KG', N'6,150.00', 615, 10, 99)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (184, N'V4638-25KG', N'13,340.00', 533.6, 25, 100)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (197, N'53319-100G', N'188.00', 1880, 0.1, 101)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (198, N'58879-10G', N'68.10', 6810, 0.01, 102)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (116, N'G5417-100G', N'61.70', 617, 0.1, 103)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (116, N'G5417-1KG', N'257.00', 257, 1, 104)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (116, N'G5417-10KG', N'1,670.00', 167, 10, 105)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (116, N'G5417-25KG', N'3,860.00', 154.4, 25, 106)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (7, N'1028361000', N'178.00', 178, 1, 107)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (7, N'1028360001', N'224.00', 336, 1500, 108)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (138, N'L6914-10KG', N'7,400.00', 740, 10, 109)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (138, N'L6914-100G', N'281.00', 2810, 0.1, 110)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (138, N'L6914-1KG', N'1,090.00', 1090, 1, 111)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (962, N'1002890025', N'31.25', NULL, NULL, 112)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (962, N'1002890100', N'55.00', NULL, NULL, 113)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (962, N'1002899010', N'2,096.00', NULL, NULL, 114)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005901000', N'71.00', NULL, NULL, 115)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005900001', N'164.00', NULL, NULL, 116)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005905000', N'246.00', NULL, NULL, 117)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005909012', N'439.00', NULL, NULL, 118)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005909025', N'784.00', NULL, NULL, 119)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (964, N'1005909050', N'1,450.00', NULL, NULL, 120)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (965, N'1015441000', N'231.00', NULL, NULL, 121)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (965, N'1015440001', N'567.00', NULL, NULL, 122)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (965, N'1015445000', N'878.00', NULL, NULL, 123)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (965, N'1015449010', N'1,580.00', NULL, NULL, 124)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (966, N'1015870001', N'513.00', NULL, NULL, 125)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (966, N'1015879010', N'1,430.00', NULL, NULL, 126)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (967, N'1027350001', N'506.00', NULL, NULL, 127)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (967, N'1027359010', N'1,410.00', NULL, NULL, 128)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (968, N'1028361000', N'178.00', NULL, NULL, 129)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (968, N'1028360001', N'224.00', NULL, NULL, 130)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (969, N'1028389010', N'2,480.00', NULL, NULL, 131)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (970, N'1028390025', N'36.00', NULL, NULL, 132)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (972, N'1043520500', N'308.00', NULL, NULL, 133)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (972, N'1043520001', N'694.00', NULL, NULL, 134)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (972, N'1043529010', N'3,770.00', NULL, NULL, 135)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (973, N'1043540001', N'489.00', NULL, NULL, 136)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (973, N'1043549010', N'2,520.00', NULL, NULL, 137)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (974, N'1057011000', N'131.00', NULL, NULL, 138)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (974, N'1057019025', N'1,680.00', NULL, NULL, 139)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (997, N'8145990050', N'61.30', NULL, NULL, 140)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (998, N'8149860050', N'76.30', NULL, NULL, 141)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (999, N'8160000025', N'22.20', NULL, NULL, 142)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (999, N'8160000100', N'70.60', NULL, NULL, 143)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1000, N'8160010100', N'41.60', NULL, NULL, 144)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1001, N'8160030100', N'25.50', NULL, NULL, 145)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1001, N'8160030500', N'88.20', NULL, NULL, 146)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1002, N'8160040100', N'27.80', NULL, NULL, 147)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1002, N'8160041000', N'145.00', NULL, NULL, 148)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1003, N'8160050025', N'20.90', NULL, NULL, 149)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1003, N'8160050100', N'69.60', NULL, NULL, 150)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1004, N'8160060025', N'23.90', NULL, NULL, 151)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1004, N'8160060100', N'59.20', NULL, NULL, 152)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1005, N'8160070005', N'25.70', NULL, NULL, 153)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1005, N'8160070025', N'92.90', NULL, NULL, 154)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1006, N'8160080010', N'25.00', NULL, NULL, 155)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1006, N'8160080025', N'50.20', NULL, NULL, 156)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1007, N'8160090025', N'19.80', NULL, NULL, 157)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1007, N'8160090100', N'55.00', NULL, NULL, 158)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1008, N'8160100025', N'19.80', NULL, NULL, 159)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1008, N'8160100100', N'61.80', NULL, NULL, 160)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1009, N'8160110010', N'21.90', NULL, NULL, 161)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1009, N'8160110050', N'35.80', NULL, NULL, 162)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1010, N'8160120025', N'60.80', NULL, NULL, 163)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1010, N'8160120100', N'191.00', NULL, NULL, 164)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1011, N'8160130250', N'28.30', NULL, NULL, 165)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1011, N'8160131000', N'86.60', NULL, NULL, 166)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1012, N'8160140025', N'26.80', NULL, NULL, 167)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1012, N'8160140100', N'90.30', NULL, NULL, 168)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1013, N'8160160025', N'22.70', NULL, NULL, 169)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1013, N'8160160100', N'61.80', NULL, NULL, 170)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1014, N'8160170025', N'38.40', NULL, NULL, 171)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1014, N'8160170100', N'117.00', NULL, NULL, 172)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1015, N'8160180100', N'39.20', NULL, NULL, 173)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1015, N'8160180500', N'113.00', NULL, NULL, 174)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1016, N'8160190025', N'36.60', NULL, NULL, 175)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1016, N'8160190100', N'101.00', NULL, NULL, 176)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1017, N'8160200025', N'36.70', NULL, NULL, 177)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1017, N'8160200100', N'101.00', NULL, NULL, 178)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1018, N'8160210025', N'33.30', NULL, NULL, 179)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1018, N'8160210100', N'63.80', NULL, NULL, 180)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1020, N'8206490100', N'34.30', NULL, NULL, 181)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1020, N'8206490500', N'107.00', NULL, NULL, 182)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1021, N'8412350100', N'62.80', NULL, NULL, 183)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1022, N'8415050001', N'36.40', NULL, NULL, 184)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1023, N'A6251-5G', N'20.60', NULL, NULL, 185)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1023, N'A6251-25G', N'67.50', NULL, NULL, 186)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1023, N'A6251-1KG', N'1,210.00', NULL, NULL, 187)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1024, N'A7377-5G', N'60.40', NULL, NULL, 188)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1024, N'A7377-25G', N'186.00', NULL, NULL, 189)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1024, N'A7377-100G', N'583.00', NULL, NULL, 190)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1025, N'A7469-1KG', N'932.00', NULL, NULL, 191)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1025, N'A7469-10MG', N'30.00', NULL, NULL, 192)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1025, N'A7469-25G', N'51.50', NULL, NULL, 193)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1025, N'A7469-100G', N'155.00', NULL, NULL, 194)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1026, N'A4349-1KG', N'1,050.00', NULL, NULL, 195)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1026, N'A4349-10KG', NULL, NULL, NULL, 196)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1026, N'A4349-25KG', NULL, NULL, NULL, 197)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1026, N'A4349-100G', N'241.00', NULL, NULL, 198)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1027, N'05129-25G', N'47.80', NULL, NULL, 199)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1027, N'05129-100G', N'160.00', NULL, NULL, 200)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1027, N'05129-500G', N'603.00', NULL, NULL, 201)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1028, N'A7502-5KG', N'869.00', NULL, NULL, 202)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1028, N'A7502-1KG', N'230.00', NULL, NULL, 203)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1029, N'596906-1G', N'996.00', NULL, NULL, 204)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1030, N'LAA21-1KT', N'586.00', NULL, NULL, 205)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1031, N'LAA10-1KT', N'238.00', NULL, NULL, 206)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1032, N'09416-1EA', N'472.00', NULL, NULL, 207)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1033, N'A9781-5ML', N'172.00', NULL, NULL, 208)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1034, N'A2908-1ML', N'51.40', NULL, NULL, 209)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1034, N'A2908-5ML', N'173.00', NULL, NULL, 210)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1034, N'A2908-10ML', N'507.00', NULL, NULL, 211)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1035, N'A6407-1ML', N'55.00', NULL, NULL, 212)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1035, N'A6407-5ML', N'181.00', NULL, NULL, 213)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1035, N'A6407-10ML', N'283.00', NULL, NULL, 214)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1036, N'A9906-1ML', N'73.00', NULL, NULL, 215)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1036, N'A9906-5ML', N'241.00', NULL, NULL, 216)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1036, N'A9906-10ML', N'431.00', NULL, NULL, 217)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1037, N'A6282-1ML', N'34.80', NULL, NULL, 218)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1037, N'A6282-5ML', N'96.60', NULL, NULL, 219)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1037, N'A6282-10ML', N'155.00', NULL, NULL, 220)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1038, N'A8094-25G', N'29.00', NULL, NULL, 221)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1038, N'A8094-10MG', N'30.00', NULL, NULL, 222)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1038, N'A8094-100G', N'89.00', NULL, NULL, 223)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1038, N'A8094-1KG', N'490.00', NULL, NULL, 224)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1039, N'A4474-100G', N'170.00', NULL, NULL, 225)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1039, N'A4474-1KG', N'450.00', NULL, NULL, 226)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1039, N'A4474-10KG', N'2,700.00', NULL, NULL, 227)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1039, N'A4474-25KG', N'5,970.00', NULL, NULL, 228)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1040, N'11009-25G-F', N'37.10', NULL, NULL, 229)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1040, N'11009-100G-F', N'96.80', NULL, NULL, 230)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1040, N'11009-500G-F', N'335.00', NULL, NULL, 231)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-10G', N'16.20', NULL, NULL, 232)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-25G', N'21.60', NULL, NULL, 233)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-100G', N'47.20', NULL, NULL, 234)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-500G', N'233.00', NULL, NULL, 235)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-1KG', N'404.00', NULL, NULL, 236)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1041, N'A5131-25KG', N'6,730.00', NULL, NULL, 237)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1042, N'A6969-25G', N'32.40', NULL, NULL, 238)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1042, N'A6969-100G', N'93.20', NULL, NULL, 239)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1042, N'A6969-1KG', N'465.00', NULL, NULL, 240)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1043, N'A4599-A150X', N'0.00', NULL, NULL, 241)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1043, N'A4599-25KG', N'5,890.00', NULL, NULL, 242)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1043, N'A4599-1KG', N'481.00', NULL, NULL, 243)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1043, N'A4599-10KG', N'2,650.00', NULL, NULL, 244)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1044, N'11039-100G', N'106.00', NULL, NULL, 245)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1044, N'11039-500G', N'360.00', NULL, NULL, 246)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1045, N'A4881-1G', N'34.70', NULL, NULL, 247)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1045, N'A4881-5G', N'71.80', NULL, NULL, 248)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1045, N'A4881-25G', N'245.00', NULL, NULL, 249)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1045, N'A4881-100G', N'819.00', NULL, NULL, 250)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1046, N'RES10070-A701X', N'189.00', NULL, NULL, 251)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1046, N'RES10070-A702X', N'693.00', NULL, NULL, 252)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1046, N'RES10070-A704X', N'3,810.00', NULL, NULL, 253)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1047, N'A8381-100G', N'75.90', NULL, NULL, 254)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1047, N'A8381-1KG', N'538.00', NULL, NULL, 255)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1048, N'A8131-25G', N'160.00', NULL, NULL, 256)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1049, N'A5474-25KG', N'5,360.00', NULL, NULL, 257)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1049, N'A5474-100G', N'186.00', NULL, NULL, 258)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1049, N'A5474-1KG', N'405.00', NULL, NULL, 259)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1049, N'A5474-10KG', N'2,430.00', NULL, NULL, 260)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1050, N'A8949-10MG', N'17.10', NULL, NULL, 261)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1050, N'A8949-1G', N'21.50', NULL, NULL, 262)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1050, N'A8949-25G', N'30.30', NULL, NULL, 263)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1050, N'A8949-100G', N'58.60', NULL, NULL, 264)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1051, N'11189-100G', N'49.00', NULL, NULL, 265)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1051, N'11189-500G', N'197.00', NULL, NULL, 266)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1051, N'11189-1KG', N'294.00', NULL, NULL, 267)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1052, N'A9006-100G', N'24.90', NULL, NULL, 268)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1052, N'A9006-500G', N'80.70', NULL, NULL, 269)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1052, N'A9006-1KG', N'140.00', NULL, NULL, 270)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1053, N'A2025-100G', N'104.00', NULL, NULL, 271)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1053, N'A2025-250G', N'220.00', NULL, NULL, 272)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1053, N'A2025-500G', N'377.00', NULL, NULL, 273)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1054, N'B6766-100ML', N'53.80', NULL, NULL, 274)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1055, N'30170-10G', N'125.00', NULL, NULL, 275)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1055, N'30170-50G', N'473.00', NULL, NULL, 276)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360B-100G', N'0.00', NULL, NULL, 277)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360B-10KG', N'0.00', NULL, NULL, 278)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360B-10KG-TW', N'0.00', NULL, NULL, 279)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360-1KG', N'1,040.00', NULL, NULL, 280)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360-100G', N'254.00', NULL, NULL, 281)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360-10KG', N'6,210.00', NULL, NULL, 282)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1056, N'C5360-25KG', N'13,340.00', NULL, NULL, 283)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1057, N'30089-25G', N'61.00', NULL, NULL, 284)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1057, N'30089-100G', N'204.00', NULL, NULL, 285)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1057, N'30089-500G', N'742.00', NULL, NULL, 286)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1058, N'C7880-5KG', N'2,190.00', NULL, NULL, 287)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1058, N'C7880-500MG', N'14.10', NULL, NULL, 288)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1058, N'C7880-100G', N'84.30', NULL, NULL, 289)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1058, N'C7880-500G', N'340.00', NULL, NULL, 290)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1058, N'C7880-1KG', N'512.00', NULL, NULL, 291)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1059, N'C6852-1KG', N'674.00', NULL, NULL, 292)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1059, N'C6852-25G', N'37.10', NULL, NULL, 293)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1059, N'C6852-100G', N'114.00', NULL, NULL, 294)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1060, N'C5610-10KG', N'4,660.00', NULL, NULL, 295)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1060, N'C5610-25KG', N'10,590.00', NULL, NULL, 296)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1060, N'C5610-100G', N'264.00', NULL, NULL, 297)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1060, N'C5610-1KG', N'848.00', NULL, NULL, 298)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1061, N'30129-25G', N'50.90', NULL, NULL, 299)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1061, N'30129-100G', N'151.00', NULL, NULL, 300)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1062, N'C9768-5G', N'170.00', NULL, NULL, 301)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1062, N'C9768-10G', N'314.00', NULL, NULL, 302)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1062, N'C9768-25G', N'676.00', NULL, NULL, 303)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1063, N'C7602-10MG', N'26.90', NULL, NULL, 304)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1063, N'C7602-25G', N'44.90', NULL, NULL, 305)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1063, N'C7602-100G', N'99.80', NULL, NULL, 306)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1063, N'C7602-1KG', N'686.00', NULL, NULL, 307)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1064, N'C8630-1G', N'40.40', NULL, NULL, 308)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1064, N'C8630-5G', N'129.00', NULL, NULL, 309)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1064, N'C8630-25G', N'510.00', NULL, NULL, 310)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1066, N'RES1513C-A702X', N'0.00', NULL, NULL, 311)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1066, N'RES1513C-A701X', N'180.00', NULL, NULL, 312)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1066, N'RES1513C-A704X', N'6,390.00', NULL, NULL, 313)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1067, N'G5667-10KG', N'2,200.00', NULL, NULL, 314)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1067, N'G5667-25KG', N'4,930.00', NULL, NULL, 315)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1067, N'G5667-100G', N'144.00', NULL, NULL, 316)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1067, N'G5667-1KG', N'251.00', NULL, NULL, 317)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1068, N'G8415-10MG', N'27.80', NULL, NULL, 318)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1068, N'G8415-100G', N'38.60', NULL, NULL, 319)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1068, N'G8415-1KG', N'208.00', NULL, NULL, 320)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1069, N'49449-100G', N'42.50', NULL, NULL, 321)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1069, N'49449-500G', N'157.00', NULL, NULL, 322)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1069, N'49449-1KG', N'248.00', NULL, NULL, 323)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1070, N'G1251-100G', N'31.20', NULL, NULL, 324)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1070, N'G1251-500G', N'78.80', NULL, NULL, 325)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1070, N'G1251-1KG', N'117.00', NULL, NULL, 326)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1070, N'G1251-5KG', N'433.00', NULL, NULL, 327)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1071, N'G1126-10G', N'34.70', NULL, NULL, 328)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1071, N'G1126-25G', N'61.00', NULL, NULL, 329)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1071, N'G1126-100G', N'171.00', NULL, NULL, 330)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1071, N'G1126-1KG', N'674.00', NULL, NULL, 331)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1073, N'G3126-100G', N'82.50', NULL, NULL, 332)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1073, N'G3126-250G', N'181.00', NULL, NULL, 333)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1073, N'G3126-500G', N'332.00', NULL, NULL, 334)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1073, N'G3126-1KG', N'609.00', NULL, NULL, 335)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1074, N'G5792-10KG', N'4,380.00', NULL, NULL, 336)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1074, N'G5792-100G', N'157.00', NULL, NULL, 337)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1074, N'G5792-1KG', N'677.00', NULL, NULL, 338)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1074, N'G5792-25KG', N'9,030.00', NULL, NULL, 339)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1075, N'G8540-10MG', N'28.10', NULL, NULL, 340)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1075, N'G8540-25G', N'57.40', NULL, NULL, 341)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1075, N'G8540-100G', N'200.00', NULL, NULL, 342)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1075, N'G8540-1KG', N'990.00', NULL, NULL, 343)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1077, N'G5417-100G', N'61.70', NULL, NULL, 344)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1077, N'G5417-1KG', N'257.00', NULL, NULL, 345)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1077, N'G5417-10KG', N'1,670.00', NULL, NULL, 346)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1077, N'G5417-25KG', N'3,860.00', NULL, NULL, 347)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-25KG', N'1,240.00', NULL, NULL, 348)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-10MG', N'27.80', NULL, NULL, 349)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-100G', N'37.40', NULL, NULL, 350)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-500G', N'64.00', NULL, NULL, 351)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-1KG', N'95.90', NULL, NULL, 352)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1078, N'G7126-5KG', N'392.00', NULL, NULL, 353)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1079, N'50046-50G', N'26.10', NULL, NULL, 354)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1079, N'50046-250G', N'69.30', NULL, NULL, 355)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1079, N'50046-1KG', N'211.00', NULL, NULL, 356)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1080, N'G7403-100G', N'99.80', NULL, NULL, 357)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1080, N'G7403-250G', N'179.00', NULL, NULL, 358)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1080, N'G7403-1KG', N'535.00', NULL, NULL, 359)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1081, N'G8790-100G', N'55.90', NULL, NULL, 360)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1081, N'G8790-1KG', N'161.00', NULL, NULL, 361)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1082, N'H3751-5G', N'171.00', NULL, NULL, 362)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1082, N'H3751-25G', N'557.00', NULL, NULL, 363)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1083, N'H6034-10MG', N'31.50', NULL, NULL, 364)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1083, N'H6034-25G', N'75.90', NULL, NULL, 365)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1083, N'H6034-100G', N'232.00', NULL, NULL, 366)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1083, N'H6034-1KG', N'1,390.00', NULL, NULL, 367)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1084, N'H3911-1KG', N'1,200.00', NULL, NULL, 368)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1084, N'H3911-25KG', N'15,900.00', NULL, NULL, 369)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1084, N'H3911-100G', N'299.00', NULL, NULL, 370)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1084, N'H3911-10KG', N'7,160.00', NULL, NULL, 371)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1085, N'53319-100G', N'188.00', NULL, NULL, 372)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1085, N'53319-25G', N'62.20', NULL, NULL, 373)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1086, N'53340-10G', N'95.60', NULL, NULL, 374)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1086, N'53340-50G', N'348.00', NULL, NULL, 375)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1087, N'H4036-100G', N'206.00', NULL, NULL, 376)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1087, N'H4036-1KG', N'809.00', NULL, NULL, 377)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1088, N'53370-25G', N'26.60', NULL, NULL, 378)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1088, N'53370-100G', N'107.00', NULL, NULL, 379)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1088, N'53370-500G', N'366.00', NULL, NULL, 380)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1089, N'H7750-25G', N'195.00', NULL, NULL, 381)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1089, N'H7750-100G', N'617.00', NULL, NULL, 382)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1090, N'H7875-25G', N'121.00', NULL, NULL, 383)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1091, N'H1007-5G', N'443.00', NULL, NULL, 384)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1092, N'69453-10MG', N'37.40', NULL, NULL, 385)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1092, N'69453-50MG', N'141.00', NULL, NULL, 386)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1093, N'I5281-100G', N'489.00', NULL, NULL, 387)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1093, N'I5281-1KG', N'2,040.00', NULL, NULL, 388)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1093, N'I5281-10KG', N'11,170.00', NULL, NULL, 389)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1094, N'I7403-10MG', N'31.50', NULL, NULL, 390)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1094, N'I7403-25G', N'96.20', NULL, NULL, 391)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1094, N'I7403-100G', N'449.00', NULL, NULL, 392)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1094, N'I7403-1KG', N'2,470.00', NULL, NULL, 393)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1095, N'58879-10G', N'68.10', NULL, NULL, 394)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1095, N'58879-50G', N'272.00', NULL, NULL, 395)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1095, N'58879-250G', N'885.00', NULL, NULL, 396)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1096, N'L8543-10MG', N'150.00', NULL, NULL, 397)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1096, N'L8543-25MG', N'315.00', NULL, NULL, 398)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1097, N'L8912-10MG', N'16.30', NULL, NULL, 399)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1097, N'L8912-25G', N'44.90', NULL, NULL, 400)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1097, N'L8912-100G', N'149.00', NULL, NULL, 401)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1097, N'L8912-1KG', N'621.00', NULL, NULL, 402)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1098, N'L8000-25G', N'25.80', NULL, NULL, 403)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1098, N'L8000-50G', N'30.60', NULL, NULL, 404)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1098, N'L8000-100G', N'61.60', NULL, NULL, 405)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1098, N'L8000-250G', N'176.00', NULL, NULL, 406)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1098, N'L8000-1KG', N'500.00', NULL, NULL, 407)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1099, N'L6914-10KG', N'7,400.00', NULL, NULL, 408)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1099, N'L6914-100G', N'281.00', NULL, NULL, 409)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1099, N'L6914-1KG', N'1,090.00', NULL, NULL, 410)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1100, N'61819-25G', N'55.30', NULL, NULL, 411)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1100, N'61819-100G', N'175.00', NULL, NULL, 412)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1100, N'61819-500G', N'558.00', NULL, NULL, 413)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1103, N'L5876-5G', N'339.00', NULL, NULL, 414)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1103, N'L5876-25G', N'700.00', NULL, NULL, 415)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1104, N'L1884-25G', N'64.60', NULL, NULL, 416)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1104, N'L1884-100G', N'192.00', NULL, NULL, 417)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1104, N'L1884-500G', N'562.00', NULL, NULL, 418)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1105, N'L5751-25G', N'52.10', NULL, NULL, 419)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1105, N'L5751-100G', N'168.00', NULL, NULL, 420)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1106, N'L5626-5KG', N'660.00', NULL, NULL, 421)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1106, N'L5626-100G', N'23.70', NULL, NULL, 422)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1106, N'L5626-500G', N'95.60', NULL, NULL, 423)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1106, N'L5626-1KG', N'154.00', NULL, NULL, 424)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1107, N'L8662-25G', N'33.80', NULL, NULL, 425)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1107, N'L8662-100G', N'68.70', NULL, NULL, 426)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1107, N'L8662-1KG', N'344.00', NULL, NULL, 427)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1109, N'62929-100G-F', N'40.40', NULL, NULL, 428)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1110, N'L6001-25G', N'46.60', NULL, NULL, 429)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1110, N'L6001-100G', N'119.00', NULL, NULL, 430)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1110, N'L6001-1KG', N'1,160.00', NULL, NULL, 431)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1111, N'M5550-100ML', N'28.70', NULL, NULL, 432)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1112, N'M9375-5G', N'52.90', NULL, NULL, 433)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1112, N'M9375-25G', N'171.00', NULL, NULL, 434)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1113, N'M9625-5G', N'17.00', NULL, NULL, 435)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1113, N'M9625-25G', N'27.80', NULL, NULL, 436)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1113, N'M9625-100G', N'80.70', NULL, NULL, 437)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1113, N'M9625-500G', N'338.00', NULL, NULL, 438)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1113, N'M9625-1KG', N'510.00', NULL, NULL, 439)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1114, N'M5308-10MG', N'26.90', NULL, NULL, 440)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1114, N'M5308-25G', N'61.00', NULL, NULL, 441)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1114, N'M5308-100G', N'201.00', NULL, NULL, 442)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1114, N'M5308-1KG', N'996.00', NULL, NULL, 443)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1115, N'M8439-25KG', N'10,140.00', NULL, NULL, 444)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1115, N'M8439-100G', N'235.00', NULL, NULL, 445)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1115, N'M8439-1KG', N'764.00', NULL, NULL, 446)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1115, N'M8439-10KG', N'4,590.00', NULL, NULL, 447)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1116, N'64319-25G-F', N'58.60', NULL, NULL, 448)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1116, N'64319-100G-F', N'186.00', NULL, NULL, 449)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1117, N'M9500-100G', N'38.00', NULL, NULL, 450)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1117, N'M9500-500G', N'135.00', NULL, NULL, 451)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1117, N'M9500-1KG', N'194.00', NULL, NULL, 452)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1118, N'75440-100G', N'765.00', NULL, NULL, 453)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1118, N'75440-5G', N'56.50', NULL, NULL, 454)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1118, N'75440-25G', N'254.00', NULL, NULL, 455)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1119, N'75469-25G', N'55.90', NULL, NULL, 456)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1119, N'75469-500G', N'739.00', NULL, NULL, 457)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1120, N'P5482-10MG', N'26.90', NULL, NULL, 458)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1120, N'P5482-25G', N'56.50', NULL, NULL, 459)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1120, N'P5482-100G', N'195.00', NULL, NULL, 460)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1120, N'P5482-1KG', N'1,060.00', NULL, NULL, 461)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1122, N'P5607-25G', N'68.10', NULL, NULL, 462)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1122, N'P5607-100G', N'216.00', NULL, NULL, 463)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1122, N'P5607-1KG', N'1,300.00', NULL, NULL, 464)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1123, N'P8865-100G', N'343.00', NULL, NULL, 465)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1123, N'P8865-1KG', N'1,280.00', NULL, NULL, 466)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1123, N'P8865-10KG', N'8,270.00', NULL, NULL, 467)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1124, N'81709-10G', N'41.90', NULL, NULL, 468)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1124, N'81709-25G', N'83.70', NULL, NULL, 469)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1124, N'81709-100G', N'280.00', NULL, NULL, 470)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1125, N'R7131-100ML', N'54.40', NULL, NULL, 471)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1126, N'RES0908S-A704X', N'7,580.00', NULL, NULL, 472)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1126, N'RES0908S-A705X', N'16,670.00', NULL, NULL, 473)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1126, N'RES0908S-A701X', N'316.00', NULL, NULL, 474)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1126, N'RES0908S-A702X', N'1,270.00', NULL, NULL, 475)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1127, N'S4311-25G', N'108.00', NULL, NULL, 476)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1127, N'S4311-100G', N'223.00', NULL, NULL, 477)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1127, N'S4311-1KG', N'1,160.00', NULL, NULL, 478)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1129, N'S4375-100G', N'98.00', NULL, NULL, 479)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1129, N'S4375-1KG', N'687.00', NULL, NULL, 480)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1130, N'SMB00395-100MG', N'119.00', NULL, NULL, 481)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1130, N'SMB00395-500MG', N'470.00', NULL, NULL, 482)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1131, N'T8250-5G', N'67.50', NULL, NULL, 483)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1131, N'T8250-25G', N'266.00', NULL, NULL, 484)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1131, N'T8250-100G', N'747.00', NULL, NULL, 485)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1132, N'T8441-10MG', N'31.50', NULL, NULL, 486)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1132, N'T8441-25G', N'138.00', NULL, NULL, 487)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1132, N'T8441-100G', N'464.00', NULL, NULL, 488)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1132, N'T8441-1KG', N'2,720.00', NULL, NULL, 489)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1134, N'89179-10G', N'50.00', NULL, NULL, 490)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1134, N'89179-50G', N'173.00', NULL, NULL, 491)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1134, N'89179-250G', N'686.00', NULL, NULL, 492)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1135, N'T8375-100G', N'256.00', NULL, NULL, 493)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1136, N'T8941-10MG', N'29.60', NULL, NULL, 494)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1136, N'T8941-25G', N'114.00', NULL, NULL, 495)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1136, N'T8941-100G', N'386.00', NULL, NULL, 496)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1136, N'T8941-1KG', N'2,260.00', NULL, NULL, 497)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1138, N'93659-10G', N'63.40', NULL, NULL, 498)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1138, N'93659-50G', N'234.00', NULL, NULL, 499)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1138, N'93659-250G', N'880.00', NULL, NULL, 500)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1139, N'T3300-5G', N'41.00', NULL, NULL, 501)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1139, N'T3300-25G', N'215.00', NULL, NULL, 502)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1139, N'T3300-100G', N'646.00', NULL, NULL, 503)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1140, N'T3629-1G', N'188.00', NULL, NULL, 504)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1141, N'T8566-10MG', N'29.30', NULL, NULL, 505)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1141, N'T8566-25G', N'61.60', NULL, NULL, 506)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1141, N'T8566-100G', N'211.00', NULL, NULL, 507)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1141, N'T8566-1KG', N'1,120.00', NULL, NULL, 508)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1142, N'T4321-10KG', N'4,860.00', NULL, NULL, 509)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1142, N'T4321-25KG', N'10,520.00', NULL, NULL, 510)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1142, N'T4321-100G', N'202.00', NULL, NULL, 511)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1142, N'T4321-1KG', N'808.00', NULL, NULL, 512)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1147, N'05159-100G', N'38.60', NULL, NULL, 513)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1147, N'05159-500G', N'150.00', NULL, NULL, 514)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1148, N'05129-25G', N'47.80', NULL, NULL, 515)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1148, N'05129-100G', N'160.00', NULL, NULL, 516)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1148, N'05129-500G', N'603.00', NULL, NULL, 517)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1149, N'11009-25G-F', N'37.10', NULL, NULL, 518)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1149, N'11009-100G-F', N'96.80', NULL, NULL, 519)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1149, N'11009-500G-F', N'335.00', NULL, NULL, 520)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1150, N'11039-100G', N'106.00', NULL, NULL, 521)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1150, N'11039-500G', N'360.00', NULL, NULL, 522)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1151, N'11189-100G', N'49.00', NULL, NULL, 523)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1151, N'11189-500G', N'197.00', NULL, NULL, 524)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1151, N'11189-1KG', N'294.00', NULL, NULL, 525)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1152, N'30089-25G', N'61.00', NULL, NULL, 526)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1152, N'30089-100G', N'204.00', NULL, NULL, 527)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1152, N'30089-500G', N'742.00', NULL, NULL, 528)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1153, N'30129-25G', N'50.90', NULL, NULL, 529)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1153, N'30129-100G', N'151.00', NULL, NULL, 530)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1154, N'49449-100G', N'42.50', NULL, NULL, 531)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1154, N'49449-500G', N'157.00', NULL, NULL, 532)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1154, N'49449-1KG', N'248.00', NULL, NULL, 533)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1155, N'49419-25G', N'45.50', NULL, NULL, 534)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1155, N'49419-100G', N'148.00', NULL, NULL, 535)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1155, N'49419-500G', N'473.00', NULL, NULL, 536)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1156, N'50046-50G', N'26.10', NULL, NULL, 537)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1156, N'50046-250G', N'69.30', NULL, NULL, 538)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1156, N'50046-1KG', N'211.00', NULL, NULL, 539)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1157, N'50239-1G', N'51.80', NULL, NULL, 540)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1157, N'50239-5G', N'174.00', NULL, NULL, 541)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1158, N'53319-100G', N'188.00', NULL, NULL, 542)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1158, N'53319-25G', N'62.20', NULL, NULL, 543)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1159, N'58879-10G', N'68.10', NULL, NULL, 544)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1159, N'58879-50G', N'272.00', NULL, NULL, 545)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1159, N'58879-250G', N'885.00', NULL, NULL, 546)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1160, N'61819-25G', N'55.30', NULL, NULL, 547)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1160, N'61819-100G', N'175.00', NULL, NULL, 548)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1160, N'61819-500G', N'558.00', NULL, NULL, 549)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1161, N'62929-100G-F', N'40.40', NULL, NULL, 550)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1162, N'64319-25G-F', N'58.60', NULL, NULL, 551)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1162, N'64319-100G-F', N'186.00', NULL, NULL, 552)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1163, N'75469-25G', N'55.90', NULL, NULL, 553)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1163, N'75469-500G', N'739.00', NULL, NULL, 554)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1164, N'81709-10G', N'41.90', NULL, NULL, 555)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1164, N'81709-25G', N'83.70', NULL, NULL, 556)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1164, N'81709-100G', N'280.00', NULL, NULL, 557)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1165, N'84959-25G', N'105.00', NULL, NULL, 558)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1165, N'84959-100G', N'347.00', NULL, NULL, 559)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1166, N'89179-10G', N'50.00', NULL, NULL, 560)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1166, N'89179-50G', N'173.00', NULL, NULL, 561)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1166, N'89179-250G', N'686.00', NULL, NULL, 562)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1167, N'93659-10G', N'63.40', NULL, NULL, 563)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1167, N'93659-50G', N'234.00', NULL, NULL, 564)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1167, N'93659-250G', N'880.00', NULL, NULL, 565)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1168, N'93829-25G', N'50.90', NULL, NULL, 566)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1168, N'93829-100G', N'171.00', NULL, NULL, 567)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1169, N'94619-25G', N'58.90', NULL, NULL, 568)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1169, N'94619-100G', N'197.00', NULL, NULL, 569)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1170, N'A4375-1G', N'124.00', NULL, NULL, 570)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1171, N'A4625-1G', N'67.50', NULL, NULL, 571)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1171, N'A4625-5G', N'236.00', NULL, NULL, 572)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1172, N'A3133-5G', N'79.50', NULL, NULL, 573)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1172, N'A3133-10G', N'149.00', NULL, NULL, 574)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1173, N'A5625-5G', N'322.00', NULL, NULL, 575)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1174, N'A1509-250MG', N'153.00', NULL, NULL, 576)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1174, N'A1509-1G', N'503.00', NULL, NULL, 577)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1175, N'A9125-25G', N'37.10', NULL, NULL, 578)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1176, N'A0876-5G', N'452.00', NULL, NULL, 579)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1177, N'A0292-1G', N'534.00', NULL, NULL, 580)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1178, N'A2010-100MG', N'26.30', NULL, NULL, 581)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1178, N'A2010-500MG', N'86.00', NULL, NULL, 582)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1178, N'A2010-1G', N'109.00', NULL, NULL, 583)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1179, N'A4021-1G', N'75.30', NULL, NULL, 584)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1179, N'A4021-5G', N'219.00', NULL, NULL, 585)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1180, N'A1501-5G', N'387.00', NULL, NULL, 586)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1181, N'A3626-500MG', N'215.00', NULL, NULL, 587)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1181, N'A3626-1G', N'396.00', NULL, NULL, 588)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1182, N'01423-5G', N'203.00', NULL, NULL, 589)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1182, N'01423-1G', N'58.60', NULL, NULL, 590)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1183, N'59891-250MG-F', N'177.00', NULL, NULL, 591)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1184, N'A3876-1G', N'75.30', NULL, NULL, 592)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1184, N'A3876-5G', N'176.00', NULL, NULL, 593)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1185, N'A4251-5G', N'258.00', NULL, NULL, 594)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1186, N'A7512-500MG', N'157.00', NULL, NULL, 595)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1186, N'A7512-1G', N'228.00', NULL, NULL, 596)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1187, N'A0783-1G', N'89.00', NULL, NULL, 597)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1187, N'A0783-5G', N'241.00', NULL, NULL, 598)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1188, N'A2638-1G', N'315.00', NULL, NULL, 599)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1188, N'A2638-10G', N'1,890.00', NULL, NULL, 600)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1189, N'A6376-10G', N'88.40', NULL, NULL, 601)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1189, N'A6376-25G', N'147.00', NULL, NULL, 602)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1190, N'ARK2160C-10KG', N'16,410.00', NULL, NULL, 603)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1190, N'ARK2160C-25KG', N'37,730.00', NULL, NULL, 604)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1190, N'ARK2160C-1KG', N'1,940.00', NULL, NULL, 605)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1191, N'A6501-250MG', N'82.50', NULL, NULL, 606)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1191, N'A6501-1G', N'256.00', NULL, NULL, 607)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1191, N'A6501-100MG', N'48.40', NULL, NULL, 608)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1191, N'A6501-500MG', N'155.00', NULL, NULL, 609)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1192, N'T4446-100G', N'299.00', NULL, NULL, 610)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1192, N'T4446-1KG', N'1,160.00', NULL, NULL, 611)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1193, N'A6751-5G', N'88.40', NULL, NULL, 612)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1193, N'A6751-10G', N'175.00', NULL, NULL, 613)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1193, N'A6751-25G', N'305.00', NULL, NULL, 614)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1194, N'A7772-25MG', N'252.00', NULL, NULL, 615)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1194, N'A7772-100MG', N'836.00', NULL, NULL, 616)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1195, N'A4377-25MG', N'339.00', NULL, NULL, 617)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1195, N'A4377-100MG', N'1,140.00', NULL, NULL, 618)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1195, N'A4377-5MG', N'98.50', NULL, NULL, 619)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1196, N'05160-50G', N'20.40', NULL, NULL, 620)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1196, N'05160-250G', N'37.70', NULL, NULL, 621)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1196, N'05160-1KG', N'132.00', NULL, NULL, 622)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1197, N'A7652-5G', N'994.00', NULL, NULL, 623)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1197, N'A7652-25G', N'3,070.00', NULL, NULL, 624)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1198, N'A1139-5G', N'112.00', NULL, NULL, 625)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1199, N'A7877-5G', N'248.00', NULL, NULL, 626)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1200, N'A3041-5G', N'241.00', NULL, NULL, 627)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1201, N'A2005-5G', N'241.00', NULL, NULL, 628)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1202, N'A8378-25G', N'1,320.00', NULL, NULL, 629)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1202, N'A8378-1G', N'96.20', NULL, NULL, 630)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1202, N'A8378-5G', N'365.00', NULL, NULL, 631)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1202, N'A8378-10G', N'596.00', NULL, NULL, 632)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1203, N'A8137-1G', N'1,120.00', NULL, NULL, 633)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1204, N'A0879-5G', N'542.00', NULL, NULL, 634)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1205, N'A0664-250MG', N'265.00', NULL, NULL, 635)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1206, N'A1879-1G', N'105.00', NULL, NULL, 636)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1206, N'A1879-5G', N'346.00', NULL, NULL, 637)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1207, N'A2636-250MG', N'45.50', NULL, NULL, 638)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1207, N'A2636-1G', N'130.00', NULL, NULL, 639)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1207, N'A2636-5G', N'529.00', NULL, NULL, 640)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1208, N'A5402-100MG', N'229.00', NULL, NULL, 641)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1209, N'A1422-100G', N'434.00', NULL, NULL, 642)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1209, N'A1422-10G', N'69.30', NULL, NULL, 643)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1209, N'A1422-25G', N'124.00', NULL, NULL, 644)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1209, N'A1422-250G', N'871.00', NULL, NULL, 645)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1210, N'A3759-25G', N'229.00', NULL, NULL, 646)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1210, N'A3759-100G', N'676.00', NULL, NULL, 647)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1211, N'A9075-25MG', N'84.90', NULL, NULL, 648)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1211, N'A9075-10MG', N'42.50', NULL, NULL, 649)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1211, N'A9075-100MG', N'272.00', NULL, NULL, 650)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1212, N'A7902-100MG', N'96.80', NULL, NULL, 651)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1212, N'A7902-250MG', N'167.00', NULL, NULL, 652)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1212, N'A7902-1G', N'509.00', NULL, NULL, 653)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1213, N'A5338-1G', N'399.00', NULL, NULL, 654)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1214, N'A6553-25MG', N'479.00', NULL, NULL, 655)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1215, N'A3913-1G', N'137.00', NULL, NULL, 656)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1215, N'A3913-5G', N'500.00', NULL, NULL, 657)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1216, N'A2883-5G', N'74.70', NULL, NULL, 658)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1217, N'A1057-50MG', N'626.00', NULL, NULL, 659)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1218, N'B2129-25G', N'364.00', NULL, NULL, 660)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1219, N'A0877-1G', N'316.00', NULL, NULL, 661)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1220, N'A6508-100MG', N'210.00', NULL, NULL, 662)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1220, N'A6508-1G', N'1,110.00', NULL, NULL, 663)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1221, N'A8291-25G', N'1,390.00', NULL, NULL, 664)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1221, N'A8291-1G', N'88.40', NULL, NULL, 665)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1222, N'A1632-1G', N'451.00', NULL, NULL, 666)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1223, N'B4261-5MG', N'41.60', NULL, NULL, 667)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1223, N'B4261-25MG', N'118.00', NULL, NULL, 668)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1223, N'B4261-50MG', N'202.00', NULL, NULL, 669)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1223, N'B4261-100MG', N'346.00', NULL, NULL, 670)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1223, N'B4261-250MG', N'689.00', NULL, NULL, 671)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1224, N'B1758-25MG', N'157.00', NULL, NULL, 672)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1224, N'B1758-50MG', N'233.00', NULL, NULL, 673)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1224, N'B1758-100MG', N'381.00', NULL, NULL, 674)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1224, N'B1758-250MG', N'762.00', NULL, NULL, 675)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1225, N'C3205-50MG', N'189.00', NULL, NULL, 676)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1225, N'C3205-250MG', N'740.00', NULL, NULL, 677)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1226, N'T4631-1G', N'230.00', NULL, NULL, 678)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1227, N'B1403-250MG', N'92.50', NULL, NULL, 679)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1227, N'B1403-1G', N'287.00', NULL, NULL, 680)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1228, N'B7144-5G', N'391.00', NULL, NULL, 681)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1229, N'B7032-50MG', N'491.00', NULL, NULL, 682)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1230, N'B2511-100MG', N'190.00', NULL, NULL, 683)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1232, N'B9003-25G', N'688.00', NULL, NULL, 684)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1233, N'B2522-5G', N'468.00', NULL, NULL, 685)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1235, N'B8254-10G', N'224.00', NULL, NULL, 686)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1236, N'09794-1G', N'601.00', NULL, NULL, 687)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1237, N'B5890-5G', N'80.70', NULL, NULL, 688)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1238, N'B2519-5G', N'821.00', NULL, NULL, 689)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1239, N'10942-25MG', N'158.00', NULL, NULL, 690)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1240, N'09945-25MG', N'163.00', NULL, NULL, 691)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1241, N'C4375-10G', N'211.00', NULL, NULL, 692)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1242, N'C4272-1MG', N'261.00', NULL, NULL, 693)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1243, N'C7757-1G', N'24.30', NULL, NULL, 694)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1243, N'C7757-5G', N'44.60', NULL, NULL, 695)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1243, N'C7757-25G', N'115.00', NULL, NULL, 696)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1244, N'C9500-100G', N'109.00', NULL, NULL, 697)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1244, N'C9500-5G', N'23.70', NULL, NULL, 698)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1244, N'C9500-25G', N'47.50', NULL, NULL, 699)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1246, N'BOCCCK-1KT', N'476.00', NULL, NULL, 700)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1247, N'C9650-250MG', N'575.00', NULL, NULL, 701)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1249, N'C2196-5MG', N'128.00', NULL, NULL, 702)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1249, N'C2196-25MG', N'436.00', NULL, NULL, 703)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1250, N'D0125-5G', N'1,180.00', NULL, NULL, 704)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1251, N'D0250-1G', N'416.00', NULL, NULL, 705)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1251, N'D0250-250MG', N'125.00', NULL, NULL, 706)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1252, N'D0875-100MG', N'71.80', NULL, NULL, 707)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1252, N'D0875-250MG', N'157.00', NULL, NULL, 708)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1252, N'D0875-1G', N'429.00', NULL, NULL, 709)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1253, N'D0756-100MG', N'119.00', NULL, NULL, 710)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1254, N'D2000-100MG', N'124.00', NULL, NULL, 711)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1255, N'17248-25MG', N'169.00', NULL, NULL, 712)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1259, N'D3758-1G', N'72.90', NULL, NULL, 713)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1259, N'D3758-5G', N'288.00', NULL, NULL, 714)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1259, N'D3758-25G', N'1,190.00', NULL, NULL, 715)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1260, N'D0778-10MG', N'214.00', NULL, NULL, 716)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1261, N'D0629-5G', N'1,280.00', NULL, NULL, 717)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1261, N'D0629-500MG', N'213.00', NULL, NULL, 718)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1262, N'D0754-10G', N'82.40', NULL, NULL, 719)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1263, N'D6382-5G', N'51.20', NULL, NULL, 720)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1263, N'D6382-25G', N'175.00', NULL, NULL, 721)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1265, N'17247-25MG', N'163.00', NULL, NULL, 722)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1266, N'E6005-5G', N'104.00', NULL, NULL, 723)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1266, N'E6005-25G', N'410.00', NULL, NULL, 724)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1266, N'E6005-100G', N'880.00', NULL, NULL, 725)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1267, N'E5139-1G', N'92.60', NULL, NULL, 726)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1267, N'E5139-5G', N'319.00', NULL, NULL, 727)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1267, N'E5139-25G', N'1,230.00', NULL, NULL, 728)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1268, N'F5126-5G', N'321.00', NULL, NULL, 729)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1271, N'F7376-100MG', N'770.00', NULL, NULL, 730)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1271, N'F7376-500MG', N'2,650.00', NULL, NULL, 731)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1272, N'F0896-1G', N'411.00', NULL, NULL, 732)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1273, N'F4505-500MG', N'361.00', NULL, NULL, 733)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1274, N'95727-1G-F', N'235.00', NULL, NULL, 734)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1274, N'95727-5G-F', N'911.00', NULL, NULL, 735)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1275, N'F0148-1G', N'241.00', NULL, NULL, 736)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1285, N'G3267-1G', N'39.80', NULL, NULL, 737)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1285, N'G3267-5G', N'131.00', NULL, NULL, 738)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1285, N'G3267-25G', N'522.00', NULL, NULL, 739)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1286, N'G5761-1G', N'243.00', NULL, NULL, 740)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1289, N'10939-25MG', N'163.00', NULL, NULL, 741)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1290, N'09926-25MG', N'164.00', NULL, NULL, 742)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1291, N'80666-50MG', N'714.00', NULL, NULL, 743)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1292, N'H6759-250MG', N'426.00', NULL, NULL, 744)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1293, N'H6503-250MG', N'226.00', NULL, NULL, 745)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1293, N'H6503-100MG', N'115.00', NULL, NULL, 746)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1293, N'H6503-1G', N'678.00', NULL, NULL, 747)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1293, N'H6503-5G', N'2,520.00', NULL, NULL, 748)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1294, N'H5134-1G', N'525.00', NULL, NULL, 749)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1295, N'H6010-100MG', N'70.60', NULL, NULL, 750)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1295, N'H6010-500MG', N'229.00', NULL, NULL, 751)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1295, N'H6010-1G', N'420.00', NULL, NULL, 752)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1296, N'H0501-10G', N'92.60', NULL, NULL, 753)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1296, N'H0501-25G', N'201.00', NULL, NULL, 754)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1296, N'H0501-100G', N'545.00', NULL, NULL, 755)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1297, N'03768-250MG', N'269.00', NULL, NULL, 756)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1297, N'03768-1G', N'852.00', NULL, NULL, 757)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1298, N'H4021-250MG', N'120.00', NULL, NULL, 758)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1298, N'H4021-1G', N'379.00', NULL, NULL, 759)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1299, N'H7890-1G', N'714.00', NULL, NULL, 760)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1299, N'H7890-250MG', N'214.00', NULL, NULL, 761)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1300, N'H0377-100MG', N'64.60', NULL, NULL, 762)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1300, N'H0377-250MG', N'122.00', NULL, NULL, 763)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1300, N'H0377-1G', N'269.00', NULL, NULL, 764)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1301, N'H4002-250MG', N'325.00', NULL, NULL, 765)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1301, N'H4002-1G', N'1,120.00', NULL, NULL, 766)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1302, N'H5877-250MG', N'47.20', NULL, NULL, 767)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1302, N'H5877-1G', N'131.00', NULL, NULL, 768)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1302, N'H5877-10G', N'880.00', NULL, NULL, 769)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1303, N'H1637-50MG', N'96.20', NULL, NULL, 770)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1303, N'H1637-250MG', N'314.00', NULL, NULL, 771)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1303, N'H1637-1G', N'1,080.00', NULL, NULL, 772)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1304, N'H7259-250MG', N'605.00', NULL, NULL, 773)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1305, N'10942-25MG', N'158.00', NULL, NULL, 774)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1306, N'09945-25MG', N'163.00', NULL, NULL, 775)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1307, N'17248-25MG', N'169.00', NULL, NULL, 776)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1308, N'17247-25MG', N'163.00', NULL, NULL, 777)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1309, N'10939-25MG', N'163.00', NULL, NULL, 778)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1310, N'09926-25MG', N'164.00', NULL, NULL, 779)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1311, N'10940-25MG', N'163.00', NULL, NULL, 780)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1312, N'O9014-10MG', N'80.70', NULL, NULL, 781)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1312, N'O9014-100MG', N'361.00', NULL, NULL, 782)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1313, N'O9139-10MG', N'78.30', NULL, NULL, 783)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1313, N'O9139-100MG', N'361.00', NULL, NULL, 784)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1314, N'O9264-10MG', N'75.30', NULL, NULL, 785)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1314, N'O9264-100MG', N'341.00', NULL, NULL, 786)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1315, N'10937-25MG', N'163.00', NULL, NULL, 787)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1316, N'I8757-1G', N'224.00', NULL, NULL, 788)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1317, N'I7634-250MG', N'293.00', NULL, NULL, 789)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1317, N'I7634-1G', N'981.00', NULL, NULL, 790)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1318, N'I0380-50MG', N'70.00', NULL, NULL, 791)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1319, N'I8754-25MG', N'65.20', NULL, NULL, 792)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1319, N'I8754-100MG', N'200.00', NULL, NULL, 793)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1319, N'I8754-1G', N'1,190.00', NULL, NULL, 794)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1320, N'I4879-1G', N'287.00', NULL, NULL, 795)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1321, N'K2380-25MG', N'97.40', NULL, NULL, 796)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1322, N'K3750-500MG', N'358.00', NULL, NULL, 797)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1322, N'K3750-1G', N'616.00', NULL, NULL, 798)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1322, N'K3750-5G', N'2,340.00', NULL, NULL, 799)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1323, N'L8543-10MG', N'150.00', NULL, NULL, 800)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1323, N'L8543-25MG', N'315.00', NULL, NULL, 801)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1324, N'61726-50MG', N'221.00', NULL, NULL, 802)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1324, N'61726-10MG', N'55.00', NULL, NULL, 803)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1325, N'L8250-250MG', N'66.20', NULL, NULL, 804)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1325, N'L8250-1G', N'161.00', NULL, NULL, 805)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1326, N'L2125-5G', N'373.00', NULL, NULL, 806)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1327, N'L9384-25MG', N'131.00', NULL, NULL, 807)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1328, N'L1636-500MG', N'663.00', NULL, NULL, 808)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1329, N'L0645-5G', N'203.00', NULL, NULL, 809)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1329, N'L0645-25G', N'699.00', NULL, NULL, 810)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1330, N'L7002-250MG', N'63.40', NULL, NULL, 811)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1330, N'L7002-1G', N'183.00', NULL, NULL, 812)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1330, N'L7002-5G', N'600.00', NULL, NULL, 813)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1331, N'M6635-5G', N'114.00', NULL, NULL, 814)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1331, N'M6635-10G', N'209.00', NULL, NULL, 815)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1331, N'M6635-100G', N'1,170.00', NULL, NULL, 816)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1332, N'64382-50G-F', N'64.60', NULL, NULL, 817)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1332, N'64382-250G-F', N'252.00', NULL, NULL, 818)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1333, N'M3529-100MG', N'134.00', NULL, NULL, 819)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1333, N'M3529-1G', N'568.00', NULL, NULL, 820)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1334, N'M0876-1G', N'64.00', NULL, NULL, 821)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1334, N'M0876-5G', N'184.00', NULL, NULL, 822)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1335, N'M1126-5G', N'222.00', NULL, NULL, 823)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1335, N'M1126-1G', N'142.00', NULL, NULL, 824)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1336, N'M3379-1G', N'285.00', NULL, NULL, 825)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1337, N'M4001-100MG', N'98.50', NULL, NULL, 826)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1337, N'M4001-1G', N'515.00', NULL, NULL, 827)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1338, N'M4255-50MG', N'335.00', NULL, NULL, 828)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1338, N'M4255-250MG', N'2,110.00', NULL, NULL, 829)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1339, N'M0506-1G', N'131.00', NULL, NULL, 830)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1339, N'M0506-5G', N'639.00', NULL, NULL, 831)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1340, N'A4802-100MG', N'434.00', NULL, NULL, 832)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1340, N'A4802-500MG', N'1,500.00', NULL, NULL, 833)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1342, N'M2383-250MG', N'47.20', NULL, NULL, 834)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1342, N'M2383-1G', N'127.00', NULL, NULL, 835)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1343, N'A5575-100MG', N'157.00', NULL, NULL, 836)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1343, N'A5575-1G', N'885.00', NULL, NULL, 837)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1344, N'M6001-100MG', N'128.00', NULL, NULL, 838)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1344, N'M6001-1G', N'608.00', NULL, NULL, 839)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1345, N'M6126-1G', N'149.00', NULL, NULL, 840)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1346, N'M6626-100G', N'797.00', NULL, NULL, 841)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1346, N'M6626-5G', N'98.00', NULL, NULL, 842)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1346, N'M6626-25G', N'383.00', NULL, NULL, 843)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1347, N'M9005-100MG', N'170.00', NULL, NULL, 844)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1347, N'M9005-250MG', N'386.00', NULL, NULL, 845)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1347, N'M9005-1G', N'1,110.00', NULL, NULL, 846)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1348, N'M4252-5G', N'1,570.00', NULL, NULL, 847)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1349, N'M4377-1G', N'534.00', NULL, NULL, 848)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1350, N'M8021-500MG', N'342.00', NULL, NULL, 849)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1350, N'M8021-1G', N'575.00', NULL, NULL, 850)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1351, N'M6877-1G', N'114.00', NULL, NULL, 851)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1351, N'M6877-5G', N'377.00', NULL, NULL, 852)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1352, N'M7378-1G', N'476.00', NULL, NULL, 853)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1353, N'M1630-5G', N'4,040.00', NULL, NULL, 854)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1355, N'M0534-250MG', N'187.00', NULL, NULL, 855)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1355, N'M0534-1G', N'539.00', NULL, NULL, 856)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1356, N'M8752-100MG', N'156.00', NULL, NULL, 857)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1357, N'M8379-1G', N'649.00', NULL, NULL, 858)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1358, N'M8377-100MG', N'80.10', NULL, NULL, 859)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1358, N'M8377-250MG', N'150.00', NULL, NULL, 860)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1358, N'M8377-1G', N'368.00', NULL, NULL, 861)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1359, N'M9377-100MG', N'64.70', NULL, NULL, 862)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1360, N'M3756-100MG', N'22.40', NULL, NULL, 863)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1361, N'M5131-500MG', N'69.20', NULL, NULL, 864)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1362, N'M5631-100MG', N'22.80', NULL, NULL, 865)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1362, N'M5631-500MG', N'78.80', NULL, NULL, 866)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1363, N'M6131-100MG', N'22.20', NULL, NULL, 867)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1363, N'M6131-500MG', N'85.40', NULL, NULL, 868)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1364, N'N5637-1G', N'702.00', NULL, NULL, 869)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1365, N'N5762-1G', N'853.00', NULL, NULL, 870)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1366, N'N2268-100MG', N'82.50', NULL, NULL, 871)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1367, N'N4503-1G', N'82.30', NULL, NULL, 872)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1368, N'N4753-5G', N'364.00', NULL, NULL, 873)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1368, N'N4753-250MG', N'30.30', NULL, NULL, 874)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1368, N'N4753-1G', N'90.90', NULL, NULL, 875)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1369, N'N4878-1G', N'87.20', NULL, NULL, 876)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1370, N'N5378-1G', N'85.40', NULL, NULL, 877)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1371, N'N5503-1G', N'87.90', NULL, NULL, 878)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1372, N'N1390-1G', N'111.00', NULL, NULL, 879)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1373, N'N6503-1G', N'81.00', NULL, NULL, 880)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1374, N'N6753-5G', N'281.00', NULL, NULL, 881)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1375, N'N4140-500MG', N'775.00', NULL, NULL, 882)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1376, N'N5890-50MG', N'176.00', NULL, NULL, 883)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1376, N'N5890-100MG', N'325.00', NULL, NULL, 884)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1376, N'N5890-500MG', N'1,060.00', NULL, NULL, 885)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1377, N'N4390-500MG', N'747.00', NULL, NULL, 886)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1378, N'N4765-500MG', N'407.00', NULL, NULL, 887)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1379, N'N5640-50MG', N'147.00', NULL, NULL, 888)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1380, N'N1018-1G', N'30.80', NULL, NULL, 889)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1381, N'N6627-100MG', N'47.50', NULL, NULL, 890)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1381, N'N6627-1G', N'116.00', NULL, NULL, 891)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1382, N'N6877-5G', N'210.00', NULL, NULL, 892)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1382, N'N6877-1G', N'65.20', NULL, NULL, 893)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1382, N'N6877-10G', N'370.00', NULL, NULL, 894)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1383, N'N1398-5G', N'58.60', NULL, NULL, 895)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1383, N'N1398-25G', N'86.00', NULL, NULL, 896)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1383, N'N1398-100G', N'245.00', NULL, NULL, 897)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1384, N'N7627-1G', N'46.90', NULL, NULL, 898)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1384, N'N7627-5G', N'128.00', NULL, NULL, 899)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1384, N'N7627-10G', N'281.00', NULL, NULL, 900)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1385, N'N7502-25G', N'52.60', NULL, NULL, 901)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1386, N'10940-25MG', N'163.00', NULL, NULL, 902)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1387, N'O5250-1G', N'50.00', NULL, NULL, 903)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1388, N'O7125-25G', N'117.00', NULL, NULL, 904)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1388, N'O7125-100G', N'351.00', NULL, NULL, 905)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1389, N'O6254-5G', N'235.00', NULL, NULL, 906)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1390, N'P1883-1G', N'189.00', NULL, NULL, 907)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1390, N'P1883-5G', N'654.00', NULL, NULL, 908)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1391, N'79710-10G', N'62.80', NULL, NULL, 909)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1391, N'79710-50G', N'222.00', NULL, NULL, 910)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1392, N'P1053-250MG', N'104.00', NULL, NULL, 911)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1392, N'P1053-1G', N'326.00', NULL, NULL, 912)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1393, N'P9405-100MG', N'169.00', NULL, NULL, 913)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1393, N'P9405-250MG', N'361.00', NULL, NULL, 914)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1393, N'P9405-1G', N'965.00', NULL, NULL, 915)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1394, N'P4628-1G', N'91.20', NULL, NULL, 916)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1395, N'P2519-100MG', N'142.00', NULL, NULL, 917)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1395, N'P2519-250MG', N'309.00', NULL, NULL, 918)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1395, N'P2519-1G', N'840.00', NULL, NULL, 919)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1396, N'03567-5G', N'262.00', NULL, NULL, 920)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1397, N'P5010-1G', N'127.00', NULL, NULL, 921)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1398, N'P7764-1G', N'134.00', NULL, NULL, 922)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1398, N'P7764-5G', N'515.00', NULL, NULL, 923)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1399, N'P1380-100MG', N'63.40', NULL, NULL, 924)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1399, N'P1380-1G', N'285.00', NULL, NULL, 925)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1400, N'P5267-1G', N'249.00', NULL, NULL, 926)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1400, N'P5267-2G', N'452.00', NULL, NULL, 927)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1401, N'P7888-250MG', N'64.60', NULL, NULL, 928)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1401, N'P7888-1G', N'179.00', NULL, NULL, 929)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1401, N'P7888-5G', N'765.00', NULL, NULL, 930)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1402, N'81838-250MG', N'498.00', NULL, NULL, 931)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1403, N'P5960-25G', N'69.30', NULL, NULL, 932)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1404, N'P5891-25MG', N'49.70', NULL, NULL, 933)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1404, N'P5891-100MG', N'138.00', NULL, NULL, 934)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1404, N'P5891-500MG', N'468.00', NULL, NULL, 935)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1404, N'P5891-1G', N'678.00', NULL, NULL, 936)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1404, N'P5891-5G', N'2,340.00', NULL, NULL, 937)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1405, N'S7672-10MG', N'42.50', NULL, NULL, 938)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1405, N'S7672-25G', N'214.00', NULL, NULL, 939)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1405, N'S7672-100G', N'466.00', NULL, NULL, 940)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1406, N'S0520-25MG', N'305.00', NULL, NULL, 941)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1406, N'S0520-100MG', N'926.00', NULL, NULL, 942)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1408, N'S4503-250MG', N'309.00', NULL, NULL, 943)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1408, N'S4503-1G', N'1,010.00', NULL, NULL, 944)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1409, N'S5000-10G', N'49.80', NULL, NULL, 945)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1410, N'S4630-1G', N'419.00', NULL, NULL, 946)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1411, N'H9380-25G', N'81.30', NULL, NULL, 947)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1411, N'H9380-100G', N'214.00', NULL, NULL, 948)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1411, N'H9380-1KG', N'1,270.00', NULL, NULL, 949)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1412, N'S7001-5G', N'41.30', NULL, NULL, 950)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1412, N'S7001-25G', N'148.00', NULL, NULL, 951)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1412, N'S7001-100G', N'457.00', NULL, NULL, 952)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1413, N'S7129-25MG', N'134.00', NULL, NULL, 953)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1413, N'S7129-100MG', N'396.00', NULL, NULL, 954)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1414, N'10937-25MG', N'163.00', NULL, NULL, 955)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1415, N'T6259-5MG', N'37.30', NULL, NULL, 956)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1415, N'T6259-100MG', N'421.00', NULL, NULL, 957)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1415, N'T6259-250MG', N'885.00', NULL, NULL, 958)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1416, N'T2634-100MG', N'764.00', NULL, NULL, 959)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1417, N'T8910-1G', N'1,140.00', NULL, NULL, 960)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1418, N'T8028-100MG', N'223.00', NULL, NULL, 961)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1419, N'T8653-500MG', N'836.00', NULL, NULL, 962)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1420, N'T8528-1G', N'614.00', NULL, NULL, 963)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1421, N'T5000-1G', N'169.00', NULL, NULL, 964)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1421, N'T5000-5G', N'564.00', NULL, NULL, 965)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1422, N'T5898-5G', N'432.00', NULL, NULL, 966)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1422, N'T5898-25G', N'1,390.00', NULL, NULL, 967)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1423, N'T5905-500MG', N'426.00', NULL, NULL, 968)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1424, N'T4626-5G', N'50.60', NULL, NULL, 969)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1424, N'T4626-25G', N'202.00', NULL, NULL, 970)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1424, N'T4626-100G', N'657.00', NULL, NULL, 971)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1425, N'T1286-5G', N'157.00', NULL, NULL, 972)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1426, N'T5012-250MG', N'187.00', NULL, NULL, 973)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1426, N'T5012-1G', N'458.00', NULL, NULL, 974)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1427, N'T9299-100MG', N'2,230.00', NULL, NULL, 975)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1427, N'T9299-250MG', N'4,490.00', NULL, NULL, 976)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1427, N'T9299-25MG', N'729.00', NULL, NULL, 977)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1428, N'53604-5G-F', N'63.40', NULL, NULL, 978)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1428, N'53604-25G-F', N'230.00', NULL, NULL, 979)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1429, N'T4011-50MG', N'37.10', NULL, NULL, 980)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1430, N'T5006-50MG', N'48.90', NULL, NULL, 981)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1431, N'L512818-250MG', N'111.00', NULL, NULL, 982)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1432, N'L512826-250MG', N'0.00', NULL, NULL, 983)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1433, N'L512834-250MG', N'111.00', NULL, NULL, 984)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1434, N'T0281-10MG', N'248.00', NULL, NULL, 985)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1434, N'T0281-50MG', N'851.00', NULL, NULL, 986)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1435, N'T0286-1MG', N'337.00', NULL, NULL, 987)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1436, N'T3879-1G', N'69.30', NULL, NULL, 988)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1436, N'T3879-5G', N'276.00', NULL, NULL, 989)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1437, N'T4879-100G', N'318.00', NULL, NULL, 990)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1438, N'T3384-1G', N'355.00', NULL, NULL, 991)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1439, N'V0750-1G', N'111.00', NULL, NULL, 992)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1439, N'V0750-5G', N'268.00', NULL, NULL, 993)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1407, N'S3875-25MG', N'75.90', NULL, NULL, 994)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1407, N'S3875-100MG', N'104.00', NULL, NULL, 995)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1407, N'S3875-500MG', N'194.00', NULL, NULL, 996)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1407, N'S3875-1G', N'373.00', NULL, NULL, 997)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1440, N'C1376-25G', N'213.00', NULL, NULL, 998)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1441, N'C7047-500MG', N'899.00', NULL, NULL, 999)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1442, N'C9783-5G', N'358.00', NULL, NULL, 1000)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1443, N'C3647-25MG', N'112.00', NULL, NULL, 1001)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1443, N'C3647-100MG', N'335.00', NULL, NULL, 1002)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1444, N'C0271-5G', N'540.00', NULL, NULL, 1003)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1467, N'P1800-100MG', N'314.00', NULL, NULL, 1004)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1468, N'P7890-25MG', N'64.60', NULL, NULL, 1005)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1468, N'P7890-100MG', N'196.00', NULL, NULL, 1006)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1468, N'P7890-500MG', N'780.00', NULL, NULL, 1007)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1468, N'P7890-1G', N'1,180.00', NULL, NULL, 1008)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1469, N'P0421-100MG', N'427.00', NULL, NULL, 1009)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1469, N'P0421-250MG', N'939.00', NULL, NULL, 1010)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1470, N'P2658-1G', N'2,920.00', NULL, NULL, 1011)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1470, N'P2658-25MG', N'161.00', NULL, NULL, 1012)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1470, N'P2658-100MG', N'494.00', NULL, NULL, 1013)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1470, N'P2658-500MG', N'1,940.00', NULL, NULL, 1014)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1471, N'P2533-500MG', N'1,610.00', NULL, NULL, 1015)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1471, N'P2533-10MG', N'84.30', NULL, NULL, 1016)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1471, N'P2533-50MG', N'235.00', NULL, NULL, 1017)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1471, N'P2533-100MG', N'404.00', NULL, NULL, 1018)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1472, N'P3543-10MG', N'207.00', NULL, NULL, 1019)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1472, N'P3543-25MG', N'433.00', NULL, NULL, 1020)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1473, N'P4033-100MG', N'342.00', NULL, NULL, 1021)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1473, N'P4033-1G', N'1,690.00', NULL, NULL, 1022)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1474, N'P4761-25MG', N'74.70', NULL, NULL, 1023)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1474, N'P4761-100MG', N'187.00', NULL, NULL, 1024)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1474, N'P4761-500MG', N'577.00', NULL, NULL, 1025)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1474, N'P4761-1G', N'1,050.00', NULL, NULL, 1026)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1475, N'P7762-10MG', N'108.00', NULL, NULL, 1027)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1475, N'P7762-50MG', N'337.00', NULL, NULL, 1028)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1475, N'P7762-100MG', N'578.00', NULL, NULL, 1029)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1476, N'P1149-10MG', N'63.40', NULL, NULL, 1030)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1476, N'P1149-100MG', N'316.00', NULL, NULL, 1031)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1476, N'P1149-500MG', N'1,270.00', NULL, NULL, 1032)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1477, N'P1399-25MG', N'61.00', NULL, NULL, 1033)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1477, N'P1399-100MG', N'184.00', NULL, NULL, 1034)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1477, N'P1399-500MG', N'735.00', NULL, NULL, 1035)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1477, N'P1399-1G', N'1,120.00', NULL, NULL, 1036)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1478, N'P5136-1G', N'719.00', NULL, NULL, 1037)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1479, N'P3418-100MG', N'151.00', NULL, NULL, 1038)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1479, N'P3418-1G', N'794.00', NULL, NULL, 1039)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1480, N'P9917-100MG', N'610.00', NULL, NULL, 1040)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1481, N'P9011-100MG', N'437.00', NULL, NULL, 1041)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1481, N'P9011-25MG', N'145.00', NULL, NULL, 1042)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1482, N'P8638-25MG', N'114.00', NULL, NULL, 1043)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1482, N'P8638-100MG', N'236.00', NULL, NULL, 1044)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1482, N'P8638-250MG', N'456.00', NULL, NULL, 1045)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1482, N'P8638-500MG', N'787.00', NULL, NULL, 1046)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1483, N'P4636-25MG', N'147.00', NULL, NULL, 1047)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1483, N'P4636-100MG', N'423.00', NULL, NULL, 1048)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1483, N'P4636-500MG', N'1,490.00', NULL, NULL, 1049)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1483, N'P4636-1G', N'2,490.00', NULL, NULL, 1050)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1484, N'P7886-10MG', N'66.90', NULL, NULL, 1051)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1484, N'P7886-50MG', N'207.00', NULL, NULL, 1052)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1484, N'P7886-100MG', N'297.00', NULL, NULL, 1053)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1484, N'P7886-500MG', N'1,030.00', NULL, NULL, 1054)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1484, N'P7886-1G', N'1,890.00', NULL, NULL, 1055)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1485, N'P2636-25MG', N'86.00', NULL, NULL, 1056)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1485, N'P2636-100MG', N'261.00', NULL, NULL, 1057)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1485, N'P2636-500MG', N'994.00', NULL, NULL, 1058)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1485, N'P2636-1G', N'1,500.00', NULL, NULL, 1059)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1486, N'P3655-10MG', N'33.80', NULL, NULL, 1060)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1486, N'P3655-50MG', N'97.40', NULL, NULL, 1061)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1486, N'P3655-100MG', N'169.00', NULL, NULL, 1062)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1486, N'P3655-500MG', N'672.00', NULL, NULL, 1063)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1486, N'P3655-1G', N'1,010.00', NULL, NULL, 1064)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1487, N'P5011-500MG', N'340.00', NULL, NULL, 1065)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1488, N'P3069-10MG', N'202.00', NULL, NULL, 1066)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1488, N'P3069-50MG', N'800.00', NULL, NULL, 1067)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1489, N'P6403-10MG', N'70.60', NULL, NULL, 1068)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1489, N'P6403-50MG', N'239.00', NULL, NULL, 1069)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1489, N'P6403-100MG', N'424.00', NULL, NULL, 1070)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1491, N'P4663-10MG', N'123.00', NULL, NULL, 1071)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1491, N'P4663-50MG', N'363.00', NULL, NULL, 1072)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1491, N'P4663-100MG', N'624.00', NULL, NULL, 1073)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1492, N'P4538-10MG', N'38.60', NULL, NULL, 1074)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1492, N'P4538-50MG', N'157.00', NULL, NULL, 1075)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1492, N'P4538-500MG', N'744.00', NULL, NULL, 1076)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1493, N'P8077-100MG', N'468.00', NULL, NULL, 1077)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1493, N'P8077-25MG', N'155.00', NULL, NULL, 1078)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1493, N'P8077-250MG', N'1,040.00', NULL, NULL, 1079)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1494, N'P0937-100MG', N'121.00', NULL, NULL, 1080)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1495, N'P9386-10MG', N'104.00', NULL, NULL, 1081)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1495, N'P9386-50MG', N'299.00', NULL, NULL, 1082)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1495, N'P9386-100MG', N'515.00', NULL, NULL, 1083)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1496, N'P4886-500MG', N'644.00', NULL, NULL, 1084)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1496, N'P4886-1G', N'1,120.00', NULL, NULL, 1085)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1496, N'P4886-25MG', N'73.50', NULL, NULL, 1086)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1496, N'P4886-100MG', N'207.00', NULL, NULL, 1087)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1497, N'P4510-1G', N'433.00', NULL, NULL, 1088)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1498, N'P8791-100MG', N'503.00', NULL, NULL, 1089)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1499, N'P1274-25MG', N'89.70', NULL, NULL, 1090)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1499, N'P1274-100MG', N'259.00', NULL, NULL, 1091)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1499, N'P1274-500MG', N'1,050.00', NULL, NULL, 1092)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1499, N'P1274-1G', N'1,550.00', NULL, NULL, 1093)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1500, N'P0899-10MG', N'72.10', NULL, NULL, 1094)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1500, N'P0899-50MG', N'215.00', NULL, NULL, 1095)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1500, N'P0899-100MG', N'360.00', NULL, NULL, 1096)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1500, N'P0899-500MG', N'1,480.00', NULL, NULL, 1097)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1500, N'P0899-1G', N'2,000.00', NULL, NULL, 1098)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1501, N'P5386-1G', N'477.00', NULL, NULL, 1099)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1502, N'P1691-1G', N'105.00', NULL, NULL, 1100)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1502, N'P1691-5G', N'357.00', NULL, NULL, 1101)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1503, N'P1566-5G', N'394.00', NULL, NULL, 1102)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1504, N'P0296-1G', N'1,980.00', NULL, NULL, 1103)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1504, N'P0296-10MG', N'66.90', NULL, NULL, 1104)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1504, N'P0296-50MG', N'223.00', NULL, NULL, 1105)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1504, N'P0296-100MG', N'352.00', NULL, NULL, 1106)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1504, N'P0296-500MG', N'1,120.00', NULL, NULL, 1107)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1505, N'P6403-10MG', N'70.60', NULL, NULL, 1108)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1505, N'P6403-50MG', N'239.00', NULL, NULL, 1109)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1505, N'P6403-100MG', N'424.00', NULL, NULL, 1110)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1506, N'P7886-10MG', N'66.90', NULL, NULL, 1111)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1506, N'P7886-50MG', N'207.00', NULL, NULL, 1112)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1506, N'P7886-100MG', N'297.00', NULL, NULL, 1113)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1506, N'P7886-500MG', N'1,030.00', NULL, NULL, 1114)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1506, N'P7886-1G', N'1,890.00', NULL, NULL, 1115)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1507, N'P7280-5X5MG', N'288.00', NULL, NULL, 1116)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1507, N'P7280-5MG', N'85.40', NULL, NULL, 1117)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1508, N'P0899-10MG', N'72.10', NULL, NULL, 1118)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1508, N'P0899-50MG', N'215.00', NULL, NULL, 1119)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1508, N'P0899-100MG', N'360.00', NULL, NULL, 1120)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1508, N'P0899-500MG', N'1,480.00', NULL, NULL, 1121)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1508, N'P0899-1G', N'2,000.00', NULL, NULL, 1122)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1510, N'P1149-10MG', N'63.40', NULL, NULL, 1123)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1510, N'P1149-100MG', N'316.00', NULL, NULL, 1124)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1510, N'P1149-500MG', N'1,270.00', NULL, NULL, 1125)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1511, N'P1024-1G', N'1,890.00', NULL, NULL, 1126)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1511, N'P1024-10MG', N'63.40', NULL, NULL, 1127)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1511, N'P1024-50MG', N'183.00', NULL, NULL, 1128)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1511, N'P1024-100MG', N'332.00', NULL, NULL, 1129)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1511, N'P1024-500MG', N'1,270.00', NULL, NULL, 1130)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1512, N'P7405-5MG', N'96.20', NULL, NULL, 1131)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1513, N'P0879-25MG', N'76.50', NULL, NULL, 1132)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1513, N'P0879-100MG', N'233.00', NULL, NULL, 1133)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1513, N'P0879-500MG', N'919.00', NULL, NULL, 1134)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1513, N'P0879-1G', N'1,390.00', NULL, NULL, 1135)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1514, N'P6516-25MG', N'91.50', NULL, NULL, 1136)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1514, N'P6516-100MG', N'293.00', NULL, NULL, 1137)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1514, N'P6516-500MG', N'951.00', NULL, NULL, 1138)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1514, N'P6516-1G', N'1,280.00', NULL, NULL, 1139)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1515, N'P7890-25MG', N'64.60', NULL, NULL, 1140)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1515, N'P7890-100MG', N'196.00', NULL, NULL, 1141)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1515, N'P7890-500MG', N'780.00', NULL, NULL, 1142)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1515, N'P7890-1G', N'1,180.00', NULL, NULL, 1143)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1516, N'P2636-25MG', N'86.00', NULL, NULL, 1144)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1516, N'P2636-100MG', N'261.00', NULL, NULL, 1145)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1516, N'P2636-500MG', N'994.00', NULL, NULL, 1146)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1516, N'P2636-1G', N'1,500.00', NULL, NULL, 1147)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1517, N'P9155-5MG', N'86.60', NULL, NULL, 1148)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1518, N'P1274-25MG', N'89.70', NULL, NULL, 1149)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1518, N'P1274-100MG', N'259.00', NULL, NULL, 1150)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1518, N'P1274-500MG', N'1,050.00', NULL, NULL, 1151)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1518, N'P1274-1G', N'1,550.00', NULL, NULL, 1152)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1519, N'P6282-5MG', N'90.80', NULL, NULL, 1153)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1520, N'P1399-25MG', N'61.00', NULL, NULL, 1154)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1520, N'P1399-100MG', N'184.00', NULL, NULL, 1155)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1520, N'P1399-500MG', N'735.00', NULL, NULL, 1156)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1520, N'P1399-1G', N'1,120.00', NULL, NULL, 1157)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1521, N'P1524-25MG', N'72.30', NULL, NULL, 1158)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1521, N'P1524-100MG', N'230.00', NULL, NULL, 1159)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1521, N'P1524-500MG', N'758.00', NULL, NULL, 1160)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1521, N'P1524-1G', N'1,320.00', NULL, NULL, 1161)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1522, N'P5899-5MG', N'90.80', NULL, NULL, 1162)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1523, N'P4707-50ML', N'173.00', NULL, NULL, 1163)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1524, N'P4832-50ML', N'169.00', NULL, NULL, 1164)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1525, N'P8920-100ML', N'184.00', NULL, NULL, 1165)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1525, N'P8920-500ML', N'732.00', NULL, NULL, 1166)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1526, N'127-2.5', N'93.80', NULL, NULL, 1167)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1527, N'P4957-50ML', N'153.00', NULL, NULL, 1168)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1528, N'P9431-25MG', N'226.00', NULL, NULL, 1169)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1529, N'P1152-10MG', N'235.00', NULL, NULL, 1170)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1529, N'P1152-25MG', N'492.00', NULL, NULL, 1171)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1530, N'P7658-25MG', N'182.00', NULL, NULL, 1172)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1530, N'P7658-100MG', N'609.00', NULL, NULL, 1173)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1531, N'P3899-25MG', N'276.00', NULL, NULL, 1174)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1531, N'P3899-100MG', N'731.00', NULL, NULL, 1175)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1532, N'P4149-10MG', N'121.00', NULL, NULL, 1176)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1532, N'P4149-25MG', N'247.00', NULL, NULL, 1177)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1534, N'P0275-250MG', N'1,140.00', NULL, NULL, 1178)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1534, N'P0275-10MG', N'114.00', NULL, NULL, 1179)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1534, N'P0275-25MG', N'180.00', NULL, NULL, 1180)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1534, N'P0275-100MG', N'563.00', NULL, NULL, 1181)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1534, N'P0275-500MG', N'1,940.00', NULL, NULL, 1182)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1535, N'P0151-25MG', N'166.00', NULL, NULL, 1183)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1536, N'81357-50MG', N'235.00', NULL, NULL, 1184)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1537, N'P3150-10MG', N'96.80', NULL, NULL, 1185)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1537, N'P3150-100MG', N'485.00', NULL, NULL, 1186)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1537, N'P3150-25MG', N'161.00', NULL, NULL, 1187)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1537, N'P3150-500MG', N'1,770.00', NULL, NULL, 1188)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1538, N'P4659-250MG', N'859.00', NULL, NULL, 1189)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1538, N'P4659-25MG', N'163.00', NULL, NULL, 1190)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1539, N'P9306-25MG', N'235.00', NULL, NULL, 1191)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1540, N'P7244-250MG', N'886.00', NULL, NULL, 1192)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1540, N'P7244-25MG', N'156.00', NULL, NULL, 1193)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1541, N'P4274-100MG', N'420.00', NULL, NULL, 1194)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1542, N'P1941-1G', N'121.00', NULL, NULL, 1195)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1542, N'P1941-5G', N'413.00', NULL, NULL, 1196)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1543, N'P8619-100MG', N'386.00', NULL, NULL, 1197)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1544, N'P6835-5ML', N'492.00', NULL, NULL, 1198)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1545, N'P6665-100MG', N'1,110.00', NULL, NULL, 1199)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1445, N'C4127-25G', N'799.00', NULL, NULL, 1200)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1446, N'G5755-25MG', N'34.40', NULL, NULL, 1201)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1446, N'G5755-1G', N'470.00', NULL, NULL, 1202)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1447, N'G5630-100MG', N'87.20', NULL, NULL, 1203)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1448, N'T1780-5MG', N'573.00', NULL, NULL, 1204)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1449, N'P6516-25MG', N'91.50', NULL, NULL, 1205)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1449, N'P6516-100MG', N'293.00', NULL, NULL, 1206)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1449, N'P6516-500MG', N'951.00', NULL, NULL, 1207)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1449, N'P6516-1G', N'1,280.00', NULL, NULL, 1208)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1450, N'P1024-1G', N'1,890.00', NULL, NULL, 1209)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1450, N'P1024-10MG', N'63.40', NULL, NULL, 1210)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1450, N'P1024-50MG', N'183.00', NULL, NULL, 1211)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1450, N'P1024-100MG', N'332.00', NULL, NULL, 1212)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1450, N'P1024-500MG', N'1,270.00', NULL, NULL, 1213)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1451, N'P1524-25MG', N'72.30', NULL, NULL, 1214)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1451, N'P1524-100MG', N'230.00', NULL, NULL, 1215)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1451, N'P1524-500MG', N'758.00', NULL, NULL, 1216)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1451, N'P1524-1G', N'1,320.00', NULL, NULL, 1217)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1452, N'P2534-25MG', N'373.00', NULL, NULL, 1218)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1452, N'P2534-100MG', N'1,210.00', NULL, NULL, 1219)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1452, N'P2534-500MG', N'3,910.00', NULL, NULL, 1220)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1452, N'P2534-10MG', N'211.00', NULL, NULL, 1221)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1453, N'P8035-1G', N'622.00', NULL, NULL, 1222)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1454, N'P4638-500MG', N'649.00', NULL, NULL, 1223)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1454, N'P4638-50MG', N'123.00', NULL, NULL, 1224)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1454, N'P4638-100MG', N'189.00', NULL, NULL, 1225)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1455, N'P0671-500MG', N'872.00', NULL, NULL, 1226)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1455, N'P0671-25MG', N'120.00', NULL, NULL, 1227)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1455, N'P0671-100MG', N'254.00', NULL, NULL, 1228)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1456, N'P9404-25MG', N'149.00', NULL, NULL, 1229)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1456, N'P9404-100MG', N'455.00', NULL, NULL, 1230)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1456, N'P9404-500MG', N'1,490.00', NULL, NULL, 1231)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1456, N'P9404-1G', N'2,460.00', NULL, NULL, 1232)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1457, N'P3886-500MG', N'1,140.00', NULL, NULL, 1233)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1457, N'P3886-1G', N'1,980.00', NULL, NULL, 1234)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1458, N'P4158-100MG', N'322.00', NULL, NULL, 1235)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1458, N'P4158-500MG', N'1,210.00', NULL, NULL, 1236)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1458, N'P4158-25MG', N'105.00', NULL, NULL, 1237)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1459, N'G0421-100MG', N'239.00', NULL, NULL, 1238)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1459, N'G0421-1G', N'1,010.00', NULL, NULL, 1239)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1460, N'P3513-100MG', N'352.00', NULL, NULL, 1240)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1460, N'P3513-1G', N'2,120.00', NULL, NULL, 1241)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1461, N'P3892-10MG', N'94.40', NULL, NULL, 1242)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1461, N'P3892-50MG', N'261.00', NULL, NULL, 1243)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1461, N'P3892-100MG', N'449.00', NULL, NULL, 1244)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1462, N'P2254-100MG', N'368.00', NULL, NULL, 1245)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1462, N'P2254-500MG', N'1,230.00', NULL, NULL, 1246)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1462, N'P2254-1G', N'2,130.00', NULL, NULL, 1247)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1462, N'P2254-50MG', N'215.00', NULL, NULL, 1248)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1463, N'P0296-1G', N'1,980.00', NULL, NULL, 1249)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1463, N'P0296-10MG', N'66.90', NULL, NULL, 1250)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1463, N'P0296-50MG', N'223.00', NULL, NULL, 1251)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1463, N'P0296-100MG', N'352.00', NULL, NULL, 1252)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1463, N'P0296-500MG', N'1,120.00', NULL, NULL, 1253)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1464, N'P9003-25MG', N'79.50', NULL, NULL, 1254)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1464, N'P9003-100MG', N'232.00', NULL, NULL, 1255)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1464, N'P9003-1G', N'1,380.00', NULL, NULL, 1256)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1465, N'P0879-25MG', N'76.50', NULL, NULL, 1257)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1465, N'P0879-100MG', N'233.00', NULL, NULL, 1258)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1465, N'P0879-500MG', N'919.00', NULL, NULL, 1259)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1465, N'P0879-1G', N'1,390.00', NULL, NULL, 1260)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1466, N'P1818-25MG', N'118.00', NULL, NULL, 1261)
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price], [PricePerKG], [AmountInKg], [ID]) VALUES (1466, N'P1818-100MG', N'393.00', NULL, NULL, 1262)
GO
SET IDENTITY_INSERT [dbo].[Product_SKU] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (1, N'Amino Acids -  (185)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16181993', 1, 1, NULL)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (2, N'BioUltra -  (23)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14992359', 1, 1, NULL)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (3, N'Modified Amino Acids -  (268)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16360557', 1, 1, NULL)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (4, N'Polyamino Acids -  (87)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9616613', 1, 1, NULL)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (14, N'A - H -  (135)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16311953', 1, 1, 3)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (15, N'Homoserine Lactones -  (11)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16191968', 1, 1, 3)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (16, N'I - Z -  (130)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16311952', 1, 1, 3)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (17, N'Amino Acid Oligomers -  (3)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=17856633', 1, 1, 4)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (18, N'Homopolymers -  (55)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9616976', 1, 1, 4)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (19, N'Multichain', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16194977', 1, 1, 4)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (20, N'Polylysine and Polyornithine Attachment Factors -  (24)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=17856631', 1, 1, 4)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (21, N'Random Copolymers -  (17)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9616614', 1, 1, 4)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID], [SubCategoryID]) VALUES (22, N'Sequential Copolymers -  (1)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9617436', 1, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[SubCategory] ADD  DEFAULT ((0)) FOR [Processed]
GO
USE [master]
GO
ALTER DATABASE [Signaaldich] SET  READ_WRITE 
GO
