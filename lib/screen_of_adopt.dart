import 'package:flutter/material.dart';
class AdoptScreen extends StatefulWidget {
  const AdoptScreen({Key? key}) : super(key: key);

  @override
  _AdoptScreenState createState() => _AdoptScreenState();
}

class _AdoptScreenState extends State<AdoptScreen> {
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
