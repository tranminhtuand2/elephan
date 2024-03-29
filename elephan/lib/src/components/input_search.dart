import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({
    super.key,
    required TextEditingController controllerSearch,
    this.onTap,
    this.readOnly = false,
  }) : _controllerSearch = controllerSearch;

  final TextEditingController _controllerSearch;
  final Function()? onTap;
  final bool readOnly;

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
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly,
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
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
    );
  }
}
