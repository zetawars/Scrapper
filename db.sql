USE [master]
GO
/****** Object:  Database [Signaaldich]    Script Date: 1/12/2019 7:35:31 AM ******/
CREATE DATABASE [Signaaldich]
 CONTAINMENT = NONE

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
USE [Signaaldich]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/12/2019 7:35:31 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 1/12/2019 7:35:31 AM ******/
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
/****** Object:  Table [dbo].[Product_Packaging]    Script Date: 1/12/2019 7:35:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Packaging](
	[ProductID] [int] NOT NULL,
	[Packaging] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_SKU]    Script Date: 1/12/2019 7:35:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_SKU](
	[ProductID] [int] NOT NULL,
	[SKU] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/12/2019 7:35:31 AM ******/
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
INSERT [dbo].[Category] ([ID], [CategoryName], [CategoryURL], [Processed]) VALUES (2, N'Antibodies', N'https://www.sigmaaldrich.com/life-science/cell-biology/antibodies.html', 0)
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
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (1, 1, N'1.00289 EMD Millipore', N'L-Glutamine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 99.0 - 101.0 %', N'56-85-9', NULL, N'L-Glutamine for biochemistry. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for biochemistry', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100289?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (2, 1, N'1.00291 EMD Millipore', N'L-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): = 99.0 %', N'56-86-0', NULL, N'L-Glutamic acid for biochemistry. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for biochemistry', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100291?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (3, 1, N'1.00590 EMD Millipore', N'Glycine cryst.', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'56-40-6', NULL, N'EMPROVE® EXPERT Ph Eur,BP,JP,USP,  EMPROVE® EXPERT Ph Eur,BP,JP,USP', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/100590?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (4, 1, N'1.01544 EMD Millipore', N'L-Arginine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'1119-34-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP, suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP,USP', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101544?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (5, 1, N'1.01587 EMD Millipore', N'L-Arginine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): 98.5 - 101.0 %', N'74-79-3', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,JP,USP', NULL, N'Arg', N'C6H14N4O2', N'174.2 g/mol', N'200-811-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/101587?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (6, 1, N'1.02735 EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'EMPROVE® ESSENTIAL Ph Eur,USP', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102735?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (7, 1, N'1.02836 EMD Millipore', N'L-Cystine', NULL, NULL, NULL, NULL, N'Assay (ex N, calc. on dried substance): 98.5 - 101.5 %', N'56-89-3', NULL, N'L-Cystine suitable for biopharmaceutical production FCC. CAS 56-89-3, molar mass 240.30 g/mol., suitable for biopharmaceutical production FCC', NULL, N'Cys', N'C6H12N2O4S2', N'240.30 g/mol', N'200-296-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102836?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (8, 1, N'1.02838 EMD Millipore', N'L-Cysteine', NULL, NULL, NULL, NULL, N'Assay (perchloric acid titration, calculated on dried substance): = 99.0', N'52-90-4', NULL, N'L-Cysteine for biochemistry. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for biochemistry', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102838?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (9, 1, N'1.02839 EMD Millipore', N'L-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'7048-04-6', NULL, N'for biochemistry', NULL, N'Cys, L-Cysteinium Chloride Monohydrate, L-Cysteine Hydrochloride, Monohydrate', N'C3H8ClNO2S * H2O', N'175.64 g/mol', N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/102839?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (10, 1, N'1.04351 EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 99.0 - 101.0 %', N'71-00-1', NULL, N'L-Histidine for biochemistry. CAS 71-00-1, pH 7.7 (10 g/l, H2O, 20 °C)., for biochemistry', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104351?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (11, 1, N'1.04352 EMD Millipore', N'L-Histidine', NULL, NULL, NULL, NULL, N'Assay (acidimetric, calculated on dried substance): 98.5 - 101.0 %', N'71-00-1', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP, suitable for use as excipient EMPROVE® exp Ph Eur,USP,JP', NULL, N'His', N'C6H9N3O2', N'155.16 g/mol', N'200-745-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104352?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (12, 1, N'1.04354 EMD Millipore', N'L-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (alkalimetric, calculated on dried substance): 98.5 - 101.0 %', N'5934-29-2', NULL, N'suitable for use as excipient EMPROVE® exp Ph Eur,BP,JP', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/104354?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (13, 1, N'1.05701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/105701?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (14, 1, N'106425 EMD Millipore', N'N-Acetyl-L-cysteine - CAS 616-91-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'616-91-1', NULL, N'Mucolytic agent and thiol-based antioxidant that has a protective effect against oxygen free radicals in early septic shock.', NULL, N'LNAC', N'C5H9NO3S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/106425?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (15, 1, N'1250 EMD Millipore', N'L-Alanine - CAS 56-41-7 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'A non-essential amino acid.', NULL, N'Ala', N'C3H7NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (16, 1, N'181003 EMD Millipore', N'L-Arginine, Hydrochloride - CAS 1119-34-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'', NULL, N'Arg, HCl', N'C6H14N4O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/181003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (17, 1, N'1820 EMD Millipore', N'L-Arginine, Free Base - CAS 74-79-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'Substrate for nitric oxide synthase. Reverses the inhibition of nitric oxide synthase caused by arginine analogs. Causes the release of insulin from pancreatic ß cells by a nitric oxide-dependent mechanism.', NULL, N'Arg', N'C6H14N4O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/1820?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (18, 1, N'2240-OP EMD Millipore', N'OmniPur<sup>®</sup> Casamino Acids - CAS 65072-00-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'65072-00-6', NULL, N'', NULL, N'Casein', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2240op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (19, 1, N'243005 EMD Millipore', N'L-Cysteine, Free Base - CAS 52-90-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'Naturally-occurring non-essential amino acid.', NULL, N'Cys', N'C3H7NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/243005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (20, 1, N'2430-M EMD Millipore', N'L-Cysteine, Hydrochloride - CAS 52-89-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'52-89-1', NULL, N'', NULL, N'Cys, HCI', N'C3H7NO2S · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2430m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (21, 1, N'2470 EMD Millipore', N'L-Cystine - CAS 56-89-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'', NULL, N'(Cys)2', N'C6H12N2O4S2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/2470?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (22, 1, N'356790 EMD Millipore', N'Glyphosine - CAS 2439-99-8 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'2439-99-8', NULL, N'A plant growth regulator that also enhances anti-B:9-23 TCR-dependent T cell activation by modulating murine class II MHC I-Ag7-mediated B:9-23 presentation on APCs.', NULL, N'Polaris, Cp41845, N,N-<i>bis</i>(Phosphonomethyl)glycine, 2-(<i>bis</i>(Phosphonomethyl)amino)acetic acid', N'C4H11NO8P2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/356790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (23, 1, N'3570 EMD Millipore', N'Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'A non-essential, optically inactive, non-chiral amino acid. Acts as an inhibitory neurotransmitter, particularly in brain stem and medulla.', NULL, N'Gly', N'C2H5NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/3570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (24, 1, N'4160 EMD Millipore', N'L-Isoleucine - CAS 73-32-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'An essential branched chain amino acid.', NULL, N'Ile', N'C6H13NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4160?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (25, 1, N'4330 EMD Millipore', N'L-Leucine - CAS 61-90-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'An essential branched chain amino acid.', NULL, N'Leu', NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4330?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (26, 1, N'4400-M EMD Millipore', N'L-Lysine, Hydrochloride - CAS 657-27-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'An essential amino acid.', NULL, N'Lys, HCl', N'C6H14N2O2 · HCl', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4400m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (27, 1, N'4500-M EMD Millipore', N'L-Methionine - CAS 63-68-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'An essential amino acid, useful as a methyl group donor.', NULL, N'Met', N'C5H11NO2S', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4500m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (28, 1, N'4810-OP EMD Millipore', N'OmniPur<sup>®</sup> Glycine - CAS 56-40-6 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'', NULL, N'Aminoacetic Acid', N'H2NCH2COOH', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/4810op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (29, 1, N'5202 EMD Millipore', N'L-Phenylalanine - CAS 63-91-2 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'', NULL, N'Phe', N'C9H11NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5202?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (30, 1, N'5370 EMD Millipore', N'L-Proline - CAS 147-85-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'A non-essential amino acid. Precursor of hydroxyproline in collagen.', NULL, N'Pro', N'C5H9NO2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (31, 1, N'5450-OP EMD Millipore', N'OmniPur® <i>L</i>-Histidine - Calbiochem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5450op?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (32, 1, N'561505 EMD Millipore', N'L-Selenomethionine - CAS 3211-76-5 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'3211-76-5', NULL, N'L Selenomethionine increases the expression of glutathione peroxidase.', NULL, N'SeMet', N'C5H11NO2Se', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/561505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (33, 1, N'5650 EMD Millipore', N'L-Serine - CAS 56-45-1 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'', NULL, N'Ser', N'C3H7NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/5650?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (34, 1, N'6540-M EMD Millipore', N'L-Tryptophan - CAS 73-22-3 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'', NULL, N'Trp', N'C11H12N2O2', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6540m?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (35, 1, N'6570 EMD Millipore', N'L-Tyrosine, Free Base - CAS 60-18-4 - Calbiochem', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'Non-essential amino acid for human development. Precursor for the synthesis of thyroid hormones and select neurotransmitters, such as dopamine and norepinephrine.', NULL, N'Tyr', N'C9H11NO3', NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/6570?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (36, 1, N'8.14599 EMD Millipore', N'N-Acetyl-DL-valine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'3067-19-4', NULL, N'N-Acetyl-DL-valine for synthesis. CAS 3067-19-4, molar mass 159.18 g/mol., for synthesis', NULL, NULL, N'C7H13NO3', N'159.18 g/mol', N'221-321-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (37, 1, N'8.14986 EMD Millipore', N'DL-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'328-39-2', NULL, N'DL-Leucine for synthesis. CAS 328-39-2, molar mass 131.17 g/mol., for synthesis', NULL, N'DL-2-Aminmo-4-methylvalerianic acid, DL-2-Aminmo-4-methylpentanoic acid', N'C6H13NO2', N'131.17 g/mol', N'206-328-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/814986?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (38, 1, N'8.16000 EMD Millipore', N'(S)-(+)-Alanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-41-7', NULL, N'(S)-(+)-Alanine for synthesis. CAS 56-41-7, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'2-Aminopropionic acid, Ala', N'C3H7NO2', N'89.09 g/mol', N'200-273-8', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (39, 1, N'8.16001 EMD Millipore', N'(S)-(+)-Arginine hydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'1119-34-2', NULL, N'(S)-(+)-Arginine hydrochloride for synthesis. CAS 1119-34-2, chemical formula C6H14N4O2*HCl., for synthesis', NULL, N'a-Amino-d-guanidino valerianic acid hydrochloride, alpha-Amino-delta-guanidino valerianic acid hydrochloride, Arg', N'C6H15ClN4O2', N'210.66 g/mol', N'214-275-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (40, 1, N'8.16003 EMD Millipore', N'(S)-(+)-Aspartic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-84-8', NULL, N'(S)-(+)-Aspartic acid for synthesis. CAS 56-84-8, pH 2.5 - 3.5 (4 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-a-Aminosuccinic acid, L-alpha-Aminosuccinic acid, Asp', N'C4H7NO4', N'133.1 g/mol', N'200-291-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816003?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (41, 1, N'8.16004 EMD Millipore', N'(S)-(+)-Glutamic acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'56-86-0', NULL, N'(S)-(+)-Glutamic acid for synthesis. CAS 56-86-0, pH 3.0 - 3.5 (8.6 g/l, H2O, 25 °C)., for synthesis', NULL, N'L-a-Aminoglutaric acid, Glu, L-alpha-Aminoglutaric acid', N'C5H9NO4', N'147.13 g/mol', N'200-293-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816004?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (42, 1, N'8.16005 EMD Millipore', N'(S)-(+)-Histidine hydrochloride monohydrate', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'5934-29-2', NULL, N'(S)-(+)-Histidine hydrochloride monohydrate for synthesis. CAS 5934-29-2, pH 3.5 - 4.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'His', N'C6H10ClN3O2 * H2O', N'209.63 g/mol', N'211-438-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816005?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (43, 1, N'8.16006 EMD Millipore', N'(S)-(+)-Valine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-18-4', NULL, N'(S)-(+)-Valine for synthesis. CAS 72-18-4, pH 5.5 - 6.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Val', N'C5H11NO2', N'117.15 g/mol', N'200-773-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (44, 1, N'8.16007 EMD Millipore', N'(S)-(-)-trans-4-Hydroxyproline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'51-35-4', NULL, N'(S)-(-)-trans-4-Hydroxyproline for synthesis. CAS 51-35-4, pH 5.5 - 6.5 (50 g/l, H2O, 20 °C)., for synthesis', NULL, N'L(-)-4-Hydroxypyrrolidine-2-carboxylic acid, Hyp', N'C5H9NO3', N'131.13 g/mol', N'200-091-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (45, 1, N'8.16008 EMD Millipore', N'(S)-(+)-Isoleucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-32-5', NULL, N'(S)-(+)-Isoleucine for synthesis. CAS 73-32-5, pH 5.5 - 6.5 (40 g/l, H2O, 20 °C)., for synthesis', NULL, N'iso-Leucine, Ile', N'C6H13NO2', N'131.17 g/mol', N'200-798-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816008?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (46, 1, N'8.16009 EMD Millipore', N'(S)-(+)-Leucine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'61-90-5', NULL, N'(S)-(+)-Leucine for synthesis. CAS 61-90-5, pH 5.5 - 6.5 (20 g/l, H2O, 20 °C)., for synthesis', NULL, N'Leu', N'C6H13NO2', N'131.18 g/mol', N'200-522-0', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (47, 1, N'8.16010 EMD Millipore', N'L-Methionine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-68-3', NULL, N'L-Methionine for synthesis. CAS 63-68-3, pH 5 - 7 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Met', N'C5H11NO2S', N'149.2 g/mol', N'200-562-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816010?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (48, 1, N'8.16011 EMD Millipore', N'(S)-(-)-Phenylalanine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'63-91-2', NULL, N'(S)-(-)-Phenylalanine for synthesis. CAS 63-91-2, pH 5.4 - 6.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Phe, 2-Amino-3-phenylpropionic acid', N'C9H11NO2', N'165.19 g/mol', N'200-568-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816011?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (49, 1, N'8.16012 EMD Millipore', N'(2S,3R)-(-)-Threonine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'72-19-5', NULL, N'(2S,3R)-(-)-Threonine for synthesis. CAS 72-19-5, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Thr, 2-Amino-3-hydroxybutanoic acid', N'C4H9NO3', N'119.12 g/mol', N'200-774-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816012?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (50, 1, N'8.16013 EMD Millipore', N'Glycine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-40-6', NULL, N'Glycine for synthesis. CAS 56-40-6, EC Number 200-272-2, chemical formula H2NCH2COOH., for synthesis', NULL, N'Gly, Aminoacetic acid, Aminoethanoic acid', N'C2H5NO2', N'75.06 g/mol', N'200-272-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816013?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (51, 1, N'8.16014 EMD Millipore', N'(R)-(+)-Cysteine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'52-90-4', NULL, N'(R)-(+)-Cysteine for synthesis. CAS 52-90-4, pH 4.5 - 5.5 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'a-Amino-ß-mercapto propionic acid, alpha-Amino-ß-mercapto propionic acid, Cys, alpha-Amino-beta-mercapto propionic acid', N'C3H7NO2S', N'121.16 g/mol', N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816014?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (52, 1, N'8.16016 EMD Millipore', N'(S)-(+)-Glutamine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-85-9', NULL, N'(S)-(+)-Glutamine for synthesis. CAS 56-85-9, pH 4.0 - 6.0 (25 g/l, H2O, 20 °C)., for synthesis', NULL, N'L-Glutamic acid-5-amide, Gln', N'C5H10N2O3', N'146.15 g/mol', N'200-292-1', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816016?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (53, 1, N'8.16017 EMD Millipore', N'(S)-(-)-Tryptophan', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'73-22-3', NULL, N'(S)-(-)-Tryptophan for synthesis. CAS 73-22-3, pH 5.5 - 7.0 (10 g/l, H2O, 20 °C)., for synthesis', NULL, N'Trp', N'C11H12N2O2', N'204.23 g/mol', N'200-795-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816017?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (54, 1, N'8.16018 EMD Millipore', N'(S)-(+)-Lysine monohydrochloride', NULL, NULL, NULL, NULL, N'Assay (argentometric): = 99.0 %', N'657-27-2', NULL, N'(S)-(+)-Lysine monohydrochloride for synthesis. CAS 657-27-2, pH 5.5 - 6.0 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Lys', N'C6H15ClN2O2', N'182.64 g/mol', N'211-519-9', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816018?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (55, 1, N'8.16019 EMD Millipore', N'(S)-(-)-Proline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'147-85-3', NULL, N'(S)-(-)-Proline for synthesis. CAS 147-85-3, pH 5 - 7 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'Pro', N'C5H9NO2', N'115.13 g/mol', N'205-702-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816019?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (56, 1, N'8.16020 EMD Millipore', N'(S)-(+)-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'56-45-1', NULL, N'(S)-(+)-Serine for synthesis. CAS 56-45-1, pH 5 - 6 (100 g/l, H2O, 20 °C)., for synthesis', NULL, N'3-Hydroxy-L-alanine, Ser', N'C3H7NO3', N'105.09 g/mol', N'200-274-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816020?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (57, 1, N'8.16021 EMD Millipore', N'(S)-(-)-Tyrosine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'60-18-4', NULL, N'(S)-(-)-Tyrosine for synthesis. CAS 60-18-4, pH 6.5 (0.1 g/l, H2O)., for synthesis', NULL, N'4-Hydroxyphenylalanine, Tyr', N'C9H11NO3', N'181.19 g/mol', N'200-460-4', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/816021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (58, 1, N'8.18263 EMD Millipore', N'(+)-N-Formyl-D-tert-leucine', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 99.0 %', N'92571-59-0', NULL, N'(+)-N-Formyl-D-tert-leucine for synthesis. CAS 92571-59-0, chemical formula (CH3)3CCH(NHCHO)COOH., for synthesis', NULL, N'(+)-N-Formyl-3-methyl-D-valine', N'C7H13NO3', N'159.18 g/mol', NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/818263?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (59, 1, N'8.20649 EMD Millipore', N'Hippuric acid', NULL, NULL, NULL, NULL, N'Assay (acidimetric): = 98.0 %', N'495-69-2', NULL, N'Hippuric acid for synthesis. CAS 495-69-2, pH 2.5 - 3.5 (10 g/l, H2O, 20 °C) (slurry)., for synthesis', NULL, N'Benzamidoacetic acid, Benzoylglycine, Benzoylaminoacetic acid', N'C9H9NO3', N'179.17 g/mol', N'207-806-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/820649?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (60, 1, N'8.41235 EMD Millipore', N'DL-Serine', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 99.0 %', N'302-84-1', NULL, N'DL-Serine for synthesis. CAS 302-84-1, molar mass 105.09 g/mol., for synthesis', NULL, N'DL-2-Amino-3-hydroxypropionic acid, Ser', N'C3H7NO3', N'105.09 g/mol', N'206-130-6', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841235?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (61, 1, N'8.41505 EMD Millipore', N'L-Norvaline', NULL, NULL, NULL, NULL, N'Assay (HClO4): = 98.0 %', N'6600-40-4', NULL, N'L-Norvaline for synthesis. CAS 6600-40-4, molar mass 117.15 g/mol., for synthesis', NULL, NULL, N'C5H11NO2', N'117.15 g/mol', N'229-543-3', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/mm/841505?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (62, 1, N'A6251 Sigma-Aldrich', N'<i>N</i>-Acetyl-<sc>DL</sc>-tryptophan', NULL, NULL, NULL, NULL, NULL, N'87-32-1', NULL, N'', NULL, NULL, NULL, N'246.26', N'201-739-3', N'89478', N'24891071', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (63, 1, N'A7377 Sigma-Aldrich', N'<sc>D</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'338-69-2', NULL, N'=98% (HPLC)', NULL, N'(<i>R</i>)-2-Aminopropionic acid', N'CH<sub>3</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'89.09', N'206-418-1', N'1720249', N'24891121', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7377?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (64, 1, N'A7469 Sigma-Aldrich', N'<sc>L</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)-2-Aminopropionic acid,
		
	
		<sc>L</sc>-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24891241', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (65, 1, N'A4349 SAFC', N'<sc>L</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)-2-Aminopropionic acid,
		
	
		<sc>L</sc>-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'24890849', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4349?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (66, 1, N'05129 Sigma-Aldrich', N'<sc>L</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-2-Aminopropionic acid,
		
	
		<sc>L</sc>-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (67, 1, N'A7502 Sigma-Aldrich', N'<sc>DL</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'302-72-7', NULL, N'=99% (HPLC)', NULL, N'(±)-2-Aminopropionic acid', N'CH<sub>3</sub>CH(NH<sub>2</sub>)COOH', N'89.09', N'206-126-4', N'1720250', N'24891244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a7502?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (68, 1, N'596906 Sigma-Aldrich', N'Algal amino acid mixture-<sup>15</sup>N,d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'97 atom % D, 98 atom % <sup>15</sup>N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/aldrich/596906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (69, 1, N'LAA21 Supelco', N'<sc>L</sc>-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, N'200-157-7', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa21?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (70, 1, N'LAA10 Supelco', N'<sc>L</sc>-Amino acids', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/laa10?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (71, 1, N'09416 Sigma-Aldrich', N'21 <sc>L</sc>-Amino acids + Glycine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'=99.0% (NT)', NULL, NULL, NULL, NULL, N'200-158-2', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/09416?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (72, 1, N'A9781 Supelco', N'Amino acid standards for protein hydrolysates', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9781?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (73, 1, N'A2908 Supelco', N'Amino acid standards for protein hydrolysates containing norleucine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a2908?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (74, 1, N'A6407 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics and neutrals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6407?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (75, 1, N'A9906 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, acidics, neutrals, and basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a9906?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (76, 1, N'A6282 Supelco', N'Amino acid standards, physiological', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'analytical standard, basics', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a6282?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (77, 1, N'A8094 Sigma-Aldrich', N'<sc>L</sc>-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>guanidinopentanoic acid', N'H<sub>2</sub>NC(=NH)NH(CH<sub>2</sub>)<sub>3</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'174.20', N'200-811-1', N'1725413', N'24891316', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8094?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (78, 1, N'A4474 SAFC', N'<sc>L</sc>-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>guanidinopentanoic acid', N'H<sub>2</sub>NC(=NH)NH(CH<sub>2</sub>)<sub>3</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'174.20', N'200-811-1', N'1725413', N'57653850', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (79, 1, N'11009 Sigma', N'<sc>L</sc>-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>guanidinopentanoic acid', N'H<sub>2</sub>NC(=NH)NH(CH<sub>2</sub>)<sub>3</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (80, 1, N'A5131 Sigma-Aldrich', N'<sc>L</sc>-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'reagent grade, =98% (HPLC), powder', NULL, N'(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>[(aminoiminomethyl)<wbr>amino]<wbr>pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24890944', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/a5131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (81, 1, N'A6969 Sigma-Aldrich', N'<sc>L</sc>-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'not synthetic, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>[(aminoiminomethyl)<wbr>amino]<wbr>pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'24891160', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a6969?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (82, 1, N'A4599 SAFC', N'<sc>L</sc>-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>[(aminoiminomethyl)<wbr>amino]<wbr>pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57653852', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4599?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (83, 1, N'11039 Sigma-Aldrich', N'<sc>L</sc>-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>[(aminoiminomethyl)<wbr>amino]<wbr>pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (84, 1, N'A4881 Sigma-Aldrich', N'<sc>DL</sc>-Arginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'32042-43-6', NULL, N'=98% (TLC)', NULL, NULL, NULL, N'210.66', N'250-903-0', NULL, N'24890747', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a4881?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (85, 1, N'RES10070-A7 SAFC', N'<sc>L</sc>-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'PharmaGrade, meets FCC testing specifications, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(<i>S</i>)-2-Aminosuccinic acid 4-amide,
		
	
		(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Aminosuccinamic acid,
		
	
		<sc>L</sc>-Aspartic acid 4-amide', N'NH<sub>2</sub>COCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · H<sub>2</sub>O', N'150.13', N'200-735-9', N'1723527', N'329824249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res10070a7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (86, 1, N'A8381 Sigma-Aldrich', N'<sc>L</sc>-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-13-8', NULL, N'=99% (TLC)', NULL, N'(<i>S</i>)-2-Aminosuccinic acid 4-amide,
		
	
		(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Aminosuccinamic acid,
		
	
		<sc>L</sc>-Aspartic acid 4-amide', N'NH<sub>2</sub>COCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · H<sub>2</sub>O', N'150.13', N'200-735-9', N'1723527', N'24891338', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8381?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (87, 1, N'A8131 Sigma-Aldrich', N'<sc>D</sc>-Asparagine monohydrate', NULL, NULL, NULL, NULL, NULL, N'5794-24-1', NULL, N'=99% (TLC)', NULL, N'(<i>R</i>)-2-Aminosuccinic acid 4-amide,
		
	
		(<i>R</i>)<wbr>-<wbr>(-<wbr>)<wbr>-<wbr>2-<wbr>Aminosuccinamic acid,
		
	
		(<sc>D</sc>)-Aspartic acid 4-amide', N'NH<sub>2</sub>COCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · H<sub>2</sub>O', N'150.13', N'218-163-3', N'1723526', N'24891320', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (88, 1, N'A5474 SAFC', N'<sc>L</sc>-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)-(+)-Aminosuccinic acid,
		
	
		(<i>S</i>)-Aminobutanedioic acid', N'HO<sub>2</sub>CCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'133.10', N'200-291-6', N'1723530', N'24890976', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a5474?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (89, 1, N'A8949 Sigma-Aldrich', N'<sc>L</sc>-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioXtra, =99% (HPLC)', NULL, N'(<i>S</i>)-(+)-Aminosuccinic acid,
		
	
		(<i>S</i>)-Aminobutanedioic acid', N'HO<sub>2</sub>CCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'133.10', N'200-291-6', N'1723530', N'24891385', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a8949?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (90, 1, N'11189 Sigma-Aldrich', N'<sc>L</sc>-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(<i>S</i>)-(+)-Aminosuccinic acid,
		
	
		(<i>S</i>)-Aminobutanedioic acid', N'HO<sub>2</sub>CCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (91, 1, N'A9006 Sigma-Aldrich', N'<sc>DL</sc>-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'617-45-8', NULL, N'=99% (TLC)', NULL, N'(±)-2-Aminosuccinic acid', N'HOOCCH<sub>2</sub>CH(NH<sub>2</sub>)COOH', N'133.10', N'210-513-3', N'774618', N'24891394', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a9006?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (92, 1, N'A2025 Sigma-Aldrich', N'<sc>DL</sc>-Aspartic acid potassium salt', NULL, NULL, NULL, NULL, NULL, N'14434-35-6', NULL, N'', NULL, NULL, N'C<sub>4</sub>H<sub>6</sub>NO<sub>4</sub>K', N'171.19', N'238-407-2', NULL, N'24890616', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/a2025?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (93, 1, N'B6766 Sigma-Aldrich', N'BME Amino Acids Solution 50×', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without <sub>L</sub>-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/b6766?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (94, 1, N'30170 Sigma-Aldrich', N'<sc>L</sc>-Cysteic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'23537-25-9', NULL, N'=99.0% (T)', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>sulfopropionic acid', N'HO<sub>3</sub>SCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·H<sub>2</sub>O', N'187.17', NULL, N'3714036', N'24858207', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30170?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (95, 1, N'C5360 SAFC', N'<sc>L</sc>-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'PharmaGrade, Ajinomoto, from non-animal source, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>mercaptopropionic acid', N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'121.16', N'200-158-2', N'1721408', N'24892777', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5360?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (96, 1, N'30089 Sigma-Aldrich', N'<sc>L</sc>-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>mercaptopropionic acid', N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (97, 1, N'C7880 Sigma-Aldrich', N'<sc>L</sc>-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'reagent grade, =98% (TLC)', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl · H<sub>2</sub>O', N'175.63', N'200-157-7', N'5158059', N'24892992', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c7880?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (98, 1, N'C6852 Sigma-Aldrich', N'<sc>L</sc>-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'from non-animal source, cell culture tested, meets EP, USP testing specifications', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl · H<sub>2</sub>O', N'175.63', N'200-157-7', N'5158059', N'24892902', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/c6852?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (99, 1, N'C5610 SAFC', N'<sc>L</sc>-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl · H<sub>2</sub>O', N'175.63', N'200-157-7', N'5158059', N'57654026', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c5610?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (100, 1, N'30129 Sigma-Aldrich', N'<sc>L</sc>-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl · H<sub>2</sub>O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (101, 1, N'C9768 Sigma-Aldrich', N'<sc>DL</sc>-Cysteine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'10318-18-0', NULL, N'=95% (TLC), anhydrous', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl', N'157.62', N'233-698-2', N'4150473', N'24893195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c9768?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (102, 1, N'C7602 Sigma-Aldrich', N'<sc>L</sc>-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>R</i>,<i>R</i>)-3,3''-Dithiobis(2-aminopropionicacid)', N'[-SCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H]<sub>2</sub>', N'240.30', N'200-296-3', N'1728094', N'24892973', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c7602?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (103, 1, N'C8630 Sigma-Aldrich', N'<sc>DL</sc>-Cystine', NULL, NULL, NULL, NULL, NULL, N'923-32-0', NULL, N'', NULL, N'(±)-3,3''-Dithiobis(2-aminopropionicacid)', N'HOOCCH(NH<sub>2</sub>)CH<sub>2</sub>SSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH', N'240.30', N'213-094-5', N'1728095', N'24893084', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/c8630?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (104, 1, N'RES1520C-A7 SAFC', N'L-Cystine', NULL, NULL, NULL, NULL, NULL, N'56-89-3', NULL, N'PharmaGrade, EP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production., suitable for cell culture', NULL, N'(<i>R</i>,<i>R</i>)-3,3''-Dithiobis(2-aminopropionicacid),
		
	
		<sc>L</sc>-Cystine', N'[-SCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H]<sub>2</sub>', N'240.30', N'200-296-3', N'1728094', N'329824261', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1520ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (105, 1, N'RES1513C-A7 SAFC', N'L-Cystine dihydrochloride, non-animal derived', NULL, NULL, NULL, NULL, NULL, N'30925-07-6', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'<sc>L</sc>-Cystine dihydrochloride', NULL, N'313.22', N'250-391-9', NULL, N'329824260', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res1513ca7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (106, 1, N'G5667 SAFC', N'<sc>L</sc>-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'PharmaGrade, Ajinomoto, EP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO<sub>2</sub>CCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'147.13', N'200-293-7', N'1723801', N'24895223', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5667?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (107, 1, N'G8415 Sigma-Aldrich', N'<sc>L</sc>-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'from non-animal source, meets EP testing specifications, suitable for cell culture, 98.5-100.5%', NULL, N'(<i>S</i>)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO<sub>2</sub>CCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'147.13', N'200-293-7', N'1723801', N'24895340', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8415?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (108, 1, N'49449 Sigma-Aldrich', N'<sc>L</sc>-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO<sub>2</sub>CCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (109, 1, N'G1251 Sigma-Aldrich', N'<sc>L</sc>-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'<i>ReagentPlus</i><sup>®</sup>, =99% (HPLC)', NULL, N'(<i>S</i>)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO<sub>2</sub>CCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'147.13', N'200-293-7', N'1723801', N'24895052', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1251?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (110, 1, N'G1126 Sigma-Aldrich', N'<sc>DL</sc>-Glutamic acid monohydrate', NULL, NULL, NULL, NULL, NULL, N'19285-83-7', NULL, N'=98% (HPLC)', NULL, N'(±)-2-Aminoglutaric acid,
		
	
		(±)<wbr>-<wbr>2-<wbr>Aminopentanedioic acid', N'HOOCCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)COOH · H<sub>2</sub>O', N'165.14', N'210-522-2', N'4155097', N'24895039', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g1126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (111, 1, N'RES5063G-A7 SAFC', N'L-Glutamic acid, monosodium salt, Low Endotoxin', NULL, NULL, NULL, NULL, NULL, N'6106-04-3', NULL, N'PharmaGrade, Manufactured under appropriate controls for use as a raw material in pharma or biopharmaceutical production., suitable for cell culture', NULL, N'<sc>L</sc>-2-Aminopentanedioic acid,
		
	
		<sc>L</sc>-Glutamic acid monosodium salt monohydrate,
		
	
		MSG,
		
	
		Sodium<sc> L</sc>-glutamate', N'NaOOCCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)COOH · H<sub>2</sub>O', N'187.13', N'205-538-1', N'4164348', N'329824272', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res5063ga7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (112, 1, N'G3126 Sigma-Aldrich', N'<sc>L</sc>-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'<i>ReagentPlus</i><sup>®</sup>, =99% (HPLC)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diamino-<wbr>5-<wbr>oxopentanoic acid,
		
	
		<sc>L</sc>-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H<sub>2</sub>NCOCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.14', N'200-292-1', N'1723797', N'24277983', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g3126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (113, 1, N'G5792 SAFC', N'<sc>L</sc>-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'PharmaGrade, Ajinomoto, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diamino-<wbr>5-<wbr>oxopentanoic acid,
		
	
		<sc>L</sc>-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H<sub>2</sub>NCOCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.14', N'200-292-1', N'1723797', N'24895232', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5792?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (114, 1, N'G8540 Sigma-Aldrich', N'<sc>L</sc>-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'meets USP testing specifications, cell culture tested, 99.0-101.0%, from non-animal source', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diamino-<wbr>5-<wbr>oxopentanoic acid,
		
	
		<sc>L</sc>-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H<sub>2</sub>NCOCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.14', N'200-292-1', N'1723797', N'24895342', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8540?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (115, 1, N'49419 Sigma-Aldrich', N'<sc>L</sc>-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diamino-<wbr>5-<wbr>oxopentanoic acid,
		
	
		<sc>L</sc>-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H<sub>2</sub>NCOCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (116, 1, N'G5417 SAFC', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'24895210', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g5417?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (117, 1, N'G7126 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'<i>ReagentPlus</i><sup>®</sup>, =99% (HPLC)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'24895290', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7126?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (118, 1, N'50046 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (119, 1, N'G7403 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioXtra, =99% (titration)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'24895306', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (120, 1, N'G8790 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, =98.5%', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'24895353', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/g8790?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (121, 1, N'H3751 Sigma-Aldrich', N'<sc>D</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'351-50-8', NULL, N'=98% (TLC)', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid,
		
	
		<sc>D</sc>-a-Amino-ß-(4-imidazolyl)propionic acid', NULL, N'155.15', N'206-513-8', N'84089', N'24895591', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (122, 1, N'H6034 Sigma-Aldrich', N'<sc>L</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'cell culture tested, meets EP, USP testing specifications, from non-animal source', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'24895728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h6034?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (123, 1, N'H3911 SAFC', N'<sc>L</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57654248', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h3911?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (124, 1, N'53319 Sigma-Aldrich', N'<sc>L</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (125, 1, N'53340 Sigma-Aldrich', N'<sc>L</sc>-Histidine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6027-02-7', NULL, N'=99.0% (AT)', NULL, NULL, NULL, N'228.08', N'227-890-5', N'6119230', N'57651406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53340?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (126, 1, N'H4036 SAFC', N'<sc>L</sc>-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'<sc>L</sc>-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'57654249', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h4036?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (127, 1, N'53370 Sigma-Aldrich', N'<sc>L</sc>-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'5934-29-2', NULL, N'=99.0% (AT)', NULL, N'<sc>L</sc>-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', NULL, N'4168261', N'329757872', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53370?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (128, 1, N'H7750 Sigma-Aldrich', N'<sc>DL</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'4998-57-6', NULL, N'=99% (TLC)', NULL, N'(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid', NULL, N'155.15', N'225-660-9', N'7800', N'24895803', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7750?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (129, 1, N'H7875 Sigma-Aldrich', N'<sc>DL</sc>-Histidine monohydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'123333-71-1', NULL, N'=99% (TLC)', NULL, N'<sc>DL</sc>-a-Amino-ß-(4-imidazolyl)propionic acid monohydrochloride', NULL, N'209.63', N'229-266-8', N'4161354', N'24895808', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (130, 1, N'H1007 Sigma-Aldrich', N'<sc>L</sc>-Homoarginine hydrochloride', NULL, NULL, NULL, NULL, NULL, N'1483-01-8', NULL, N'unnatural arginine analog', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>6-<wbr>guanidinohexanoic acid hydrochloride', N'H<sub>2</sub>NC(=NH)NH(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H · HCl', N'224.69', N'216-045-6', N'4016621', N'24895420', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/h1007?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (131, 1, N'69453 Sigma-Aldrich', N'<sc>L</sc>-Homocysteine', NULL, NULL, NULL, NULL, NULL, N'6027-13-0', NULL, N'=98.0% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>mercaptobutyric acid', N'HSCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)COOH', N'135.18', N'227-891-0', NULL, N'329761669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/69453?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (132, 1, N'I5281 SAFC', N'<sc>L</sc>-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(2<i>S</i>,3<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylpentanoic acid', N'C<sub>2</sub>H<sub>5</sub>CH(CH<sub>3</sub>)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-798-2', N'1721792', N'57654304', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i5281?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (133, 1, N'I7403 Sigma-Aldrich', N'<sc>L</sc>-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(2<i>S</i>,3<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylpentanoic acid', N'C<sub>2</sub>H<sub>5</sub>CH(CH<sub>3</sub>)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-798-2', N'1721792', N'24896115', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/i7403?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (134, 1, N'58879 Sigma-Aldrich', N'<sc>L</sc>-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2<i>S</i>,3<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylpentanoic acid', N'C<sub>2</sub>H<sub>5</sub>CH(CH<sub>3</sub>)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (135, 1, N'L8543 Sigma-Aldrich', N'<sc>DL</sc>-Lanthionine', NULL, NULL, NULL, NULL, NULL, N'3183-08-2', NULL, N'=98% (TLC)', NULL, N'<sc>DL</sc>-3,3''-Thiodialanine,
		
	
		S-<wbr>(2-<wbr>Amino-<wbr>2-<wbr>carboxyethyl)<wbr>-<sc>DL</sc>-cysteine', NULL, N'208.24', N'221-676-5', NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8543?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (136, 1, N'L8912 Sigma-Aldrich', N'<sc>L</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-522-0', N'1721722', N'24896510', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8912?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (137, 1, N'L8000 Sigma-Aldrich', N'<sc>L</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-522-0', N'1721722', N'24896488', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8000?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (138, 1, N'L6914 SAFC', N'<sc>L</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-522-0', N'1721722', N'57654329', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6914?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (139, 1, N'61819 Sigma-Aldrich', N'<sc>L</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (140, 1, N'L7875 Sigma-Aldrich', N'<sc>DL</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'328-39-2', NULL, N'=99% (HPLC)', NULL, N'(±)<wbr>-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'206-328-2', N'636005', N'24896484', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7875?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (141, 1, N'L8021 Sigma-Aldrich', N'<sc>D</sc>-Lysine', NULL, NULL, NULL, NULL, NULL, N'923-27-3', NULL, N'=98% (HPLC)', NULL, N'(<i>R</i>)-2,6-Diaminocaproic acid', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.19', N'213-091-9', N'1722530', N'24896491', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8021?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (142, 1, N'L5876 Sigma-Aldrich', N'<sc>D</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'7274-88-6', NULL, N'=98% (TLC)', NULL, N'<sc>(</sc><i>R</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'230-691-6', N'4356907', N'24896421', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5876?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (143, 1, N'L1884 Sigma-Aldrich', N'<sc>L</sc>-Lysine acetate salt', NULL, NULL, NULL, NULL, NULL, N'57282-49-2', NULL, N'=98% (HPLC)', NULL, N'<sc>(S)</sc>-2,6-Diaminohexanoic acid', NULL, N'206.24', N'260-664-4', NULL, N'329817395', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l1884?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (144, 1, N'L5751 Sigma-Aldrich', N'<sc>L</sc>-Lysine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-26-1', NULL, N'=98% (HPLC)', NULL, N'<sc>(S)</sc>-2,6-Diaminohexanoic acid dihydrochloride', N'NH<sub>2</sub>(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)COOH · 2HCl', N'219.11', N'211-518-3', N'4539715', N'24896413', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l5751?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (145, 1, N'L5626 Sigma-Aldrich', N'<sc>L</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'reagent grade, =98% (HPLC)', NULL, N'<sc>(</sc><i>S</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896408', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/l5626?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (146, 1, N'L8662 Sigma-Aldrich', N'<sc>L</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'<sc>(</sc><i>S</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'211-519-9', N'3563889', N'24896502', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l8662?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (147, 1, N'L7039 SAFC', N'<sc>L</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'<sc>(</sc><i>S</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'211-519-9', N'3563889', N'57654336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l7039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (148, 1, N'62929 Sigma-Aldrich', N'<sc>L</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'<sc>(</sc><i>S</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (149, 1, N'L6001 Sigma-Aldrich', N'<sc>DL</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'70-53-1', NULL, N'=98% (HPLC)', NULL, N'<sc>DL</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'NH<sub>2</sub>(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)COOH · HCl', N'182.65', N'200-739-0', N'4711993', N'24896425', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/l6001?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (150, 1, N'M5550 Sigma-Aldrich', N'MEM Amino Acids (50x) solution', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without L-glutamine, liquid, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5550?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (151, 1, N'M9375 Sigma-Aldrich', N'<sc>D</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'348-67-4', NULL, N'=98% (HPLC)', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>D</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', NULL, N'149.21', N'206-483-6', N'1722293', N'24897327', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (152, 1, N'M9625 Sigma-Aldrich', N'<sc>L</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'reagent grade, =98% (HPLC)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'149.21', N'200-562-9', N'1722294', N'24897343', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/m9625?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (153, 1, N'M5308 Sigma-Aldrich', N'<sc>L</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'149.21', N'200-562-9', N'1722294', N'24896818', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m5308?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (154, 1, N'M8439 SAFC', N'<sc>L</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'149.21', N'200-562-9', N'1722294', N'57654418', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m8439?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (155, 1, N'64319 Sigma-Aldrich', N'<sc>L</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (156, 1, N'M9500 Sigma-Aldrich', N'<sc>DL</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'59-51-8', NULL, N'=99%', NULL, N'(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>DL</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)COOH', N'149.21', N'200-432-1', N'636185', N'24897336', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/m9500?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (157, 1, N'75440 Sigma-Aldrich', N'<sc>L</sc>-Ornithine dihydrochloride', NULL, NULL, NULL, NULL, NULL, N'6211-16-1', NULL, N'=99.0% (AT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diaminopentanoic acid dihydrochloride', NULL, N'205.08', N'228-277-5', N'4538819', N'329766423', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75440?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (158, 1, N'75469 Sigma-Aldrich', N'<sc>L</sc>-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (159, 1, N'P5482 Sigma-Aldrich', N'<sc>L</sc>-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>phenylpropionic acid', N'C<sub>6</sub>H<sub>5</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'165.19', N'200-568-1', N'1910408', N'24898657', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5482?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (160, 1, N'P8740 SAFC', N'<sc>L</sc>-Phenylalanine', NULL, NULL, NULL, NULL, NULL, N'63-91-2', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>phenylpropionic acid', N'C<sub>6</sub>H<sub>5</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'165.19', N'200-568-1', N'1910408', N'57654567', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8740?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (161, 1, N'P5607 Sigma-Aldrich', N'<sc>L</sc>-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>Pyrrolidine-<wbr>2-<wbr>carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'24898677', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p5607?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (162, 1, N'P8865 SAFC', N'<sc>L</sc>-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>Pyrrolidine-<wbr>2-<wbr>carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57654568', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/p8865?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (163, 1, N'81709 Sigma-Aldrich', N'<sc>L</sc>-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>Pyrrolidine-<wbr>2-<wbr>carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (164, 1, N'R7131 Sigma-Aldrich', N'RPMI 1640 Amino Acids Solution (50×)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Without <sc>L</sc>-glutamine, sterile-filtered, BioReagent, suitable for cell culture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/r7131?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (165, 1, N'RES0908S-A7 SAFC', N'<sc>L</sc>-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'PharmaGrade, Ajinomoto, EP, USP, JP, Manufactured under appropriate controls for use in pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxypropionic acid', N'HOCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'105.09', N'200-274-3', N'1721404', N'329824244', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/res0908sa7?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (166, 1, N'S4311 Sigma-Aldrich', N'<sc>L</sc>-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxypropionic acid', N'HOCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'105.09', N'200-274-3', N'1721404', N'24899599', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4311?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (167, 1, N'84959 Sigma-Aldrich', N'<sc>L</sc>-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxypropionic acid', N'HOCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (168, 1, N'S4375 Sigma-Aldrich', N'<sc>DL</sc>-Serine', NULL, NULL, NULL, NULL, NULL, N'302-84-1', NULL, N'=98% (TLC)', NULL, N'(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxypropionic acid', N'HOCH<sub>2</sub>CH(NH<sub>2</sub>)COOH', N'105.09', N'206-130-6', N'1721405', N'24899600', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/s4375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (169, 1, N'SMB00395 Sigma-Aldrich', N'<sc>L</sc>-Theanine', NULL, NULL, NULL, NULL, NULL, N'3081-61-6', NULL, N'=98% (HPLC)', NULL, N'<i>N</i><sub>?</sub>-Ethyl-<sc>L</sc>-glutamine,
		
	
		<sc>L</sc>-Glutamic acid ?-(ethylamide),
		
	
		Suntheanine', NULL, N'174.20', N'221-379-0', NULL, N'329824989', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/smb00395?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (170, 1, N'T8250 Sigma-Aldrich', N'<sc>D</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'632-20-2', NULL, N'=98% (TLC)', NULL, N'(2R,3S)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid,
		
	
		<sc>D</sc>-a-Amino-ß-hydroxybutyric acid', NULL, N'119.12', N'211-171-8', N'1721643', N'24900513', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8250?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (171, 1, N'T8441 Sigma-Aldrich', N'<sc>L</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(2<i>S</i>,3<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid', N'CH<sub>3</sub>CH(OH)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'119.12', N'200-774-1', N'1721646', N'24900531', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8441?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (172, 1, N'T4071 SAFC', N'<sc>L</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(2<i>S</i>,3<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid', N'CH<sub>3</sub>CH(OH)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'119.12', N'200-774-1', N'1721646', N'57654668', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4071?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (173, 1, N'89179 Sigma-Aldrich', N'<sc>L</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2<i>S</i>,3<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid', N'CH<sub>3</sub>CH(OH)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (174, 1, N'T8375 Sigma-Aldrich', N'<sc>DL</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'80-68-2', NULL, N'=95% (titration)', NULL, N'(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid', N'CH<sub>3</sub>CH(OH)CH(NH<sub>2</sub>)COOH', N'119.12', N'201-300-6', N'1721647', N'24900522', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8375?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (175, 1, N'T8941 Sigma-Aldrich', N'<sc>L</sc>-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>indolyl)<wbr>propionic acid,
		
	
		<sc>L</sc>-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'24900575', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8941?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (176, 1, N'T4196 SAFC', N'<sc>L</sc>-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, Manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>indolyl)<wbr>propionic acid,
		
	
		<sc>L</sc>-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57654669', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4196?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (177, 1, N'93659 Sigma-Aldrich', N'<sc>L</sc>-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>indolyl)<wbr>propionic acid,
		
	
		<sc>L</sc>-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (178, 1, N'T3300 Sigma-Aldrich', N'<sc>DL</sc>-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'54-12-6', NULL, N'=99% (HPLC)', NULL, N'(±)-a-Amino-3-indolepropionic acid,
		
	
		(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>indolyl)<wbr>propionic acid,
		
	
		<sc>DL</sc>-3ß-Indolylalanine', NULL, N'204.23', N'200-194-9', N'86199', N'24900128', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3300?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (179, 1, N'T3629 Sigma-Aldrich', N'<sc>DL</sc>-<i>m</i>-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'775-06-4', NULL, N'crystalline', NULL, N'(±)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>hydroxyphenyl)<wbr>propionic acid,
		
	
		3-(3-Hydroxyphenyl)-<sc>DL</sc>-alanine', N'HOC<sub>6</sub>H<sub>4</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'181.19', N'212-270-9', N'2416853', N'24900153', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t3629?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (180, 1, N'T8566 Sigma-Aldrich', N'<sc>L</sc>-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'from non-animal source, meets EP, USP testing specifications, suitable for cell culture, 99.0-101.0%', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>hydroxyphenyl)<wbr>propionic acid,
		
	
		3-(4-Hydroxyphenyl)-<sc>L</sc>-alanine', N'4-(HO)C<sub>6</sub>H<sub>4</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'181.19', N'200-460-4', N'392441', N'24900543', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t8566?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (181, 1, N'T4321 SAFC', N'<sc>L</sc>-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for pharma or biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>hydroxyphenyl)<wbr>propionic acid,
		
	
		3-(4-Hydroxyphenyl)-<sc>L</sc>-alanine', N'4-(HO)C<sub>6</sub>H<sub>4</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'181.19', N'200-460-4', N'392441', N'57654670', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/t4321?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (182, 1, N'93829 Sigma-Aldrich', N'<sc>L</sc>-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>hydroxyphenyl)<wbr>propionic acid,
		
	
		3-(4-Hydroxyphenyl)-<sc>L</sc>-alanine', N'4-(HO)C<sub>6</sub>H<sub>4</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (183, 1, N'V0513 Sigma-Aldrich', N'<sc>L</sc>-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'from non-animal source, meets EP, JP, USP testing specifications, suitable for cell culture, 98.5-101.0%', NULL, N'(<i>S</i>)-a-Aminoisovaleric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylbutanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH(NH<sub>2</sub>)CO<sub>2</sub>H', N'117.15', N'200-773-6', N'1721136', N'24900696', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v0513?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (184, 1, N'V4638 SAFC', N'<sc>L</sc>-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'PharmaGrade, Ajinomoto, EP, JP, USP, manufactured under appropriate GMP controls for Pharma or Biopharmaceutical production, suitable for cell culture', NULL, N'(<i>S</i>)-a-Aminoisovaleric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylbutanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH(NH<sub>2</sub>)CO<sub>2</sub>H', N'117.15', N'200-773-6', N'1721136', N'57654728', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/v4638?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (185, 1, N'94619 Sigma-Aldrich', N'<sc>L</sc>-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-a-Aminoisovaleric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylbutanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH(NH<sub>2</sub>)CO<sub>2</sub>H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (186, 2, N'05159 Sigma-Aldrich', N'ß-Alanine', NULL, NULL, NULL, NULL, NULL, N'107-95-9', NULL, N'BioUltra, =99.0% (NT)', NULL, N'ß-Ala,
		
	
		3-Aminopropionic acid', N'NH<sub>2</sub>CH<sub>2</sub>CH<sub>2</sub>COOH', N'89.09', N'203-536-5', N'906793', N'329747648', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05159?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (187, 2, N'05129 Sigma-Aldrich', N'<sc>L</sc>-Alanine', NULL, NULL, NULL, NULL, NULL, N'56-41-7', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-2-Aminopropionic acid,
		
	
		<sc>L</sc>-a-Aminopropionic acid', NULL, N'89.09', N'200-273-8', N'1720248', N'329747639', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/05129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (188, 2, N'11009 Sigma', N'<sc>L</sc>-Arginine', NULL, NULL, NULL, NULL, NULL, N'74-79-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>guanidinopentanoic acid', N'H<sub>2</sub>NC(=NH)NH(CH<sub>2</sub>)<sub>3</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'174.20', N'200-811-1', N'1725413', N'329749274', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11009?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (189, 2, N'11039 Sigma-Aldrich', N'<sc>L</sc>-Arginine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'1119-34-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'(<i>S</i>)<wbr>-<wbr>(+)<wbr>-<wbr>2-<wbr>Amino-<wbr>5-<wbr>[(aminoiminomethyl)<wbr>amino]<wbr>pentanoic acid monohydrochloride', NULL, N'210.66', N'214-275-1', N'3631658', N'57646880', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11039?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (190, 2, N'11189 Sigma-Aldrich', N'<sc>L</sc>-Aspartic acid', NULL, NULL, NULL, NULL, NULL, N'56-84-8', NULL, N'BioUltra, =99.5% (T)', NULL, N'(<i>S</i>)-(+)-Aminosuccinic acid,
		
	
		(<i>S</i>)-Aminobutanedioic acid', N'HO<sub>2</sub>CCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'133.10', N'200-291-6', N'1723530', N'57646891', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/11189?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (191, 2, N'30089 Sigma-Aldrich', N'<sc>L</sc>-Cysteine', NULL, NULL, NULL, NULL, NULL, N'52-90-4', NULL, N'BioUltra, =98.5% (RT)', NULL, N'(<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>mercaptopropionic acid', N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'121.16', N'200-158-2', N'1721408', N'57648406', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30089?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (192, 2, N'30129 Sigma-Aldrich', N'<sc>L</sc>-Cysteine hydrochloride monohydrate', NULL, NULL, NULL, NULL, NULL, N'7048-04-6', NULL, N'BioUltra, =99.0% (RT)', NULL, NULL, N'HSCH<sub>2</sub>CH(NH<sub>2</sub>)COOH · HCl · H<sub>2</sub>O', N'175.63', N'200-157-7', N'5158059', N'57648412', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/30129?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (193, 2, N'49449 Sigma-Aldrich', N'<sc>L</sc>-Glutamic acid', NULL, NULL, NULL, NULL, NULL, N'56-86-0', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-2-Aminopentanedioic acid,
		
	
		Glu', N'HO<sub>2</sub>CCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'147.13', N'200-293-7', N'1723801', N'57651195', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49449?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (194, 2, N'49419 Sigma-Aldrich', N'<sc>L</sc>-Glutamine', NULL, NULL, NULL, NULL, NULL, N'56-85-9', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diamino-<wbr>5-<wbr>oxopentanoic acid,
		
	
		<sc>L</sc>-Glutamic acid 5-amide,
		
	
		Levoglutamide', N'H<sub>2</sub>NCOCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'146.14', N'200-292-1', N'1723797', N'57651187', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/49419?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (195, 2, N'50046 Sigma-Aldrich', N'Glycine', NULL, NULL, NULL, NULL, NULL, N'56-40-6', NULL, N'BioUltra, for molecular biology, =99.0% (NT)', NULL, N'Aminoacetic acid,
		
	
		Aminoethanoic acid,
		
	
		Glycocoll', N'NH<sub>2</sub>CH<sub>2</sub>COOH', N'75.07', N'200-272-2', N'635782', N'57651233', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50046?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (196, 2, N'50239 Sigma-Aldrich', N'Gly-Gly-Gly', NULL, NULL, NULL, NULL, NULL, N'556-33-2', NULL, N'BioUltra, =99.0% (NT)', NULL, N'Glycyl-<wbr>glycyl-<wbr>glycine,
		
	
		Triglycine', N'NH<sub>2</sub>CH<sub>2</sub>CONHCH<sub>2</sub>CONHCH<sub>2</sub>COOH', N'189.17', N'209-122-0', N'1711130', N'57651245', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/50239?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (197, 2, N'53319 Sigma-Aldrich', N'<sc>L</sc>-Histidine', NULL, NULL, NULL, NULL, NULL, N'71-00-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>imidazolyl)<wbr>propionic acid,
		
	
		NSC 137773', NULL, N'155.15', N'200-745-3', N'84088', N'57651378', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/53319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (198, 2, N'58879 Sigma-Aldrich', N'<sc>L</sc>-Isoleucine', NULL, NULL, NULL, NULL, NULL, N'73-32-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(2<i>S</i>,3<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylpentanoic acid', N'C<sub>2</sub>H<sub>5</sub>CH(CH<sub>3</sub>)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-798-2', N'1721792', N'57651663', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/58879?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (199, 2, N'61819 Sigma-Aldrich', N'<sc>L</sc>-Leucine', NULL, NULL, NULL, NULL, NULL, N'61-90-5', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>methylpentanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'131.17', N'200-522-0', N'1721722', N'57651866', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/61819?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (200, 2, N'62929 Sigma-Aldrich', N'<sc>L</sc>-Lysine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'657-27-2', NULL, N'BioUltra, =99.5% (AT)', NULL, N'<sc>(</sc><i>S</i><sc>)</sc>-2,6-Diaminohexanoic acid monohydrochloride', N'H<sub>2</sub>N(CH<sub>2</sub>)<sub>4</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H·HCl', N'182.65', N'211-519-9', N'3563889', N'329759756', 1, N'https://www.sigmaaldrich.com/catalog/product/sial/62929?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (201, 2, N'64319 Sigma-Aldrich', N'<sc>L</sc>-Methionine', NULL, NULL, NULL, NULL, NULL, N'63-68-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylmercapto)<wbr>butyric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>4-<wbr>(methylthio)<wbr>butanoic acid', N'CH<sub>3</sub>SCH<sub>2</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'149.21', N'200-562-9', N'1722294', N'57651979', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/64319?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (202, 2, N'75469 Sigma-Aldrich', N'<sc>L</sc>-Ornithine monohydrochloride', NULL, NULL, NULL, NULL, NULL, N'3184-13-2', NULL, N'BioXtra, =99.5% (AT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2,5-<wbr>Diaminopentanoic acid monohydrochloride', NULL, N'168.62', N'221-678-6', N'3625847', N'57652566', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/75469?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (203, 2, N'81709 Sigma-Aldrich', N'<sc>L</sc>-Proline', NULL, NULL, NULL, NULL, NULL, N'147-85-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>Pyrrolidine-<wbr>2-<wbr>carboxylic acid', NULL, N'115.13', N'205-702-2', N'80810', N'57652885', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/81709?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (204, 2, N'84959 Sigma-Aldrich', N'<sc>L</sc>-Serine', NULL, NULL, NULL, NULL, NULL, N'56-45-1', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxypropionic acid', N'HOCH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'105.09', N'200-274-3', N'1721404', N'57653029', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/84959?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (205, 2, N'89179 Sigma-Aldrich', N'<sc>L</sc>-Threonine', NULL, NULL, NULL, NULL, NULL, N'72-19-5', NULL, N'BioXtra, =99.5% (NT)', NULL, N'(2<i>S</i>,3<i>R</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>hydroxybutyric acid', N'CH<sub>3</sub>CH(OH)CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'119.12', N'200-774-1', N'1721646', N'57653332', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/89179?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (206, 2, N'93659 Sigma-Aldrich', N'<sc>L</sc>-Tryptophan', NULL, NULL, NULL, NULL, NULL, N'73-22-3', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(3-<wbr>indolyl)<wbr>propionic acid,
		
	
		<sc>L</sc>-a-Amino-3-indolepropionic acid', NULL, N'204.23', N'200-795-6', N'86197', N'57653570', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93659?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (207, 2, N'93829 Sigma-Aldrich', N'<sc>L</sc>-Tyrosine', NULL, NULL, NULL, NULL, NULL, N'60-18-4', NULL, N'BioUltra, =99.0% (NT)', NULL, N'(<i>S</i>)<wbr>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>(4-<wbr>hydroxyphenyl)<wbr>propionic acid,
		
	
		3-(4-Hydroxyphenyl)-<sc>L</sc>-alanine', N'4-(HO)C<sub>6</sub>H<sub>4</sub>CH<sub>2</sub>CH(NH<sub>2</sub>)CO<sub>2</sub>H', N'181.19', N'200-460-4', N'392441', N'57653577', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/93829?lang=en&amp;region=US')
GO
INSERT [dbo].[Product] ([ID], [SubCategoryID], [ID_Link], [name], [Volume], [Density], [AmountInKG], [PricePerKG], [Assay], [CASnumber], [InChlkey], [Description], [Biologicalsource], [Synonyms], [Linearformula], [Molecularweight], [ECnumber], [Beilsteinnumber], [PubChemID], [Processed], [ProductUrl]) VALUES (208, 2, N'94619 Sigma-Aldrich', N'<sc>L</sc>-Valine', NULL, NULL, NULL, NULL, NULL, N'72-18-4', NULL, N'BioUltra, =99.5% (NT)', NULL, N'(<i>S</i>)-a-Aminoisovaleric acid,
		
	
		<sc>L</sc>-<wbr>2-<wbr>Amino-<wbr>3-<wbr>methylbutanoic acid', N'(CH<sub>3</sub>)<sub>2</sub>CHCH(NH<sub>2</sub>)CO<sub>2</sub>H', N'117.15', N'200-773-6', N'1721136', N'57653624', 1, N'https://www.sigmaaldrich.com/catalog/product/sigma/94619?lang=en&amp;region=US')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (1, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (1, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (3, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (4, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (4, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (4, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (4, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (5, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (5, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (6, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (6, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (7, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (7, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (8, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (8, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (9, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (9, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (10, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (11, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (11, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (11, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (12, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (12, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (14, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (15, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (16, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (16, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (16, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (17, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (18, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (19, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (19, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (19, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (20, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (20, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (21, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (22, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (23, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (23, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (24, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (25, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (27, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (29, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (30, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (31, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (32, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (32, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (33, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (2, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (2, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (26, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (26, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (28, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (34, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (35, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (36, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (37, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (38, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (39, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (40, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (41, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (41, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (42, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (43, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (44, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (45, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (46, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (47, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (48, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (49, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (50, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (51, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (52, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (53, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (54, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (55, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (56, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (57, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (59, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (60, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_Packaging] ([ProductID], [Packaging]) VALUES (61, N'DataExtractor.Controllers.Product')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (1, N'1002890025', N'31.25')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (1, N'1002890100', N'55.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (1, N'1002899010', N'2,096.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005901000', N'70.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005900001', N'162.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005905000', N'243.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005909012', N'434.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005909025', N'776.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (3, N'1005909050', N'1,430.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (4, N'1015441000', N'228.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (4, N'1015440001', N'561.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (4, N'1015445000', N'869.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (4, N'1015449010', N'1,560.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (5, N'1015870001', N'507.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (5, N'1015879010', N'1,410.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (6, N'1027350001', N'506.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (6, N'1027359010', N'1,410.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (7, N'1028361000', N'178.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (7, N'1028360001', N'224.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (8, N'1028389010', N'2,480.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (9, N'1028390025', N'36.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (11, N'1043520500', N'304.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (11, N'1043520001', N'687.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (11, N'1043529010', N'3,730.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (12, N'1043540001', N'484.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (12, N'1043549010', N'2,490.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (36, N'8145990050', N'61.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (37, N'8149860050', N'76.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (38, N'8160000025', N'22.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (38, N'8160000100', N'70.60')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (39, N'8160010100', N'41.60')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (40, N'8160030100', N'25.50')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (40, N'8160030500', N'88.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (41, N'8160040100', N'27.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (41, N'8160041000', N'145.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (42, N'8160050025', N'20.90')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (42, N'8160050100', N'69.60')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (43, N'8160060025', N'23.90')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (43, N'8160060100', N'59.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (44, N'8160070005', N'25.70')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (44, N'8160070025', N'92.90')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (45, N'8160080010', N'25.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (45, N'8160080025', N'50.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (46, N'8160090025', N'19.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (46, N'8160090100', N'55.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (47, N'8160100025', N'19.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (47, N'8160100100', N'61.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (48, N'8160110010', N'21.90')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (48, N'8160110050', N'35.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (50, N'8160130250', N'28.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (50, N'8160131000', N'86.60')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (51, N'8160140025', N'26.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (51, N'8160140100', N'90.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (52, N'8160160025', N'22.70')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (52, N'8160160100', N'61.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (53, N'8160170025', N'38.40')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (53, N'8160170100', N'117.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (54, N'8160180100', N'39.20')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (54, N'8160180500', N'113.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (55, N'8160190025', N'36.60')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (55, N'8160190100', N'101.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (56, N'8160200025', N'36.70')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (56, N'8160200100', N'101.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (57, N'8160210025', N'33.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (57, N'8160210100', N'63.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (59, N'8206490100', N'34.30')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (59, N'8206490500', N'107.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (60, N'8412350100', N'62.80')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (61, N'8415050001', N'36.40')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (64, N'A7469-1KG', N'932.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (65, N'A4349-1KG', N'1,050.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (65, N'A4349-10KG', N'')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (65, N'A4349-25KG', N'')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (67, N'A7502-5KG', N'869.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (68, N'596906-1G', N'996.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (82, N'A4599-A150X', N'0.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (82, N'A4599-25KG', N'5,890.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (88, N'A5474-25KG', N'5,360.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (104, N'RES1520C-A705X', N'11,090.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (105, N'RES1513C-A702X', N'0.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (106, N'G5667-10KG', N'2,200.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (106, N'G5667-25KG', N'4,930.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (123, N'H3911-1KG', N'1,200.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (123, N'H3911-25KG', N'15,900.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (124, N'53319-100G', N'188.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (126, N'H4036-1KG', N'809.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (134, N'58879-10G', N'68.10')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (141, N'L8021-25G', N'1,580.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (154, N'M8439-25KG', N'10,140.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (157, N'75440-100G', N'765.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (165, N'RES0908S-A704X', N'7,580.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (165, N'RES0908S-A705X', N'16,670.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (172, N'T4071-10KG', N'11,120.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (172, N'T4071-25KG', N'25,260.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (184, N'V4638-10KG', N'6,150.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (184, N'V4638-25KG', N'13,340.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (197, N'53319-100G', N'188.00')
GO
INSERT [dbo].[Product_SKU] ([ProductID], [SKU], [Price]) VALUES (198, N'58879-10G', N'68.10')
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID]) VALUES (1, N'Amino Acids -  (185)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16181993', 1, 1)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID]) VALUES (2, N'BioUltra -  (23)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=14992359', 1, 1)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID]) VALUES (3, N'Modified Amino Acids -  (268)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=16360557', 0, 1)
GO
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [SubCategoryURL], [Processed], [CategoryID]) VALUES (4, N'Polyamino Acids -  (87)', N'https://www.sigmaaldrich.com/etc/controller/controller-page.html?TablePage=9616613', 0, 1)
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
