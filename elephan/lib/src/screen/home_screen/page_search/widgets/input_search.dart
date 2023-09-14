import 'dart:developer';

import 'package:elephan/src/screen/home_screen/page_search/widgets/bottom_sheet_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _showBottomSheet(BuildContext context, String key) {
  double max = 50000.0;
  double min = 1.0;
  double? upper;
  double? lower;

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return bottomSheetPrice(min, max, lower, upper);
    },
  );
}

class InputSearch extends StatefulWidget {
  const InputSearch({
    super.key,
    required TextEditingController controllerSearch,
  }) : _controllerSearch = controllerSearch;

  final TextEditingController _controllerSearch;

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
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
                } else {
                  //ngược lại nếu không có thì xóa data product cũ
                }
              },
              controller: widget._controllerSearch,
              decoration: InputDecoration(
                  hintText: 'Bạn đang thèm gì?',
                  alignLabelWithHint: true,
                  filled: true, // Hiển thị màu nền
                  fillColor: Colors.transparent,
                  hintStyle: const TextStyle(fontSize: 15),
                  contentPadding: const EdgeInsets.only(left: 0),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  suffixIcon: isIconClose
                      ? IconButton(
                          icon: Icon(
                            CupertinoIcons.clear_circled_solid,
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
          const SizedBox(
            width: 6,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
              border: Border.all(
                color: Colors.black, // Màu viền
                width: 0.5, // Độ dày viền
              ),
            ),
            child: IconButton(
              onPressed: () {
                _showBottomSheet(context, widget._controllerSearch.text);
              },
              icon: const Icon(
                CupertinoIcons.slider_horizontal_3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
