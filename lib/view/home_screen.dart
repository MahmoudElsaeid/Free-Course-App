import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_course/helper/course.dart';
import 'package:free_course/helper/data.dart';
import 'package:free_course/model/category_model.dart';
import 'package:free_course/model/course_model.dart';
import 'package:free_course/widget/category_tile.dart';
import 'package:free_course/widget/course_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CategoryModel> categories=[];
  List<CourseModel> courses=[];

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getCourse();
  }

  getCourse() async{
    Course course = Course();
    course.getCourses();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff747474),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Find your Free Courses',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff232323),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/images/heart.svg",
                  color: Colors.black38,
                  width: 28,
                ),
              ],
            ),
          ),
        ),
      ),
      body: _loading ? Center(
        child: Container(
          child: SpinKitWave(
            color: Color(0xff99CAE1),
            size: 30,
          ),
        ),
      ) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 18),
                alignment: Alignment.topLeft,
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff232323),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 160,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, int index){
                    return CategoryTile(
                      categoryName: categories[index].categoryName,
                      color: categories[index].color,
                      imageUrl: categories[index].imageURL,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.topLeft,
                child: Text(
                  "Courses",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff232323)),
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: courses.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, int index){
                    return CourseTile(
                        imageUrl: courses[index].image,
                        courseUrl: courses[index].courseLink,
                        title: courses[index].heading,
                        successRate: '',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
