import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_data.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem> dataList;
  const IndexRecommend({Key? key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0x08000000)),
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(10.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '房屋推荐',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text(
              '更多',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5.0)),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: dataList
              .map((item) => Container(
                    child: IndexRecommendItemWidget(item),
                    decoration: const BoxDecoration(color: Colors.white),
                    width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
                    padding: const EdgeInsets.all(10.0),
                  ))
              .toList(),
        )
      ]),
    );
  }
}
