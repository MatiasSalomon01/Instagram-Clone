import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';

import '../constants/colors.dart';
import '../constants/others.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ContentItemHelper {
  static void showCommentsModal(BuildContext context,
      {bool isScrollControlled = false, int count = 0}) {
    final size = MediaQuery.of(context).size;

    final comments = List.generate(
      count,
      (index) => CommentModel(
        username: '${mockName()} ${mockName()}',
        caption: wordGenerator.randomSentence(random.nextInt(30) + 2),
        days: mockInteger(1, 10),
        countResponses: mockInteger(1, 15),
        countLikes: mockInteger(1, 5000),
      ),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            const _Header(),
            const CustomDivider(color: greyText),
            _Body(models: comments),
            const _TextFormField(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.models});

  final List<CommentModel> models;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => Comment(model: models[index]),
        itemCount: models.length,
      ),
    );
  }
}

class _TextFormField extends StatefulWidget {
  const _TextFormField();

  @override
  State<_TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  late final TextEditingController controller;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      if (isEmpty && controller.text.isNotEmpty) {
        isEmpty = !isEmpty;
        setState(() {});
      }

      if (!isEmpty && controller.text.isEmpty) {
        isEmpty = !isEmpty;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // height: kToolbarHeight,
      width: size.width,
      color: grey,
      padding: EdgeInsets.only(
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('❤️', style: TextStyle(fontSize: 24)),
              Text('🙌', style: TextStyle(fontSize: 24)),
              Text('🔥', style: TextStyle(fontSize: 24)),
              Text('😂', style: TextStyle(fontSize: 24)),
              Text('🤣', style: TextStyle(fontSize: 24)),
              Text('😁', style: TextStyle(fontSize: 24)),
              Text('🗿', style: TextStyle(fontSize: 24)),
              Text('👌', style: TextStyle(fontSize: 24)),
            ],
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(color: white),
            cursorColor: const Color.fromARGB(255, 50, 169, 199),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ProfilePicture(
                  radius: 16,
                  padding: 1,
                  model: StoryModel(username: 'asdasdas'),
                ),
              ),
              suffixIcon: isEmpty
                  ? const Icon(
                      Icons.gif_box_outlined,
                      color: white,
                    )
                  : enterButton(),
              hintText: 'Agrega un comentario...',
              hintStyle: const TextStyle(color: greyText),
            ),
          ),
        ],
      ),
    );
  }

  Widget enterButton() {
    return ZoomIn(
      duration: const Duration(milliseconds: 200),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: lightBlue, borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.arrow_upward_rounded,
          color: white,
          size: 25,
        ),
      ),
    );
  }
}
