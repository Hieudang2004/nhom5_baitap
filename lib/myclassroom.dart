import 'dart:math';
import 'package:flutter/material.dart';

class Myclassrom extends StatelessWidget {
  const Myclassrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Classroom'),
      ),
      body: SafeArea(child: myBody()),
    );
  }

  Widget myBody() {
    // Danh sách ảnh
    List<String> images = [
      "https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg",
      "https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg",
      "https://images.pexels.com/photos/3184325/pexels-photo-3184325.jpeg",
      "https://images.pexels.com/photos/4145194/pexels-photo-4145194.jpeg",
      "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg",
      "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg",
      "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg",
      "https://images.pexels.com/photos/3184643/pexels-photo-3184643.jpeg",
      "https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg",
      "https://images.pexels.com/photos/3861958/pexels-photo-3861958.jpeg",
      "https://images.pexels.com/photos/3184651/pexels-photo-3184651.jpeg",
      "https://images.pexels.com/photos/1181359/pexels-photo-1181359.jpeg",
      "https://images.pexels.com/photos/3184301/pexels-photo-3184301.jpeg",
      "https://images.pexels.com/photos/3184464/pexels-photo-3184464.jpeg",
      "https://images.pexels.com/photos/1181716/pexels-photo-1181716.jpeg",
      "https://images.pexels.com/photos/3184329/pexels-photo-3184329.jpeg",
      "https://images.pexels.com/photos/3184287/pexels-photo-3184287.jpeg",
      "https://images.pexels.com/photos/3184312/pexels-photo-3184312.jpeg",
      "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
    ];

    // Trộn ảnh để random thứ tự
    images.shuffle();

    return ListView(
      children: List.generate(10, (index) => item(index, images[index])),
    );
  }

  Color randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Widget item(int index, String imageUrl) {
    // Danh sách tiêu đề và mã lớp
    List<String> titles = [
      "Lập Trình Flutter",
      "Phát Triển Web",
      "Lập Trình Nâng Cao",
      "Trí Tuệ Nhân Tạo",
      "Mạng Máy Tính",
      "An Toàn Thông Tin",
      "Các Hệ Quản Trị Cơ Sở Dữ Liệu",
      "Java Nâng Cao",
      "Kỹ Thuật Phần Mềm",
      "Nguyên Lý Hệ Điều Hành"
    ];
    List<String> subtitles = [
      "TIN1001",
      "TIN1002",
      "TIN1003",
      "TIN1004",
      "TIN1005",
      "TIN1006",
      "TIN1007",
      "TIN1008",
      "TIN1009",
      "TIN1010"
    ];

    // Lấy tiêu đề và mã lớp theo index
    String title = titles[index % titles.length];
    String subtitle = subtitles[index % subtitles.length];
    String siSo = "${30 + Random().nextInt(30)} học viên"; // random sĩ số

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: randomColor(),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                ],
              ),
              Text(siSo, style: const TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.white),
          )
        ],
      ),
    );
  }
}