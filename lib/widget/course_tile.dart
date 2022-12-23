import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_course/view/course_view.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseTile extends StatelessWidget {

  String imageUrl, courseUrl, title, successRate;


  CourseTile({
    required this.imageUrl,
    required this.courseUrl,
    required this.title,
    required this.successRate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 8.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseView(
                  courseUrl: courseUrl,
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 205,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Text(
                      title.replaceAll('[Free]', ''),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/free.svg"),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Free",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[

                            GestureDetector(
                              onTap: () => launch(courseUrl),
                              child: Icon(Icons.open_in_browser,
                                  color: Colors.white, size: 24),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                Share.share(
                                  '$courseUrl',
                                );
                              },
                              child:
                              Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
