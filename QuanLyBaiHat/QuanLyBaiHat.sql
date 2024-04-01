create database QuanLyBaiHat
go

--drop database QuanLyBaiHat
use QuanLyBaiHat
go

-- drop table BaiHat
create table BaiHat(
	mabh varchar(10) primary key not null ,
	tenbh nvarchar(50) not null default N'chưa đặt tên',
	loibaihat ntext not null default N'chưa có lời',
	macasi varchar(10) not null,
	matheloai varchar(10) not null,
	matacgia varchar(10) not null,
	mahangdia varchar(10) not null,
	maalbum varchar(10) not null,
)

--drop table casi
create table CaSi(
	macasi varchar(10) not null primary key,
	tencasi nvarchar(50) not null ,
)

--drop table theloai
create table TheLoai(
	matheloai varchar(10) not null primary key,
	tentheloai nvarchar(50) not null ,
)

--drop table account
create table TacGia(
	matacgia varchar(10) not null primary key,
	tentacgia nvarchar(50) not null,
)

create table Album(
	maalbum varchar(10) not null primary key,
	tenalbum  nvarchar(50) not null ,
	namphathanh int not null,
)

create table HangDia(
	mahangdia varchar(10) not null primary key,
	tenhangdia nvarchar(50) not null,
)

alter table BaiHat add constraint fk_BaiHat_CaSi foreign key (macasi) references CaSi(macasi)
alter table BaiHat add constraint fk_BaiHat_TheLoai foreign key (matheloai) references TheLoai(matheloai)
alter table BaiHat add constraint fk_BaiHat_TacGia foreign key (matacgia) references TacGia(matacgia)
alter table BaiHat add constraint fk_BaiHat_Album foreign key (maalbum) references Album(maalbum)
alter table BaiHat add constraint fk_BaiHat_HangDia foreign key (mahangdia) references HangDia(mahangdia)


select * from TheLoai
select * from CaSi
select * from Album
select * from TacGia
select * from HangDia
select * from Album
select * from BaiHat

-- TABLE THELOAI
Insert into TheLoai values ('trutinh',N'Nhạc Trữ Tình')
Insert into TheLoai values ('kpop',N'Nhạc K-Pop')
Insert into TheLoai values ('thieunhi',N'Nhạc Thiếu Nhi')
Insert into TheLoai values ('rap',N'Nhạc Rap')
Insert into TheLoai values ('usuk',N'Nhạc US-UK')
Insert into TheLoai values ('cachmang',N'Nhạc Cách Mạng')

--Table CASI
Insert into CaSi values ('cs001',N'Quang Lê, Hương Thủy')
Insert into CaSi values ('cs002',N'Lưu Ánh Loan, Đoàn Minh')
Insert into CaSi values ('cs003',N'Lệ Quyên')
Insert into CaSi values ('cs004',N'Đan Nguyên')
Insert into CaSi values ('cs005',N'Dương Hồng Loan')


Insert into CaSi values ('cs006',N'Cao Thái Sơn')
Insert into CaSi values ('cs007',N'Vũ Phụng Tiên, DT')
Insert into CaSi values ('cs008',N'Chu Bin')
Insert into CaSi values ('cs009',N'Thái Học')
Insert into CaSi values ('cs010',N'H-Kray')


Insert into CaSi values ('cs011',N'Ruby Bảo An')
Insert into CaSi values ('cs012',N'Bé Minh Vy')
Insert into CaSi values ('cs013',N'Bé Đan Thư')


Insert into CaSi values ('cs014',N'HIEUTHUHAI')
Insert into CaSi values ('cs015',N'Obito')
Insert into CaSi values ('cs016',N'Mikelodic')
Insert into CaSi values ('cs017',N'B Ray')
Insert into CaSi values ('cs018',N'Double2T, Masew')


Insert into CaSi values ('cs019',N'Ariana Grande, Iggy Azalea')
Insert into CaSi values ('cs020',N'Modern Talking')
Insert into CaSi values ('cs021',N'Justin Bieber, Daniel Caesar, Giveon')
Insert into CaSi values ('cs022',N'Akon')

Insert into CaSi values ('cs023',N'Trịnh Xuân Hảo, Lan Anh, Tân Nhàn')
Insert into CaSi values ('cs024',N'Quang Hà')
Insert into CaSi values ('cs025',N'Đức Thịnh, Minh Ngọc')
Insert into CaSi values ('cs026',N'Nguyễn Thu Hằng')
Insert into CaSi values ('cs027',N'Anh Bằng')

-- Table albums
Insert into Album values ('alb001',N'7000 Đêm Góp Lại',2005)
Insert into Album values ('alb002',N'Tìm nghèo có nhau',1972)
Insert into Album values ('alb003',N'Trả lại thời gian',2011)
Insert into Album values ('alb004',N'Khóc một cuộc tình',2020)
Insert into Album values ('alb005',N'Vì lòng còn thương',2017)


Insert into Album values ('alb006',N'Tất cả hoặc không là gì cả',2023)
Insert into Album values ('alb007',N'Lệ Lưu Ly',2023)
Insert into Album values ('alb008',N'Phố Hoa Lệ',2023)
Insert into Album values ('alb009',N'Cưới Thôi Em',2021)
Insert into Album values ('alb010',N'Khuất Lối',2022)

Insert into Album values ('alb011',N'Những nụ cười',2013)
Insert into Album values ('alb012',N'Bố là tất cả',2019)
Insert into Album values ('alb013',N'Bảy sắc cầu vồng',2022)
Insert into Album values ('alb014',N'Cho con',2018)


Insert into Album values ('alb015',N'Ai Cũng Phải Bắt Đầu Từ Đâu Đó',2020)
Insert into Album values ('alb016',N'Đánh đổi',2023)
Insert into Album values ('alb017',N'Trầu Văn Trap',2022)
Insert into Album values ('alb018',N'Anh luôn như vậy',2020)
Insert into Album values ('alb019',N'À lôi',2022)


Insert into Album values ('alb020',N'My Everything',2015)
Insert into Album values ('alb021',N'You"re My Heart, You"re My Soul (EP)',2016)
Insert into Album values ('alb022',N'Ready For Romance',2017)
Insert into Album values ('alb023',N'Justice',2018)
Insert into Album values ('alb024',N'Freedom',2019)

Insert into Album values ('alb025',N'Dòng máu Việt Nam',2017)
Insert into Album values ('alb026',N'Đất nước tình yêu',2018)
Insert into Album values ('alb027',N'Đất Nước Trọn Niềm Vui',2018)
Insert into Album values ('alb028',N'Mãi mãi Việt Nam',2023)
Insert into Album values ('alb029',N'Tiếng Sáo Chiều',2022)

--Table HangDia
Insert into HangDia values('HD001',N'Thúy Nga')
Insert into HangDia values('HD002',N'MIXUS')
Insert into HangDia values('HD003',N'MỘC Entertainment')

Insert into HangDia values('HD004',N'Euphoria Media Vietnam')
Insert into HangDia values('HD005',N'VIEENT Music')
Insert into HangDia values('HD006',N'DAO Music Entertainment')
Insert into HangDia values('HD007',N'Nam Việt Media')

Insert into HangDia values('HD008',N'Âu Lạc')
Insert into HangDia values('HD009',N'Believe')
Insert into HangDia values('HD010',N'Republic')
Insert into HangDia values('HD011',N'Ariola')

Insert into HangDia values('HD012',N'BMG Ariola')
Insert into HangDia values('HD013',N'Def Jam')
Insert into HangDia values('HD014',N'RIAV')
Insert into HangDia values('HD015',N'MMusic')
Insert into HangDia values('HD016',N'VIEENT Music')
--Table TacGia
Insert into TacGia values('TG001',N'Hàn Châu')
Insert into TacGia values('TG002',N'Hoài Linh')
Insert into TacGia values('TG003',N'Thương Linh')
Insert into TacGia values('TG004',N'Song Ngọc')

Insert into TacGia values('TG005',N'Thanh Sơn')
Insert into TacGia values('TG006',N'Đông Thiên Đức')
Insert into TacGia values('TG007',N'Drum7')
Insert into TacGia values('TG008',N'Thái Học')

Insert into TacGia values('TG009',N'NB3 Hoài Bảo')
Insert into TacGia values('TG010',N'Nguyễn Hồng Thuận')
Insert into TacGia values('TG011',N'Thập Nhất')
Insert into TacGia values('TG012',N'Phan Nhân')

Insert into TacGia values('TG013',N'Nguyễn Văn Chung')
Insert into TacGia values('TG014',N'Phạm Trọng Cầu')
Insert into TacGia values('TG015',N'HIEUTHUHAI')
Insert into TacGia values('TG016',N'Lý Quốc Phong')

Insert into TacGia values('TG017',N'Trần Mai Việt')
Insert into TacGia values('TG018',N'B Ray')
Insert into TacGia values('TG019',N'Double2T')
Insert into TacGia values('TG020',N'Ariana Grande')

Insert into TacGia values('TG021',N'Dieter Bohlen')
Insert into TacGia values('TG022',N'Justin Bieber')
Insert into TacGia values('TG023',N'Rihanna, David Guetta')
Insert into TacGia values('TG024',N'Trịnh Xuân Hảo')

Insert into TacGia values('TG025',N'Hoàng Vân')
Insert into TacGia values('TG026',N'Phó Đức Phương')
Insert into TacGia values('TG027',N'Huy Thục')
Insert into TacGia values('TG028',N'Hoàng Hà')

