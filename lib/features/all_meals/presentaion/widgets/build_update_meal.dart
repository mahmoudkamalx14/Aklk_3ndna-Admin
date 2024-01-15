// ignore_for_file: must_be_immutable

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUpdateMealWidget extends StatelessWidget {
  CustomUpdateMealWidget({super.key, required this.model});

  MealModel model;

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var editMealImage = AppCubit.get(context).MealImageFile;

        nameController.text = model.name!;
        priceController.text = model.price!;
        rateController.text = model.rate!;
        descriptionController.text = model.description!;
        photoController.text = model.photo!;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Update data for Meal',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(
                          image: editMealImage == null
                              ? NetworkImage('${model.photo}')
                              : FileImage(editMealImage) as ImageProvider,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context).getMealImage();
                            AppCubit.get(context).uploadMealImage(
                              name: nameController.text,
                              price: priceController.text,
                              description: descriptionController.text,
                              rate: rateController.text,
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: nameController,
                  hintText: '${model.name}',
                ),
                CustomTextFormField(
                  controller: priceController,
                  hintText: '${model.price}',
                ),
                CustomTextFormField(
                  controller: rateController,
                  hintText: '${model.name}',
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: '${model.description}',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: CustomButton(
                    width: 50,
                    text: 'Update',
                    onPressed: () {
                      AppCubit.get(context).updateMeal(
                        name: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        photo: photoController.text,
                        rate: rateController.text,
                      );
                    },
                    textColor: Colors.white,
                  ),
                ),
                if (state is UpdateMealLoadingState)
                  const LinearProgressIndicator(
                    color: Colors.amber,
                    backgroundColor: Colors.amber,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
