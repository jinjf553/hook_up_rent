import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
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
            CommonTitle(data.title!),
            const CommonTitle('房屋配置'),
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
