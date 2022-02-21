import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  String? title;
   CategoryTitle( {Key? key, required String title}  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            "See more",
            style: TextStyle(
                color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
