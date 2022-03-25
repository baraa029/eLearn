import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/book_model.dart';
import 'book_screen.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blobs(),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(height: 30),
                    CustomTextField(),
                    SizedBox(height: 18),
                    CategorySelector(),
                    SizedBox(height: 20),
                    TrendingBooksCarousel('tag1'),
                    SizedBox(height: 16),
                    BooksCarousel('tag2')
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
  String tag;
  TrendingBooksCarousel(this.tag);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Trending Books',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Book book = books[index];
              return ImageCarouselItem(
                book: book,
                tag: tag,
              );
            },
          ),
        ),
      ],
    );
  }
}

class BooksCarousel extends StatelessWidget {
  String tag;
  BooksCarousel(this.tag);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Trending Books',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Book book = books[index];
              return ImageCarouselItem(
                book: book,
                tag: tag,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageCarouselItem extends StatelessWidget {
  final Book book;
  String tag;

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
                        tag: book.imageUrl + tag,
                        child: Image.asset(
                          book.imageUrl,
                          height: 180,
                          width: 120,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 120,
                    child: Text(
                      "by ${book.auhton_name}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4F9DBC),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 120,
                child: Text(
                  book.book_name,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    color: Color(0xFF305F72),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
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
  Categories selectedCategory = Categories.Comics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Categories',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Categories category = Categories.values[index];
              bool isSelected = category == selectedCategory;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                child: Container(
                  width: 100,
                  height: 35,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFF305F72)
                        : Color(0xFFCBE5F3).withOpacity(0.46),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    describeEnum(category),
                    style: GoogleFonts.raleway(
                      color: isSelected ? Colors.white : Color(0xFF305F72),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        )
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
            color: Colors.black, fontWeight: FontWeight.w500),
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
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFF305F72),
          ),
        ),
      ),
    );
  }
}
