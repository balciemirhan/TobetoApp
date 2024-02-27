import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/background_image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/bookmark/bookmark_add.dart';
import 'package:tobeto_app/pages/bookmark/bookmark_list.dart';

import 'package:tobeto_app/config/constant/core/widget/top_bar_widget.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    /* final MediaQueryData mediaQueryData = MediaQuery.of(context); */
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;

    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBarWidget(
                titleText: AppText.bookMarkSave,
                leadingIcon: Icon(
                  Icons.bookmark_add,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: deviceH / 1.2,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 250,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: BookMarkAdd.bookMark.length,
                  itemBuilder: (context, index) {
                    return BookMarkList(course: BookMarkAdd.bookMark[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        // Add other widgets or configurations as needed
      ),
    );
  }
}
