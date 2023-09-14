import 'package:elephan/src/screen/product_screen/widget/image.dart';
import 'package:elephan/src/screen/product_screen/widget/info.dart';
import 'package:elephan/src/screen/product_screen/widget/input_note.dart';
import 'package:elephan/src/screen/product_screen/widget/quantity_button.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
   const ProductDetail({Key? key}) : super(key: key);
 
  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final TextEditingController controllerNode= TextEditingController();
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
                      imageProduct(),
                      infoProduct(),
                      inputNoteProduct(controllerNode),
                    ],
                  ),
                ),
              ),
              const QuanityButtonProduct(),
            ],
          ),
        ),
      ),
    );
  }
}