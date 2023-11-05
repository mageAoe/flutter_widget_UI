import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  List users = [];

  void getHttp() async {
    final response = await dio.get('http://cdn.apc.360.cn/index.php?c=WallPaper&a=getAllCategoriesV2&from=360chrome');
    setState(() {
      users = response.data['data'];
    });
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index]['name']));
          }
      ),
    );
  }
}