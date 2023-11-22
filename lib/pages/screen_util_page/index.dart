import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Animations',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, designSize:const Size(1080, 2220));
    return const ExampleWidget(title: 'FlutterScreenUtil 示例',);
  }
}

class ExampleWidget extends StatefulWidget {
  final title;
  const ExampleWidget({super.key,this.title});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                      width: ScreenUtil().setWidth(540),
                      height: ScreenUtil().setHeight(200),
                      color: Colors.red,
                      child: Text(
                        '我的宽度:${0.5.sw}dp \n'
                            '我的高度:${ScreenUtil().setHeight(200)}dp',
                        style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                      width: 540.w,
                      height: 200.h,
                      color: Colors.blue,
                      child: Text(
                          '我的宽度:${540.w}dp \n'
                              '我的高度:${200.h}dp',
                          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34))),
                    ),
                  ],
                ),
                // Text('设备宽度:${ScreenUtil().scaleWidth}px'), // screenWidthPx
                // Text('设备高度:${ScreenUtil().screenHeight}px'),
                Text('设备宽度:${ScreenUtil().screenWidth}dp'),
                Text('设备高度:${ScreenUtil().screenHeight}dp'),
                Text('设备的像素密度:${ScreenUtil().pixelRatio}'),
                Text('底部安全区距离:${ScreenUtil().bottomBarHeight}dp'),
                Text('状态栏高度:${ScreenUtil().statusBarHeight}dp'),
                Text(
                  '实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Text('系统的字体缩放比例:${ScreenUtil().textScaleFactor}'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '我的文字大小在设计稿上是24px，不会随着系统的文字缩放比例变化',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      '我的文字大小在设计稿上是24px，会随着系统的文字缩放比例变化',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}
