import 'package:flutter/material.dart';

TextStyle loginRegisterStyle =
    const TextStyle(fontSize: 20.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            margin: const EdgeInsets.all(15.0),
            child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg")),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(11.0)),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('login');
                      },
                      child: Text("登录", style: loginRegisterStyle)),
                  Text("/", style: loginRegisterStyle),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('register');
                      },
                      child: Text("注册", style: loginRegisterStyle)),
                ],
              ),
              const Text(
                "登录后可以体验更多",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
