import 'package:flutter/material.dart';
// import 'package:wanapo_game/models/PartidaModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class LogoSVG extends StatelessWidget {
  // a property on this class
  // a constructor for this class
  final width;
  final height;
  LogoSVG({Key key, @required this.width, @required this.height}) : super(key: key);
  // LogoSVG();

  Widget build(context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var w = width != null ? width : queryData.size.width;
    double max = 300;
    final String assetName = 'assets/images/Logo.svg';
    final Widget svgLogo = new SvgPicture.asset(
      assetName,
      width: w > max ? max : w,
      semanticsLabel: 'Logo'
    );
    return svgLogo;
  }
}
