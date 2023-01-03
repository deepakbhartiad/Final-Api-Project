
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.black),
          //     onPressed: () =>
          //         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()))),
          // title: Text(
          //   "HOME",
          // ),
          // centerTitle: true,
      )
    );
  }
}
