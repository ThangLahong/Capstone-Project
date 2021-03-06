USE [master]
GO
/****** Object:  Database [Capstone]    Script Date: 4/10/2022 9:58:39 PM ******/
CREATE DATABASE [Capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Capstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [Capstone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Capstone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Capstone] SET RECOVERY FULL 
GO
ALTER DATABASE [Capstone] SET  MULTI_USER 
GO
ALTER DATABASE [Capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Capstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Capstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Capstone', N'ON'
GO
ALTER DATABASE [Capstone] SET QUERY_STORE = OFF
GO
USE [Capstone]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/10/2022 9:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[FullName] [nvarchar](30) NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[AccountRole] [tinyint] NOT NULL,
 CONSTRAINT [PK_Account_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllDonations]    Script Date: 4/10/2022 9:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllDonations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Thumbnail] [varchar](255) NOT NULL,
	[NumberOfDonations] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[ExpectedAmount] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CharityFund] [nvarchar](50) NULL,
	[CharityLogo] [varchar](255) NULL,
 CONSTRAINT [PK_AllDonations_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationDetails]    Script Date: 4/10/2022 9:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Image1] [varchar](255) NULL,
	[Image2] [varchar](255) NULL,
	[Image3] [varchar](255) NULL,
	[Image4] [varchar](255) NULL,
	[Story1] [nvarchar](1000) NULL,
	[Story2] [nvarchar](1000) NULL,
	[Story3] [nvarchar](1000) NULL,
	[Story4] [nvarchar](1000) NULL,
 CONSTRAINT [PK_DonationDetails_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 4/10/2022 9:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Stt] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[FullName] [nvarchar](30) NULL,
	[Phone] [char](10) NOT NULL,
	[Amount] [int] NOT NULL,
	[DonationId] [int] NOT NULL,
 CONSTRAINT [PK_Donor_Stt] PRIMARY KEY CLUSTERED 
