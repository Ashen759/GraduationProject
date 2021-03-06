USE [master]
GO
/****** Object:  Database [FoodieWebsite]    Script Date: 2020/9/7 19:21:34 ******/
CREATE DATABASE [FoodieWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodieWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FoodieWebsite.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FoodieWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FoodieWebsite_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FoodieWebsite] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodieWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodieWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodieWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodieWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodieWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodieWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodieWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodieWebsite] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FoodieWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodieWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodieWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodieWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodieWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodieWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodieWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodieWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodieWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodieWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodieWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodieWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodieWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodieWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodieWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodieWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodieWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodieWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [FoodieWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodieWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodieWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodieWebsite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodieWebsite', N'ON'
GO
USE [FoodieWebsite]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](20) NULL,
	[AdminPwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DietNous]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DietNous](
	[NousID] [int] IDENTITY(1,1) NOT NULL,
	[NousTitle] [nvarchar](100) NULL,
	[NousPic] [nvarchar](50) NULL,
	[NousDetails] [nvarchar](4000) NULL,
 CONSTRAINT [PK_DietNous] PRIMARY KEY CLUSTERED 
(
	[NousID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](50) NULL,
	[FoodType] [int] NULL,
	[FoodPicture] [nvarchar](4000) NULL,
	[FoodDifficulty] [int] NULL,
	[CompletionTime] [decimal](18, 0) NULL,
	[Flavor] [nvarchar](50) NULL,
	[CookingUtensils] [nvarchar](50) NULL,
	[CookingStyle] [nvarchar](50) NULL,
	[Mainmaterial] [nvarchar](200) NULL,
	[Accessories] [nvarchar](200) NULL,
	[FlowChart] [nvarchar](4000) NULL,
	[ThumbNumber] [int] NULL,
	[Foodissuer] [int] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeType]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TEName] [nvarchar](50) NULL,
	[TypeName] [nvarchar](50) NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_RecipeType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sfav]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sfav](
	[SfavID] [int] IDENTITY(1,1) NOT NULL,
	[SfavName] [nvarchar](50) NULL,
	[SfavPic] [nvarchar](50) NULL,
	[SfavExplain] [nvarchar](200) NULL,
	[MatureSeason] [int] NULL,
 CONSTRAINT [PK_Sfav] PRIMARY KEY CLUSTERED 
(
	[SfavID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/9/7 19:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[UserPwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminPwd]) VALUES (1, N'admin', N'123')
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminPwd]) VALUES (2, N'ashen', N'123456')
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminPwd]) VALUES (1002, N'xxx', N'111')
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminPwd]) VALUES (2002, N'huyao', N'123456')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[DietNous] ON 

