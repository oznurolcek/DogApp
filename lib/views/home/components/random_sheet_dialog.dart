import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class RandomSheetDialog extends StatelessWidget {
  const RandomSheetDialog({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: Builder(builder: (context) {
        return SizedBox(
          width: context.screenWidth * 0.3,
          height: context.screenHeight * 0.3,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: context.screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white),
                  child: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
