import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/firestore_helper.dart';
import '../models/Car_model.dart';

class FireProvider extends ChangeNotifier {
  Set logocomplist = {};
  Set logotypelist = {};
  Set<String> logolisturl = {};
  Set<String> logotypelisturl = {};
  Set<String> allcarComplist = {};
  Set<String> allCompanylist = {};
  List<String> allcartype;
  Set<String> carlisturl = {};
  List<Car> Carslist;
  List<Car> Favorite = [];
  List<Car> CarsofComplist;
  List<Car> CarsofTypelist;
  // Set<String> carsCompimageUrl = {};
  Set<String> carsTypeimageUrl = {};
  String logoOneComp;
  // String logo;

  FireProvider() {}

  getAllcar() async {
    this.Carslist = await FirestoreHelper.firestoreHelper.getAllCars();

    log('Carslist');
    log('${Carslist[0].name}');
    // dowladAllCarimage();
    notifyListeners();
  }

  getFavoritecar() async {
    this.Favorite = await FirestoreHelper.firestoreHelper.getProductToFaviret();

    log('favoritlist');
    // log('${Favorite[0].name}');
    // dowladAllCarimage();
    notifyListeners();
  }

  updateFavoritecar(Car car) async {
    await FirestoreHelper.firestoreHelper.updatefavorite(car);
    if (Favorite.contains(car)) {
      Favorite.remove(car);
    }

    log('Updatefavorit');

    notifyListeners();
  }

  getAllCarToOneCompany({@required String compName}) async {
    // CarsofComplist.clear();
    this.CarsofComplist = await FirestoreHelper.firestoreHelper
        .getOneCar(classification: 'comp', object: compName);
    // dowladCarsOneCompimage();

    // log('CarsComplist');
    // log('${CarsofComplist[0].classifi['Engine']}');

    notifyListeners();
  }

  getAllCarToOneType({@required String TypeName}) async {
    // CarsofComplist.clear();
    this.CarsofTypelist = await FirestoreHelper.firestoreHelper
        .getOneCar(classification: 'type', object: TypeName);
    // dowladCarsOneCompimage();

    // log('CarsComplist');
    // log('${CarsofComplist[0].classifi['Engine']}');

    notifyListeners();
  }

  // Future<String> getAllCarToOneType({@required String TypeName}) async {
  //   List fackType = await FirestoreHelper.firestoreHelper
  //       .getOneCar(classification: 'type', object: TypeName);
  //   if (fackType.length == 0) {
  //     print('fackType');
  //     print(fackType);
  //     return 'null';
  //   }
  //   this.CarsofTypelist = fackType;
  //   // log('Carslist');
  //   // log('${Carslist[0].name}');
  //   dowladAllCarsOneTypeimage();
  //   notifyListeners();
  // }

  dowladAllCarimage() async {
    ////////////////
    for (var i = 0; i < Carslist.length; i++) {
      String logofackurl = await FirestoreHelper.firestoreHelper
          .downloadImage('Cars', '${Carslist[i].name}.png');
      carlisturl.add(logofackurl);
      notifyListeners();
      //print('nullllllll');

      // log('${allcartype[i]}');
      // log('$logofackurl');
    }
  }

  getallLogoComp() async {
    ///////////////
    List list = await FirestoreHelper.firestoreHelper.getAlllogocompany();
    logocomplist.addAll(list);
    dowladcomplogo();
  }

  getallLogotype() async {
    ///////////////
    List list = await FirestoreHelper.firestoreHelper.getAlllogotype();
    logotypelist.addAll(list);
    dowladtypelogo();
  }

  // dowladCarsOneCompimage() async {
  //   ////////////////
  //   carsCompimageUrl.clear();
  //   for (var i = 0; i < CarsofComplist.length; i++) {
  //     String logofackurl = await FirestoreHelper.firestoreHelper
  //         .downloadImage('Cars', '${CarsofComplist[i].name}.png');
  //     // CarsofComplist[i].imageurl = logofackurl;

  //     carsCompimageUrl.add(logofackurl);
  //     notifyListeners();
  //     //print('nullllllll');

  //     // log('${allcartype[i]}');
  //     // log('$logofackurl');
  //   }
  // }

  // dowladAllCarsOneTypeimage() async {
  //   ////////////////
  //   carsTypeimageUrl.clear();
  //   for (var i = 0; i < CarsofTypelist.length; i++) {
  //     String logofackurl = await FirestoreHelper.firestoreHelper
  //         .downloadImage('Cars', '${CarsofTypelist[i].name}.png');

  //     carsTypeimageUrl.add(logofackurl);
  //     notifyListeners();
  //     //print('nullllllll');

  //     // log('${allcartype[i]}');
  //     // log('$logofackurl');
  //   }
  // }

  dowladcomplogo() async {
    ////////////////
    for (var i = 0; i < logocomplist.length; i++) {
      String logofackurl = await FirestoreHelper.firestoreHelper
          .downloadImage('carLogo', '${logocomplist.toList()[i]}.png');
      logolisturl.add(logofackurl);
      notifyListeners();
      //print('nullllllll');

      // log('${allcartype[i]}');
      // log('$logofackurl');
    }
  }

  dowladOnecomplogo(String compName) async {
    ////////////////

    String logofackurl = await FirestoreHelper.firestoreHelper
        .downloadImage('carLogo', '${compName}.png');
    logoOneComp = logofackurl;
    log('$logoOneComp');
  }

  dowladtypelogo() async {
    ////////////////
    for (var i = 0; i < logotypelist.length; i++) {
      String logofackurl = await FirestoreHelper.firestoreHelper
          .downloadImage('typelogo', '${logotypelist.toList()[i]}.png');
      logotypelisturl.add(logofackurl);
      notifyListeners();
      //print('nullllllll');

      // log('${allcartype[i]}');
      // log('$logofackurl');
    }
  }
}
