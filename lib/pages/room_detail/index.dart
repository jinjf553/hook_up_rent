import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;

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
            color: Colors.grey.shade200,
          ),
        )
      ]),
    );
  }
}
