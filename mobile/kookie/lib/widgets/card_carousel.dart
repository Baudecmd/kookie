import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/recette/post_model.dart';

class CardCarousel extends StatefulWidget {
  final String title;
  final List<Post> posts;

  const CardCarousel({required this.posts, this.title = ''});

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel>
    with AutomaticKeepAliveClientMixin<CardCarousel> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  _buildCard(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double scale = 1;
        if (pageController.position.haveDimensions) {
          scale = pageController.page! - index;
          scale = (1 - (scale.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(scale) * 500.0,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        // width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 0.2), blurRadius: 6.0)
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(children: [
            Text(
              post.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(children: [
                Icon(
                  Icons.star_border_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 6.0),
                Text(
                  post.likes.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
              ]),
              SizedBox(height: 6.0),
              Row(children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Icon(
                    Icons.favorite_border_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ])
            ])
          ])
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.isNotEmpty
            ? Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ))
            : SizedBox(),
        Container(
          height: 500.0,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildCard(context, index);
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
