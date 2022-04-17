import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/common_tag.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

var bottomButtonStyle = const TextStyle(fontSize: 20.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool isLike = false;

  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null as RoomDetailData) return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title!),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('https://itcast.cn');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Stack(children: [
        ListView(
          children: [
            CommonSwiper(
              images: data.houseImgs!,
            ),
            CommonTitle(data.title!),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data.price.toString(),
                    style: const TextStyle(fontSize: 20.0, color: Colors.pink),
                  ),
                  const Text(
                    '元/月(押一付三)',
                    style: TextStyle(fontSize: 14.0, color: Colors.pink),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
              child: Wrap(
                spacing: 4.0,
                children: data.tags!.map((item) => CommonTag(item)).toList(),
              ),
            ),
            const Divider(color: Colors.grey, indent: 10.0, endIndent: 10.0),
            Container(
              padding: const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
              child: Wrap(
                runSpacing: 20.0,
                children: [
                  BaseInfoItem(content: '面积：${data.size}平米'),
                  BaseInfoItem(content: '楼层：${data.floor}'),
                  BaseInfoItem(content: '房型：${data.roomType}'),
                  const BaseInfoItem(content: '装修：精装'),
                ],
              ),
            ),
            const CommonTitle('房屋配置'),
            RoomApplianceList(
              list: data.applicances,
            ),
            const CommonTitle('房屋概况'),
            const CommonTitle('猜你喜欢'),
          ],
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(
                right: 10.0, left: 20.0, top: 20.0, bottom: 20.0),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLike = !isLike;
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: 40.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          isLike ? Icons.star : Icons.star_border,
                          color: isLike ? Colors.green : Colors.black,
                          size: 24.0,
                        ),
                        Text(
                          isLike ? '已收藏' : '收藏',
                          style: const TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: (() {}),
                  child: Container(
                      height: 50.0,
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Center(
                          child: Text(
                        '联系房东',
                        style: bottomButtonStyle,
                      ))),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: (() {}),
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Center(
                          child: Text(
                        '预约看房',
                        style: bottomButtonStyle,
                      ))),
                ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String? content;

  const BaseInfoItem({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        content!,
        style: const TextStyle(fontSize: 16.0),
      ),
      width: (MediaQuery.of(context).size.width - 3 * 10.0) / 2,
    );
  }
}
