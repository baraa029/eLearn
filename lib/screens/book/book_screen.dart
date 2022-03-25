import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/book_model.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  const BookDetails({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF9FE),
      body: Stack(
        children: [
          Blob(),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    HeaderWithTitle(
                      title: 'Book Details',
                    ),
                    SizedBox(height: 30),
                    BookImage(book: book),
                    SizedBox(height: 50),
                    DetailCard(book: book),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({
    this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF4F9DBC),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -200,
            top: -50,
            child: Image.asset(
              'assets/images/blobs/Blob 1.png',
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                BookDetailsAndBookmarkRow(book: book),
                SizedBox(height: 25),
                BookDetailsCard(book: book),
                SizedBox(height: 12),
                BookDescription(book: book),
                SizedBox(height: 24),
                // QuantityAndAddToCart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class QuantityAndAddToCart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Text(
//           'QTY',
//           style: GoogleFonts.raleway(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(width: 10),
//         QuantitySelector(),
//         Spacer(),
//       ],
//     );
//   }
// }

// class AddToCart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ///Add to cart
//         print('add to cart');
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xFF305F72),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.symmetric(
//           horizontal: 26,
//           vertical: 16,
//         ),
//         child: Text(
//           'Add to Cart',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  decrementQuantity() {
    if (quantity != 0)
      setState(() {
        quantity--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: decrementQuantity,
          child: Container(
            height: 54,
            width: 23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFEAF9FE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              '-',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        Container(
          width: 56,
          height: 54,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text(quantity.toString()),
        ),
        GestureDetector(
          onTap: incrementQuantity,
          child: Container(
            height: 54,
            width: 23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFEAF9FE),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              '+',
              style: TextStyle(fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}

class BookDescription extends StatelessWidget {
  const BookDescription({
    this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Text(
      book.description,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.white,
        height: 1.4,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({
    this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF57BAE1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DetailNameAndValue(
            detailName: 'Rating',
            value: '★ ${book.rating}/5',
          ),
          DetailNameAndValue(
            detailName: 'Number of Pages',
            value: '${book.pages_number.toString()} pages',
          ),
          DetailNameAndValue(
            detailName: 'Language',
            value: describeEnum(book.language),
          ),
        ],
      ),
    );
  }
}

class DetailNameAndValue extends StatelessWidget {
  final String detailName;
  final String value;

  const DetailNameAndValue({this.detailName, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          detailName,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '$value',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class BookDetailsAndBookmarkRow extends StatelessWidget {
  final Book book;

  const BookDetailsAndBookmarkRow({this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$${book.price.toString()}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.yellow,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 5),
            Text(
              book.book_name,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Text(
              book.auhton_name,
              style: TextStyle(
                color: Color(0xFF305F72),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        RoundedCornersIconButton(
          icon: Icons.bookmark,
          onTap: () {},
        ),
      ],
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xFF305F72).withOpacity(0.78),
              offset: Offset(0, 5),
              blurRadius: 20)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
          tag: book.imageUrl,
          child: Image.asset(
            book.imageUrl,
            height: 270,
            width: 180,
          ),
        ),
      ),
    );
  }
}

class HeaderWithTitle extends StatelessWidget {
  final String title;

  const HeaderWithTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RoundedCornersIconButton(
            icon: Icons.arrow_back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Text(
            title,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF305F72),
            ),
          ),
          RoundedCornersIconButton(
            icon: Icons.send,
            onTap: () {
              print('share with');
            },
          ),
        ],
      ),
    );
  }
}

class RoundedCornersIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundedCornersIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Color(0xFF305F72),
        ),
      ),
    );
  }
}

class Blob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -140,
      top: -200,
      child: Transform.rotate(
        angle: 0,
        child: Image.asset(
          'assets/images/blobs/Blob2.png',
          color: Color(0xFF4E92B1),
        ),
      ),
    );
  }
}
