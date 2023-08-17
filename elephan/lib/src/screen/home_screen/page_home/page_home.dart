import 'dart:developer';

import 'package:elephan/src/screen/home_screen/page_home/tab_screen/drink_tab.dart';
import 'package:elephan/src/screen/home_screen/page_home/tab_screen/food_tab.dart';
import 'package:elephan/src/screen/home_screen/page_home/tab_screen/other_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/shared_preferences.dart';
import '../../../models/category.dart';
import '../../../models/user.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final _controllerSearch = TextEditingController();

  User? user;
  void getUser() async {
    final sharedPrefs = await SharedPreferencesService.getInstance();
    user = User.fromJson(sharedPrefs.getUser());
    log(user!.phone.toString());
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            expandedHeight: 250,
            pinned: true,
            floating: true,

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: inputSearch(controllerSearch: _controllerSearch),
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
                        appBarTop(context),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
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
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Bánh ngọt",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/621/621647.png',
                            status: true),
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Cơm",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/2694/2694993.png',
                            status: true),
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Bánh ngọt",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/621/621647.png',
                            status: true),
                        DanhMuc(
                            idDanhmuc: 1,
                            tenDanhmuc: "Cơm",
                            urlImage:
                                'https://cdn-icons-png.flaticon.com/128/2694/2694993.png',
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
                ],
              ),
            ),
          ),
        ],
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

  Column appBarTop(BuildContext context) {
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
                onPressed: () {
                  Get.snackbar('Icon', "Chức năng chưa làm");
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
                'Tận hưóng món ăn',
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

class inputSearch extends StatefulWidget {
  const inputSearch({
    super.key,
    required TextEditingController controllerSearch,
  }) : _controllerSearch = controllerSearch;

  final TextEditingController _controllerSearch;

  @override
  State<inputSearch> createState() => _inputSearchState();
}

class _inputSearchState extends State<inputSearch> {
  bool isIconClose = false;

  @override
  void initState() {
    super.initState();
    // Lắng nghe thay đổi nội dung của TextField
    widget._controllerSearch.addListener(_updateIconVisibility);
  }

  @override
  void dispose() {
    widget._controllerSearch.removeListener(_updateIconVisibility);
    widget._controllerSearch.dispose();
    super.dispose();
  }

  void _updateIconVisibility() {
    // Kiểm tra nếu có dữ liệu trong TextField thì hiển thị icon close
    // Ngược lại, ẩn icon close
    setState(() {
      isIconClose = widget._controllerSearch.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextFormField(
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                log(value);
              }
            },
            onChanged: (value) {
              //Nếu có dữ liệu input thì gọi api
              if (value.isNotEmpty) {
                log(value);
              } else {}
            },
            controller: widget._controllerSearch,
            decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm .. ',
                alignLabelWithHint: true,
                filled: true, // Hiển thị màu nền

                fillColor: const Color.fromARGB(255, 239, 239, 239),
                hintStyle: const TextStyle(fontSize: 15),
                // contentPadding: const EdgeInsets.only(left: 20),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
                suffixIcon: isIconClose
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onPressed: () {
                          widget._controllerSearch.clear();
                          _updateIconVisibility();
                        },
                      )
                    : null,
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        ),
      ],
    );
  }
}
