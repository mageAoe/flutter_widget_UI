import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  final Color? color;
  const HomePage({super.key,this.color});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List users = [];

  void getHttp() async {
    // final response = await dio.get('http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory&cid=9&start=1&count=20&from=360chrome');
    final response = await dio.get('http://service.picasso.adesk.com/v1/vertical/vertical?limit=30&skip=180&adult=false&first=0&order=hot');
    print(response.data['res']['vertical']);
    setState(() {
      users = response.data['res']['vertical'];
    });
  }

  List<Widget> getTags(List<dynamic> list){
    List<String> widgetList = [];
    for (dynamic item in list) {
      widgetList.add(item as String);
    }
    return widgetList.map((item) {
      return Text(item);
    }).toList();
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
      backgroundColor: Colors.white,
      body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                children: [
                  Image.network(users[index]['img']),
                  Column(
                    children: getTags(users[index]['tag']),
                  )
                ],
              ),
              ),
            );
          },
      ),
    );
  }
}