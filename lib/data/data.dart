import 'package:wallpaper/models/categories.dart';

String apiKey = '563492ad6f917000010000011ca751d56ce74cc2a73b5c385689672e';

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = new List();
  CategoryModel categoryModel = new CategoryModel();
  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/1121897/pexels-photo-1121897.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260';
  categoryModel.categoriesName = 'Street Art';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/168496/pexels-photo-168496.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoryModel.categoriesName = 'Wild Life';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/2896668/pexels-photo-2896668.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categoryModel.categoriesName = 'Nature';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/3849167/pexels-photo-3849167.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoryModel.categoriesName = 'City';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/937786/pexels-photo-937786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoryModel.categoriesName = 'Motivational';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/750841/pexels-photo-750841.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoryModel.categoriesName = 'Biker';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl = 'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoryModel.categoriesName = 'Car';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}