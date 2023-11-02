import 'package:flutter/cupertino.dart';

class Dimensions{
  static double calc(BuildContext context,double value){
    var height=MediaQuery.of(context).size.height;
    var result=height/value;
    var output=height/result;
    return output;
  }
}