import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBarField extends StatefulWidget {
  const SearchBarField({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarFieldState createState() => _SearchBarFieldState();
}

class _SearchBarFieldState extends State<SearchBarField> {
  bool isExpanded = false;
  double maxHeight = 200.0;
  double searchBarPadding = 15.0;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.screenHeight * 0.16,
      left: searchBarPadding,
      right: searchBarPadding,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            if (isExpanded) {
              maxHeight = context.screenHeight * 0.7;
              if (maxHeight < 200.0) {
                maxHeight = 200.0;
              }
            }
          });
        },
        onTap: () {
          setState(() {
            isExpanded = true;
            searchBarPadding = 0.0;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(left: 16.0),
          alignment: isExpanded ? Alignment.topLeft : Alignment.centerLeft,
          height: isExpanded
              ? maxHeight
              : MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isExpanded
              ? SizedBox(
                  child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (RawKeyEvent event) {
                      if (event is RawKeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.enter) {
                        searchBreed(_textEditingController.text);
                        setState(() {
                          isExpanded = false;
                          searchBarPadding = 15.0;
                        });
                      }
                    },
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'GalanoGrotesque',
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              : _textEditingController.text.isNotEmpty
                  ? Text(
                      _textEditingController.text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'GalanoGrotesque',
                        fontSize: 16,
                      ),
                    )
                  : Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'GalanoGrotesque',
                        fontSize: 16,
                      ),
                    ),
        ),
      ),
    );
  }

  void searchBreed(String searchText) {
    // ignore: avoid_print
    print("Arama: $searchText");
  }
}
