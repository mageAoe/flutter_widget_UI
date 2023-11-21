import 'package:flutter/material.dart';

// 自定义组件导航
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextFileAnimation(),
    );
  }
}

class TextFileAnimation extends StatefulWidget {
  const TextFileAnimation({super.key});

  @override
  State<TextFileAnimation> createState() => _TextFileAnimationState();
}

class _TextFileAnimationState extends State<TextFileAnimation> {

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AppBar(
        leading: const Icon(Icons.ac_unit_sharp,color: Colors.cyanAccent),
        leadingWidth:  20,
        title: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: flag ? 350 : 200,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(237, 252, 243, 236)
          ),
          // child: Text("data"),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 4, 0), child: Icon(Icons.search, color: Colors.black45)),
              Text('手机', style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.w500)),
              Spacer(), // 中间用Expanded控件
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child:Icon( Icons.document_scanner_outlined, color: Colors.black45)),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.refresh),
          onPressed:(){
            setState(() {
              flag = !flag;
            });
          }
      ),
    );
  }
}
