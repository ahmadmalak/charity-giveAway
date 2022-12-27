import 'package:flutter/material.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1C1B1B),
          elevation: 0,
          centerTitle: true,
          title: const Text('BookMark'),
        ),
        backgroundColor: const Color(0xff333333),
        body: Container());
  }
}
