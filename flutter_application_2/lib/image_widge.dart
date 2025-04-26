import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});
  final _url =
      "https://cdn.villacim.com.tr/uploads/640/618_izmir-saat-kulesi-gezilecek-yerler.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Widgets")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                width: 250,
                height: 250,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/cat.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 250,
                height: 250,
                color: Colors.blue.shade300,
                child: Image.network(_url, fit: BoxFit.cover),
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: "assets/images/cat.jpg",
              image: _url,
            ),
            const Expanded(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.jpg'),
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