(
	[Stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (1, N'lahongthang266@gmail.com', N'111', N'La Hồng Thắng', N'Thangla', N'Nam', N'0378573499', CAST(N'1996-06-20' AS Date), N'Gò Vấp, TP.HCM', CAST(N'2022-04-04' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (2, N'huynhbaolieu@gmail.com', N'222', N'Huỳnh Thị Bảo Liễu', N'BaoLieu', N'Nữ', N'0964862729', CAST(N'1996-06-02' AS Date), N'Gò Vấp, TP.HCM', CAST(N'2022-04-04' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (3, N'trantuanphong@gmail.com', N'333', N'Trần Tuấn Phong', N'TuanPhong', N'Nam', N'0968634315', CAST(N'1996-01-24' AS Date), N'Gò Dầu, Tây Ninh', CAST(N'2022-04-04' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (4, N'trananhnhutnam@gmail.com', N'444', N'Trần Anh Nhựt Nam', N'NhutNam', N'Nam', N'0776272724', CAST(N'1996-01-02' AS Date), N'Đức Hòa, Long An', CAST(N'2022-04-04' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (5, N'phamhuuphuoc@gmail.com', N'555', N'Phạm Hữu Phước', N'HuuPhuoc', N'Nam', N'0908936970', CAST(N'1996-01-03' AS Date), N'Đức Hòa, Long An', CAST(N'2022-04-04' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (6, N'vovanpho@gmail.com', N'666', N'Võ Văn Phố', N'PhoVo', N'Nam', N'0972057351', CAST(N'1994-01-01' AS Date), N'Gò vấp, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (7, N'vuthanhtam@gmail.com', N'777', N'Vũ Thị Thanh Tâm', N'ThanhTam', N'Nữ', N'0901765259', CAST(N'1995-09-25' AS Date), N'Tân Phú, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (8, N'lahungminh@gmail.com', N'888', N'La Hùng Minh', N'HungMinh', N'Nam', N'0355438080', CAST(N'1992-05-19' AS Date), N'Bình Chánh, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (9, N'lahungvi@gmail.com', N'999', N'La Hùng Vĩ', N'HungVi', N'Nam', N'0974871312', CAST(N'1994-03-15' AS Date), N'Gò vấp, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (10, N'lahongloc@gmail.com', N'112', N'La Hồng Lộc', N'HongLoc', N'Nam', N'0334454203', CAST(N'2004-05-24' AS Date), N'Gò Vấp, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (11, N'thanhhoai@gmail.com', N'113', N'Nguyễn Thanh Hoài', N'ThanhHoai', N'Nam', N'0965372854', CAST(N'1996-01-01' AS Date), N'Bình Chánh, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (12, N'lesitinh@gmail.com', N'114', N'Lê Sĩ Tình', N'SiTinh', N'Nam', N'0962988244', CAST(N'1996-01-01' AS Date), N'Gò Vấp, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (13, N'kieuphuong@gmail.com', N'115', N'Nguyễn Thị Kiều Phương', N'KieuPhuong', N'Nữ', N'0373999001', CAST(N'1994-01-01' AS Date), N'Quận 1, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (14, N'pdhoangminh@gmail.com', N'116', N'Phạm Dương Hoàng Minh', N'HoangMinh', N'Nam', N'0834666168', CAST(N'1986-01-01' AS Date), N'Tân Bình, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [UserName], [Gender], [Phone], [DateOfBirth], [Address], [CreateDate], [AccountRole]) VALUES (15, N'phungthanhlong@gmail.com', N'117', N'Phùng Thanh Long', N'LongPhung', N'Nam', N'0334029117', CAST(N'1994-12-12' AS Date), N'Gò Vấp, TP.HCM', CAST(N'2022-04-08' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AllDonations] ON 

INSERT [dbo].[AllDonations] ([Id], [Name], [Thumbnail], [NumberOfDonations], [Amount], [ExpectedAmount], [StartDate], [EndDate], [CharityFund], [CharityLogo]) VALUES (1, N'Cùng chung tay hỗ trợ chi phí phẫu thuật tim bẩm sinh cho 8 em nhỏ có hoàn cảnh khó khăn', N'https://static.mservice.io/blogscontents/momo-upload-api-220404110124-637846668847330674.jpg', 2, 3500000, 10000000, CAST(N'2022-04-04' AS Date), CAST(N'2022-06-04' AS Date), N'Quỹ Từ Thiện & BTXH Trăng Khuyết', N'https://static.mservice.io/blogscontents/momo-upload-api-220330105422-637842344622656288.jpg')
INSERT [dbo].[AllDonations] ([Id], [Name], [Thumbnail], [NumberOfDonations], [Amount], [ExpectedAmount], [StartDate], [EndDate], [CharityFund], [CharityLogo]) VALUES (2, N'Cùng quyên góp tặng thư viện sách và tập huấn kỹ năng sống cho học sinh khó khăn tại trường THCS Mương Mán, Bình Thuận', N'https://static.mservice.io/blogscontents/momo-upload-api-220407100310-637849225907944453.jpg', 1, 1000000, 130000000, CAST(N'2022-04-04' AS Date), CAST(N'2022-05-04' AS Date), N'Sức Mạnh 2000', N'https://static.mservice.io/blogscontents/momo-upload-api-220228090431-637816358714728605.jpg')
INSERT [dbo].[AllDonations] ([Id], [Name], [Thumbnail], [NumberOfDonations], [Amount], [ExpectedAmount], [StartDate], [EndDate], [CharityFund], [CharityLogo]) VALUES (3, N'Cùng quyên góp tặng “Thêm 1 Bữa No, Thêm 1 Nụ Cười” cho trẻ em và người già neo đơn tại các mái ấm và quán trọ Quý 1/2022', N'https://static.mservice.io/blogscontents/momo-upload-api-220314110322-637828526027353807.jpg', 0, 0, 195000000, CAST(N'2022-04-04' AS Date), CAST(N'2022-07-04' AS Date), N'Quỹ Từ Thiện & BTXH Trăng Khuyết', N'https://static.mservice.io/blogscontents/momo-upload-api-220330105422-637842344622656288.jpg')
INSERT [dbo].[AllDonations] ([Id], [Name], [Thumbnail], [NumberOfDonations], [Amount], [ExpectedAmount], [StartDate], [EndDate], [CharityFund], [CharityLogo]) VALUES (4, N'Đồng hành cùng OneSky nâng cao chất lượng giáo dục mầm non cho hàng nghìn trẻ em tại các Khu công nghiệp', N'https://static.mservice.io/blogscontents/momo-upload-api-220304142457-637820006977670730.jpg', 0, 0, 100000000, CAST(N'2022-04-04' AS Date), CAST(N'2022-08-04' AS Date), N'OneSkye', N'https://static.mservice.io/blogscontents/momo-upload-api-220228090431-637816358714728605.jpg')
SET IDENTITY_INSERT [dbo].[AllDonations] OFF
GO
SET IDENTITY_INSERT [dbo].[DonationDetails] ON 

INSERT [dbo].[DonationDetails] ([Id], [Title], [Image1], [Image2], [Image3], [Image4], [Story1], [Story2], [Story3], [Story4]) VALUES (1, N'Cùng chung tay gây quỹ hỗ trợ chi phí phẫu thuật tim bẩm sinh 8 em nhỏ có hoàn cảnh khó khăn, giúp các em có cuộc sống khỏe mạnh', N'https://static.mservice.io/blogscontents/momo-upload-api-220404110124-637846668847330674.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220404110942-637846673826346719.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220404110952-637846673922539083.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220404111001-637846674016416255.jpg', N'Trong suốt 16 năm qua, với sứ mệnh của mình, VinaCapital Foundation (VCF) và chương trình Nhịp tim Việt Nam đã nỗ lực hết mình để mang đến cơ hội phẫu thuật miễn phí cho trẻ em có hoàn cảnh khó khăn không may ra đời với bệnh tim bẩm sinh trên khắp Việt Nam. Tuy nhiên, vẫn còn rất em nhỏ cần được giúp đỡ. Ước tính cứ 100 trẻ em sinh ra mỗi năm, sẽ có 1 em mắc bệnh tim bẩm sinh; theo thống kê mỗi năm tại Việt Nam có khoảng 15.000 trẻ sơ sinh được sinh ra mắc bệnh tim bẩm sinh.', N'Với những gia đình có hoàn cảnh khó khăn, đặc biệt từ vùng sâu vùng xa, việc chăm sóc cho một em nhỏ mắc bệnh tim là một gánh nặng kinh tế to lớn bởi hàng loạt những chi phí thuốc men, khám sức khỏe định kỳ và nhập viện, chưa kể đến chi phí phẫu thuật tim khổng lồ. Tuy nhiên, trẻ mắc bệnh tim bẩm sinh hoàn toàn có thể sống và khỏe mạnh hơn nếu các con có cơ hội được tiếp cận với dịch vụ chăm sóc và điều trị y tế tốt.', N'Những em nhỏ mắc bệnh tim bẩm sinh hoàn toàn có thể sống khỏe mạnh nếu được chữa trị tốt, thế nhưng chi phí cho những ca phẫu thuật tim là một con số không hề nhỏ đối với nhiều gia đình. Một ca phẫu thuật hiện nay dao động từ 35.000.000 VNĐ đến 163.000.000 VNĐ, trong đó chi phí trung bình là 84.000.000 VNĐ. Nhờ có nguồn chi phí đối ứng từ bảo hiểm y tế cho trẻ em, chính quyền địa phương, và các tổ chức khác, các nhà tài trợ thông qua Nhịp Tim Việt Nam chỉ cần đóng góp 28.000.000 VNĐ là có thể cứu được một em bé mắc bệnh tim bẩm sinh.', N'Thông qua kênh quyên góp của MoMo, Nhịp Tim Việt Nam kêu gọi sự chung tay của cộng đồng nhằm mang đến cơ hội thay đổi cuộc đời cho những trái tim bé bỏng, để không còn một em nào phải chết đi vì chờ đợi phẫu thuật nữa. VCF và Nhịp Tim Việt Nam rất cần sự hỗ trợ của các bạn để giúp chúng tôi rút ngắn hành trình đầy thử thách nhưng ý nghĩa này và cứu thêm thật nhiều em nhỏ mắc bệnh tim bẩm sinh hơn nữa. Chúng tôi mong muốn có thể gây quỹ 224,000,000 VND từ các tấm lòng hảo tâm thông qua Trái Tim MoMo để giúp 08 em nhỏ có đủ kinh phí để phẫu thuật, sớm có được sức khỏe tốt để vui chơi, chạy nhảy như bao bạn bè cùng trang lứa.')
INSERT [dbo].[DonationDetails] ([Id], [Title], [Image1], [Image2], [Image3], [Image4], [Story1], [Story2], [Story3], [Story4]) VALUES (2, N'Cùng gây quỹ tặng thư viện sách và tổ chức tập huấn kỹ năng sống cho học sinh có hoàn cảnh khó khăn tại trường THCS Mương Mán, Hàm Thuận Nam, Bình Thuận', N'https://static.mservice.io/blogscontents/momo-upload-api-220407100310-637849225907944453.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220407101152-637849231127694271.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220407101201-637849231216289291.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220407101210-637849231303424004.jpg', N'Ai trong mỗi chúng ta đều biết rằng đọc sách để mở mang kiến thức. Vì thế sách có vai trò và vị trí của sách vô cùng quan trọng trong con đường học vấn. Chu Quang Tiềm đã khuyên dạy chúng ta rằng: “Học vấn không chỉ là việc đọc sách, nhưng đọc sách vẫn là một con đường quan trọng của học vấn”. Sách là kho tàng tri thức quý báu được tìm hiểu, ghi chép, cô đọng, lưu truyền qua những thăng trầm lịch sử. Và sách cũng là “di sản tinh thần của nhân loại”. Ở các trường học, thư viện được xây dựng với nhiều nguồn sách bổ ích, cung cấp tri thức vô tận cho các em học sinh. Nhưng vẫn còn một số vùng khó khăn, việc tiếp cận với sách vẫn còn là một vấn đề nan giải.', N'Mương Mán là một xã miền núi thuộc huyện Hàm Thuận Nam, tỉnh Bình Thuận. Trường THCS Mương Mán đóng trên địa bàn thôn Văn Phong, sĩ số bình quân hằng năm 700 học sinh, trong đó 1/3 là học sinh nghèo, cận nghèo hoặc khó khăn. Các gia đình nhập cư và lao động tự do bị ảnh hưởng nặng nề nhất vì thất nghiệp và mất việc dẫn khó khăn về tài chính, học sinh phải học online dài ngày.', N'Mặc dù nhà trường đã chủ động tìm kiếm nguồn lực để gầy dựng, bù đắp và phát triển văn hoá đọc nhằm xoá bớt ảnh hưởng của thiết bị công nghệ đến cuộc sống của học sinh. Nhưng, chỉ với 500 đầu sách hiện có về các chủ đề cuộc sống, biển đảo, kỹ năng, pháp luật… nhà trường đã gặp vô cùng khó khăn trong thu hút học sinh đến đọc sách.', N'Với tinh thần lá lành đùm lá rách, tương thân tương ái của người Việt Nam, Trung tâm Giáo dục Sức khỏe và Phát triển Cộng đồng Tương Lai – TP.HCM phối hợp cùng Ví MoMo gây quỹ và kêu gọi ủng hộ 30.000.000 đồng cho chương trình này thông qua Trái Tim MoMo. Toàn bộ số tiền ủng hộ sẽ được sử dụng để mua sách ủng hộ thư viện và tập huấn kỹ năng sống cho học sinh trường THCS Mương Mán.')
INSERT [dbo].[DonationDetails] ([Id], [Title], [Image1], [Image2], [Image3], [Image4], [Story1], [Story2], [Story3], [Story4]) VALUES (3, N'Chung tay góp đóng góp để tạo ra hàng ngàn bữa ăn dinh dưỡng, chất lượng cho các cụ già và trẻ em tại mái ấm, quán trọ trong quý 1/2022', N'https://static.mservice.io/blogscontents/momo-upload-api-220314110322-637828526027353807.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220314111142-637828531028738190.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220314111153-637828531130819649.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220314111201-637828531216778701.jpg', N'Lâu ngày thành quen, chương trình “Thêm 1 bữa no - Thêm 1 nụ cười” dần trở nên quen thuộc đối với các mảnh đời ở mái ấm mà Trăng Khuyết hỗ trợ thực phẩm.  Khi được các bạn TNV đến trao thực phẩm và hỗ trợ nấu ăn, ai cũng háo hức, bởi các cụ, các bé biết rằng hôm nay lại có “thêm một bữa no”.', N'Đối với các cụ và các con sống ở mái ấm, thì điều mong muốn nhất là cơm đủ no ngày 3 bữa, được một chỗ ngủ không bị ướt mưa. Cầm trên tay tô cơm thịt khìa ngon lành mà ánh mắt các em nhỏ ở mái ấm lại ánh lên niềm vui sướng khôn tả. Có đôi khi hạnh phúc đối với các con chỉ là được ăn một tô cơm ngon lành với món mà các con thích.', N'Dù những kế hoạch ở giai đoạn triển khai gặp nhiều khó khăn, nhưng Trăng Khuyết vẫn luôn cố gắng duy trì chương trình “Thêm 1 bữa no - Thêm 1 nụ cười” giống như một điều ước nhỏ dành riêng tặng cho các cụ và các con với mong muốn bữa ăn không bị ngắt quãng.', N'Nhìn các cụ cười tươi khi nhìn nồi canh củ ngon lành, nhìn các con ăn ngon miệng với tô cơm đầy. Một bữa cơm ở mái ấm đơn giản lắm, chỉ vỏn vẹn 15 ngàn đồng chưa đầy được 1 ly trà sữa ngoài tiệm. Thế nhưng với những cụ già và em nhỏ là cả một niềm hạnh phúc vô bờ.')
INSERT [dbo].[DonationDetails] ([Id], [Title], [Image1], [Image2], [Image3], [Image4], [Story1], [Story2], [Story3], [Story4]) VALUES (4, N'Cùng OneSky chung tay cải thiện chất lượng giáo dục mầm non tại Khu công nghiệp để hàng nghìn trẻ em nghèo có cơ hội phát huy tối đa tiềm năng trong giai đoạn vàng 0-6 tuổi', N'https://static.mservice.io/blogscontents/momo-upload-api-220304142457-637820006977670730.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220228091404-637816364447669033.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220228091416-637816364569335323.jpg', N'https://static.mservice.io/blogscontents/momo-upload-api-220228091330-637816364101827804.jpg', N'Tại Việt Nam, các Khu Công Nghiệp (KCN) đang phát triển nhanh chóng với hơn 3,5 triệu công nhân nhà máy. Trong đó, có hơn 60% là phụ nữ trong độ tuổi sinh đẻ và 1,2 triệu trẻ em dưới 6 tuổi hiện đang sống cùng cha mẹ trong địa bàn các khu công nghiệp. Theo các chuyên gia, 0 – 6 tuổi là độ tuổi “vàng” để phát triển nhận thức cho trẻ. Ở thời điểm này, trường mầm non có vai trò quan trọng trong việc hỗ trợ trẻ xử lý thông tin, hình ảnh cũng như hình thành các khái niệm nền tảng giúp trẻ hình thành các nhận thức của riêng mình.', N'Tuy nhiên, do gặp trở ngại từ nhiều mặt mà phần lớn công nhân tại Khu Công Nghiệp lại không thể cung cấp cho các bé điều kiện giáo dục tốt nhất. Quyết định rời quê hương đi lao động xa nhà, cũng đồng nghĩa với việc các công nhân sẽ thiếu đi sự hỗ trợ trực tiếp từ gia đình trong việc nuôi dạy trẻ. Thêm vào đó, các trường mầm công lập thường ưu tiên cho trẻ em có hộ khẩu thường trú tại địa phương, dẫn đến việc công nhân lao động xa nhà gặp khó khăn khi xin học cho con vào các cơ sở công lập. Vì vậy, họ thường chấp nhận gửi con tại các cơ sở trông giữ trẻ có chi phí thấp nhưng chưa được qua tập huấn chuyên môn và thiếu hụt về cơ sở vật chất.', N'Năm 2017, nhằm đưa ra một giải pháp an toàn, mang lại sự an tâm cho công nhân lao động và hỗ trợ tối đa phát triển khả năng cho trẻ, phối hợp với Sở Giáo Dục và Đào Tạo Đà Nẵng, OneSky đã thành lập Trung tâm Chăm sóc và Giáo Dục Mầm Non tại KCN Hòa Khánh - Đà Nẵng. Trung tâm tập trung nuôi dạy 250 trẻ em từ 6 tháng tới 6 tuổi, có cha mẹ là công nhân nghèo đang làm việc tại các nhà máy ở địa phương.', N'OneSky áp dụng phương pháp dạy học ứng đáp – cách thức giáo dục lấy trẻ làm trung tâm, tạo nên môi trường học tập đa dạng dựa vào nhu cầu và hứng thú của từng trẻ, để thúc đẩy sự phát triển toàn diện về thể chất, trí tuệ, ngôn ngữ và tình cảm xã hội. Với 17 lớp học và khu vui chơi được xây dựng trên khuôn viên rộng 3.800 m2, Trung tâm OneSky đem lại môi trường giáo dục mầm non chất lượng dành riêng cho con công nhân nghèo với học phí được tài trợ chỉ còn 800.000 đồng / tháng.')
SET IDENTITY_INSERT [dbo].[DonationDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Donor] ON 

INSERT [dbo].[Donor] ([Stt], [Id], [FullName], [Phone], [Amount], [DonationId]) VALUES (1, 3, N'Trần Tuấn Phong', N'0968634315', 1500000, 1)
INSERT [dbo].[Donor] ([Stt], [Id], [FullName], [Phone], [Amount], [DonationId]) VALUES (2, 4, N'Trần Anh Nhựt Nam', N'0776272724', 2000000, 1)
INSERT [dbo].[Donor] ([Stt], [Id], [FullName], [Phone], [Amount], [DonationId]) VALUES (3, 5, N'Phạm Hữu Phước', N'0908936970', 1000000, 2)
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account_Email]    Script Date: 4/10/2022 9:58:40 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ_Account_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account_Phone]    Script Date: 4/10/2022 9:58:40 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ_Account_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account_UserName]    Script Date: 4/10/2022 9:58:40 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ_Account_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllDonations_Name]    Script Date: 4/10/2022 9:58:40 PM ******/
ALTER TABLE [dbo].[AllDonations] ADD  CONSTRAINT [UQ_AllDonations_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllDonations_Thumbnail]    Script Date: 4/10/2022 9:58:40 PM ******/
ALTER TABLE [dbo].[AllDonations] ADD  CONSTRAINT [UQ_AllDonations_Thumbnail] UNIQUE NONCLUSTERED 
(
	[Thumbnail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[AllDonations] ([Id])
GO
ALTER TABLE [dbo].[DonationDetails] CHECK CONSTRAINT [FK_DonationDetails_Id]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_DonationId] FOREIGN KEY([DonationId])
REFERENCES [dbo].[AllDonations] ([Id])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_DonationId]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_Id]
GO
USE [master]
GO
ALTER DATABASE [Capstone] SET  READ_WRITE 
GO
