import 'package:flutter/material.dart';

import '../../../core/color/app_color.dart';

class TaskItem extends StatelessWidget {
  final String state;
  const TaskItem({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                state,
                style: const TextStyle(color: AppColor.purble, fontSize: 20),
              ),
            ),
            const Divider(
              thickness: 1.5,
              color: AppColor.gray,
              height: 2,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: AppColor.darkColor,
                    width: 4,
                    height: 66,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create a High Intensity Intervel",
                          style: TextStyle(
                              color: AppColor.darkColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        const Text(
                          "Desgin a 20-minute HIIT workout routine.",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.010,
            ),
            const Row(
              children: [
                Icon(
                  Icons.timelapse_outlined,
                  color: AppColor.gray,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "starts 9/18/2023 - end 10/18/2023",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.darkColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
