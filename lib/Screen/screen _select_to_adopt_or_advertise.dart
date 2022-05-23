

// ignore_for_file: deprecated_member_use, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:untitled/Screen/screen_of_add_new_advertise.dart';
import 'package:untitled/Screen/screen_of_adopt.dart';


class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const ReadySelectionScreen());
  }
}

class ReadySelectionScreen extends StatefulWidget {
  const ReadySelectionScreen({Key? key}) : super(key: key);

  @override
  ReadySelectionScreenState createState() => ReadySelectionScreenState();
}

class ReadySelectionScreenState extends State<ReadySelectionScreen> {
  // the opacity
  double _opacity = 0;

  @override
  void initState() {
    _opacity = _opacity == 0 ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            opacity: _opacity,
            child:  Image(
        image: AssetImage ('assets/puppy.jpeg'),         // Köpek Resmı
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            opacity: _opacity,
            child:
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdoptScreen())); //  // İlanlara Bak Ekranına Yönlendiriyor
                },
                elevation: 20.0,
                color: Colors.amber,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: const Center(
                    child: Text(
                      'İlanlara Bak',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                )),
          ),
          // Using Curves.elasticInOut
          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              curve: Curves.elasticInOut,
              opacity: _opacity,
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenOfCreateAdvertisement())); // İlan ver Ekranına Yönlendiriyor.
                  },
                  elevation: 20.0,
                  color: Colors.blue,
                  child: Container(
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'İlan Ver',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
