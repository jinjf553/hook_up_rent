import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        children: list
            .map((item) => Container(
                  // margin: EdgeInsets.only(),
                  width: (MediaQuery.of(context).size.width - 2) / 3,
                  height: 20.0,
                  decoration: const BoxDecoration(color: Colors.red),
                ))
            .toList());
  }
}
