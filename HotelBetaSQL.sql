


create table [User](
id int primary key identity(1,1),
username varchar(20),
password varchar(20),
role varchar(15))



create table Room(
roomID int primary key identity(1,1),
roomTypeID int foreign key references RoomsType(RoomTypeID),
isAvailable int,
name nvarchar(max)
)



create table ImagesRoom(
	id int primary key identity(1,1),
	url varchar(max),
	roomTypeID int foreign key references RoomsType(RoomTypeID)
)

create table RoomsType(
roomTypeID int primary key identity(1,1),
name nvarchar(40),
description nvarchar(max),
quantity int,
overview nvarchar(max),
featured nvarchar(max),
price money,
capacity int ,
thumbnail varchar(max),
isActive int
)


create table Service(
id int primary key identity(1,1),
name nvarchar(max),
price money,
description nvarchar(max),
markdown nvarchar(max),
thumbnail varchar(max))

create table ImagesService(
	id int primary key identity(1,1),
	url varchar(max),
	serviceID int foreign key references Service(id)
)

CREATE TABLE BookingInfor (
	id INT IDENTITY(1,1) PRIMARY KEY,
	user_id INT FOREIGN KEY REFERENCES [User](id),
	customer_name NVARCHAR(50),
    customer_address NVARCHAR(50),
    customer_phone VARCHAR(11),
    customer_email VARCHAR(50),
    check_in_date DATE,
    check_out_date DATE,
	quantity int
)

alter table BookingInfor add quantity int


CREATE TABLE Booking (
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
	room_id INT FOREIGN KEY REFERENCES Room(roomID),
	booking_infor INT FOREIGN KEY REFERENCES BookingInfor(id),
);


--Khai báo

-- Thêm các phòng của Senior Room (P301 đến P310)
SET @roomTypeId = (SELECT roomTypeId FROM RoomsType WHERE name = 'PHÒNG SENIOR')
SET @roomId = 301 -- Số phòng bắt đầu
WHILE @roomId <= 310
BEGIN
    INSERT INTO Room ( roomTypeID, isAvailable,name)
    VALUES ( @roomTypeId,1,@roomId)
	SET @roomId = @roomId + 1
END

-- Thêm các phòng của Connecting Room (P401 đến P410)
SET @roomTypeId = (SELECT roomTypeId FROM RoomsType WHERE name = 'PHÒNG CONNECTING')
SET @roomId = 401 -- Số phòng bắt đầu
WHILE @roomId <= 410
BEGIN
    INSERT INTO Room (roomTypeID,isAvailable,name)
    VALUES ( @roomTypeId,0,@roomId)
    SET @roomId = @roomId + 1
END
select * from RoomsType
DECLARE @roomId INT
DECLARE @roomTypeId INT
-- Thêm các phòng của Tripple Room (P201 đến P210)
SELECT @roomTypeId = (SELECT roomTypeID FROM RoomsType WHERE name = 'PHÒNG TRIPLE')

SET @roomId = 201 -- Số phòng bắt đầu
WHILE @roomId <= 210
BEGIN
    INSERT INTO Room (roomTypeID,isAvailable,name)
    VALUES (@roomTypeId, 1 ,@roomId)
    SET @roomId = @roomId + 1
END







