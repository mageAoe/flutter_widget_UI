class Vertical {
   late String img;
   late List<String> tag;

   Vertical({
      required this.img,
      required this.tag
   });

   factory Vertical.fromJson(Map<String, dynamic> json) {
      return Vertical(
         img: json['img'],
         tag: List<String>.from(json['tag']),
      );
   }
}