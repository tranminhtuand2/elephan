import 'package:elephan/src/screen/home_screen/page_search/widgets/input_search.dart';
import 'package:elephan/src/screen/home_screen/page_search/widgets/view_product_search.dart';
import 'package:elephan/src/screen/home_screen/page_search/widgets/view_suggest.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controllerSearch = TextEditingController();
  bool show = false;
  @override
  void initState() {
    super.initState();
    // Lắng nghe thay đổi nội dung của TextField
    _controllerSearch.addListener(() {
      setState(() {
        _controllerSearch.text.isNotEmpty ? show = true : show = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InputSearch(controllerSearch: _controllerSearch),
            Expanded(
              child: show ? viewProductSearch() : viewSuggest(),
            ),
          ],
        ),
      ),
    );
  }
}