INSERT [dbo].[DietNous] ([NousID], [NousTitle], [NousPic], [NousDetails]) VALUES (1, N'吃火锅时饮料选择有讲究', N'火锅.jpg', N'以下几种饮料都是吃火锅时可以选择的：
　　碳酸饮料：固然它们除糖分外，含其他营养成分很少，但其中的二氧化碳可以助消化，并能增进体内热气排出，发生清凉快快的感到，补充水分的成果也较好。 copyright dedecms

吃火锅时饮料选择有讲究
　　果汁饮料：含有丰盛的有机酸，可刺激胃肠分泌、助消化，还可使小肠上部呈酸性，有助于钙、磷的吸收。但节制体重的人和老年人、血糖高者要留心选用低糖饮料。 本文来自织梦

吃火锅时饮料选择有讲究
　　蔬菜汁、乳品和植物蛋白饮料：如酸奶、杏仁露、椰汁、凉茶等，合适有慢性病的人和老年人。吃火锅时饮料选择有讲究
　　酒类：吃火锅时，最好喝点白酒或葡萄酒，可以起到杀菌、往膻的作用，最合适涮羊肉时吃')
INSERT [dbo].[DietNous] ([NousID], [NousTitle], [NousPic], [NousDetails]) VALUES (2, N'番茄炒蛋竟有如此功效，好吃又营养', N'番茄炒蛋.jpg', N'番茄，又名番茄、洋柿子相传番茄最先生长在南新大陆，因颜色娇嫩鲜艳，许多人对于它十分小心，视为"狐狸的果实&quot;，又称狼桃，只供不雅赏，不敢品尝

　　此刻它是不少人饭桌上的甘旨番茄含有富厚的胡莱菔素，维他命B以及C，尤其是维他命P的含量居菜蔬之冠此中含有的维他命C、糖类以及芦丁等身分，具备抗坏血病、润肤、掩护血管、降压、助克化等效用

　　番茄红素含有对于心思以及精力管具备掩护效用的维他命以及矿事物元素，能削减心脏病的爆发

　　番茄红素具备奇特的抗氧化能力，能断根自由基，掩护细胞，使脱氧核糖核酸及基因免遭粉碎，能遏止癌症病变进程项番茄除开对于最前一列腺癌有预防效用外，还能有用削减胰腺癌、直肠癌、喉癌、口腔癌、乳房内腺体癌等癌症的病发伤害 内容来自dedecms

　　番茄含有维他命C，有生津止渴，健胃消食，凉血平肝，清热除毒，减低血压之功能，对于高血压、肾脏病人有杰出的匡助疗治效用多吃番茄具备抗朽迈效用，使肉皮儿连结白净
织梦内容管理系统

　　番茄中的尼克酸能维持胃液的没事了排泄，保进红血球的形成，有帮助于连结血管壁的弹性以及掩护肉皮儿以是食用番茄对于防治动脉硬化、高血压以及冠芥蒂也有帮忙番茄多汁，可以住进排尿，肾脏炎症病人也宜食用

　　鸡蛋是天然界的1个古迹，1个受过精的鸡蛋，在温度适合的前提下，不需要从外界增补不论什么营养成分，就能孵出一只小鸡，这就完全可以申明鸡蛋的营养长短常完善的鸡蛋被以为是营养富厚的食物，含有卵白质、脂肪、卵黄素、卵磷块、维他命以及铁、钙、钾等人的身体所需要的矿事物凸起独特之处是，鸡蛋含有天然界中最优良的卵白质

　　鸡蛋中含有富厚的DHA以及卵磷块等，对于神经器官体系以及身板发育有很大的效用，能健脑益智，制止耆老智力阑珊，并可改善各个春秋组的影象力有实际证明验实，鸡蛋防治动脉粥样硬化，患上到了出人意表的使人吃惊成效鸡蛋中含有较多的维他命B2，它可以分化以及氧化人的身体内的致癌事物，鸡蛋中的微量元素也都具备防癌的效用鸡蛋卵白质对于肝脏社团毁伤有修复效用，卵黄中的卵磷块可增进肝细胞的再生鸡蛋含有人的身体需要的险些所有的营养事物，故被许多人称作"抱负的营养库"，营养学家称之为"纯粹卵白质标准样式&quot;不少长命白叟的祛病延年经验之一就是天天必食1个鸡蛋 织梦好，好织梦')
INSERT [dbo].[DietNous] ([NousID], [NousTitle], [NousPic], [NousDetails]) VALUES (3, N'养生解困又健脾，初春喝四汤', N'汤.jpg', N'陈皮莲子薏米水鸭汤　　材料：每次可选用新会陈皮6克，去心莲子肉30克，炒薏米30克，怀山药12克，生姜10克，水鸭肉250克。　　制法：先将水鸭肉用清水洗净血污，斩件。薏米用铁锅炒至微黄，莲子去心洗净，怀山药用水稍浸，陈皮、生姜用水洗净，然后将全部用料一齐放进汤煲内，加入清水，先用武火煮沸，再用文火煲2小时，调味即可。　　功效：本汤能补脾健胃、去湿止泻，对于湿气重而又大便稀烂者尤宜。初春喝四汤 养生解困又健脾　　山药芡实扁豆排骨汤　　材料：可选用怀山药15克，芡实15克，炒薏米15克，炒扁豆15克，北芪12克，白术10克，猪排骨200克。　　制法：先用水浸泡怀山药，扁豆、薏米用锅炒至微黄，猪排骨洗净血污并斩件，芡实、北芪、白术用清水洗净，然后将全部用料放进汤煲内，用中火煲1个半小时，调味即可。　　功效：此汤有健脾醒胃、去湿抗疲劳作用，对于脾虚湿重、精神不振者尤宜。初春喝四汤 养生解困又健脾　　陈皮白术猪肚汤　　材料：每次可选用新会陈皮6克，白术30克，鲜猪肚半个或1个，砂仁6克，生姜5片。　　制法：先将猪肚去除肥油，放入开水中去除腥味，并刮去白膜。陈皮、白术、砂仁、生姜用清水洗净。然后将全部用料放入汤煲内，煮沸后用慢火煲2小时即可。　　功效：本汤有健脾开胃，促进食欲作用。对于腹胀、纳食不香、消化不良者尤宜。初春喝四汤 养生解困又健脾　　党参黄芪薏米粥　　材料：每次可选用黄芪15克，党参15克，炒薏米60克，炒扁豆15克，红枣2个，大米100克。　　制法：先将薏米、扁豆炒至微黄，红枣去除核，用清水洗净黄芪、党参并放入沙锅内，加清水煎汁；药汁好后，去除药渣，将炒薏米、炒扁豆、红枣肉、大米一同放进药汁中煮沸，后用文火煮成粥。　　功效：本粥能补中益气，健脾去湿，对于春湿天气出现神疲乏力、大便溏薄者尤为适宜。')
INSERT [dbo].[DietNous] ([NousID], [NousTitle], [NousPic], [NousDetails]) VALUES (4, N'橙子与橘子的区别是什么 怎么挑选甜橙子', N'橘子橙子.jpg', N'属科类品种区别
橘子为芸香科植物福桔或朱桔等多种桔类的成熟果实。种类很多，有八布桔、金钱桔、甜桔、酸桔、宫川、新津桔、尾张桔、温州桔、四川桔等品种。 内容来自dedecms

而橙子，指芸香科、柑桔亚科、柑桔族、柑桔亚族以下的一群植物果实。品种有锦橙、脐橙、甜橙等。 copyright dedecms

长相区别
橘子常为扁圆形，皮色橘红或朱红，果皮薄而宽松，容易剥开，摸起来也会软一些；而橙子常为圆形或长圆形，表皮光滑且较厚，包裹紧实，不容易剥开，而且较橘子而言，橙子一般比橘子大一些。

温凉性区别
橘子性温,多吃易上火,会出现口舌生疮、口干舌燥、咽喉干痛、大便秘结等症状。

橙子味甘、酸，性凉，它是清火的水果。

味道区别
橘子，味道或甜或酸；而橙子味道酸甜适度，而且汁特别多。')
INSERT [dbo].[DietNous] ([NousID], [NousTitle], [NousPic], [NousDetails]) VALUES (1008, N'jjjj', N'QQ图片20200702161501.jpg', N'jjjjjjj')
SET IDENTITY_INSERT [dbo].[DietNous] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (1, N'宫保鸡丁', 3, N'1.jpg', 1, CAST(2 AS Decimal(18, 0)), N'辣', N'铁锅', N'炒', N'鸡一只', N'豆瓣酱一瓶', N'买鸡杀鸡炒鸡', 20, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (2, N'麻辣兔头', 3, N'2.jpg', 2, CAST(2 AS Decimal(18, 0)), N'辣', N'铁锅', N'爆炒', N'兔头若干', N'辣椒', N'兔兔那么可爱怎么可以吃兔兔', 88, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (3, N'3333', 4, N'111', 1, CAST(33 AS Decimal(18, 0)), N'甜', N'压力锅-铁锅-蒸笼-', N'炸-煎-蒸-炖-', N'333', N'33', N'333', 16, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (4, N'娃娃菜', 6, N'111', 0, CAST(1 AS Decimal(18, 0)), N'甜', N'压力锅-铁锅-', N'炒-', N'哇哇哇', N'哇哇', N'哇哇哇哇哇哇哇哇哇哇', 8, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (1003, N'培根', 4, N'QQ图片20200702161520.jpg', 1, CAST(2 AS Decimal(18, 0)), N'辣', N'平底锅&nbsp;铁锅&nbsp;', N'炒&nbsp;煎&nbsp;', N'培根', N'辣椒', N'顶顶顶顶顶顶顶顶顶顶', 99, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (1004, N'刘秘书', 9, N'QQ图片20200702161501.jpg', 1, CAST(2 AS Decimal(18, 0)), N'甜', N'平底锅&nbsp;', N'蒸&nbsp;', N'ssss', N'sssssss', N'ssssssss', 120, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (1005, N'小金FFFF', 16, NULL, 2, CAST(3 AS Decimal(18, 0)), N'苦', NULL, NULL, N'jjjjjFFF', N'jjjjjjjFF', N'jjjjjjjFFF', 22, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (1006, N'帆帆帆帆', 7, N'QQ图片20200702161501.jpg', 2, CAST(1 AS Decimal(18, 0)), N'咸', N'铁锅&nbsp;', N'蒸&nbsp;炖&nbsp;', N'fffff', N'ffff', N'ffffffffffffff', 28, 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (3005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (4003, N'叉烧肉', 2, N'QQ图片20200705142156.jpg', 0, CAST(1 AS Decimal(18, 0)), N'辣', N'压力锅&nbsp;铁锅&nbsp;', N'炒&nbsp;', N'猪里脊', N'猪里脊', N'猪里脊', NULL, 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (4004, N'水晶虾饺', 2, N'QQ图片20200705142159.jpg', 2, CAST(2 AS Decimal(18, 0)), N'辣', N'压力锅&nbsp;蒸笼&nbsp;', N'蒸&nbsp;', N'水晶虾饺', N'水晶虾饺', N'水晶虾饺水晶虾饺', NULL, 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (5003, N'粑粑', 4, N'QQ图片20200705142159.jpg', 0, CAST(0 AS Decimal(18, 0)), N'苦', N'砂锅&nbsp;瓦罐&nbsp;', N'炖&nbsp;焗&nbsp;', N'bb', N'bb', N'bbbbbbb', NULL, 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (5004, N'草莓', 7, N'草莓.jpg', 1, CAST(1 AS Decimal(18, 0)), N'辣', N'铁锅&nbsp;', N'蒸&nbsp;', N'123', N'123', N'1231232', NULL, 2)
INSERT [dbo].[Food] ([FoodID], [FoodName], [FoodType], [FoodPicture], [FoodDifficulty], [CompletionTime], [Flavor], [CookingUtensils], [CookingStyle], [Mainmaterial], [Accessories], [FlowChart], [ThumbNumber], [Foodissuer]) VALUES (6003, N'菜品1', 3, NULL, 0, CAST(1 AS Decimal(18, 0)), N'甜', NULL, NULL, N'ssss', N'sss', N'sss', NULL, 2)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[RecipeType] ON 

INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (1, N'ChineseDishes', N'中式菜品', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (2, N'CantoneseCuisine', N'粤菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (3, N'SichuanCuisine', N'川菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (4, N'HunanCuisine', N'湘菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (5, N'ShandongCuisine', N'鲁菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (6, N'ZhejiangCuisine', N'浙菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (7, N'XinjiangCuisine', N'新疆菜', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (8, N'TaiwanCuisine', N'台湾美食', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (9, N'HongKongCuisine', N'香港美食', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (10, N'MacaoCuisine', N'澳门美食', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (11, N'ForeignCuisine', N'外国美食', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (12, N'JapaneseCuisine', N'日本料理', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (13, N'KoreanCuisine', N'韩国料理', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (14, N'ThailandCuisine', N'泰国菜', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (15, N'VietnameseCuisine', N'越南菜', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (16, N'FrenchCuisine', N'法国菜', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (17, N'ItalyCuisine', N'意大利菜', 11)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (18, N'BakedFood', N'烘培美食', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (19, N'Cake', N'蛋糕', 18)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (20, N'bread', N'面包', 18)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (21, N'Macaroon', N'马卡龙', 18)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (22, N'Baguette', N'法棍', 18)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (23, N'Cookies', N'曲奇', 18)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (24, N'Snacks', N'小吃美食', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (25, N'Pizza', N'披萨', 24)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (26, N'FriedFood', N'油炸物', 24)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (29, N'bigdd', N'大类大类', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (30, N'small1', N'小类1', 29)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (32, N'HomemadeIngredients', N'自制食材', NULL)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (2033, N'small3', N'小类3', 1)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (2035, N'small4', N'小类4', 29)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (2036, N'small5', N'小类5', 29)
INSERT [dbo].[RecipeType] ([TypeID], [TEName], [TypeName], [PID]) VALUES (2037, N'small6', N'小类6', 29)
SET IDENTITY_INSERT [dbo].[RecipeType] OFF
SET IDENTITY_INSERT [dbo].[Sfav] ON 

INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (1, N'芦柑', N'芦柑.jpg', N'芦柑味甘甜微酸，有止渴生津，和胃利尿作用，含有丰富的维生素C和柠檬酸，具有美容、消除疲劳的功效。是一月份水果的佳品。果皮可以晾干冲茶。', 1)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (2, N'甘蔗', N'甘蔗.jpg', N'甘蔗汁甜解渴、含糖量极为丰富，润肺润喉', 2)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (3, N'圣女果', N'圣女果.jpg', N'圣女果含有番茄红素，具有补血养血之功效，是增进食欲、延缓衰老的佳品', 2)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (4, N'菠萝', N'菠萝.jpg', N'菠萝甘甜爽脆，含有维生素B较多，具有营养皮肤，消除紧张,减少疲劳，增强肌体的免疫能力', 3)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (5, N'山竹', N'山竹.jpg', N'山竹具有清凉解热的作用，含钙、磷、维生素B和C等多种元素，对肌体有很好的补养作用，虚寒身体不宜多吃', 4)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (6, N'草莓', N'草莓.jpg', N'草莓含有丰富的叶酸，有益于心脏健康和改善消化道健康，还具有抗癌的保健功能。', 5)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (7, N'桑葚', N'桑葚.jpg', N'桑葚性寒，补血养颜，健脾胃，助消化，含有鞣酸、脂肪酸等营养成分。', 5)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (8, N'樱桃', N'樱桃.jpg', N'樱桃性温，具有补气调中的功效，健脾开胃，美容养颜', 6)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (9, N'荔枝', N'荔枝.jpg', N'荔枝同樱桃一样地美容健脾作用，还可补脑健身，含有丰富的维生素成分，可增加肌体的免疫能力', 6)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (10, N'龙眼', N'龙眼.jpg', N'龙眼味甘甜，性温，具有养血安神的作用，滋补强体，润肤美容，不易多吃，易上火', 7)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (11, N'桃子', N'桃子.jpg', N'桃子性平，具有滋养作用含铁量较高，有润燥活血作用，体内偏热者少吃。', 7)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (12, N'西瓜', N'西瓜.jpg', N'西瓜是夏季解渴解暑的最佳果品，具有清热止渴、利尿消肿等功效。易腹泻者要少吃。', 8)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (13, N'芒果', N'芒果.jpg', N'芒果性平，有益脾胃，有防止心血管疾病，降低胆固醇之功效。', 8)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (14, N'葡萄', N'葡萄.jpg', N'葡萄味甜酸，对滋补肝肾有益，益气补血，之中的糖分比较容易被人吸收，有很好的抗衰老作用', 9)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (15, N'石榴', N'石榴.jpg', N'石榴，性温，有止血止泻作用 ，有助于消化，有助于软化血管、降血脂、降胆固醇的作用。', 9)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (16, N'白梨', N'白梨.jpg', N'白梨性凉，润喉清热，润肺解燥，化痰解酒，还有保护肝脏的作用是秋季水果之王。', 10)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (17, N'猕猴桃', N'猕猴桃.jpg', N'猕猴桃微酸，含有丰富的维生素E和C，预防口腔溃疡，增强抵抗力，美容抗衰老。', 10)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (18, N'冬枣', N'冬枣.jpg', N'冬枣甘甜爽脆，性平含有维生素及多种人体需要的微量元素，具有补血护肝作用，还可以抗动脉硬化，对维持血管弹性有一定的好处。', 11)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (19, N'苹果', N'苹果.jpg', N'苹果更是含维生素和其它人体需要的镁、铁、硫、锌等多种微量元素。俗话有说：“一天一苹果，不找医生开处方”。还具有嫩肤美容的作用。也有果中之王的美称。', 11)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (20, N'橘子', N'橘子.jpg', N'橘子味酸甜，有生津止咳的作用，开胃通经络，具有消除疲劳之作用', 12)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (21, N'柚子', N'柚子.jpg', N'柚子性寒，微苦，有健胃化食的作用，对止咳化痰，清热败火有一定的疗效，对心血管、高血压，糖尿病有一定的辅助治疗作用。', 12)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (1004, N'茄子', NULL, N'茄子中含丰富的维生素P，是一种黄酮类化合物，有软化血管的作用，可以降血压。其次，茄子含有葫芦巴碱及胆碱，在小肠内能与过多胆固醇结合，排出体外，以保身体血液循环正常，降低胆固醇。此外，茄子还可以吸收脂肪，起到减肥的作用。', 7)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (3005, N'草莓莓1111', N'草莓.jpg', N'111111', 1)
INSERT [dbo].[Sfav] ([SfavID], [SfavName], [SfavPic], [SfavExplain], [MatureSeason]) VALUES (3010, N'七二七七二', N'QQ图片20200705142208.jpg', N'15649849', 1)
SET IDENTITY_INSERT [dbo].[Sfav] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (1, N'楼主', N'110')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (2, N'小丁', N'555')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (1002, N'1', N'12')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (2002, N'xx', N'111')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (3002, N'洲洲', N'520')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (3003, N'zz', N'123')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (3004, N'小胡', N'123')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (3005, N'古月', N'123')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (4002, N'huyao', N'123456')
INSERT [dbo].[User] ([UserID], [UserName], [UserPwd]) VALUES (4003, N'hu', N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_RecipeType1] FOREIGN KEY([Foodissuer])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_RecipeType1]
GO
ALTER TABLE [dbo].[RecipeType]  WITH CHECK ADD  CONSTRAINT [FK_RecipeType_RecipeType] FOREIGN KEY([PID])
REFERENCES [dbo].[RecipeType] ([TypeID])
GO
ALTER TABLE [dbo].[RecipeType] CHECK CONSTRAINT [FK_RecipeType_RecipeType]
GO
USE [master]
GO
ALTER DATABASE [FoodieWebsite] SET  READ_WRITE 
GO
