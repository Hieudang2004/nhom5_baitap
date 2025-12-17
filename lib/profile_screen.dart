// lib/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  ProfileScreen({required this.userData});

  // Helper function để tạo các ô thông tin đẹp hơn
  Widget _buildProfileInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade800),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black87),
          overflow: TextOverflow.ellipsis, // Xử lý tràn chữ cho Token
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Thông tin cá nhân', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade700,
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Phần Header và Avatar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    // Dùng avatar từ API nếu có, nếu không thì dùng placeholder
                    backgroundImage: NetworkImage(userData['image'] ?? 'https://i.pravatar.cc/150?img=${userData['id']}'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Chào mừng, ${userData['firstName']} ${userData['lastName']}!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    userData['email'] ?? 'Không có Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),

            // Các ô thông tin chi tiết
            _buildProfileInfoTile(
              icon: Icons.badge,
              label: 'ID người dùng',
              value: '${userData['id']}',
            ),
            _buildProfileInfoTile(
              icon: Icons.person,
              label: 'Tên đăng nhập',
              value: '${userData['username']}',
            ),
            _buildProfileInfoTile(
              icon: Icons.cake,
              label: 'Giới tính',
              value: userData['gender']?.toUpperCase() ?? 'Không rõ',
            ),
            _buildProfileInfoTile(
              icon: Icons.lock_open,
              label: 'Token (Rất dài, không nên hiển thị hết)',
              value: '${userData['token']}', // Đây là chuỗi dài, sử dụng overflow: TextOverflow.ellipsis
            ),

            const SizedBox(height: 30),

            // Nút Đăng xuất
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Chức năng đăng xuất: Quay lại màn hình đăng nhập
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: Text(
                    'Đăng xuất',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}