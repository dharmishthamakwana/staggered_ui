import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class staggered_screen extends StatefulWidget {
  const staggered_screen({Key? key}) : super(key: key);

  @override
  State<staggered_screen> createState() => _staggered_screenState();
}

Home_provider? home_providertrue, home_providerfalse;

class _staggered_screenState extends State<staggered_screen> {
  @override
  Widget build(BuildContext context) {
    home_providerfalse = Provider.of<Home_provider>(context, listen: false);
    home_providertrue = Provider.of<Home_provider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        title: Text("Straged Grid View"),
        centerTitle: true,
      ),
      body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              6 / 9,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 9,
          (context, index) => Tile(index: index),
        ),
      ),
    ));
  }

  Tile({required int index}) {
    return Container(
      color: Colors.black38,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "${home_providerfalse!.Images[index]}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "${home_providerfalse!.name[index]}",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
