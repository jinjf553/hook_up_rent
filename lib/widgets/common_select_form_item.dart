import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_picker/index.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String? label;
  final int? value;
  final List<String>? options;
  final ValueChanged<int?>? onChange;

  const CommonSelectFormItem(
      {Key? key, this.label, this.value, this.options, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          onTap: () {
            var result = CommonPicker.showPicker(
                context: context, options: options, value: value);
            result!.then((selectedValue) {
              if (value != selectedValue &&
                  selectedValue != null &&
                  onChange != null) {
                onChange!(selectedValue);
              }
            });
          },
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options![value!],
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
