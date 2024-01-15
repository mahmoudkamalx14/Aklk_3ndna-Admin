import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  MealModel? mealModel;

// Get All Meals

  List<MealModel> allMeals = [];

  void getAllMeals() {
    allMeals.clear();
    emit(GetAllMealsLoadingState());
    FirebaseFirestore.instance.collection('mealsAr').get().then((value) {
      value.docs.forEach((element) {
        allMeals.add(MealModel.fromJson(element.data()));
      });

      emit(GetAllMealsSuccessState());
    }).catchError((error) {
      emit(GetAllMealsErrorState(error.toString()));
      print(error);
    });
  }

  // Pick an Meal Image
  File? MealImageFile;
  var picker = ImagePicker();
  Future getMealImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      MealImageFile = File(pickedFile.path);
      log('${pickedFile.path.toString()}');
      emit(MealImagePickerSuccessState());
    } else {
      print('No Image Selected');
      emit(MealImagePickerErrorState());
    }
  }

  void uploadMealImage({
    required String name,
    required String price,
    required String description,
    required String rate,
  }) {
    emit(UpdateMealImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('mealsAr/${Uri.file(MealImageFile!.path).pathSegments.last}')
        .putFile(MealImageFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        AddMeal(
          name: name,
          price: price,
          description: description,
          rate: rate,
          photo: value,
        );
        log('$value');
      }).catchError((error) {
        emit(UpdateMealImageErrorState());
      });
    }).catchError((error) {
      emit(UpdateMealImageErrorState());
    });
  }

  void removeMealmage() {
    MealImageFile = null;
    emit(DeleteMealImagePickerErrorState());
  }

  void AddMeal({
    required String name,
    required String price,
    required String description,
    required String rate,
    required String? photo,
  }) {
    emit(AddMealLoadingState());
    MealModel meal = MealModel(
      name: name,
      price: price,
      description: description,
      photo: photo,
      rate: rate,
    );
    FirebaseFirestore.instance
        .collection('mealsAr')
        .doc(name)
        .set(meal.toMap())
        .then((value) {
      print('The meal => ${mealModel} is Added');
      emit(AddMealSuccessState());
    }).catchError((error) {
      emit(AddMealErrorState());
    });
  }

  // Delete Meal

  void deleteMeal({
    required String name,
    required String price,
    required String description,
    required String photo,
    required String rate,
  }) {
    emit(DeleteMealLoadingState());
    MealModel meal = MealModel(
      name: name,
      price: price,
      description: description,
      photo: photo,
      rate: rate,
    );

    FirebaseFirestore.instance
        .collection('mealsAr')
        .doc(name)
        .delete()
        .then((value) {
      mealModel = MealModel.fromJson(meal.toMap());
      emit(DeleteMealSuccessState());
      print('The meal => ${mealModel} is deleted');
    }).catchError((onError) {
      emit(DeleteMealErrorState());
    });
  }

  Future<void> updateMeal({
    required String name,
    required String price,
    required String description,
    String? photo,
    required String rate,
  }) async {
    emit(UpdateMealLoadingState());
    MealModel meal = MealModel(
      name: name,
      price: price,
      description: description,
      photo: photo ?? mealModel!.photo,
      rate: rate,
    );

    await FirebaseFirestore.instance
        .collection('mealsAr')
        .doc(name)
        .update(meal.toMap())
        .then((value) {
      getAllMeals();
      emit(UpdateMealSuccessState());
      log('The meal => ${mealModel!.price} is updated');
    }).catchError((onError) {
      emit(UpdateMealErrorState());
    });
  }

  // Search by meal name
  List<MealModel> resultSearch = [];
  void Search(String text) async {
    emit(SearchMealLoadingState());
    resultSearch.clear();
    allMeals.forEach((element) {
      if (element.name!.contains(text)) {
        resultSearch.add(element);
      }
      if (text == nullptr) {
        resultSearch.clear();
      }
      emit(SearchMealSuccessState());
    });
  }
}
