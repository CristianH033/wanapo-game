import 'package:flutter/material.dart';
import 'package:wanapo_game/models/PartidaModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class LogoSVG extends StatelessWidget {
  // a property on this class
  // a constructor for this class
  LogoSVG();

  Widget build(context) {
    final String assetName = 'assets/images/Logo.svg';
    final Widget svgLogo = new SvgPicture.asset(
      assetName,
      semanticsLabel: 'Empresa Logo'
    );
    return svgLogo;
  }
}