------------------------------------------------------------------
-- INSERT FOR SERVICE---
INSERT INTO Service (name, description,price,thumbnail,markdown) VALUES (
	N'TIỆC BBQ BÃI BIỂN',
	N'Trở lại bãi biển và nấu các công thức nấu ăn từ masterchef của chúng tôi.',
	100000,
	'https://luxehotel.webhotel.vn/files/images/dv/Corallo-FIRE-set-up-e1554377061139.jpg',
	N'<p>Một trong những trải nghiệm không thể bỏ qua khi đến với chúng tôi, đó là thưởng thức bữa tiệc nướng BBQ lãng mạn và riêng tư trong thời khắc chuyển giao hoàng hôn tuyệt đẹp khi màn đêm buông xuống, bên cạnh là nến và tiếng sóng biển vỗ rì rào. Ánh than hồng đỏ ửng, tôm hùm và các món thịt, hải sản tươi ngon đã sẵn sàng. Bạn còn chờ gì nữa?<br>
<br>
<strong>Thời gian</strong><br>
Quý khách tự do chọn lựa thời gian cho bữa tối. Thường là 2 tiếng và nên bắt đầu từ 6:00 tối.</p>'
)
INSERT INTO Service (name, description,price,thumbnail,markdown) VALUES (
	N'HƯỚNG DẪN VIÊN DU LỊCH THÀNH PHỐ',
	N'Khám phá thành phố với hướng dẫn viên du lịch trong nhà của chúng tôi. Chúng tôi đã trở lại của bạn.',
	200000,
	'https://luxehotel.webhotel.vn/files/images/dv/tim-hieu-thu-nhap-cua-huong-dan-vien-du-lich-quoc-te-03.jpg',
	N'<p><span style="font-size:12px"><span style="color:rgb(49, 49, 49); font-family:arial,helvetica,sans-serif">Hướng dẫn viên của chúng tôi với đội ngũ nòng cốt là những hướng dẫn viên lâu năm trong nghề với kinh nghiệm, kỹ năng, kiến thức thuộc loại tốt trong ngành du lịch và sau này thêm vào những Hướng dẫn viên được công ty đào tạo, bồi dưỡng thực tế trên các chuyến tour nên đảm bảo uy tín cho quý khách khi gọi đến chúng tôi</span></span></p>'
)
INSERT INTO Service (name, description,price,thumbnail,markdown) VALUES (
	N'BỮA SÁNG MIỄN PHÍ',
	N'Đừng tiêu một xu cho bữa sáng. Đó hoàn toàn là do chúng tôi.',
	0,
	'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-1.jpg',
	N'<div style="text-align: justify;">Thực đơn buffet sáng của khách sạn rất đa dạng và phong phú, bao gồm các món Âu, Á đến các món thuần Việt. Du khách có thể dễ dàng lựa chọn thực đơn phù hợp với nhu cầu, khẩu vị và sở thích của bản thân.</div>'
)
INSERT INTO Service (name, description,price,thumbnail,markdown) VALUES (
	N'ĐƯA ĐÓN SÂN BAY',
	N'Chúng tôi sẽ đón từ sân bay trong khi bạn thoải mái trên chuyến đi của mình.',
	230000,
	'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-1.jpg',
	N'<div class="service-des">
                    <div>
<p>Lần đầu tiên du lịch đến một miền đất mới, tìm xe ở sân bay có thể không dễ dàng. Đừng để bản thân bị bối rối hoặc làm khó khi bị bao vây bởi đội quân taxi dù đông đảo, trong khi hàng người đợi taxi sân bay chính hãng thì dài không điểm dừng?</p>

<p>Hãy để chúng tôi&nbsp;chăm sóc trải nghiệm cho bạn một cách trọn vẹn nhất. Đặt dịch vụ đưa đón sân bay của chúng tôi để có thể dễ dàng chọn được chuyến đi phù hợp với nhu cầu và đón nhận cảm giác thoải mái nhất sau chuyến bay.</p>

<p><u><strong>1. Dịch vụ Đón sân bay</strong></u></p>

<div class="btgrid" style="box-sizing: border-box; color: rgb(90, 90, 90); font-family: UTMAvo; font-size: 15px; background-color: rgb(245, 245, 245);">
<div class="row row-1" style="box-sizing: border-box; margin-left: -15px; margin-right: -15px;">
<div class="col col-md-6" style="box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 600px;">
<div class="content" style="box-sizing: border-box;">
<ul>
	<li>
	<p style="text-align:justify">Đón sân bay bằng xe riêng cho 1- 4 khách<br>
	Giá: Tùy theo thời&nbsp;điểm</p>
	</li>
</ul>
</div>
</div>

<div class="col col-md-6" style="box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 600px;">
<div class="content" style="box-sizing: border-box;">
<ul>
	<li>
	<p style="text-align:justify">Đón sân bay bằng xe riêng cho 5-12 khách<br>
	Giá: Tùy theo thời&nbsp;điểm</p>
	</li>
</ul>
</div>
</div>
</div>
</div>
<span style="color:rgb(90, 90, 90); font-family:utmavo; font-size:15px">* Vui lòng cung cấp Mã số chuyến bay, giờ đến và số lượng khách để đặt dịch vụ. Phụ thu thêm đối với&nbsp;các chuyến bay có giờ đến sau 21:00</span></div>

<div style="text-align: justify;">&nbsp;</div>

                </div>'
)


