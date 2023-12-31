import 'package:flutter/material.dart';
import 'package:instagram_clone/colors/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // height: 640,
      // color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                CircleAvatar(radius: 18),
                HorizontalSpace(10),
                Text(
                  'championsleague',
                  style: TextStyle(color: white),
                ),
                HorizontalSpace(5),
                Icon(Icons.verified, color: lightBlue, size: 18),
                Spacer(),
                Icon(Icons.more_vert, color: white),
              ],
            ),
          ),
          const VerticalSpace(15),
          Image.network(
            'https://pbs.twimg.com/media/FqtnngIXoAQ_Z9z.jpg:large',
            fit: BoxFit.cover,
            height: 450,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.favorite_border_outlined, color: white),
                          Icon(Icons.comment_outlined, color: white),
                          Icon(Icons.share_outlined, color: white),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 1.58,
                      child: const Icon(
                        Icons.label_important_outline_rounded,
                        color: white,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Les gusta ',
                        style: TextStyle(color: white),
                        children: [
                          TextSpan(
                            text: 'theassassinbaby ',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: 'y ', style: TextStyle(color: white)),
                          TextSpan(
                            text: '1,066,905 personas más',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(6),
                Text.rich(
                  TextSpan(
                    text: 'championsleague ',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalSpace(6),
                Text(
                  'Ver los 6,053 comentarios',
                  style: TextStyle(color: whiteOpaque),
                ),
                const VerticalSpace(6),
                Text(
                  'Hace 2 días',
                  style: TextStyle(color: whiteOpaque, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
