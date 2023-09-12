import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChiTietSanPham extends StatefulWidget {
  const ChiTietSanPham({Key? key}) : super(key: key);

  @override
  _ChiTietSanPhamState createState() => _ChiTietSanPhamState();
}

class _ChiTietSanPhamState extends State<ChiTietSanPham> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildProductImage(),
                      _buildProductInfo(),
                      _buildProductDescription(),
                    ],
                  ),
                ),
              ),
              _buildQuantityAndButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/food.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_rounded,
              size: 50.0,
            ),
            color: Colors.white,
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              "Cơm tấm Anh Thy - sườn trứng",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "35.000d",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 50, 50, 50)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    bool isFocused = false;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocused = hasFocus;
          });
        },
        child: TextFormField(
          readOnly: isFocused,
          showCursor: true,
          decoration: const InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.sticky_note_2_outlined,
                size: 35,
              ),
            ),
            hintStyle: TextStyle(fontSize: 15),
            hintText: 'Bạn có gì muốn nhắn tới nhà hàng không ?',
            border: InputBorder.none,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildQuantityAndButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (count != 1) {
                            count--;
                          }
                        });
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 215, 215, 214)),
                        child: const Icon(
                          Icons.remove,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$count',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 215, 215, 214)),
                        child: const Icon(
                          Icons.add_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button click
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 18),
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Thêm - 35.000d',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