--------------- INSERT FOR ROOMTYPE -------------------------
INSERT INTO RoomsType (name, description,overview, featured,quantity,price, capacity, thumbnail) VALUES
(
    N'PHÒNG SENIOR', 
    N'Phòng Senior được trang bị nội thất tiện nghi đầy đủ. Các chi tiết trong phòng được thiết kế hài hòa, nhẹ nhàng. Đặc biệt, một số phòng được thiết kế thông nhau rất phù hợp với các gia đình đông thành viên, tạo không gian liên kết chung các thành viên trong gia đình khi vui chơi, và có được không gian riêng khi nghỉ ngơi thư giãn.',
    N'<h3>Tổng quan</h3><p>Diện tích phòng: 30m2</p><p>Loại giường: 1 Giường đôi</p><ul><li>02 trà, 02 cà phê, 02 nước lọc miễn phí trong phòng</li><li>Bữa sáng hàng ngày</li></ul>',
    N'<h3>Đặc trưng</h3><p>Chính sách trẻ em: Tối đa hai trẻ em dưới 6 tuổi được miễn phí lưu trú và ăn sáng.</p><p>Giờ nhận phòng: Sau 14:00 PM</p><p>Giờ trả phòng: Trước 12:00 AM</p><ul><li>Trước 18:00 PM: 50% tiền phòng</li><li>Sau 18:00 PM: 100% tiền phòng</li></ul>',
    26,
	1500000,
    3,
    'https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Boos-Apartmen3t.jpg'
),

(
N'PHÒNG TRIPLE', 
N'Phòng Triple có ban công với thiết kế hiện đại, được trang bị nội thất tiện nghi. Các chi tiết trong phòng được thiết kế hài hòa, nhẹ nhàng giúp đưa bạn về trạng thái thư giãn tuyệt đối. Phòng được lắp đặt cửa sổ kính giúp quý khách ngắm nhìn toàn cảnh khu nghỉ dưỡng xinh đẹp.',
N'<h3>Tổng quan</h3><p>Diện tích phòng: 35m2</p><p>Loại giường: 3 Giường đơn</p><ul><li>02 trà, 02 cà phê, 02 nước lọc miễn phí trong phòng</li><li>Bữa sáng hàng ngày</li></ul>',
N'<h3>Đặc trưng</h3><p>Chính sách trẻ em: Tối đa hai trẻ em dưới 6 tuổi được miễn phí lưu trú và ăn sáng.</p><p>Giờ nhận phòng: Sau 14:00 PM</p><p>Giờ trả phòng: Trước 12:00 AM</p><ul><li>Trước 18:00 PM: 50% tiền phòng</li><li>Sau 18:00 PM: 100% tiền phòng</li></ul>', 
2000000,
30,
2,
'https://luxehotel.webhotel.vn/files/images/room/Triple-Room-with-Balcony/Triple-Room-with-Balcony.jpg'
),

(
N'PHÒNG CONNECTING', 
N'Phòng Connecting với không gian rộng rãi, được thiết kế thông minh giữa hai phòng có cửa kết nối, phù hợp cho các gia đình hoặc nhóm bạn bè muốn ở cùng nhau nhưng vẫn đảm bảo không gian riêng tư.',
N'<h3>Tổng quan</h3><p>Diện tích phòng: 40m2</p><p>Loại giường: 1 Giường đôi</p><ul><li>02 trà, 02 cà phê, 02 nước lọc miễn phí trong phòng</li><li>Bữa sáng hàng ngày</li></ul>',
N'<h3>Đặc trưng</h3><p>Chính sách trẻ em: Tối đa hai trẻ em dưới 6 tuổi được miễn phí lưu trú và ăn sáng.</p><p>Giờ nhận phòng: Sau 14:00 PM</p><p>Giờ trả phòng: Trước 12:00 AM</p><ul><li>Trước 18:00 PM: 50% tiền phòng</li><li>Sau 18:00 PM: 100% tiền phòng</li></ul>', 
30000000,
23,
2,
'https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Apartment-5.jpg'
),

