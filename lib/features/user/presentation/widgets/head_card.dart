import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadCard extends StatelessWidget {
  final String? jobtype;
  final double? salary;
  final String? curranecy;

  const HeadCard({
    super.key,
    required this.jobtype,
    required this.salary,
    required this.curranecy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Column(
              children: [
                Image.asset(
                  "assets/images/money.png",
                  width: Get.width * 0.12,
                  height: Get.height * 0.09,
                ),
                Text(
                  salary.toString(),
                ),
                Text(curranecy ?? ''),
              ],
            ),
            const Spacer(),
            Container(
                width: Get.height * 0.22,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    jobtype == 'Employee'
                        ? Image.asset(
                            "assets/images/employee.png",
                            width: Get.width * 0.18,
                            height: Get.height * 0.125,
                          )
                        : Image.asset(
                            "assets/images/freelancer.png",
                            width: Get.width * 0.18,
                            height: Get.height * 0.125,
                          ),
                    Text(jobtype ?? ''),
                  ],
                )),
          ],
        ));
  }
}
