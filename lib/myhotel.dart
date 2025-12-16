import 'package:flutter/material.dart';

class Myhotel extends StatelessWidget {
  const Myhotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Hotel'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            block1(),
            block2(),
            block3(),
            // const SizedBox(height: 10),
            Expanded(child: block4()),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    return Container(
      color: Colors.blue[800],
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orangeAccent, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
                SizedBox(width: 5),
                Text(
                  "Xung quanh vị trí hiện tại",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              "23 thg 10 – 24 thg 10",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget block2() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FilterButton(icon: Icons.sort, label: "Sắp xếp"),
          FilterButton(icon: Icons.tune, label: "Lọc"),
          FilterButton(icon: Icons.map_outlined, label: "Bản đồ"),
        ],
      ),
    );
  }

  Widget block3() {
    return Column(
      children: [
        Container(
          height: 10,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE0E0E0), Colors.white],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: const Text(
            "757 chỗ nghỉ",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget block4() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        HotelCard(
          name: "aNhill Boutique",
          location: "Huế - Cách bạn 0.6km",
          rating: 9.5,
          review: "Xuất sắc - 95 đánh giá",
          price: "US\$109",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlQLdhQl2PbyK_GdwiXDqnlhY-gvvFrs6imQ&s",
          roomInfo:
              "1 suite riêng tư: 1 giường",
          includeBreakfast: true,
          showStars: true,
        ),
        HotelCard(
          name: "An Nam Hue Boutique",
          location: "Cư Chính - Cách bạn 0.9km",
          rating: 9.2,
          review: "Tuyệt hảo - 34 đánh giá",
          price: "US\$20",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQkFjVkPE6FUVTB5eYUeYfEl5bpGO1vrgMQ&s",
          roomInfo:
              "1 biệt thự nguyên căn • 1000 m² • 4 giường • 3 phòng ngủ • 1 phòng khách • 3 phòng tắm",
          includeBreakfast: true,
        ),
        HotelCard(
          name: "Huế Jade Hill Villa",
          location: "Cư Chính - Cách bạn 1,3km",
          rating: 8.0,
          review: "Rất tốt • 1 đánh giá",
          price: "US\$285",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHi7ze6rdSAwxH8Qb5VaFN70pre0OIW5zkGA&s",
          includeBreakfast: false,
          subTitle: "Được quản lý bởi một host cá nhân",
          roomInfo:
              "1 biệt thự nguyên căn • 1000 m² • 4 giường • 3 phòng ngủ • 1 phòng khách • 3 phòng tắm",
          notePricing: "Chỉ còn 1 căn với giá này trên Booking.com",
          freeCancel: "Không cần thanh toán trước",
        ),
      ],
    );
  }
}

class HotelCard extends StatelessWidget {
  final String name;
  final bool showStars;
  final String location;
  final double rating;
  final String review;
  final String price;
  final String imageUrl;
  final bool includeBreakfast;
  final String? subTitle;
  final String? roomInfo;
  final String? notePricing;
  final String? freeCancel;

  const HotelCard({
    super.key,
    required this.name,
    this.showStars = false,
    required this.location,
    required this.rating,
    required this.review,
    required this.price,
    required this.imageUrl,
    this.includeBreakfast = false,
    this.subTitle,
    this.roomInfo,
    this.notePricing,
    this.freeCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------ IMAGE ------
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 120,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                if (includeBreakfast)
                  Positioned(
                    width: 120,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Bao bữa sáng",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),

            // ------ CONTENT ------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề + icon tim
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.favorite_border, size: 20),
                    ],
                  ),
                  if (showStars)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                        ),
                      ),
                    ),

                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                  const SizedBox(height: 4),

                  // Rating + đánh giá
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          rating.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          review,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Text(location, style: const TextStyle(fontSize: 13)),

                  if (roomInfo != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      roomInfo!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],

                  const SizedBox(height: 6),

                  // Giá
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),

                  if (notePricing != null)
                    Text(
                      notePricing!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),

                  if (freeCancel != null)
                    Text(
                      "✔ $freeCancel",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22, color: Colors.black87),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}
