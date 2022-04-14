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
  final ValueChanged<String>? onSearchSubmit; //用户点击搜索框触发

  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  void _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.shwoLocation != null)
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
        if (widget.goBackCallback != null)
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
          height: 34.0,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(17.0)),
          margin: const EdgeInsets.only(right: 10.0),
          child: TextField(
            controller: _controller,
            onTap: widget.onSearch != null ? widget.onSearch!() : () {},
            onSubmitted: widget.onSearchSubmit,
            textInputAction: TextInputAction.search,
            style: const TextStyle(fontSize: 14.0),
            onChanged: (value) {
              setState(() {
                _searchWord = value;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入搜索词',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
                contentPadding: const EdgeInsets.only(top: 0.0, left: -15.0),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _onClean();
                  },
                  child: Icon(
                    Icons.clear,
                    size: 18.0,
                    color:
                        _searchWord == '' ? Colors.grey.shade200 : Colors.grey,
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 1.0, left: 5.0),
                  child: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                )),
          ),
        )),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: GestureDetector(
              onTap: () {}, // widget.onCancel!(),
              child: const Text(
                '取消',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
          ),
        if (widget.showMap != null)
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CommonImage('static/icons/widget_search_bar_map.png'),
          )
      ],
    );
  }
}
