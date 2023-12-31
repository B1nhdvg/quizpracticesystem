USE [QuizTaking]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answer_id] [int] IDENTITY(1,1) NOT NULL,
	[answer] [nvarchar](50) NOT NULL,
	[answer_check] [bit] NOT NULL,
	[explain] [nvarchar](50) NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerDetail]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[attempt_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[answer_id] [int] NULL,
 CONSTRAINT [PK_AnswerDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attempt_Quiz]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attempt_Quiz](
	[attempt_id] [int] IDENTITY(1,1) NOT NULL,
	[enroll_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[finish_time] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_Attemp_Quizz] PRIMARY KEY CLUSTERED 
(
	[attempt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](50) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](50) NOT NULL,
	[course_description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[enroll_id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[subteacher_id] [int] NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[enroll_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [bit] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[correct_answer] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[attempt_time] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[total_question] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[public_score] [bit] NULL,
 CONSTRAINT [PK_Quizz] PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/11/2023 3:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[gender] [bit] NULL,
	[password] [varchar](50) NULL,
	[phone] [varchar](11) NOT NULL,
	[status] [bit] NOT NULL,
	[role_id] [int] NOT NULL,
	[roll_number] [nvarchar](50) NOT NULL,
	[forgot_key] [nvarchar](6) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (511, N'2', 1, N'2', 192)
INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (512, N'3', 0, NULL, 192)
INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (513, N'3', 0, NULL, 192)
INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (514, N'w1', 1, N'2', 193)
INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (515, N'w2', 1, N'2', 193)
INSERT [dbo].[Answer] ([answer_id], [answer], [answer_check], [explain], [question_id]) VALUES (516, N'w3', 0, NULL, 193)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[AnswerDetail] ON 

INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (517, 239, 59, 192, 511)
INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (518, 239, 59, 193, 514)
INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (519, 239, 59, 193, 516)
INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (520, 240, 59, 192, 511)
INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (521, 240, 59, 193, 514)
INSERT [dbo].[AnswerDetail] ([id], [attempt_id], [quiz_id], [question_id], [answer_id]) VALUES (522, 240, 59, 193, 515)
SET IDENTITY_INSERT [dbo].[AnswerDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Attempt_Quiz] ON 

INSERT [dbo].[Attempt_Quiz] ([attempt_id], [enroll_id], [quiz_id], [finish_time], [score]) VALUES (239, 19, 59, 30, 5)
INSERT [dbo].[Attempt_Quiz] ([attempt_id], [enroll_id], [quiz_id], [finish_time], [score]) VALUES (240, 19, 59, 23, 10)
SET IDENTITY_INSERT [dbo].[Attempt_Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([class_id], [class_name], [start_date], [end_date]) VALUES (1, N'IS1704', CAST(N'2023-09-05' AS Date), CAST(N'2023-11-17' AS Date))
INSERT [dbo].[Class] ([class_id], [class_name], [start_date], [end_date]) VALUES (2, N'IS1703', CAST(N'2023-09-05' AS Date), CAST(N'2023-11-17' AS Date))
INSERT [dbo].[Class] ([class_id], [class_name], [start_date], [end_date]) VALUES (5, N'IS1705', CAST(N'2023-10-19' AS Date), CAST(N'2023-09-27' AS Date))
INSERT [dbo].[Class] ([class_id], [class_name], [start_date], [end_date]) VALUES (6, N'SE1999', CAST(N'2023-11-09' AS Date), CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Class] ([class_id], [class_name], [start_date], [end_date]) VALUES (7, N'SE1920', CAST(N'2023-11-18' AS Date), CAST(N'2023-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (1, N'ISP392', N'Integrated System Project')
INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (2, N'SWP391', N'Sofware Engineer Project')
INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (3, N'ITA201', N'Information Technology')
INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (4, N'SSB201', N'Bussiness')
INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (15, N'SWE201c', N'Sofware Engineer Coursera')
INSERT [dbo].[Course] ([course_id], [course_name], [course_description]) VALUES (16, N'TRANS601c', N'English level 6')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Enroll] ON 

INSERT [dbo].[Enroll] ([enroll_id], [class_id], [course_id], [student_id], [teacher_id], [subteacher_id]) VALUES (19, 1, 1, 2, 6, 30)
INSERT [dbo].[Enroll] ([enroll_id], [class_id], [course_id], [student_id], [teacher_id], [subteacher_id]) VALUES (20, 1, 1, 3, 6, NULL)
SET IDENTITY_INSERT [dbo].[Enroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([question_id], [name], [type], [quiz_id], [correct_answer]) VALUES (192, N'1+1 = ?', 0, 59, 1)
INSERT [dbo].[Question] ([question_id], [name], [type], [quiz_id], [correct_answer]) VALUES (193, N'Có mấy cuộc chiến tranh', 1, 59, 2)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quiz_id], [title], [description], [start_date], [end_date], [attempt_time], [duration], [status], [total_question], [class_id], [course_id], [public_score]) VALUES (59, N'PT1', N'Progress', CAST(N'2023-11-11T00:52:00.000' AS DateTime), CAST(N'2023-11-24T00:52:00.000' AS DateTime), 100, 30, 1, 2, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
INSERT [dbo].[Role] ([role_id], [role]) VALUES (1, N'Admin     ')
INSERT [dbo].[Role] ([role_id], [role]) VALUES (2, N'Teacher   ')
INSERT [dbo].[Role] ([role_id], [role]) VALUES (3, N'Student   ')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (2, N'Le Viet Anh', N'anhlvhe172133@fpt.edu.vn', 0, N'123', N'0989123321', 1, 3, N'HE123890', N'WlmS4T')
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (3, N'Dang Vu Gia Binh', N'binhdvghe171163@fpt.edu.vn', 1, N'123', N'0377683456', 1, 3, N'HE123899', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (4, N'Hoai Nam', N'namnhhe160187@fpt.edu.vn', 1, N'123', N'0989733239', 1, 3, N'HE12389', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (5, N'Nguyen The Anh', N'anhnthe172192@fpt.edu.vn', 1, N'123', N'0989123321', 1, 3, N'HE12389', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (6, N'Teacher Vanhle', N'levietanh20033002@gmail.com', 1, N'123', N'0377683456', 1, 2, N'HE12389', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (8, N'Teacher 1', N'teacher1@fe.edu.vn', 1, N'123', N'0377683456', 1, 2, N'', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (9, N'Teacher 2 ', N'teacher2@fe.edu.vn', 1, N'123', N'0876541549', 1, 2, N'dsad', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (12, N'admin', N'admin@gmail.com', 1, N'123', N'0377683456', 1, 1, N'1', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (30, N'Dao Thi Thanh', N'thanhdt59@fe.edu.vn', 0, N'123', N'0742823464', 1, 2, N'HE190791', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (32, N'Student 1', N'student1@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172222', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (33, N'Student 2', N'student2@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172245', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (34, N'Student 3', N'student3@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172265', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (35, N'Student 4', N'student4@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172276', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (36, N'Student 5', N'student5@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172278', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (37, N'Student 6', N'student6@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172299', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (38, N'Student 7', N'student7@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172294', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (39, N'Student 8', N'student8@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172456', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (40, N'Student 9', N'student9@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172847', NULL)
INSERT [dbo].[User] ([user_id], [user_name], [email], [gender], [password], [phone], [status], [role_id], [roll_number], [forgot_key]) VALUES (41, N'Student 10', N'student10@fpt.edu.vn', 0, N'123', N'0382945439', 1, 3, N'HE172254', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Attempt_Quiz] ADD  CONSTRAINT [DF_Attemp_Quizz_finish_time]  DEFAULT ((0)) FOR [finish_time]
GO
ALTER TABLE [dbo].[Attempt_Quiz] ADD  CONSTRAINT [DF_Attemp_Quizz_score]  DEFAULT ((0)) FOR [score]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_correct_answer]  DEFAULT ((0)) FOR [correct_answer]
GO
ALTER TABLE [dbo].[Quiz] ADD  CONSTRAINT [DF_Quizz_total_question]  DEFAULT ((0)) FOR [total_question]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_AnswerDetail_Answer] FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answer] ([answer_id])
GO
ALTER TABLE [dbo].[AnswerDetail] CHECK CONSTRAINT [FK_AnswerDetail_Answer]
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_AnswerDetail_Attempt_Quiz] FOREIGN KEY([attempt_id])
REFERENCES [dbo].[Attempt_Quiz] ([attempt_id])
GO
ALTER TABLE [dbo].[AnswerDetail] CHECK CONSTRAINT [FK_AnswerDetail_Attempt_Quiz]
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_AnswerDetail_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[AnswerDetail] CHECK CONSTRAINT [FK_AnswerDetail_Question]
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_AnswerDetail_Quizz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[AnswerDetail] CHECK CONSTRAINT [FK_AnswerDetail_Quizz]
GO
ALTER TABLE [dbo].[Attempt_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Attemp_Quizz_Enroll] FOREIGN KEY([enroll_id])
REFERENCES [dbo].[Enroll] ([enroll_id])
GO
ALTER TABLE [dbo].[Attempt_Quiz] CHECK CONSTRAINT [FK_Attemp_Quizz_Enroll]
GO
ALTER TABLE [dbo].[Attempt_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Attemp_Quizz_Quizz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[Attempt_Quiz] CHECK CONSTRAINT [FK_Attemp_Quizz_Quizz]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Class]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_User] FOREIGN KEY([student_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_User]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_User1] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_User1]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quizz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Quizz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quizz_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quizz_Class]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quizz_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quizz_Course]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
