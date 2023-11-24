import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../../../utils/fonts.dart';

class ViewPicturePage extends StatefulWidget {
  final String imgUrl;
  const ViewPicturePage({super.key,required this.imgUrl});

  @override
  State<ViewPicturePage> createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends State<ViewPicturePage> {

   bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('壁纸'),
      ),
      body: Material(
        child: InkWell(
          onTap: (){
            setState(() {
              _visible = !_visible;
            });
          },
          child: Stack(
            children: [
              PhotoView(
                loadingBuilder: (context, progress) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                customSize: MediaQuery.of(context).size,
                backgroundDecoration: const BoxDecoration(color: Colors.white),
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 2,
                initialScale: PhotoViewComputedScale.contained * 1.1,
                basePosition: Alignment.center,
                imageProvider: NetworkImage(widget.imgUrl),
              ),
              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCirc,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                  child: Stack(
                    children: [
                      const Positioned(
                          right: 40,
                          bottom: 100,
                          child: Icon(IconFonts.xiai1,color: Colors.red,size: 40.0)
                      ),
                      Positioned(
                          right: 40,
                          bottom: 50,
                          child: IconButton(
                              onPressed: (){
                                print("开始下载");
                              }, icon: const Icon(IconFonts.xiazai,color: Colors.red,size: 40.0)
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
