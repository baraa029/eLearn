import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_track/colorConst.dart';
import 'package:learning_track/provider/firestore_provider.dart';
import 'package:learning_track/router/router.dart';
import 'package:provider/provider.dart';

import '../../models/bookModel.dart';
import '../../models/book_model.dart';
import 'details_book_screen.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 233, 252),
      body: Stack(
        children: [
          Blobs(),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(height: 30),
                    CategorySelector(),

                    SizedBox(height: 18),
                    CustomTextField(),
                    SizedBox(height: 20),
                    BooksCarousel('tag'),

                    SizedBox(height: 16),
                    // TrendingBooksCarousel(),
                    TrendingBooksCarousel(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TrendingBooksCarousel extends StatelessWidget {
  TrendingBooksCarousel();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Arabic Stories',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConst.forground),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: Provider.of<FireProvider>(context).booklist.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ImageCarouselItem(
                  book: Provider.of<FireProvider>(context).booklist[index]);
            },
          ),
        ),
      ],
    );
  }
}

class BooksCarousel extends StatelessWidget {
  String tage;
  BooksCarousel(this.tage);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            ' English Stories',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConst.forground),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: Provider.of<FireProvider>(context).booklist.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ImageCarouselItem(
                tag: tage,
                book: Provider.of<FireProvider>(context).reversbooklist[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageCarouselItem extends StatelessWidget {
  Book book;
  String tag = '';
  ImageCarouselItem({this.book, this.tag});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        goToBookDetails(book, context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.5),
        child: InkWell(
          onTap: () {
            goToBookDetails(book, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: book.imageurl + tag.toString(),
                        child: Container(
                          height: 175,
                          width: 125,
                          child: CachedNetworkImage(
                            imageUrl: book.imageurl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 120,
                    child: Text(
                      book.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   width: 120,
              //   child: Text(
              //     "by ${book.auhton_name}",
              //     overflow: TextOverflow.clip,
              //     style: TextStyle(
              //       fontSize: 13,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

goToBookDetails(Book book, BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => BookDetails(book: book)));
}

class Blobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -200,
          top: -50,
          child: Image.asset(
            'assets/images/blobs/Blob 1.png',
            color: Color(0xFF579ACA).withOpacity(0.55),
          ),
        ),
        Positioned(
          top: -250,
          right: -200,
          child: Image.asset(
            'assets/images/blobs/Blob2.png',
            color: Color(0xFF4E92B1).withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            ' Stories',
            style: GoogleFonts.raleway(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: ColorConst.backgroundbar),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 50,
        //   child: ListView.builder(
        //     physics: BouncingScrollPhysics(),
        //     itemCount: 5,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       Categories category = Categories.values[index];
        //       bool isSelected = category == selectedCategory;
        //       return GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             selectedCategory = category;
        //           });
        //         },
        //         child: Container(
        //           width: 100,
        //           height: 35,
        //           margin: EdgeInsets.all(10),
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             color: isSelected
        //                 ? Color(0xFFFFD073)
        //                 : Color(0xFFFFD073).withOpacity(0.46),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Text(
        //             describeEnum(category),
        //             style: GoogleFonts.raleway(
        //               color: Colors.white,
        //               fontWeight:
        //                   isSelected ? FontWeight.w600 : FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: GoogleFonts.raleway(
            color: Color(0xFFFFD073), fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          alignLabelWithHint: true,
          hintText: 'Search books here..',
          hintStyle: GoogleFonts.raleway(
              color: Color(0xFF212121).withOpacity(0.5),
              fontWeight: FontWeight.w500),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color(0xFF305F72),
            ),
          ),
        ),
      ),
    );
  }
}