--Table BaiHat
Insert into BaiHat values('BH001',N'Tình Nhỏ Mau Quên',N'Ủa, anh Lê, anh mới về hả?
À, em, em là...
Út nè! Nhớ hông?
Út Lượm, phải hông?
Phải rồi!
Trời ơi, dạo này em lớn bổn à nha
Ủa, tự nhiên anh đi đâu mà lâu quá anh mới về thăm vậy?
Thì anh ở trên Sài Gòn chứ ở đâu
Ở Sài Gòn, dị ở trên Sài Gòn anh nhớ gì hông nè?
Nhớ chứ, nhớ quê mình nhiều kỷ niệm lắm á
Hôm nao hoa phượng nở về quê ghé thăm nhà em
Em như con chim nhỏ chạy quanh nép sau chân rèm
Lặng thầm nhìn anh đăm đăm rồi thẹn thùng che mắt biếc
Bé nay không còn cô bé như năm nào, em đã lớn thật rồi
Hôm nay em đã thành nàng con gái xinh thật xinh
Đôi môi tươi thơm nồng làm anh ngẩn ngơ trong lòng
Để rồi làm sao anh quên lần hẹn hò em đã đến
Dắt nhau qua cầu, đuổi bắt nhau trên đồi, tình yêu nói thành lời
Rồi ngày vui qua mau, anh gửi lại em lời chào
Gửi lại em một mối tình hồng, tình nồng hai đứa yêu nhau
Anh gửi lại cho em cầu tre lắc lẻo đôi bờ
Nhịp cầu tre một thuở mong chờ, đôi mình dệt mối tình thơ
Sau bao năm xa nhà, chiều qua ghé thăm nhà em
Nhưng em yêu đâu rồi, còn chăng mái tranh im lìm
Hỏi nhịp cầu tre đong đưa, hỏi từng dòng sông tím ngắt
Nói em theo chồng, em đã quên câu thề, lòng anh thấy não nề
Ủa, tự nhiên sao anh Lê buồn vậy?
Ủa buồn chứ sao không buồn, tự nhiên về quê thăm cái Út nói với Lê là Út có chồng rồi cái ớ...
Thôi, đừng buồn
Ờ... Má Út nói á, con gái ba chục không lấy chồng là ế đó, Út năm nay Út hăm chín nữa, Út phải lấy chồng chứ
Ủa, Út hăm chín rồi hả?
Ừ
Vậy là Út nhỏ hơn Lê hai tuổi á
Vậy hả?
Nhưng mà thôi, cũng mừng cho Út
Hôm nao hoa phượng nở về quê ghé thăm nhà em
Em như con chim nhỏ chạy quanh nép sau chân rèm
Lặng thầm nhìn anh đăm đăm rồi thẹn thùng che mắt biếc
Bé nay không còn cô bé như năm nào, em đã lớn thật rồi
Hôm nay em đã thành nàng con gái xinh thật xinh
Đôi môi tươi thơm nồng làm anh ngẩn ngơ trong lòng
Để rồi làm sao anh quên lần hẹn hò em đã đến
Dắt nhau qua cầu, đuổi bắt nhau trên đồi, tình yêu nói thành lời
Rồi ngày vui qua mau, anh gửi lại em lời chào
Gửi lại em một mối tình hồng, tình nồng hai đứa yêu nhau
Anh gửi lại cho em cầu tre lắc lẻo đôi bờ
Nhịp cầu tre một thuở mong chờ, đôi mình dệt mối tình thơ
Sau bao năm xa nhà, chiều qua ghé thăm nhà em
Nhưng em yêu đâu rồi, còn chăng mái tranh im lìm
Hỏi nhịp cầu tre đong đưa, hỏi từng dòng sông tím ngắt
Nói em theo chồng, em đã quên câu thề, lòng anh thấy não nề
Hỏi nhịp cầu tre đong đưa, hỏi từng dòng sông tím ngắt
Nói em theo chồng, em đã quên câu thề, lòng anh thấy não nề
Thôi anh đừng buồn, mai mốt nhớ về thăm Út nữa nghen
Thì nói, nói vậy thôi chứ, cũng về chứ, tại quê hương mình nhiều kỷ niệm mà
Về thăm quê rồi thăm Út luôn, vậy đó
Nhớ à nghen!
Ừa','cs001','trutinh','TG001','HD001','alb001')

Insert into BaiHat values('BH002',N'Sầu Tím Thiệp Hồng',N'Từ lúc quen nhau chưa nói một lời gì, tỏ tình ta mến nhau
Nhiều đêm ngắm sao mà ước duyên mình bền lâu, suốt đời tình khắc sâu
Nhớ thương đầy vơi, mộng thấy ai mỉm cười, làn môi xinh tuyệt vời
Để rồi buồn ơi, anh trăng soi còn đó, và nghe hơi gió biết rằng mình vừa mơ
Khi yêu, hồn như nở hoa xây mộng tuyệt vời
Nắm tương lai trong bàn tay một câu nói thôi
Đôi khi gặp nhau, muốn khơi nhưng rồi lại thôi
Nói ra e ngại mặc theo gió trôi
Hôm nay nhìn xe kết hoa xuôi ngược nẻo đường
Gửi thư trao cho người yêu, vài câu luyến thương
Hân hoan hồn như nở hoa trông chờ hồi âm
Đắng cay trong lòng chỉ thấy thiệp hồng
Chiều tím không mây, đường cũ bước lần về, buồn nghe day dứt tim
Nhìn xe kết hoa màu trắng ngỡ rằng mình mơ, pháo hồng nhuộm tiễn đưa
Lá thu chậm rơi từng lá nghe buồn buồn, tưởng bước ai tìm về
Mở rộng vòng tay đón anh nhưng nào thấy?
Sầu dâng lên tim, biết bao giờ cho khuây?
Hôm nay nhìn xe kết hoa xuôi ngược nẻo đường
Gửi thư trao cho người yêu, vài câu luyến thương
Hân hoan hồn như nở hoa trông chờ hồi âm
Đắng cay trong lòng chỉ thấy thiệp hồng
Chiều tím không mây, đường cũ bước lần về, buồn nghe day dứt tim
Nhìn xe kết hoa màu trắng ngỡ rằng mình mơ, pháo hồng nhuộm tiễn đưa
Lá thu chậm rơi từng lá nghe buồn buồn tưởng bước ai tìm về
Mở rộng vòng tay đón anh nhưng nào thấy?
Sầu dâng lên tim, biết bao giờ cho khuây?
Mở rộng vòng tay đón anh nhưng nào thấy
Sầu dâng lên tim, biết bao giờ cho khuây?','cs002','trutinh','TG002','HD002','alb002')

Insert into BaiHat values('BH003',N'Ai Khổ Vì Ai',N'Anh biết chăng anh em khổ vì ai em khóc vì ai
Ngày vui đã tan nhân tình thế thái còn lại đống tro tàn
Em muốn kêu lên cho thấu tận trời cao xanh
Rằng tình em yêu sao giống đời đoá phù dung
Sớm nở tối tàn xót xa duyên mình chưa thắm đành dở dang
Thuở xưa ngày đầu của nhau hai đứa vang câu tình ca
Ngày đầu của nhau anh đón đưa em về nhà
Trăng nước hiền hoà
Ngày đầu của nhau hương sắc tình yêu đậm đà
Ngày nay người đành bỏ em canh vắng bơ vơ sầu đau
Người đành bỏ em quên phút ta yêu lần đầu
Trăng nước bạc màu
Người đành bỏ người như sương khói sau chuyến tàu
Anh biết chăng anh em ngủ nào yên em thức nào yên
Nhiều khi cố quên nhưng chỉ thêm chuốc vào lòng những ưu phiền
Âu yếm hôm qua không xoá được buồn hôm nay
Người phụ đời em khi đã cạn chén tình say
Để lại thương sầu trót yêu nhau rồi sao nỡ làm khổ nhau
Thuở xưa ngày đầu của nhau hai đứa vang câu tình ca
Ngày đầu của nhau anh đón đưa em về nhà
Trăng nước hiền hoà
Ngày đầu của nhau hương sắc tình yêu đậm đà
Ngày nay người đành bỏ em canh vắng bơ vơ sầu đau
Người đành bỏ em quên phút ta yêu lần đầu
Trăng nước bạc màu
Người đành bỏ người như sương khói sau chuyến tàu
Anh biết chăng anh em ngủ nào yên em thức nào yên
Nhiều khi cố quên nhưng chỉ thêm chuốc vào lòng những ưu phiền
Âu yếm hôm qua không xoá được buồn hôm nay
Người phụ đời em khi đã cạn chén tình say
Để lại thương sầu trót yêu nhau rồi sao nỡ làm khổ nhau
Trót yêu nhau rồi sao nỡ làm khổ nhau','cs003','trutinh','TG003','HD003','alb003')

Insert into BaiHat values('BH004',N'Khóc Một Cuộc Tình',N'Người đã bỏ ta đi lấy chồng
Ta hỏi lòng mình có buồn không
Không buồn sao ta lại khóc
Không buồn sao lại đau thương
Không buồn sao từng đêm say mèm
Đời đã phong trần chắc phong trần thêm
Rồi đây từng đêm ngõ vắng không đèn
Ta đi tìm đôi mắt ấy
Đi tìm lại làn tóc mây
Tưởng như em vẫn còn đây
Thôi uống thêm một ly
Để cho vơi sầu dĩ vãng
Quên người phụ rẫy tình ta
Tháng ngày biết có phôi phai
Hay quên là để nhớ nhiều
Oan nghiệt một mối tình đau
Người đã bỏ ta đi lấy chồng
Ta hỏi lòng còn chi nữa mà trông
Chim trời cao bay về núi
Ai từ vực thẳm thương mong
Ôm một kiếp đời long đong
Thôi uống thêm một ly
Để cho vơi sầu dĩ vãng
Quên người phụ rẫy tình ta
Tháng ngày biết có phôi phai
Hay quên là để nhớ nhiều
Oan nghiệt một mối tình đau
Người đã bỏ ta đi lấy chồng
Ta hỏi lòng còn chi nữa mà trông
Chim trời cao bay về núi
Ai từ vực thẳm thương mong
Ôm một kiếp đời long đong
Chim trời cao bay về núi
Ai từ vực thẳm thương mong
Ôm một kiếp đời long đong','cs004','trutinh','TG004','HD001','alb004')

Insert into BaiHat values('BH005',N'Bội Bạc',N'Nhiều đêm khắc khoải niềm ưu tư chợt đến
Cho nhớ thương đong đầy kỷ niệm xưa còn đấy
Mà người đổi thay chối bỏ câu hẹn thề
Để lại nhau chua xót và thương đau
Từng đêm mưa giăng sầu
Như nước mắt ban đầu mình đã khóc cho nhau
Niềm thương chớm nở mình yêu nhau từ đó
Không đắn đo âu lo ngỡ quen nhau từ lâu
Mà nào ngờ đâu cũng đành thôi tạ từ
Cuộc tình như ong bướm vờn bên hoa
Rồi khi hoa phai tàn ong bướm bay theo đàn để trọn kiếp ly tan
Nhưng thôi nhắc lại chỉ đau đớn lòng
Vì đời mấy ai giữ được câu chung tình
Mấy ai hiểu cho mình tay trắng đôi tay
Đường tình còn ai dù duyên kiếp không thành
Chỉ buồn phận mình thôi
Đường yêu lắm nẻo nụ hoa mau tàn héo
Cho nhớ nhung mang theo nếu xưa ta đừng quen
Lời ngọt đầu môi đã thành câu bội bạc
Tình đổi thay như áo mặc qua tay
Đời ai không một lần dang dở duyên ban đầu để trọn kiếp thương đau
Nhưng thôi nhắc lại chỉ đau đớn lòng
Vì đời mấy ai giữ được câu chung tình
Mấy ai hiểu cho mình tay trắng đôi tay
Đường tình còn ai dù duyên kiếp không thành
Chỉ buồn phận mình thôi
Đường yêu lắm nẻo nụ hoa mau tàn héo
Cho nhớ nhung mang theo nếu xưa ta đừng quen
Lời ngọt đầu môi đã thành câu bội bạc
Tình đổi thay như áo mặc qua tay
Đời ai không một lần dang dở duyên ban đầu để trọn kiếp thương đau
Tình đổi thay như áo mặc qua tay
Đời ai không một lần dang dở duyên ban đầu để trọn kiếp thương đau','cs005','trutinh','TG005','HD002','alb005')

Insert into BaiHat values('BH006',N'Tất Cả Hoặc Không Là Gì Cả',N'[Verse 1]
Ta yêu nhau từ trong lặng thinh
Rồi cứ xa nhau trong lặng thinh
Không họ cũng chẳng tên
Đợi đến lúc quay mặt là quên...
Ta yêu nhau chỉ mình ta biết
Trời chẳng hay, đất cũng chẳng biết
Không phận cũng chẳng duyên
Sao lại tha thiết...
Trông như ta là đôi tình nhân
Mà mấy khi giống với nhân tình
Nhân tình nào dấu sâu
Tận ngõ khuất không dám công nhận...
Hững hờ rồi thiết tha
Chẳng quen cũng chẳng phải lạ
Chẳng sâu đậm
Cũng không phải là phôi pha...
[Điệp khúc]
Cuối cùng thì, mình gọi nhau là gì
Là bến đỗ hay là trạm dừng nghỉ
Tình có lúc thật, đôi lúc không thật
Có nắm em được đâu mà mất...
Bước thì ngại mà chậm bước ở lại
Làm người cô đơn
Với nỗi nhớ đêm dài
Vậy ta là ai
Ta cố ôm hy vọng cho ai...
Chán thì dừng
Mập mờ thôi thì đừng
Chẳng ai muốn nắm lấy
Quá khứ lưng chừng
Là tất cả, hoặc không phải là gì cả...
Phố thênh thang
Dòng người bước vội vàng
Sợ cơn mưa kia đôi khi quá nặng hạt
Nhìn mưa buồn rơi vỡ tan, vỡ tan...
[Verse 2]
Trông như ta là đôi tình nhân
Nào mấy khi giống với tình nhân
Nhân tình nào dấu sâu
Tận ngõ khuất không dám công nhận...
Hững hờ rồi thiết tha
Chẳng quen cũng chẳng phải lạ
Chẳng sâu đậm
Cũng không phải là phôi pha...
[Điệp khúc]
Cuối cùng thì, mình gọi nhau là gì
Là bến đỗ hay là trạm dừng nghỉ
Tình có lúc thật
Đôi lúc không thật
Có nắm em được đâu mà mất...
Bước thì ngại mà chậm bước ở lại
Làm người cô đơn
Với nỗi nhớ đêm dài
Vậy ta là ai
Ta cố ôm hy vọng cho ai...
Chán thì dừng
Mập mờ thôi thì đừng
Chẳng ai muốn nắm lấy
Quá khứ lưng chừng
Là tất cả, hoặc không phải là gì cả...
Phố thênh thang
Dòng người bước vội vàng
Sợ cơn mưa kia đôi khi quá nặng hạt
Nhìn mưa buồn rơi vỡ tan, vỡ tan...
[Điệp khúc]
Cuối cùng thì, mình gọi nhau là gì
Là bến đỗ hay là trạm dừng nghỉ
Tình có lúc thật
Đôi lúc không thật
Có nắm em được đâu mà mất...
Bước thì ngại mà chậm bước ở lại
Làm người cô đơn
Với nỗi nhớ đêm dài
Vậy ta là ai
Ta cố ôm hy vọng cho ai...
Hy vọng cho ai...
Chán thì dừng
Chán thì dừng
Mập mờ thôi thì đừng
Chẳng ai muốn nắm lấy
Quá khứ lưng chừng
Là tất cả, hoặc không phải là gì cả...
Phố thênh thang
Dòng người bước vội vàng
Sợ cơn mưa kia đôi khi quá nặng hạt
Nhìn mưa buồn rơi vỡ tan, vỡ tan...
[Kết thúc]
Nhìn mưa buồn rơi vỡ tan, vỡ tan...','cs006','kpop','TG006','HD002','alb006')

Insert into BaiHat values('BH007',N'Lệ Lưu Ly',N'Em có gì đâu ngoài những vết thương sâu
Yêu bao nhiêu lâu mà vẫn cứ thấy đau
Gieo bao tương tư nặng ôm những nỗi buồn
Em trao tim em rồi đem bán linh hồn

Để đổi lấy đôi phút bình yên
Dẫu nước mắt ướt gối hằng đêm
Mà em ơi hi sinh vậy có xứng đáng?

Vết bầm trên người em nhiều thêm
Chẳng có lấy một ngày ấm êm
Chỉ còn tai ương thâu đêm
Không còn tương lai đâu em!

Em ơi dừng lại khi nắng đã phai
Dừng lại khi em bước sai
Dừng lại khi chẳng có ai
Biết em vẫn đang tồn tại

Em ơi đừng làm lệ vương khoé mi
Đừng làm thân xác úa si
Tình tàn xin cất bước đi
Chớ lưu luyến thêm làm gì?
Cố yêu được chi

Rap:

Chơi đùa, chơi đùa thôi à
Xin đừng trêu đùa tôi mà
Đừng giam lòng tin vào nơi vực sâu
Dựng xây niềm đau thành ngôi nhà
Luôn là luôn là tôi
Đau lòng nhưng mà thôi
Thiên hà rơi tả tơi
Tim là nơi lả lơi
Họ lại xem tôi như con cờ

Đạp đổ tương lai tôi mong chờ
Sai vì tôi mộng mơ
Vì tình yêu nơi tôi tôn thờ?
Tình tàn tình vỡ tan
Trở về với khuôn mặt đáng thương
Nhìn hành trình dở dang
Chê bai hay những lời tán dương.

Lệ mang sầu đau trên từng vết son
Người thương em xưa giờ đây chẳng còn
Đào sương hoa mơ em còn bỡ ngỡ
Thời gian thoi đưa tim em tan vỡ
Thương khi em yêu có đâu ngờ
Trăng soi thân em cứ xác xơ
Ở đâu người em nhớ.

Em ơi dừng lại khi nắng đã phai
Dừng lại khi em bước sai
Dừng lại khi chẳng có ai
Biết em vẫn đang tồn tại

Em ơi đừng làm lệ vương khoé mi
Đừng làm thân xác úa si
Tình tàn xin cất bước đi
Chớ lưu luyến thêm làm gì?
Cố yêu được chi

Rap:

Một khi đã hết giá trị lợi dụng
Họ trói con tiên em vào xiềng gông
Em chỉ muốn đến góp vui cho đời
Họ nghĩ là em đang chờ tiền công

Em đã từng ở thời hoàng kim
Từng sải cánh bay cùng đàn chim
Giờ nhìn lại thì em có gì?
Không một ai biết, không người hàn huyên
Em trượt dài theo con dốc
Em đã từng là một nàng tiên

Kể và cười y như con ngốc
Anh nghe rồi khóc như một thằng điên
Em trượt dài theo con dốc
Em đã từng là một nàng tiên
Kể và cười y như con ngốc
Anh nghe rồi khóc như một thằng điên.

Em không buồn, em không khóc
Cũng chẳng thấy đau…
Như cái cách mà loài người
Vẫn thường cứu lấy nhau

Em không buồn, em không khóc
Cũng chẳng thấy đau…
Như cái cách mà loài người
Vẫn thường cứu lấy nhau.','cs007','kpop','TG007','HD004','alb007')

Insert into BaiHat values('BH008',N'Phố Hoa Lệ',N' Người trách anh sao cũng được
Hay là giết anh đi cũng được
Chỉ xin em đừng hoen hoen mắt ướt
Người nghĩ anh sao cũng được
Miễn hả hê trong lòng là được
Chỉ xin em đừng lệ vấn lệ vương
Nào phải đâu anh thay đổi
Anh nào phải là người phản bội
Anh cũng chưa từng lời gian tiếng dối
Người nói yêu anh một lời
Mà mỏi bước theo anh một đời
Xin lỗi đã làm chậm bước em rồi
ĐK:
Đã đến lúc ta phải dừng lại
Đoạn đường chúng ta đi quá dài
Còn in hằn cả thanh xuân một người con gái
Em lộng lẫy sau những lo toan
Em lầm lũi sau những lối mòn
Bỏ sau lưng những ngẩn ngơ đợi chờ đưa đón
Dường như chính anh là trở ngại
Để người viết tiếp giấc mơ dài
Vậy anh sẽ chọn cách đi xa người mãi mãi
Tiếng ai khóc giữa phố lê thê
Tiếng ai hát phố hoa phố lệ
Phố hoa lệ hoa cho người còn lệ cho anh
(Vậy kết thúc ta nên dừng lại
Bỏ lại tất cả những gì hi vọng
Cản đường em đi thôi thì mình chia ly
Phố hoa kia có người
Phố hoa kia em cười
Cười trên nỗi đau của anh.','cs008','kpop','TG006','HD002','alb008')

Insert into BaiHat values('BH009',N'Cưới Thôi Em',N'Vậy là chính thức bây giờ
Em làm vợ anh
Về làm nàng dâu sống cùng anh đến khi bạc đầu
Dù đời gian nan em vẫn luôn kề vai sát cánh
Để ngày hôm nay thay lời anh muốn nói ra
Từ khi gặp em anh cảm thấy
À đây người mà bấy lâu nay
Mà Ba Mẹ anh khuyên anh lấy

Cùng anh đi qua bao khó khăn
Dẫu có sóng gió hay nhọc nhằn
Hi sinh vì anh cố gắng

Anh sẽ là bờ vai
Cho em đến tựa vào
Nhẹ nhành tựa làn mây gió cuốn theo mang em về đây
Anh sẽ là ngọng sóng
Em là bờ cát trắng
Sóng sẽ ngã vào bờ
Anh có em tình tựa như mơ

Em sẽ là cô dâu
Xinh nhất ở trên đời
Dịu dàng tựa ngàn vạt nắng đang chiếu soi đường tình dẫn lối
Ngộ tựa đầu vào vai nhau
Hét lên với cả thế giới
Có em trong cuộc đời
Là điều tuyệt vời nhất','cs009','kpop','TG008','HD005','alb009')

Insert into BaiHat values('BH010',N'Khuất Lối',N'Hôm nay mưa phủ bay lay nhẹ hương thơm đôi tóc mây
Nhớ thương nàng, anh lang thang trong đêm mà đâu có hay
Đôi câu yêu ngày nao vẫn còn in trong tâm trí anh
Lối xưa về giờ đây vắng tanh, lạnh lùng nhớ ai
Thương thân anh thủy chung, đêm về nặng lòng mình nhớ thương
Khói sương mờ bên hiên hòa chung đèn khuya hắt hiu
Ai yêu ai để cho bây giờ đôi câu thơ dở dang
Hóa ra ngàn yêu thương đến vậy giờ cũng vỡ tan
Anh đi về bóng tối khuất lối, chìm dần trong bao đêm trôi
Thương thì thương vậy thôi, sao giờ con tim vỡ đôi?
Em ơi anh buồn, anh nhớ ánh mắt, nụ cười em đang nơi đâu?
Sầu đôi bờ mi, anh buồn trong cô liêu
Tiếc thương hoài những phút đắm đuối ân cần ta tay trong tay
Sao giờ đây lẻ loi chỉ mình anh trong men say?
Thôi cứ dặn lòng ta quên đi em, hết đêm này ta quên đi em
Ngày mai bình yên sẽ về, quên đi em
Yah, yah
Anh sẽ cố quên đi một người, người anh xem là cả thế giới
Anh sẽ cố quên đi một người, nhường cho em tìm hạnh phúc mới
Vì anh biết tình mình chỉ đẹp khi tình mình còn nhiều dang dở
Và anh biết tình mình kết thúc khi tình mình có nhiều tan vỡ
Cố nén chua cay, đêm vùi chôn những niềm nhớ (những niềm nhớ)
Ai đó thay lòng, mang khổ đau vào trong giấc mơ
Duyên kiếp bẽ bàng, thôi từ đây tình ta rẽ đôi
Lui bước về sau, chúc em một đời êm ấm
Anh đi về bóng tối khuất lối, chìm dần trong bao đêm trôi
Thương thì thương vậy thôi, sao giờ con tim vỡ đôi?
Em ơi anh buồn, anh nhớ ánh mắt, nụ cười em đang nơi đâu?
Sầu đôi bờ mi, anh buồn trong cô liêu
Tiếc thương hoài những phút đắm đuối ân cần ta tay trong tay
Sao giờ đây lẻ loi chỉ mình anh trong men say?
Thôi cứ dặn lòng ta quên đi em, hết đêm này ta quên đi em
Ngày mai bình yên sẽ về, quên đi em
Xa rồi từng nhớ thương khờ dại
Chỉ mỗi anh nơi đây buồn tênh (một mình anh mơ, một mình anh mơ)
Em giờ này phấn son lụa là
Bỏ lại đây bao nhiêu cô đơn nhớ thương (nhớ thương oh ho)
Anh đi về bóng tối khuất lối, chìm dần trong bao đêm trôi
Thương thì thương vậy thôi, sao giờ con tim vỡ đôi?
Em ơi anh buồn anh nhớ ánh mắt, nụ cười em đang nơi đâu?
Sầu đôi bờ mi, anh buồn trong cô liêu
Tiếc thương hoài những phút đắm đuối ân cần ta tay trong tay
Sao giờ đây lẻ loi chỉ mình anh trong men say?
Thôi cứ dặn lòng ta quên đi em, hết đêm này ta quên đi em
Ngày mai bình yên sẽ về, quên đi em','cs010','kpop','TG009','HD006','alb010')

Insert into BaiHat values('BH011',N'Nhà Mình Rất Vui',N'Má là đóa hồng dành riêng cho ba
Ba là mái nhà che con và má
Con là nụ hoa đẹp xinh nhất nhà
Nhà mình yêu thương sống vui thuận hòa
Nhà mình bốn mùa rộn vang câu ca
Ba thả cung đàn vui tươi rộn rã
Má bắt bài ca con hát chan hòa
Hạnh phúc ngọt ngào hơn cả sôcôla
Papa
Mama
Papa
Mama
Má là đóa hồng dành riêng cho ba
Ba là mái nhà che con và má
Con là nụ hoa đẹp xinh nhất nhà
Nhà mình yêu thương sống vui thuận hòa
Nhà mình bốn mùa rộn vang câu ca
Ba thả cung đàn vui tươi rộn rã
Má bắt bài ca con hát chan hòa
Hạnh phúc ngọt ngào hơn cả sôcôla
Má là đóa hồng dành riêng cho ba
Ba là mái nhà che con và má
Con là nụ hoa đẹp xinh nhất nhà
Nhà mình yêu thương sống vui thuận hòa
Nhà mình bốn mùa rộn vang câu ca
Ba thả cung đàn vui tươi rộn rã
Má bắt bài ca con hát chan hòa
Hạnh phúc ngọt ngào hơn cả sôcôla
Papa
Mama
Papa
Mama
Má là đóa hồng dành riêng cho ba
Ba là mái nhà che con và má
Con là nụ hoa đẹp xinh nhất nhà
Nhà mình yêu thương sống vui thuận hòa
Nhà mình bốn mùa rộn vang câu ca
Ba thả cung đàn vui tươi rộn rã
Má bắt bài ca con hát chan hòa
Hạnh phúc ngọt ngào hơn cả sôcôla
Hạnh phúc ngọt ngào hơn cả sôcôla
Papa
Mama
Papa
Mama','cs011','thieunhi','TG010','HD002','alb011')

Insert into BaiHat values('BH012',N'Bố Là Tất Cả',N'Bố là tàu lửa bố là xe hơi
Bố là con ngựa em cưỡi em chơi
Bố là thuyền nan cho em vượt sóng
Bố là sông rộng cho thuyền em bơi
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Nhưng lúc bố mệt bố là bố thôi
Bố là tàu lửa bố là xe hơi
Bố là con ngựa em cưỡi em chơi
Bố là thuyền nan cho em vượt sóng
Bố là sông rộng cho thuyền em bơi
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Nhưng lúc bố mệt bố là bố thôi
Bố là tàu lửa bố là xe hơi
Bố là con ngựa em cưỡi em chơi
Bố là thuyền nan cho em vượt sóng
Bố là sông rộng cho thuyền em bơi
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Nhưng lúc bố mệt bố là bố thôi
Bố là tàu lửa bố là xe hơi
Bố là con ngựa em cưỡi em chơi
Bố là thuyền nan cho em vượt sóng
Bố là sông rộng cho thuyền em bơi
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là bờ đê cho em nằm ngủ
Bố bố là phi thuyền cho em bay vào không gian
Bố bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Bố là tất cả bố ơi bố ơi
Nhưng lúc bố mệt bố là bố thôi','cs0012','thieunhi','TG0011','HD007','alb0012')

Insert into BaiHat values('BH013',N'Vườn Cây Của Ba',N'Má trồng toàn những cây dễ thương
Nào là hoa là rau là lúa
Còn ba trồng toàn cây dễ sợ
Cây xù xì cây lại có gai
Cái gai bưởi đụng nhầm là chảy máu
Trái sầu riêng rớt trúng thì đầu u
Nhựa hột điều dính vào là rách áo
Cây dừa cao eo ôi ôi là cao
Cây ba trồng sống lâu thiệt là lâu
Mưa chẳng dập gió lay chẳng đổ
Thân xù xì cứ đứng trơ trơ
Cành gan góc đâm ngang tua tủa
Bưởi sầu riêng dừa điều nhiều nhiều nữa
Cho em bốn mùa vị ngọt hương thơm
Vườn của ba cây trồng thì dễ sợ
Mà trái nào cũng thiệt dễ thương
Má trồng toàn những cây dễ thương
Nào là hoa là rau là lúa
Còn ba trồng toàn cây dễ sợ
Cây xù xì cây lại có gai
Cái gai bưởi đụng nhầm là chảy máu
Trái sầu riêng rớt trúng thì đầu u
Nhựa hột điều dính vào là rách áo
Cây dừa cao eo ôi ôi là cao
Cây ba trồng sống lâu thiệt là lâu
Mưa chẳng dập gió lay chẳng đổ
Thân xù xì cứ đứng trơ trơ
Cành gan góc đâm ngang tua tủa
Bưởi sầu riêng dừa điều nhiều nhiều nữa
Cho em bốn mùa vị ngọt hương thơm
Vườn của ba cây trồng thì dễ sợ
Mà trái nào cũng thiệt dễ thương
Má trồng toàn những cây dễ thương
Nào là hoa là rau là lúa
Còn ba trồng toàn cây dễ sợ
Cây xù xì cây lại có gai
Cái gai bưởi đụng nhầm là chảy máu
Trái sầu riêng rớt trúng thì đầu u
Nhựa hột điều dính vào là rách áo
Cây dừa cao eo ôi ôi là cao
Cây ba trồng sống lâu thiệt là lâu
Mưa chẳng dập gió lay chẳng đổ
Thân xù xì cứ đứng trơ trơ
Cành gan góc đâm ngang tua tủa
Bưởi sầu riêng dừa điều nhiều nhiều nữa
Cho em bốn mùa vị ngọt hương thơm
Vườn của ba cây trồng thì dễ sợ
Mà trái nào cũng thiệt dễ thương
Vườn của ba cây trồng thì dễ sợ
Mà trái nào cũng thiệt dễ thương','CS012','thieunhi','TG012','HD007','alb012')

Insert into BaiHat values('BH014',N'Chị Thương Em Lắm',N'Lúc ba vắng nhà chị chơi với em.
Lúc mẹ vắng nhà chị chăm em nhé.
Bé ơi chớ khóc đến khi mẹ về, có mua bánh phồng chị em mình ăn.
Bé ngoan của chị đừng leo quá cao, đến khi té rồi là đau lắm đấy.

Bé ơi chớ có quấy phá mẹ buồn.
Bé ơi hãy vâng lời ai cũng thương.
Là la la la lá, lá la la la chị hay thương em nhé và thương nhất nhà.
Là la la la lá, lá la la la chị em ta ca hát và luôn bên nhau.','CS012','thieunhi','TG013','HD007','alb013')

Insert into BaiHat values('BH015',N'Cho Con',N'Ba sẽ là cánh chim
Đưa con đi thật xa
Mẹ sẽ là cành hoa
Cho con cài lên ngực
Ba mẹ là lá chắn
Che chở suốt đời con
Vì con là con ba
Con của ba rất ngoan
Vì con là con mẹ
Con của mẹ rất hiền
Ngày mai con khôn lớn
Bay đi khắp mọi miền
Con đừng quên con nhé
Ba mẹ là quê hương
Ba sẽ là cánh chim
Đưa con đi thật xa
Mẹ sẽ là cành hoa
Cho con cài lên ngực
Ba mẹ là lá chắn
Che chở suốt đời con
Vì con là con ba
Con của ba rất ngoan
Vì con là con mẹ
Con của mẹ rất hiền
Ngày mai con khôn lớn
Bay đi khắp mọi miền
Con đừng quên con nhé
Ba mẹ là quê hương
Ba sẽ là cánh chim
Đưa con đi thật xa
Mẹ sẽ là cành hoa
Cho con cài lên ngực
Ba mẹ là lá chắn
Che chở suốt đời con
Vì con là con ba
Con của ba rất ngoan
Vì con là con mẹ
Con của mẹ rất hiền
Ngày mai con khôn lớn
Bay đi khắp mọi miền
Con đừng quên con nhé
Ba mẹ là quê hương
Ngày mai con khôn lớn
Bay đi khắp mọi miền
Con đừng quên con nhé
Ba mẹ là quê hương','cs013','thieunhi','TG014','HD008','alb014')

Insert into BaiHat values('BH016',N'Không Phải Gu',N'Uầу uầу good girl không thể cãi
Quуến rũ nhưng mà không có dễ dãi
Một mình đương đầu moving on
Vẫn xúng xính bên mình Louis Vuitton
Hơi cô đơn nhưng sao không buồn
Vẫn luôn control
Ɗù cho thính đầу tai
Ɓao nhiêu anh xếp lớp ngang ngang
Falling in love, no thanks
Ѕo sorrу
Ɛm đang bận tính ngàу mai
Miệt mài
RAP:
Không phải em chảnh
Không phải tiêu chuẩn cao
Mà là vibe của mình
Vốn dĩ không tương trợ lẫn nhau
Anh thích cá tính
Ɗĩ nhiên là em có
Ϲhỉ là những thứ em thích
Thì anh lại không có
Từ đầu
Là ta đã không cùng một tần số
Không thể cưỡng cầu
Thì tốt nhất là đừng cố
Ɛm vẫn đang hưởng thụ
Ϲuộc sống như chu trình
Ϲhưa cần khuấу động
Khi chưa gặp đúng gu mình

Ɓước đi bao anh nhìn theo
Ɲhiều người thường nói sao em mlem quá
Guốc hai phân thêm Ϲhanel
Đặt vào cốp xe Lamborghini
Đang trước sân kìa
Ѕố anh xui nên gặp em
Hợp tình hợp lý nhưng không hợp gu
Ɓúp bê không cần tình уêu
Đừng mà thức canh em
Tin nhắn em đâu xem

ĐK:
Ɓarapbarapbarapbaba
Không ai giống em đâu
Ɓarapbarapbarapbaba
Ѕhine like a diamond
Ɓarapbarapbarapbaba
Please don"t waste mу time
Ɓarapbarapbarapbaba
Ϲuz уou"re not mу tуpe
2.
Ɛm từng viết love song như là thơ
Yêu nhiều rồi mới biết
Vốn đâu như là mơ
Ɲhư trò cá cược chịu nhiều thiệt thòi
Đặt con hạnh phúc
Mà nó toàn về đơn côi
Thôi được rồi

RAP2:
Ɲên là thôi đừng nói lời hoa mỹ
Haу là nghĩ
Ѕẽ dễ dàng gạ được em
Ɓằng mấу đồ xa xỉ
Ɛm không phủ nhận
Là với tình уêu thì mình lười
Ɲhưng nói thiệt điều em giỏi nhất
Hiện tại vẫn là nhìn người
Ɛу bad boу not good
Ɓut good boу not fun
Anh cũng không cần theo em
Từng gót chân đâu
Ϲhẳng tiến triển thêm gì
Rất là mất thời gian
Đừng bảo không nói trước
Không sau lại cất lời than
Không phải là anh thiếu năng lực
Ѕợ nói thẳng thì lượt thích tăng
Lên cho em quả nhạc căng cực
Ɲói tóm lại là
Ϲhung quу do em không thích anh

ĐK:
Ɓarapbarapbarapbaba
Không ai giống em đâu
Ɓarapbarapbarapbaba
Ѕhine like a diamond
Ɓarapbarapbarapbaba
Please don"t waste mу time
Ɓarapbarapbarapbaba
Ϲuz уou"re not mу tуpe

Ɓarapbarapbarapbaba
Không ai giống em đâu
Ɓarapbarapbarapbaba
Ѕhine like a diamond
Ɓarapbarapbarapbaba
Please don"t waste mу time
Ɓarapbarapbarapbaba
Ϲuz уou"re not mу tуpe','cs014','rap','TG015','HD015','alb015')

Insert into BaiHat values('BH017',N'16',N'[Verse 1: Obito]
Nó bắt đầu 16
Từ bỏ ý định làm người xấu
Tập tễnh viết lời vào tờ giấy
Đem bao chuyện không hay muốn kể cho mọi người thấu
Young boy with the passion
Love to know he thinks back (I know)
Mặc kệ mọi thứ đang dang dở
But fuck it, I still rap
Bắt đầu thêm những chuyện không vui, nhưng lần này vấn đề nó không nằm ở ngoài đường
Thằng bé bắt đầu biết dùng âm nhạc, để vẽ thêm màu sắc, thêm hi vọng trong đời thường
Ba mẹ nó làm việc đến thâu đêm, cũng không vui với cái cách nó chọn đường
Thằng bé lúc đó cũng không nghĩ, âm nhạc cùng với nó sau này trở thành tình trường

[Chorus]
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn mười-

[Verse 2]
Lúc đầu toàn lời độc trong lời văn, chửi thề dính ở mồm như thuốc phiện
Nhạc chửi thì ai mà muốn nghe, cõi sâu của tâm hồn thì sau này nó mới tìm
Cảm xúc cứ như nén ở phần ngực, con người mới đôi khi khiến nó buồn bực
Mơ lớn và tính cách hiếu thắng, nhưng tự tìm cách bước đôi khi khiến nó ấm ức
Nhưng kiên quyết không muốn trở thành người xấu
Vẫn cố dù không biết đi từ đâu
Chân cứ bước đi trong vô thức
Cũng vô thức trưởng thành hơn ngày đầu
Sự vô thức làm tâm hồn nó nở hoa
Sự vô thức làm nó chìm trong cảm xúc
Sự vô thức tạo cho nó thế giới riêng
Vô tình khiến nó không biết chuyện gì đang diễn ra [Chorus]
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn mười-

[Verse 3]
Năm đó nó vừa tròn 16
Người thân trong nhà cắn xé nhau
Biến cố ập ngay lúc nó bay bổng
Thêm một lần thằng bé đó đau lòng
Bắt đầu biết sao ba mẹ làm thâu đêm
Để ý khi mẹ trốn vào một góc
Biết được những con số cần giải quyết
Những con số khi nhìn vào là bật khóc
Quyết định đứng dậy và nó đi
Bỏ tâm sự vào âm nhạc điều nó nghĩ
Lao đầu vào cuộc đời mạng nó phi
Không ngại làm con tốt cho đời thí
Chuyến xe đưa nó đi xa thật xa
Trách nhiệm không cho chân nó được ngã
Nuôi ý chí để dòng họ nó nhờ vả
Ôm giấc mộng thành công để tâm hồn được về nhà [Chorus]
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn 16
Năm đó nó vừa tròn mười-
[Skit]
Cái lúc mà mày thấy tao kiểu... thoát ra được cái mà hiện tại mày đang bị, mày đang bị vướng vô, mày thấy tao thoát ra được, cái lúc đó mày có thấy mừng cho tao không?
Tất nhiên!','cs015','rap','TG016','HD009','alb016')

Insert into BaiHat values('BH018',N'Trầu Văn Trap',N'Xin cõi cao trên trời rủ lòng thương
Nơi thế gian phũ phàng lòng còn vương
Tâm con không lừa lọc ai, họ đi lúc con chân thành
Nam nhi không ngại nhận sai a

Được bay như những ngọn gió tối ngắm sao ở trên Đồng Cao
Song ca với cây lá nghe khúc đồng dao
Chả phải biết sống sao cho họ hài lòng
Đôi khi lại ngồi nhớ anh em Hải Phòng

Thằng bạn con trong lồng giam ân hận nhiều năm
Nhạc con được tẩm vào trong giai điệu Chầu Văn
Thanh âm từ Đông Bắc lương tâm nằm trong mắt
Để yêu thương này lan khắp tâm hồn này trong vắt

Âm nhạc con mang tâm tư nhiều
Con đang chìm trong không gian 3 chiều
Xong việc con cùng anh em du hí
Hai bánh đi thăm bản làng 2T

What up my bro! Đức năng thắng số pha son la đố
OKEE LET GOOOO!!!
Ăn hạt gạo làng tình yêu thương nồng nàn 16 tuổi thân con bôn ba 2 bàn tay trắng
Cho con thêm thử thách gian nan còn vài đồng bạc con không tính toán

Khổ đau cho mày gan lì cơm ngày 3 bữa còn tham lam gì?
Nhạc sập sình bên tai con không mong mình trên ai
Đem tâm tư này lên mic không tin mình thì tin ai?
Không nghe bọn nổ tin sai! Đi con xe hiệu Hyundai','cs016','rap','TG017','HD009','alb017')

Insert into BaiHat values('BH019',N'Anh Luôn Như Vậy',N'Oh baby anh vẫn luôn như vậy, Hay là em hãy nhanh chân chạy,
Đôi lần đổ vỡ, ngàn lần vô cớ, tìm đường lui để không trình bày,
Baby, anh sẽ luôn như vậy,
Và điều cần thiết là em hãy ghét anh đi,
Anh luôn đoán trước được việc đánh mất vật gần nhất tiếp theo là gì.

Maybe i was made for this
Ready for ya, ready for ya

Just leave me alone

Lý trí như cô vợ nội trợ, suốt ngày tìm con tim bắt ghen,
Hoài nghi là kẻ mù màu, chỉ nhận định sự việc trắng đen,
Em khiến 1 kẻ thích giam mình trong bóng tối từ chối tắt đèn,
Anh đi khắp cả nẻo đường, rồi cũng phải lạc vào đôi mắt em,
Có thể là vô lý, cũng có thể là ngu si,
Đi tìm điều mới lạ, từ những món đồ đã cũ kĩ,
But what can I do now, baby boo, I"m a rolling stone,
And you know that there"s no use in keep holding on,
Nhìn xem kìa, ta còn là gì ngoài những đứa trẻ tổn thương và đa nghi?
Ngày anh mở lòng là ngày em thấy lối thoát và ra đi,
Dù anh vẫn biết là sai có,
Nhưng bản thân ai cũng 1 lần phá vỡ quy tắc vì ai đó,
You know I"m still waiting for you at our rendezvous,
I saw you in the end and knew that that"s not you,
Tất cả chỉ là cái cớ, em biết anh không phải gã khờ,
Nhưng để có kết của 1 câu chuyện thì nếu cần thiết anh sẽ giả vờ.
Rằng là...','cs017','rap','TG018','HD002','alb018')

Insert into BaiHat values('BH020',N'À lôi',N'Tại vì thích em nhiều quá nhưng em lại nói là "à lôi"
Cũng định solo Hiphop cùng với trai bản nhưng mà thôi
Anh gửi vào trong câu rap cho em dính cả thính, cả mồi
Nhà em có mấy quả đồi, ừ thì anh cũng tính cả rồi
Tại vì thích em nhiều quá nhưng em lại nói là "à lôi" (à lôi noọng)
Cũng định solo Hiphop cùng với trai bản nhưng mà thôi
Anh gửi vào trong câu rap cho em dính cả thính cả mồi
Nhà em có tới mấy quả đồi ừ thì anh cũng tính cả rồi (à lôi noọng)
Gặp em ở thung lũng, ném quả còn lên không trung
Anh bận đi tìm cảm hứng trong chuỗi ngày bị mông lung
Anh cầm trên tay cây nỏ, ngắm vào tâm nhưng không trúng
Nhưng mà lỡ bị em gây thương nhớ, bắn vào tim mà không súng
Trai bản em chơi đàn tính, còn anh thì gẩy guitar
Anh thì không biết múa khèn nhưng mà giỏi quẩy Vina
Yêu em mấy núi cũng trèo mặc dù không giỏi đi xa
Anh lại còn giỏi cả thi ca, biến homestay bản thành villa
Tấm lòng anh không phải thú dữ, không cần mổ bụng thì mới được xem
Mấy anh thanh niên trong bản phải biết uống rượu mới tán được em
Nhà sàn của em sẵn bậc nhưng nàng đồng ý mới có đường lên
Anh thì số vốn đen đủi không biết lần này liệu có được hên
Ừ thì noọng ơi, à lôi
Hai chúng mình thì cùng đẹp nết, đẹp cả đôi
Hội trai bản để anh dẹp hết, chấp cả hội
Trồng cây kín cả quả đồi, xong dắt em đi về nhà thôi
Ơi nọong ơi, ơi nọong ơi
Thương em mấy núi cũng trèo, mấy sông cũng lội, mấy đèo cũng qua
Nhà em ở ngay lưng đồi, nếu như có dịp mời chàng tới chơi
Tại vì thích em nhiều quá nhưng em lại nói là "à lôi"
Cũng định solo Hiphop cùng với trai bản nhưng mà thôi
Anh gửi vào trong câu rap cho em dính cả thính, cả mồi
Nhà em có mấy quả đồi, ừ thì anh cũng tính cả rồi
Tại vì thích em nhiều quá nhưng em lại nói là "à lôi" (à lôi noọng)
Cũng định solo Hiphop cùng với trai bản nhưng mà thôi
Anh gửi vào trong câu rap cho em dính cả thính, cả mồi
Nhà em có tới mấy quả đồi, ừ thì anh cũng tính cả rồi
À lôi
Một, hai, ba, yeah, nơng, thoong, tham
Đây là người miền núi phía Bắc Việt Nam (Việt Nam)
Hiên ngang, không thích luồn cúi (hiên ngang)
Flexing theo kiểu miền núi (flex, flex)
Ta chơi nhạc Trap, Hiphop trên bản làng
Bản này là bản chất, biến từ đất thành bản vàng
Từ những ngày khó khăn, các dân tộc còn tản mạn
Đến ngày chung tay cùng làm kinh tế, tiền chất đống như tải hàng
Và ta đi lên từ bàn tay trắng (từ bàn tay trắng)
Cần cù chịu khó, không nhờ may mắn (không nhờ may mắn)
Trải qua khó khăn một mưa hai nắng (một mưa hai nắng)
Người biết khiêm tốn là người hay thắng
À lôi, à lôi
Người miền núi chất nói à lôi, à lôi
Hiền lành nhưng chiến như gà chọi, gà chọi
Ở đây hay nói là à lôi, mọi người thường nói là à lôi
À lôi, à lôi
Người miền núi chất nói à lôi, à lôi
Hiền lành nhưng chiến như gà chọi
Ở đây hay nói là à lôi, mọi người thường nói là à lôi (à lôi)','cs018','rap','TG019','HD005','alb019')


Insert into BaiHat values('BH021',N'Problem',N'Uh-huh!
It"s Iggy Iggs!
I got one more problem with you girl, hey!
Hey baby, even though I hate ya, I wanna love ya (I want you)
And even though I can"t forgive ya, I really want to (I want you)
Tell me, tell me, baby, why can"t you leave me?
"Cause even though I shouldn"t want it, I gotta have it (I want you)
Head in the clouds
Got no weight on my shoulders
I should be wiser, and realize that I"ve got
One less problem without ya
I got one less problem without ya
I got one less problem without ya (I got one less, one less problem)
Problem, problem, problem (I got one less, one less problem)
Let"s go
I know you"re never gonna wake up
I gotta give up (but it"s you)
I know I shouldn"t ever call back or let you come back (but it"s you)
Every time you touch me and say you love me, I get a little bit breathless
I shouldn"t want it (but it"s you)
Head in the clouds
Got no weight on my shoulders
I should be wiser, and realize that I"ve got
One less problem without ya
I got one less problem without ya
I got one less problem without ya (I got one less, one less problem)
Problem, problem, problem (I got one less, one less problem)
It"s Iggy Iggs!
Uh, what you got?
Smart money bettin" I"ll be better off without you
In no time I"ll be forgettin" all about you
You sayin" that you know but I really, really doubt you understand
My life is easy when I ain"t around you
Iggy Iggy, too big to be here stressin"
I"m thinkin" I love the thought of you more than I love your presence
And the best thing now is probably for you to exit
I let you go, let you back, I finally learned my lesson
No half-stepping, either you want it or you just playin"
I"m listenin" to you knowin" I can"t believe what you"re sayin"
There"s a million yous, baby boo, so don"t be dumb
I got 99 problems but you won"t be one
Like what
Mm-mm na-na-na (one less, one less problem)
Mm-mm, yeah (one less, one less problem)
Head in the clouds
Got no weight on my shoulders
I should be wiser, and realize that I"ve got
One less problem without ya (hey)
I got one less problem without ya (no, babe)
I got one less problem without ya (ooh, ooh, baby) (I got one less, one less problem)
Problem, problem, problem (I got one less, one less problem, problem)
Hey
I got one less, one less, yeah (I got one less, one less problem)','cs019','usuk','TG020','HD010','alb020')

Insert into BaiHat values('BH022',N'Cheri Cheri Lady',N'Oh, I cannot explain
Every time it"s the same
Oh, I feel that it"s real
Take my heart
I"ve been lonely too long
Oh, I can"t be so strong
Take the chance for romance
Take my heart
I need you so
There"s no time I"ll ever go
Cheri, cheri lady
Goin" through a motion
Love is where you find it
Listen to your heart
Cheri, cheri lady
Living in devotion
It"s always like the first time
Let me take a part
Cheri, cheri lady
Like there"s no tomorrow
Take my heart, don"t lose it
Listen to your heart
Cheri, cheri lady
To know you is to love you
If you call me baby
I"ll be always yours
I get up, I get down
All my world turns around
Who is right? Who was wrong?
I don"t know
I"ve got pain in my heart
Got a love in my soul
Easy come, but I think
Easy go
I need you so
All the times I move so slow
Cheri, cheri lady
Goin" through a motion
Love is where you find it
Listen to your heart
Cheri, cheri lady
Living in devotion
It"s always like the first time
Let me take a part
Cheri, cheri lady
Like there"s no tomorrow
Take my heart, don"t lose it
Listen to your heart
Cheri, cheri lady
To know you is to love you
If you call me baby
I"ll be always yours
Cheri, cheri lady
Like there"s no tomorrow
Take my heart, don"t lose it
Listen to your heart
Cheri, cheri lady
To know you is to love you
If you call me baby
I"ll be yours
Cheri, cheri lady
Like there"s no tomorrow
Take my heart, don"t lose it
Listen to your heart
Cheri, cheri lady
To know you is to love you
If you call me baby
I"ll be yours','cs020','usuk','TG021','HD011','alb021')

Insert into BaiHat values('BH023',N'Brother Louie',N'Dear, love is a burning fire
Stay, "cause then the flames grows higher
Babe, don"t let him steal your heart
It"s easy, easy
Girl, this game can"t last forever
Why? We cannot live together
Try? Don"t let him take your love from me
You"re no good, can"t you see?
Brother Louie, Louie, Louie
I"m in love, set you free
Oh, she"s only looking to me
Only love breaks her heart
Brother Louie, Louie, Louie
Only love"s paradise
Oh, she"s only looking to me
Brother Louie, Louie, Louie
Oh, she"s only looking to me
Oh, let it Louie
She is undercover
Brother Louie, Louie, Louie
Oh, doing what he"s doing
So leave it Louie
"Cause I"m a lover
Stay, "cause this boy wants to gamble
Stay, love"s more than he can handle, girl
Oh, come and stay by me forever, ever
Why does he go on pretending?
That his love is never-ending, babe
Don"t let him steal your love from me
You"re no good, can"t you see?
Brother Louie, Louie, Louie
I"m in love, set you free
Oh, she"s only looking to me
Only love breaks her heart
Brother Louie, Louie, Louie
Only love"s paradise
Oh, she"s only looking to me
Brother Louie, Louie, Louie
Oh, she"s only looking to me
Oh, let it, Louie
She is undercover
Brother Louie, Louie, Louie
Oh, doing what he"s doing
So leave it Louie
"Cause I"m a lover
Brother Louie, Louie, Louie
Oh, she"s only looking to me
Oh, let it, Louie
She is undercover
Brother Louie, Louie, Louie
Oh, doing what he"s doing
So leave it Louie
"Cause I"m a lover
Brother Louie, Louie, Louie
Oh, she"s only looking to me
Oh, let it, Louie...','cs020','usuk','TG021','HD012','alb022')

Insert into BaiHat values('BH024',N'Peaches',N'I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)
And I see you (oh), the way I breathe you in (in), it"s the texture of your skin
I wanna wrap my arms around you, baby, never let you go, oh
And I say, oh, there"s nothing like your touch
It"s the way you lift me up, yeah
And I"ll be right here with you "til the end
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)
You ain"t sure yet, but I"m for ya
All I could want, all I can wish for
Nights alone that we miss more
And days we save as souvenirs
There"s no time, I wanna make more time
And give you my whole life
I left my girl, I"m in Mallorca
Hate to leave her, call it torture
Remember when I couldn"t hold her
Left her baggage for Rimowa
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)
I get the feeling, so I"m sure (sure)
Hand in my hand because I"m yours
I can"t, I can"t pretend, I can"t ignore you"re right for me
Don"t think you wanna know just where I"ve been, oh
Done being distracted
The one I need is right in my arms (oh)
Your kisses taste the sweetest with mine
And I"ll be right here with you "til end of time
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
(I get my light right from the source, yeah, yeah)
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)
I got my peaches out in Georgia (oh, yeah, shit)
I get my weed from California (that"s that shit)
I took my chick up to the North, yeah (badass bitch)
I get my light right from the source, yeah (yeah, that"s it)','cs021','usuk','TG022','HD013','alb023')

Insert into BaiHat values('BH025',N'Right Now',N'It"s been so long
That I haven"t seen your face
I"m tryna be strong
But the strength I have is washing away
It won"t be long
Before I get you by my side
And just hold you, tease you, squeeze you
Tell you what"s been on my mind
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
Girl, I know
Mistakes were made between us two
And we showed our ass that night
Even said some things weren"t true
Watched you go
And haven"t seen my girl since then
Why can"t it be the way it was
"Cause you were my homie, lover and friend
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
I can"t lie (I miss you much)
Watchin" every day that goes by (I miss you much)
Until I get you back, I"m gon" try (yes, I miss you much)
"Cause you are the apple of my eye (girl, I miss you much)
(I miss you much)
I can"t lie (I miss you much)
Watchin" every day that goes by (I miss you much)
Until I get you back, I"m gon" try (yes, I miss you much)
"Cause you are the apple of my eye (girl, I miss you much)
(I miss you much)
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na
I want you to fly with me (want you to fly)
I miss how you lie with me (miss how you lie)
Just wish you could dine with me (wish you could dine with me)
The one that"ll grind with me (said the one that"ll grind with me)
I want you to fly with me (want you to fly)
I miss how you lie with me (oh, miss how you lie)
Just wish you could dine with me (wish you could dine)
The one that"ll grind with me (oh, one that"ll grind, yeah, yeah)
I wanna make up right now, na, na
I wanna make up right now, na, na (make up)
Wish we never broke up right now, na, na
We need to link up right now, na, na (link up, baby)
I wanna make up right now, na, na
I wanna make up right now, na, na
Wish we never broke up right now, na, na
We need to link up right now, na, na (link up)','cs0022','usuk','TG0023','HD0013','alb0024')

Insert into BaiHat values('BH026',N'Dòng máu Việt Nam',N'Dòng máu lạc hồng
Bốn nghìn năm
Dòng máu đỏ tươi
Chảy trong tim mình
Nòi giống lạc hồng
Giống rồng tiên
Nguyện ôm
Bao đời đất mẹ
Nhịp trống hào hùng
Mãi còn vang
Bao lớp người đi
Ra nơi biên thùy
Hình bóng mẹ già
đứng đợi con
Tạc vào sử sách
Hào hùng
Việt Nam ơi
Yêu mến ngàn đời
Yêu lũy tre xanh
Có con sông chảy quanh
Nào ta hát
Khúc hát lạc hồng
Làm muôn cánh chim
Bay rợp biển đông
Việt Nam ơi
Hãy nắm chặt tay
Tiến bước đi lên
Viết thêm trang sử vàng
Nào ta hát
Khúc hát Việt Nam
Con cháu Rồng Tiên
Con cháu lạc hồng
Tự hào hai tiếng
Việt Nam
Dòng máu lạc hồng
Bốn nghìn năm
Dòng máu đỏ tươi
Chảy trong tim mình
Nòi giống lạc hồng
Giống rồng tiên
Nguyện ôm
Bao đời đất mẹ
Nhịp trống hào hùng
Mãi còn vang
Bao lớp người đi
Ra nơi biên thùy
Hình bóng mẹ già
đứng đợi con
Tạc vào sử sách
Hào hùng
Việt Nam ơi
Yêu mến ngàn đời
Yêu lũy tre xanh
Có con sông chảy quanh
Nào ta hát
Khúc hát lạc hồng
Làm muôn cánh chim
Bay rợp biển đông
Việt Nam ơi
Hãy nắm chặt tay
Tiến bước đi lên
Viết thêm trang sử vàng
Nào ta hát
Khúc hát Việt Nam
Con cháu Rồng Tiên
Con cháu lạc hồng
Tự hào hai tiếng
Việt Nam','cs023','cachmang','TG024','HD002','alb025')

Insert into BaiHat values('BH027',N'Bài Ca Xây Dựng',N'Bạn đời ơi
Bạn có nghe chăng niềm vui của những người
Dọn đến ngôi nhà mới mà chúng tôi vừa xây xong?
Và em thân yêu ơi
Ngày mai chúng ta lại lên đường đến những chân trời mới
Niềm vui của đôi ta
Về ngôi nhà thầm mong ước
Đã chan hòa trong niềm vui chung như nước sông ra biển lớn
Bạn đời ơi
Hãy tin, hãy yêu và hát cùng chúng tôi
Những người thợ xây tin yêu cuộc đời mới
Trong khói bom (trong khói bom)
Dưới ánh trăng (dưới ánh trăng)
Suốt bốn mùa (suốt bốn mùa)
Tôi vẫn xây (tôi vẫn xây)
Tiếng hát vui (tiếng hát vui)
Cho chúng tôi (cho chúng tôi)
Tiếng hát vui (tiếng hát vui)
Cho các bạn (cho các bạn)
Cho ngày nay, cho ngày mai, cho muôn đời sau
Cho ngày nay, cho ngày mai, cho muôn đời sau
Bạn đời ơi
Bạn có nghe chăng niềm vui của những người
Dọn đến ngôi nhà mới mà chúng tôi vừa xây xong?
Và em thân yêu ơi
Ngày mai chúng ta lại lên đường đến những chân trời mới
Niềm vui của đôi ta
Về ngôi nhà thầm mong ước
Đã chan hòa trong niềm vui chung như nước sông ra biển lớn
Bạn đời ơi
Hãy tin, hãy yêu và hát cùng chúng tôi
Những người thợ xây tin yêu cuộc đời mới
Trong khói bom (trong khói bom)
Dưới ánh trăng (dưới ánh trăng)
Suốt bốn mùa (suốt bốn mùa)
Tôi vẫn xây (tôi vẫn xây)
Tiếng hát vui (tiếng hát vui)
Cho chúng tôi (cho chúng tôi)
Tiếng hát vui (tiếng hát vui)
Cho các bạn (cho các bạn)
Cho ngày nay, cho ngày mai, cho muôn đời sau
Cho ngày nay, cho ngày mai, cho muôn đời sau
Bạn đời ơi
Hãy tin, hãy yêu và hát cùng chúng tôi
Những người thợ xây tin yêu cuộc đời mới
Trong khói bom (trong khói bom)
Dưới ánh trăng (dưới ánh trăng)
Suốt bốn mùa (suốt bốn mùa)
Tôi vẫn xây (tôi vẫn xây)
Tiếng hát vui (tiếng hát vui)
Cho chúng tôi (cho chúng tôi)
Tiếng hát vui (tiếng hát vui)
Cho các bạn (cho các bạn)
Cho ngày nay, cho ngày mai, cho muôn đời sau
Cho ngày nay, cho ngày mai
Cho muôn đời sau','cs024','cachmang','TG025','HD002','alb026')

Insert into BaiHat values('BH028',N'Mãi Mãi Việt Nam',N'Đời mình là một khúc quân hành
Đời mình là bài ca chiến sĩ
Ta ca vang triền miên qua tháng ngày
Lượn bay trên núi đồi biên cương đến nơi đảo xa
Mãi mãi lòng chúng ta
Ca bài ca người lính
Mãi mãi lòng chúng ta
Vẫn hát khúc quân hành ca
Dù rằng đời ta thích hoa hồng
Kẻ thù buộc ta ôm cây súng
Ta yêu sao làng quê non nước mình
Tình quê hương vút thành thanh âm khúc quân hành ca
Mãi mãi lòng chúng ta
Ca bài ca người lính
Mãi mãi lòng chúng ta
Vẫn hát khúc quân hành ca
Đời mình là một khúc quân hành
Đời mình là bài ca chiến sĩ
Ta ca vang triền miên qua tháng ngày
Lượn bay trên núi đồi biên cương đến nơi đảo xa
Mãi mãi lòng chúng ta
Ca bài ca người lính
Mãi mãi lòng chúng ta
Vẫn hát khúc quân hành ca
Dù rằng đời ta thích hoa hồng
Kẻ thù buộc ta ôm cây súng
Ta yêu sao làng quê non nước mình
Tình quê hương vút thành thanh âm khúc quân hành ca
Mãi mãi lòng chúng ta
Ca bài ca người lính
Mãi mãi lòng chúng ta
Vẫn hát khúc quân hành ca
Mãi mãi lòng chúng ta
Ca bài ca người lính
Mãi mãi lòng chúng ta
Vẫn hát khúc quân hành ca
Vẫn hát khúc quân hành ca
Vẫn hát khúc quân hành ca','cs025','cachmang','TG026','HD002','alb028')

Insert into BaiHat values('BH029',N'Tiếng Đàn Ta Lư',N'Đi chiến trường gùi trên vai nặng trĩu
Đàn Ta Lư em cất tiếng ca vui cùng núi rừng
Mừng thắng trận quê em
Từ trên đỉnh núi cao chon von
Thánh thót nhịp nhàng vang lời em ca
Theo nhịp bước quân đi trong tiếng đàn Ta Lư
Tính tính tính tính tính tính tính tính tang tang tình
Con chim Ch"rao xinh hót trên cành vui mừng công anh
Bộ đội giải phóng quân ơi anh thắng trận miền Tây Khe Sanh
Đồn Tà Cơn hôm nào bốc cháy đồi Đồng Chi xác Mỹ chất đầy
Kia trông một hai ba bốn năm sáu ngàn tên lính thủy đánh bộ Mỹ kia
Nó bị bắt trên rừng
Bộ đội giải phóng ơi các anh đánh hay hung oh
Đàn em reo ca ơi đàn Ta Lư
Rừng núi quê ta tưng bừng reo ca
Tiếng trống trận từ Gio An vọng tới
Rừng núi ta ơi hãy hát xây vui cùng bản làng
Mừng thắng trận Gio An
Từ trên đỉnh núi cao chon von thánh thót nhịp nhàng vang lời em ca
Vọng về đất Gio An vang tiếng đàn Ta Lư
Tính tính tính tính tính tính tính tính tang tang tình
Ơi anh pháo binh pháo ta gầm đạn nở như hoa
Đồn quân giặc bốc cao cao có tiếng đàn Ta Lư em reo
Hòa cùng anh tiếng kèn chiến thắng từ Trị Thiên đất lửa anh hùng
Kia trông một hai ba bốn năm sáu ngàn tên lính thủy đánh bộ Mỹ kia
Nó bò sát trên rừng
Bộ đội giải phóng ơi các anh đánh hay hung oh
Đàn em reo ca ơi đàn Ta Lư
Rừng núi quê ta tưng bừng reo ca
Tính tính tính tính tính tính tính tính tang tang tình
Ơi anh pháo binh pháo ta gầm đạn nở như hoa
Đồn quân giặc bốc cao cao có tiếng đàn Ta Lư em reo
Hòa cùng anh tiếng kèn chiến thắng từ Trị Thiên đất lửa anh hùng
Kia trông một hai ba bốn năm sáu ngàn tên lính thủy đánh bộ Mỹ kia
Nó bò sát trên rừng
Bộ đội giải phóng ơi các anh đánh hay hung oh','cs026','cachmang','TG027','HD002','alb029')

Insert into BaiHat values('BH030',N'Đất Nước Trọn Niềm Vui',N'Ta đi trong muôn ánh sao vàng, rừng cờ tung bay!
Rộn ràng bao mê say những bước chân dồn về đây.
Sài Gòn ơi!
Vững tin đã bao năm rồi một ngày vui giải phóng.

Ta nghe như vang tiếng Bác Hồ dậy từ non sông!
Rạo rực sao hôm nay, Bác vui với hội toàn dân.
Thành Đồng ơi!
Sắc son đã vang khải hoàn.
Ôi! Hạnh phúc vô biên!
Hát nữa đi em, những lời yêu thương.

Hò ơ...ớ hò...ớ hò...ớ hò....
Hội toàn thắng náo nức đất nước,
Ta muốn bay lên, say ngắm sông núi hiên ngang,
Ta muốn reo vang, hát ca muôn đời Việt Nam,
Tổ quốc anh hùng!

Ôi quê hương dẫu bao lần giặc phá điêu tàn mà vẫn ngoan cường
Giành một ngày toàn thắng.
Đẹp quá!
Đời rực sáng những ánh mắt lấp lánh,
Ta muốn ôm hôn mỗi tấc đất quê hương,
Ta muốn ca vang bước chân những người chiến sĩ giải phóng kiên cường!

Đêm hoa đăng, những môi cười là bó hoa đời tươi thắm tuyệt vời,
Đẹp niềm tin mãi mãi Tổ Quốc muôn đời,
Trọn vẹn cả non sông thống nhất
Rạng rỡ Việt Nam','cs027','cachmang','TG028','HD014','alb027')


select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
join TheLoai tl on bh.matheloai=tl.matheloai
join TacGia tg on bh.matacgia=tg.matacgia
join HangDia hd on bh.mahangdia=hd.mahangdia
join Album al on bh.maalbum=al.maalbum

