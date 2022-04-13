import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool? shwoLocation; //展示位置按钮
  final Function? goBackCallback; //回退按钮函数
  final String? inputValue; //搜索框输入值
  final String? defaultInputValue; //搜索框默认值
  final Function? onCancel; //取消按钮
  final bool? showMap; //展示地图按钮
  final Function? onSearch; //用户点击搜索框触发

  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue,
      this.onCancel,
      this.showMap,
      this.onSearch})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.shwoLocation != null || true)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: (() {}),
              child: Row(
                children: const [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16.0,
                  ),
                  Text(
                    '北京',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        if (widget.goBackCallback != null || true)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {}, // widget.goBackCallback!(),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            ),
          ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.only(right: 10.0),
          child: const TextField(
            decoration: InputDecoration(hintText: '请输入搜索词'),
          ),
        )),
        if (widget.onCancel != null || true)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {}, // widget.onCancel!(),
              child: const Text(
                '取消',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
          ),
        if (widget.showMap != null || true)
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CommonImage('static/icons/widget_search_bar_map.png'),
          )
      ],
    );
  }
}
