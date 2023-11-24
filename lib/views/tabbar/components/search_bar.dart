import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.3), 
            spreadRadius: 2, 
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}