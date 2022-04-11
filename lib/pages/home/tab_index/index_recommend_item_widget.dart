import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

var textStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;
  const IndexRecommendItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pushNamed(data.navigateUri!);
      }),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(data.title!, style: textStyle),
              Text(data.subTitle!, style: textStyle),
            ],
          ),
          CommonImage(
            data.imageUri!,
            width: 55.0,
          ),
        ],
      ),
    );
  }
}
