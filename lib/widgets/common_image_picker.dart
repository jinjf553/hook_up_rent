import 'dart:io';

import 'package:flutter/material.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>>? onChange;

  const CommonImagePicker({Key? key, this.onChange}) : super(key: key);

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    Widget addButton = Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: const Center(
          child: Text(
        '+',
        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
      )),
    );

    Widget wrapper(String imageUri) {
      return Image.network(
        imageUri,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }

    List<Widget> list = defautImages.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        children: list,
        spacing: 10.0,
        runSpacing: 10.0,
      ),
    );
  }
}
