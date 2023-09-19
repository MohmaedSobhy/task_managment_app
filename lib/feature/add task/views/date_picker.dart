import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_managment_app/core/color/app_color.dart';

// ignore: must_be_immutable
class ShowTimeDatePicker extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onChanged;
  ShowTimeDatePicker({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 60),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.33,
        child: SfDateRangePicker(
          todayHighlightColor: AppColor.purble,
          endRangeSelectionColor: AppColor.purble,
          startRangeSelectionColor: AppColor.purble,
          rangeSelectionColor: AppColor.purble.withOpacity(0.2),
          onSelectionChanged: onChanged,
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.range,
        ),
      ),
    );
  }
}
