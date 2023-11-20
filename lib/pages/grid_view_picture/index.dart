import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './models/Vertical.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart'; //图片缓存

class HomePage extends StatefulWidget {
  final Color? color;
  const HomePage({super.key,this.color});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List<Vertical> users = [];

  void getHttp() async {
    // final response = await dio.get('http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory&cid=9&start=1&count=20&from=360chrome');
    final response = await dio.get('http://service.picasso.adesk.com/v1/vertical/vertical?limit=30&skip=180&adult=false&first=0&order=hot');
    // print(response.data['res']['vertical']);
    List<Vertical> verticalList = (response.data['res']['vertical'] as List)
        .map((item) => Vertical.fromJson(item))
        .toList();
    setState(() {
      users = verticalList;
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
      backgroundColor: Colors.white,
      body:MasonryGridViewCountWidget(users: users)
      // body: Container(
      //   color: Colors.cyanAccent,
      //   width: 200,
      //   height: 200,
      //   child: CachedNetworkImage(
      //     placeholder: (context, url) => const CircularProgressIndicator(),
      //     imageUrl: 'https://lmg.jj20.com/up/allimg/1113/052420110515/200524110515-1-1200.jpg',
      //   ),
      // ),
    );
  }
}

class MasonryGridViewCountWidget extends StatelessWidget {
  List<Vertical> users = [];
  MasonryGridViewCountWidget({
    super.key,
    required this.users
  });

  List<Widget> getTags(List<String> list){
    return list.map((item) {
      return Text(item, style: GoogleFonts.dmSerifDisplay(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.bold));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:const  Color.fromRGBO(246, 247, 249, 1),// Color.fromRGBO(246, 247, 249, 1) rgba (246, 247, 249, 1)
      padding: const EdgeInsets.all(5),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 4,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
            margin: index / 2 == 0? const EdgeInsets.fromLTRB(0, 0, 5, 10): const EdgeInsets.fromLTRB(5, 0, 0, 10),
            // color: Colors.blue, // #f6f8fa
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(
              //   color: Colors.blue,
              //   width: 2,
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.2), // 阴影颜色
              //     spreadRadius: 5, // 阴影扩散程度
              //     blurRadius: 5, // 阴影模糊程度
              //     offset: Offset(0, 3), // 阴影偏移量
              //   ),
              // ],
            ),
            child: Column(
              children: [
                // Image.network(users[index].img),
                // "http://via.placeholder.com/350x150"
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: users[index].img,
                    // placeholder: (context, url) => const CircularProgressIndicator(),
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        LinearProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: getTags(users[index].tag),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

