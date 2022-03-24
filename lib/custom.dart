import 'package:flutter/material.dart';

class custom extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height/2);

    path.quadraticBezierTo(20, size.height/1.5, size.width/4, size.height/4);
    path.quadraticBezierTo(size.width-(size.width/4), size.height/1.5, size.width, 0);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
  
}