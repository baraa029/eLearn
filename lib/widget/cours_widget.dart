import 'package:flutter/material.dart';
import 'package:learning_track/models/Car_model.dart';
import 'package:provider/provider.dart';
import '../screens/courses/constants.dart';

import '../provider/firestore_provider.dart';
import '../screens/courses/details_screen_cours.dart';

class CoursWidget extends StatelessWidget {
  int index;
  CoursWidget(this.index);
  @override
  Widget build(BuildContext context) {
    var cours = Provider.of<FireProvider>(context).courslist;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsCours(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        height: index.isEven ? 200 : 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage('assets/images/ux_design.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${cours[index].nameCours}',
              style: kTitleTextStyle,
            ),
            // Text(
            //   '${cours[index].} Courses',
            //   style: TextStyle(
            //     color: kTextColor.withOpacity(.5),
            //   ),
            // )
          ],
        ),
      ),
    );
    ;
  }
}
