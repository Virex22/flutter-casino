import 'package:flutter/material.dart';
import 'package:casino/helper/tiles_helper.dart';

class CasinoTiles extends StatefulWidget {
  const CasinoTiles({Key? key, required this.imageIndex}) : super(key: key);

  final int imageIndex;

  @override
  State<CasinoTiles> createState() => _CasinoTilesState();
}

class _CasinoTilesState extends State<CasinoTiles> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        tile[widget.imageIndex],
        fit: BoxFit.cover,
      ),
    );
  }
}
