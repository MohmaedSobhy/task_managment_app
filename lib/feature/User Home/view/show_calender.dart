import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/feature/User%20Home/controller/user_home_cubit.dart';

import '../controller/user_home_state.dart';

class ShowCalander extends StatelessWidget {
  const ShowCalander({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomseState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CalendarTimeline(
          showYears: true,
          initialDate: UserHomeCubit.get(context).selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          onDateSelected: (data) {
            UserHomeCubit.get(context);
          },
          leftMargin: 20,
          monthColor: AppColor.darkColor,
          dayColor: AppColor.darkColor,
          dayNameColor: Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColor.purble,
          dotsColor: Colors.white,
          locale: 'en',
        );
      },
    );
  }
}
