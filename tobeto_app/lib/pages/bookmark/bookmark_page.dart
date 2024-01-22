import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/bookmark/bookmark_list.dart';
import 'package:tobeto_app/pages/bookmark/course_item_extended.dart';
import 'package:tobeto_app/pages/curved_bar.dart/top_bar_widget.dart';

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

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBarWidget(
                titleText: "Kaydetmeler",
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
                  itemCount: BookMarkList.bookMark.length,
                  itemBuilder: (context, index) {
                    return CourseItemExtended(
                        course: BookMarkList.bookMark[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Add other widgets or configurations as needed
    );
  }
}
