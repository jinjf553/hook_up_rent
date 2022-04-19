import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<GeneralType>> dataList =
        ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['_roomTypeList']!;
    orientedList = dataList['_orientedList']!;
    floorList = dataList['_floorList']!;
    List<String> selectedIds =
        ScopedModelHelper.getModel<FilterBarModel>(context)
            .selectedList
            .toList();
    _onChange(val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
          child: ListView(
        children: [
          const CommonTitle('户型'),
          FilterDrawerItem(
            list: roomTypeList,
            selectIds: selectedIds,
            onChange: _onChange,
          ),
          const CommonTitle('朝向'),
          FilterDrawerItem(
            list: orientedList,
            selectIds: selectedIds,
            onChange: _onChange,
          ),
          const CommonTitle('楼层'),
          FilterDrawerItem(
            list: floorList,
            selectIds: selectedIds,
            onChange: _onChange,
          ),
        ],
      )),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType>? list;
  final List<String>? selectIds;
  final ValueChanged<String>? onChange;

  const FilterDrawerItem({Key? key, this.list, this.selectIds, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list!.map((item) {
          var isActive = selectIds!.contains(item.id);
          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange!(item.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.white,
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: Center(
                  child: Text(
                item.name,
                style: TextStyle(color: isActive ? Colors.white : Colors.green),
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
