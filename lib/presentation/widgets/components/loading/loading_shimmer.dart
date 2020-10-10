import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.grey[300],
      enabled: true,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.filled(
              5,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: Container(
                    width: 80,
                    height: 100,
                    color: Colors.grey[300],
                  ),
                  title: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 20,
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5, right: 80),
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 10,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
