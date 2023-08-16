import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // pinned: true,
            // floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
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
                                'khánh',
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
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Tận hường món ăn',
                          textAlign: TextAlign.end,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Đơn giản bằng một chạm',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return Text('FoodTab $index');
            },
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const SliverAppBar(
      title: Text('Scrolling Tab Example'),
      floating: true, // Để AppBar "float" khi cuộn xuống
      snap: true, // Để AppBar bám sát bên trên khi cuộn lên trở lại
      // leading: Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           children: [
      //             const CircleAvatar(
      //               radius: 24,
      //               backgroundImage: AssetImage('assets/images/avatar.png'),
      //             ),
      //             const SizedBox(width: 10),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'Let’t order a food,',
      //                   style: Theme.of(context).textTheme.titleMedium,
      //                 ),
      //                 Text(
      //                   'khánh',
      //                   style: Theme.of(context)
      //                       .textTheme
      //                       .titleMedium
      //                       ?.copyWith(fontWeight: FontWeight.bold),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //         Container(
      //           padding: const EdgeInsets.all(3),
      //           decoration: BoxDecoration(
      //               color: Theme.of(context).colorScheme.onBackground,
      //               borderRadius: BorderRadius.circular(18)),
      //           child: IconButton(
      //             color: Theme.of(context).colorScheme.primary,
      //             onPressed: () {
      //               Get.snackbar('Icon', "Chức năng chưa làm");
      //             },
      //             icon: const Icon(CupertinoIcons.shopping_cart),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 14),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Text(
      //             'Tận hường món ăn',
      //             textAlign: TextAlign.end,
      //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //           ),
      //           Text(
      //             'Đơn giản bằng một chạm',
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .titleLarge
      //                 ?.copyWith(fontWeight: FontWeight.bold),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight + 300; // Chiều cao tối đa của AppBar

  @override
  double get minExtent => kToolbarHeight; // Chiều cao tối thiểu của AppBar

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Luôn rebuild khi dữ liệu thay đổi
  }
}
