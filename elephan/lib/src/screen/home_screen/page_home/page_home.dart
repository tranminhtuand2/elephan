import 'package:elephan/src/getx_controller/auth_controller.dart';
import 'package:elephan/src/getx_controller/page_controller.dart';
import 'package:elephan/src/getx_controller/product_controller.dart';
import 'package:elephan/src/models/login_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../components/listview_grid.dart';
import '../../../models/category.dart';
import '../../sanpham_screen/chitietsanpham.dart';
import 'widgets/app_bar_top.dart';
import '../../../components/input_search.dart';
import 'widgets/list_view_category.dart';
import 'widgets/listview_horizon.dart';

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
            mySliverAppBar(context),
            SliverToBoxAdapter(
              child: Obx(
                () => Column(
                  children: [
                    const SizedBox(height: 20),
                    ListViewCategory(
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
                            tenDanhmuc: "Nước uống",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/8606/8606876.png',
                            status: true),
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Nước uống",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/8606/8606876.png',
                            status: true),
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Nước uống",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/8606/8606876.png',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: viewProductHorizontal(
                        title: 'Giảm giá hôm nay',
                        products: productController.products,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: listViewGrid(
                        onClickTitle: () {
                          Get.to(() => const ChiTietSanPham());
                        },
                        title: 'Món siêu ngon',
                        products: productController.products,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar mySliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InputSearch(
            controllerSearch: _controllerSearch,
            readOnly: true,
            onTap: () {
              final pageControllerGetX = Get.find<PageControllerGetX>();
              pageControllerGetX.nextPage(1);
            },
          ),
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
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
    );
  }
}
