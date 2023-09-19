import 'package:flutter/material.dart';
import 'package:task_managment_app/core/widgets/radio_item.dart';

import '../../../core/localization/app_string.dart';

class ViewAllStateTask extends StatelessWidget {
  const ViewAllStateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          AppString.allTaskStatus.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 5, top: 6),
            child: RadioItem(
                groubValue: AppString.allTaskStatus[0],
                onChange: (value) {},
                text: AppString.allTaskStatus[index]),
          ),
        )
      ],
    );
  }
}
