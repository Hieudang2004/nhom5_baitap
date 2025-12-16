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
import 'loginscreen.dart';


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
        '/bai12': (context) =>  LoginScreen(),
  
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
      // appBar: AppBar(title: const Text('Menu')),
      body: Column(
        children: [
          ListTile(
            leading: Icon(_isExpanded ? Icons.close : Icons.menu),
            title: const Text('DANH SÁCH BÀI TẬP'),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Home'),
                    onTap: () => Navigator.pushNamed(context, '/bai1'),
                  ),
                  ListTile(
                    title: const Text('Classroom'),
                    onTap: () => Navigator.pushNamed(context, '/bai2'),
                  ),
                  ListTile(
                    title: const Text('Guide'),
                    onTap: () => Navigator.pushNamed(context, '/bai3'),
                  ),
                  ListTile(
                    title: const Text('Hotel'),
                    onTap: () => Navigator.pushNamed(context, '/bai4'),
                  ),
                  ListTile(
                    title: const Text('Change Color App'),
                    onTap: () => Navigator.pushNamed(context, '/bai5'),
                  ),
                  ListTile(
                    title: const Text('Count Number App'),
                    onTap: () => Navigator.pushNamed(context, '/bai6'),
                  ),
                  ListTile(
                    title: const Text('Count Down Time App'),
                    onTap: () => Navigator.pushNamed(context, '/bai7'),
                  ),
                  ListTile(
                    title: const Text('FormLogin'),
                    onTap: () => Navigator.pushNamed(context, '/bai8'),
                  ),
                  ListTile(
                    title: const Text('FormRegister'),
                    onTap: () => Navigator.pushNamed(context, '/bai9'),
                  ),
                  ListTile(
                    title: const Text('Product List from API'),
                    onTap: () => Navigator.pushNamed(context, '/bai10'),
                  ),
                  ListTile(
                    title: const Text('NewsListScreen'),
                    onTap: () => Navigator.pushNamed(context, '/bai11'),
                  ),
                  ListTile(
                    title: const Text('Login Screen with API'),
                    onTap: () => Navigator.pushNamed(context, '/bai12'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}