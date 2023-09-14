import 'package:elephan/src/getx_controller/loading_controller.dart';
import 'package:elephan/src/models/login_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column appBarTop(
    {required BuildContext context, required LoginResult inforUser}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’t order a food,',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    inforUser.info!.email!.split('@')[0],
                    // 'asdss',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(18)),
            child: IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                Get.find<LoadingController>().showLoading();
              },
              icon: const Icon(CupertinoIcons.shopping_cart),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tận hưởng món ăn',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Đơn giản bằng một chạm',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    ],
  );
}
