import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?>? showPicker({
    BuildContext? context,
    List<String>? options,
    int? value,
  }) {
    return showCupertinoModalPopup<int>(
        context: context!,
        builder: (BuildContext context) {
          var buttonTextStyle = TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600);
          return Container(
            color: Colors.grey,
            height: 300.0,
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  height: 40.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '取消',
                            style: buttonTextStyle,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '确定',
                            style: buttonTextStyle,
                          ),
                        ),
                      ]),
                ),
                Expanded(
                    child: CupertinoPicker(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int val) {},
                  children: options!.map((item) => Text(item)).toList(),
                ))
              ],
            ),
          );
        });
  }
}