(
N'PHÒNG DELUXE', 
N'Phòng Deluxe mang đến không gian nghỉ dưỡng lý tưởng với trang thiết bị hiện đại và tiện nghi. Các chi tiết trong phòng được chăm chút tỉ mỉ, tạo nên một không gian thoải mái, dễ chịu cho quý khách.',
N'<h3>Tổng quan</h3><p>Diện tích phòng: 30m2</p><p>Loại giường: 1 Giường đôi 1m8</p><ul><li>02 trà, 02 cà phê, 02 nước lọc miễn phí trong phòng</li><li>Bữa sáng hàng ngày</li></ul>',
N'<h3>Đặc trưng</h3><p>Chính sách trẻ em: Tối đa hai trẻ em dưới 6 tuổi được miễn phí lưu trú và ăn sáng.</p><p>Giờ nhận phòng: Sau 14:00 PM</p><p>Giờ trả phòng: Trước 12:00 AM</p><ul><li>Trước 18:00 PM: 50% tiền phòng</li><li>Sau 18:00 PM: 100% tiền phòng</li></ul>', 2300000,52,4,'https://luxehotel.webhotel.vn/files/images/room/deluxe/Deluxe-Room-1.jpg'
);
select * from RoomsType
---------- INSERT INTO IMAGES ROOM ----------
INSERT INTO ImagesRoom (url, roomTypeID) VALUES
('https://luxehotel.webhotel.vn/files/images/room/Triple-Room-with-Balcony/Triple-Room-with-Balcony.jpg', 6),
('https://luxehotel.webhotel.vn/files/images/room/Triple-Room-with-Balcony/Triple-Room-with-Balcony2.jpg', 6),
('https://luxehotel.webhotel.vn/files/images/room/Triple-Room-with-Balcony/Triple-Room-with-Balcony6.jpg', 6),
('https://luxehotel.webhotel.vn/files/images/room/Triple-Room-with-Balcony/Triple-Room-with-Balcony-Twin.jpg', 6),
('https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Apartment-5.jpg', 7),
('https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Boos-Apartment.jpg', 7),
('https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Apartment-3.jpg', 7),
('https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Senior-Deluxe-Room.jpg', 7),
('https://luxehotel.webhotel.vn/files/images/room/Senior-Deluxe-Room/Bedroom-Boos-Apartment.jpg', 8),
('https://luxehotel.webhotel.vn/Files/_thumbs/images/room/Senior-Deluxe-Room/Bedroom-Apartment-3.jpg', 8),
('https://luxehotel.webhotel.vn/Files/_thumbs/images/room/Senior-Deluxe-Room/Bedroom-Boos-Apartment.jpg', 8),
('https://luxehotel.webhotel.vn/Files/_thumbs/images/room/Senior-Deluxe-Room/Senior-Deluxe-Room.jpg', 8),
('https://luxehotel.webhotel.vn/files/images/room/deluxe/Deluxe-Room-1.jpg', 9),
('https://luxehotel.webhotel.vn/files/images/room/deluxe/Deluxe-Room-2.jpg', 9),
('https://luxehotel.webhotel.vn/files/images/room/deluxe/Deluxe-Room-5.jpg', 9),
('https://luxehotel.webhotel.vn/files/images/room/deluxe/Deluxe-Room-3.jpg', 9);


