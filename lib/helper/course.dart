import 'dart:convert';

import 'package:free_course/model/course_model.dart';
import 'package:http/http.dart' as http;

class Course {
  List <CourseModel> courses = <CourseModel>[];

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future<void> getCourses() async{
   var url = "https://sumanjay.vercel.app/udemy";
   var response = await http.get(Uri.parse(url), headers: headers);
   //var jsonData = jsonDecode(response.body.toString());
   var jsonData =json.decode(json.encode(response.body));
       if(response.statusCode == 200)
   {
     jsonData.forEach((element)
     {
       CourseModel courseModel = CourseModel(
         heading: element['title'],
         image: element['image'],
         courseLink: element['link'], successRate: '',
       );
       courses.add(courseModel);
     });
   } else{
     print(response.statusCode);
   }
  }
}

class Categorycourse {
  List <CourseModel> course = [];

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future<void> getCourses(String category)async{
   var url = "https://udemycoupon.herokuapp.com";
   var response = await http.get(Uri.parse(url), headers: headers);
   //var jsonData = jsonDecode(response.body.toString());
   var jsonData =json.decode(json.encode(response.body));
   if(response.statusCode == 200)
   {
     jsonData[0]["$category"].forEach((element)
     {
       CourseModel courseModel = CourseModel(
         heading: element['heading'],
         image: element['image'],
         courseLink: element['courseLink'],
         successRate: element['successRate'],
       );

       print(response.statusCode);
       course.add(courseModel);
     });
   }else{
     print(response.statusCode);
   }
  }
}