import 'package:elephan/src/getx_controller/auth_controller.dart';
import 'package:elephan/src/getx_controller/product_controller.dart';
import 'package:elephan/src/models/login_result.dart';
import 'package:elephan/src/screen/home_screen/page_home/tab_screen/drink_tab.dart';
import 'package:elephan/src/screen/home_screen/page_home/tab_screen/food_tab.dart';
import 'package:elephan/src/screen/home_screen/page_home/tab_screen/other_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../components/listview_grid.dart';
import '../../../models/category.dart';
import 'component/app_bar_top.dart';
import 'component/input_search.dart';
import 'component/listview_horizon.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final _controllerSearch = TextEditingController();
  late final LoginResult? inforUser;
  final productController = Get.put(ProductController());
  @override
  void initState() {
    super.initState();
    getInforUser();
  }

  Future<void> getInforUser() async {
    final controller = Get.put(AuthController());
    inforUser = controller.login_result.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.teal,
        onRefresh: () => productController.fetchProduct(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              expandedHeight: 250,
              pinned: true,
              floating: true,

              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: inputSearch(controllerSearch: _controllerSearch),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Lottie.asset(
                        'assets/images/appBarHome3.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          appBarTop(context: context, inforUser: inforUser!),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        child: TabBar(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 255, 251, 238),
                        ),
                        child: listViewCategory(
                          danhmuc: [
                            DanhMuc(
                                idDanhmuc: 1,
                                tenDanhmuc: "Cơm",
                                urlImage:
                                    'https://cdn-icons-png.flaticon.com/128/2694/2694993.png',
                                status: true),
                            DanhMuc(
                                idDanhmuc: 1,
                                tenDanhmuc: "Nước uống",
                                urlImage:
                                    'https://cdn-icons-png.flaticon.com/128/8606/8606876.png',
                                status: true),
                            DanhMuc(
                                idDanhmuc: 1,
                                tenDanhmuc: "Bánh ngọt",
                                urlImage:
                                    'https://cdn-icons-png.flaticon.com/128/621/621647.png',
                                status: true),
                            DanhMuc(
                                idDanhmuc: 1,
                                tenDanhmuc: "Bánh ngọt",
                                urlImage:
                                    'https://cdn-icons-png.flaticon.com/128/621/621647.png',
                                status: true),
                          ],
                        ),
                      ),
                      viewProductHorizontal(
                        title: 'Giảm giá hôm nay',
                        products: productController.products,
                      ),
                      listViewGrid(
                        title: 'Món siêu ngon',
                        products: productController.products,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row TabBar() {
    return Row(
      children: [
        ItemTabFood(
          icon: const Icon(Icons.usb_rounded),
          name: 'Đồ ăn',
          function: () {
            Get.to(() => const FoodTab());
          },
        ),
        const SizedBox(width: 10),
        ItemTabFood(
          icon: const Icon(Icons.access_time),
          name: 'Đồ uống',
          function: () {
            Get.to(() => const DrinkTab());
          },
        ),
        const SizedBox(width: 10),
        ItemTabFood(
          icon: const Icon(Icons.group_work_rounded),
          name: 'Khác',
          function: () {
            Get.to(() => const OtherTab());
          },
        ),
      ],
    );
  }
}

class listViewCategory extends StatelessWidget {
  const listViewCategory({
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
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80,
          mainAxisExtent: 100,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: danhmuc.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  radius: 22,
                  child: Image.network(danhmuc[index].urlImage!),
                ),
                Text(
                  danhmuc[index].tenDanhmuc!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemTabFood extends StatelessWidget {
  ItemTabFood(
      {super.key, required this.icon, required this.name, this.function});
  Icon icon;
  String name;
  Function? function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 4),
            Text(name),
          ],
        ),
      ),
    );
  }
}
