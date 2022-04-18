import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/index.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SearchBar(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 41.0,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
