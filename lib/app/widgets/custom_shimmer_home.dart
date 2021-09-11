import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCustomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 1.8,
          ),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text('text')
                ],
              ),
            );
          },
        ));
  }
}
