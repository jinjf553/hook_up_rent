import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('首页-tabSearch'))),
      body: Column(
        children: [
          const SizedBox(
            height: 40.0,
            child: Text('filterBar'),
          ),
          Expanded(
            child: ListView(
              children: dataList
                  .map((item) => Container(
                        height: 200.0,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: const BoxDecoration(color: Colors.grey),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
