import 'package:flutter/material.dart';
import 'package:free_course/model/category_model.dart';

List <CategoryModel> getCategories(){
  List <CategoryModel> category = <CategoryModel>[];

  CategoryModel categoryModel;
  categoryModel =  CategoryModel();

  //1
  categoryModel = new CategoryModel();
  categoryModel.color = Color(0xff99CAE1);
  categoryModel.categoryName = "Development";
  categoryModel.imageURL = "assets/images/dev.svg";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.color = Color(0xffE19999);
  categoryModel.categoryName = "Networking";
  categoryModel.imageURL = "assets/images/network.svg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.color = Color(0xff9EE199);
  categoryModel.categoryName = "Web";
  categoryModel.imageURL = "assets/images/web.svg";
  category.add(categoryModel);


  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Language";
  categoryModel.imageURL = "assets/images/web.svg";
  categoryModel.color=Color(0xff99CAE1);
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Marketing";
  categoryModel.imageURL = "assets/images/network.svg";
  categoryModel.color=Color(0xffE19999);

  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = " Design";
  categoryModel.imageURL = "assets/images/dev.svg";
  categoryModel.color=Color(0xff9EE199);

  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Office-Productivity";
  categoryModel.imageURL = "assets/images/dev.svg";
  categoryModel.color=Color(0xff99CAE1);
  category.add(categoryModel);

  //8
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Personal-Development";
  categoryModel.imageURL = "assets/images/web.svg";
  categoryModel.color=Color(0xffE19999);
  category.add(categoryModel);

  //9
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Test-Prep";
  categoryModel.imageURL = "assets/images/dev.svg";
  categoryModel.color=Color(0xff9EE199);
  category.add(categoryModel);

  return category;

}