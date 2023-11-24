import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(1440, 3120),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Simple Animations',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: Typography.englishLike2018.apply(
                fontSizeFactor: 3.sp,
                displayColor: Colors.black
            ),
          ),
          home: child,
        );
      },
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    // ScreenUtil.init(context, designSize:const Size(1440, 3120)); // 1440, 3120 1080, 2220
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

  // 整屏宽度
  double winWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
// 整屏高度
  double winHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

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
                      width: ScreenUtil().setWidth(720),
                      height: ScreenUtil().setHeight(200),
                      color: Colors.red,
                      child: Text(
                        '我的宽度:${0.5.sw}dp \n'
                            '我的高度:${ScreenUtil().setHeight(200)}dp',
                        style: TextStyle(color: Colors.white, fontSize: 34.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                      width: 720.w,
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
                Text('设备高度:${ScreenUtil().screenHeight}dp',style:const TextStyle(color: Colors.black)),
                Text('设备的像素密度:${ScreenUtil().pixelRatio}',style:const TextStyle(color: Colors.black)),
                Text('底部安全区距离:${ScreenUtil().bottomBarHeight}dp',style:const TextStyle(color: Colors.black)),
                Text('状态栏高度:${ScreenUtil().statusBarHeight}dp',style:const TextStyle(color: Colors.black)),
                Text(
                  '实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}',
                  textAlign: TextAlign.center,
                   style:const TextStyle(color: Colors.black)
                ),
                Text(
                  '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
                  textAlign: TextAlign.center,
                    style:const TextStyle(color: Colors.black)
                ),
                SizedBox(
                  height: 100.h,
                ),
                Text('系统的字体缩放比例:${ScreenUtil().textScaleFactor}',style:const TextStyle(color: Colors.black)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '我的文字大小在设计稿上是32px，不会随着系统的文字缩放比例变化',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.sp,
                      ),
                    ),
                    Text(
                      '我的文字大小在设计稿上是32px，会随着系统的文字缩放比例变化',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: (winWidth(context) - 20) * 120 / 335,
                  width: winWidth(context) - 20,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    color: Colors.amber.withOpacity(0.5),
                  ),
                  child: const Text('模拟图片'),
                )
              ],
            )
        )
    );
  }
}
