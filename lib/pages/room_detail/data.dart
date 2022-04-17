class RoomDetailData {
  String? id;
  String? title;
  String? community;
  String? subTitle;
  int? size;
  String? floor;
  int? price;
  String? roomType;
  List<String>? houseImgs;
  List<String>? tags;
  List<String>? oriented;
  List<String>? applicances;

  RoomDetailData({
    this.id,
    this.title,
    this.community,
    this.subTitle,
    this.size,
    this.roomType,
    this.houseImgs,
    this.tags,
    this.price,
    this.floor,
    this.oriented,
    this.applicances,
  });
}

var defaultData = RoomDetailData(
    id: '1111',
    title: '整租 中山路 历史最低价',
    community: '中山花园',
    subTitle:
        '近地铁，附近有商场！我不去想是否能够成功。既然选择了远方。便只顾风雨兼程。我不去想能否赢得爱情。既然钟情于玫瑰。就勇敢地吐露真诚。我不去想身后会不会袭来寒风冷雨。既然目标是地平线。留给世界的只能是背影。我不去想未来是平坦还是泥泞。只要热爱生命。一切，都在意料之中。。。我不去想是否能够成功。既然选择了远方。便只顾风雨兼程。我不去想能否赢得爱情。既然钟情于玫瑰。就勇敢地吐露真诚。我不去想身后会不会袭来寒风冷雨。既然目标是地平线。留给世界的只能是背影。我不去想未来是平坦还是泥泞。只要热爱生命。一切，都在意料之中。。。',
    size: 100,
    floor: '高楼层',
    price: 3000,
    oriented: ['南'],
    roomType: '三室',
    applicances: ['衣柜', '洗衣机'],
    tags: ["近地铁", "集中供暖", "新上", "随时看房"],
    houseImgs: [
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
    ]);
