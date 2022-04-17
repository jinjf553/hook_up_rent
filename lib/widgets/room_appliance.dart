class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

// const List<RoomApplianceItem> _dataList = [
//   RoomApplianceItem('衣柜', 0xe918, false),
//   RoomApplianceItem('洗衣机', 0xe917, false),
//   RoomApplianceItem('空调', 0xe90d, false),
//   RoomApplianceItem('天然气', 0xe90f, false),
//   RoomApplianceItem('冰箱', 0xe907, false),
//   RoomApplianceItem('暖气', 0xe910, false),
//   RoomApplianceItem('电视', 0xe908, false),
//   RoomApplianceItem('热水器', 0xe912, false),
//   RoomApplianceItem('宽带', 0xe90e, false),
//   RoomApplianceItem('沙发', 0xe913, false),
// ];

//组件参数
// late final ValueChanged<List<RoomApplianceItem>> onChange;