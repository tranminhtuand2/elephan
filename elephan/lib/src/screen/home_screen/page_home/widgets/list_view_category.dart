import 'package:flutter/material.dart';

import '../../../../models/category.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({
    super.key,
    required this.danhmuc,
  });

  final List<DanhMuc> danhmuc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 100,
          // childAspectRatio: 8,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          crossAxisCount: 4,
        ),
        itemCount: danhmuc.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 28,
                  child: Image.network(danhmuc[index].urlImage!),
                ),
                const SizedBox(height: 8),
                Text(
                  danhmuc[index].tenDanhmuc!,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
