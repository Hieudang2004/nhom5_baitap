import 'package:flutter/material.dart';

class Myguide extends StatelessWidget {
  const Myguide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Guide'),
      ),
      body: SafeArea(child: myBody()),
    );
  }

  Widget myBody() {
    return Column(
      children: [
        block1(), //header
        const SizedBox(height: 10),
        const SizedBox(width: 10),
        block2(), //tiêu đề
        const SizedBox(height: 5),
        block3(),
        const SizedBox(height: 50),
        const SizedBox(width: 10),
        block4(),
        block5(),
        
      ],
    );
  }

  Widget block1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.notifications, size: 28, color: Colors.black),
        ),
        SizedBox(width: 15),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.settings, size: 28, color: Colors.black),
        ),
      ],
    );
  }

  Widget block2() {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome,',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: '\n'), // xuống dòng
                TextSpan(
                  text: 'Charlie',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), 
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            ), 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget block4() {
  return Padding(
    padding: EdgeInsets.only(left: 23),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Places',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget block5() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: GridView.count(
      shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(), 
      crossAxisCount: 2, 
      crossAxisSpacing: 12, 
      mainAxisSpacing: 12, 
      childAspectRatio: 1.5, 
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/Picture1.jpg', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/Picture2.jpg', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/Picture3.jpg', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/Picture4.jpg', fit: BoxFit.cover),
        ),
      ],
    ),
  );
}


}
