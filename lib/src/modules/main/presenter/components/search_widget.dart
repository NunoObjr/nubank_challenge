import 'package:flutter/material.dart';

import '../../../../_exports.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {Key? key, required this.controller, required this.onPressed})
      : super(key: key);

  final TextEditingController controller;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SizedBox(
            height: 32,
            child: TextField(
              key: const Key(ComponentsConstants.inputWidget),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                  hintText: MainPageConstants.textHint,
                  fillColor: Colors.white70),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(
              key: const Key(ComponentsConstants.sendButtonWidget),
              splashRadius: 28,
              onPressed: onPressed,
              icon: const Icon(
                Icons.send,
                color: Colors.blue,
              ),
            ),
        ),
      ],
    );
  }
}
