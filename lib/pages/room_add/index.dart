import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:hook_up_rent/widgets/common_select_form_item.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;
  int roomType = 0;
  int floor = 0;
  int oriented = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发布房源')),
      body: ListView(
        children: [
          const CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: SizedBox(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '请选择小区',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('search');
                },
              );
            },
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: const ['合租', '整租'],
            value: rentType,
            onChanged: (index) {
              setState(() {
                rentType = index!;
              });
            },
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val!;
              });
            },
            options: const ['一室', '二室', '三室', '四室'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val!;
              });
            },
            options: const ['高楼层', '中楼层', '低楼层'],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val!;
              });
            },
            options: const ['东', '南', '西', '北'],
          ),
          CommonRadioFormItem(
            label: '装修',
            options: const ['精装', '简装'],
            value: decorationType,
            onChanged: <ValueChanged>(index) {
              setState(() {
                decorationType = index;
              });
            },
          ),
          const CommonTitle('房屋头像'),
          const CommonTitle('房屋标题'),
          const CommonTitle('房屋配置'),
          const CommonTitle('房屋描述'),
        ],
      ),
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
