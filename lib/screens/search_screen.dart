import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Consumer<SearchProvider>(
              builder: (context, state, child) => Stack(
                children: [
                  Column(
                    children: [
                      const _TextField(),
                      Expanded(
                        child: ListView.builder(
                          controller: state.controller,
                          itemCount: state.urls.length,
                          itemBuilder: (context, index) => SeachItemLayout(
                            index: index,
                            photos: state.urls[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.isLoading)
                    Container(
                      color: backgroundColor.withOpacity(.5),
                      child: const Loader(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      height: 55,
      child: TextFormField(
        cursorColor: white,
        cursorWidth: .3,
        style: const TextStyle(
          color: white,
          fontWeight: FontWeight.w400,
          fontSize: 14.5,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: grey,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Buscar',
          hintStyle: const TextStyle(
            color: greyText,
            fontWeight: FontWeight.w400,
            fontSize: 14.5,
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 17),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SvgString(
              icon: searchIcon,
              color: Colors.white70,
            ),
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
