// main.dart
import 'package:flutter/material.dart';
import 'package:nhom5_baitap/screens/news_list_screen.dart';
import 'form_login.dart';
import 'form_register.dart';
import 'myhome.dart';
import 'myclassroom.dart';
import 'myguide.dart';
import 'myhotel.dart';
import 'change_color_app.dart';
import 'count_number_app.dart';
import 'count_time_app.dart';
import 'myproduct.dart';
import 'login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gộp nhiều bài',
      home: const HomeScreen(),
      routes: {
        '/bai1': (context) => const MyHome(),
        '/bai2': (context) => const Myclassrom(),
        '/bai3': (context) => const Myguide(),
        '/bai4': (context) => const Myhotel(),
        '/bai5': (context) => const ChangeColorApp(),
        '/bai6': (context) => const CountNumberApp(),
        '/bai7': (context) => const CountDownTimeApp(),
        '/bai8': (context) => const Formlogin(),
        '/bai9': (context) => const Formregister(),
        '/bai10': (context) => const MyProduct(),
        '/bai11': (context) => const NewsListScreen(),
        '/bai12': (context) => LoginScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANH SÁCH BÀI TẬP'),
        leading: IconButton(
          icon: Icon(_isExpanded ? Icons.close : Icons.menu),
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Row(
            children: [
              if (_isExpanded)
                Container(
                  width: 285,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(width: 15),

                            // Text
                            const Expanded(
                              child: Text(
                                'Họ tên: Đặng Duy Hiếu\nMã sinh viên: 22T1020114',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text('Bài 1 - Home'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai1'),
                            ),
                            ListTile(
                              title: Text('Bài 2 -Classroom'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai2'),
                            ),
                            ListTile(
                              title: Text('Bài 3 - Guide'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai3'),
                            ),
                            ListTile(
                              title: Text('Bài 4 - Hotel'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai4'),
                            ),
                            ListTile(
                              title: Text('Bài 5 - Change Color App'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai5'),
                            ),
                            ListTile(
                              title: Text('Bài 6 - Count Number App'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai6'),
                            ),
                            ListTile(
                              title: Text('Bài 7 - Count Down Time App'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai7'),
                            ),
                            ListTile(
                              title: Text('Bài 8 - FormLogin'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai8'),
                            ),
                            ListTile(
                              title: Text('Bài 9 - FormRegister'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai9'),
                            ),
                            ListTile(
                              title: Text('Bài 10 - Product List from API'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai10'),
                            ),
                            ListTile(
                              title: Text('Bài 11 - NewsListScreen'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai11'),
                            ),
                            ListTile(
                              title: Text('Bài 12 - Login Screen with API'),
                              trailing: Icon(Icons.chevron_right),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/bai12'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              // Nội dung chính
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Lập trình ứng dụng di động Nhóm 5",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
