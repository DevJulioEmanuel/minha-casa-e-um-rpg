import 'package:flutter/material.dart';

class CardRanking extends StatelessWidget {
  final String path;
  final String nomeUsuario;
  final int xp;
  final double scaleImage;

  const CardRanking({
    super.key,
    required this.path,
    required this.nomeUsuario,
    required this.xp,
    required this.scaleImage
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Material(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            child: Image.asset(
              path,
              width: 48 * scaleImage * 1.25,
              height: 48 * scaleImage * 1.25,
              filterQuality: FilterQuality.none,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: scaleImage*15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeUsuario,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20.0),
                ),
              Text(
                "$xp xp",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ],
          )
        ]
      ),
    );
  }
}