---------- INSERT FOR IMAGES SERVICE -------------------
INSERT INTO ImagesService(url, serviceID)
VALUES
('https://luxehotel.webhotel.vn/files/images/dv/tiec-bbq-bai-bien/bua-tiec-bbq-thinh-soan-ngay-trong-moi-can-villa-cua-premier-village-phu-quoc-resort-06-_7693.jpg', 1),
('https://luxehotel.webhotel.vn/files/images/dv/tiec-bbq-bai-bien/186479360_195632689071070_7674385599091351194_n.jpg', 1),
('https://luxehotel.webhotel.vn/files/images/dv/tiec-bbq-bai-bien/bbq-phong-cach-nhat.jpg', 1),
('https://luxehotel.webhotel.vn/files/images/dv/tiec-bbq-bai-bien/Nyaman---Beach-BBQ.jpg', 1),
( 'https://luxehotel.webhotel.vn/files/images/dv/huong-dan-vien-/ffdab1d3f7484ffe7aec6bb3dc9e38-4329-3842-1649493519.jpg',2),
( 'https://luxehotel.webhotel.vn/files/images/dv/huong-dan-vien-/Lan-Ha-1-9636-1650464807.jpg',2),
( 'https://luxehotel.webhotel.vn/files/images/dv/huong-dan-vien-/thac-ban-gioc-16629689901401757210423.jpg',2),
( 'https://luxehotel.webhotel.vn/files/images/dv/huong-dan-vien-/du-lich-viet-nam-2020-1.jpg',2),
( 'https://luxehotel.webhotel.vn/files/images/dv/huong-dan-vien-/1545276593_305_bali-guide_jpg.jpg',2),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/vai-tro-cua-bua-sang-la-gi-thoi-diem-an-sang-tot-nhat-la-khi-nao.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/herbal_2.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/1111-1200x676-7.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/trung-06395835.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/picture-43-1646995545-668-width1200height900.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/bua-sang-bo-sung/sua-chua.jpg',3),
( 'https://luxehotel.webhotel.vn/files/images/dv/san-bay/Doan-ket-cung-cap-nhieu-loai-xe-phuc-vu-nhu-cau-dua-don-san-bay.jpg',4),
( 'https://luxehotel.webhotel.vn/files/images/dv/san-bay/xe-limousine-ha-noi-di-ha-long-quang-ninh-1-1200x801.jpg',4),
( 'https://luxehotel.webhotel.vn/files/images/dv/san-bay/thue-xe-dua-don-san-bay-24.jpg',4)


select * from Room
select * from BookingInfor 
select * from Booking
select * from RoomsType
select * from Room

DECLARE @CheckInDate DATE = '2024-03-15';
DECLARE @CheckOutDate DATE = '2024-03-15';
DECLARE @Today DATE = GETDATE();
DECLARE @RoomTypeID INT = 7;


SELECT	roomID,
		R.roomTypeID,
		R.name 
FROM Room R
INNER JOIN RoomsType RT ON R.roomTypeID = RT.roomTypeID
WHERE R.isAvailable = 1 AND RT.roomTypeID = @RoomTypeID
AND NOT EXISTS (
    SELECT 1
    FROM Booking B
    INNER JOIN BookingInfor BI ON B.booking_infor = BI.id
    WHERE B.room_id = R.roomID
	AND NOT (CAST(@CheckOutDate AS DATE) <= BI.check_in_date OR CAST(@CheckInDate AS DATE) >= BI.check_out_date)
);



DECLARE @startDate DATE = '2024-03-17';
DECLARE @endDate DATE = '2024-03-21';

SELECT R.*, B.*,BI.*,RT.name AS roomTypeName
FROM Booking AS B
JOIN BookingInfor AS BI ON B.booking_infor = BI.id
JOIN Room AS R ON B.room_id = R.roomID
JOIN RoomsType AS RT ON R.roomTypeID = RT.roomTypeID
WHERE BI.user_id = 1
AND BI.check_in_date >= @startDate
AND BI.check_out_date <= @endDate;

UPDATE BookingInfor
SET quantity = (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.booking_infor = BookingInfor.id
)

SELECT quantity FROM BookingInfor BI
                JOIN Booking B ON BI.id = B.booking_infor
                WHERE B.booking_id = 4017;
SELECT quantity FROM BookingInfor WHERE id IN (SELECT booking_infor FROM Booking WHERE booking_id = 4017);

UPDATE BookingInfor
SET quantity = CASE 
                    WHEN quantity > 0 THEN quantity - 1 
                    ELSE quantity 
                END
WHERE id IN (SELECT booking_infor FROM Booking WHERE booking_id = 4028);

DELETE FROM BookingInfor
WHERE id IN (SELECT booking_infor FROM Booking WHERE booking_id = 4028) AND quantity = 1;

DELETE FROM Booking WHERE booking_id = 4028

select * from BookingInfor
select * from Booking


