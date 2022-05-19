import 'package:flutter/material.dart';
class AdvertiseScreen extends StatefulWidget {
  const AdvertiseScreen({Key? key}) : super(key: key);

  @override
  _AdvertiseScreenState createState() => _AdvertiseScreenState();
}

class _AdvertiseScreenState extends State<AdvertiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Can Dostum"), // Sonradan kaldırılabilir veya farkli bir title eklenebilir.

      ),
    );
  }
}
