import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Home'),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }

  Widget block1() {
    var src =
        'https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return SizedBox(
      width: double.infinity,
      height: 270, // Giới hạn chiều cao để tránh tràn
      child: Image.network(src, fit: BoxFit.cover),
    );
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [          
          Column(//tiêu đề
            children: [
              Text('Hoang Mạc Sahara',
                    style: TextStyle(
                    fontSize: 20, // cỡ chữ lớn
                    fontWeight: FontWeight.bold, // chữ đậm
                    ),
                  ),
              Text('Phía Bắc Châu Phi',
                    style: TextStyle(
                    fontSize: 15, // cỡ chữ nhỏ
                    color: Colors.black54,
                    ),
              )
            ],
          ),
          Row(//icon ngôi sao 
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.red),
              SizedBox(width: 5),
              Text("4.5"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(//cột 1
            children: const [
                   Icon(Icons.phone, color: Colors.blue),
                   SizedBox(height: 5),
                   Text("Gọi"),
                 ],
          ),
          Column(//cột 2
                 children: const [
                   Icon(Icons.near_me, color: Colors.blue),
                   SizedBox(height: 5),
                   Text("Điều hướng"),
                 ],
               ),
          Column(
                 children: const [
                   Icon(Icons.share, color: Colors.blue),
                   SizedBox(height: 5),
                   Text("Chia sẻ"),
                 ],
               ),
        ],
      ),
    );
  }

  Widget block4() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Sa mạc Sahara là sa mạc nóng lớn nhất thế giới, nằm ở phía bắc châu Phi, bao phủ một diện tích rộng lớn khoảng 9,2 triệu km² với địa hình đa dạng gồm đụn cát, cao nguyên đá, đồng bằng sỏi và cả những ốc đảo. Với khí hậu cực kỳ khô hạn, nhiệt độ cao và lượng mưa rất thấp, Sahara là một trong những nơi khô hạn nhất hành tinh, nhưng cũng chứa đựng nhiều cảnh quan bí ẩn và thu hút du khách.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
