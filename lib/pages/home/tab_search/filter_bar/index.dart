import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/item.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(title: '区域', isActive: false, onTap: (context) {}),
          Item(title: '方式', isActive: false, onTap: (context) {}),
          Item(title: '租金', isActive: false, onTap: (context) {}),
          Item(title: '筛选', isActive: false, onTap: (context) {}),
        ],
      ),
    );
  }
}
