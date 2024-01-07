import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/widgets.dart';

class ContentItemHelper {
  static void showCommentsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // constraints:
      //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .6),
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 5,
                        decoration: BoxDecoration(
                          color: greyText,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const VerticalSpace(30),
                      const Text(
                        'Comentarios',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const CustomDivider(color: greyText),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Comment();
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
