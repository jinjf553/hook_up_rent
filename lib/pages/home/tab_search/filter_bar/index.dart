import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/item.dart';
import 'package:hook_up_rent/utils/common_picker/index.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: areaList.map((item) => item.name).toList());

    result!.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(
      () {
        setState(() {
          isAreaActive = false;
        });
      },
    );
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: rentTypeList.map((item) => item.name).toList());

    result!.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChange();
    }).whenComplete(
      () {
        setState(() {
          isRentTypeActive = false;
        });
      },
    );
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: priceList.map((item) => item.name).toList());

    result!.then((index) {
      if (index == null) return;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChange();
    }).whenComplete(
      () {
        setState(() {
          isPriceActive = false;
        });
      },
    );
  }

  _onFilterChange(context) {}

  _onChange() {
    if (widget.onChange != null) {
      widget.onChange!(FilterBarResult(
          areaId: areaId,
          priceId: priceId,
          rentTypeId: rentTypeId,
          moreIds: moreIds));
    }
  }

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
          Item(title: '区域', isActive: isAreaActive, onTap: _onAreaChange),
          Item(
              title: '方式',
              isActive: isRentTypeActive,
              onTap: _onRentTypeChange),
          Item(title: '租金', isActive: isPriceActive, onTap: _onPriceChange),
          Item(title: '筛选', isActive: isFilterActive, onTap: _onFilterChange),
        ],
      ),
    );
  }
}
