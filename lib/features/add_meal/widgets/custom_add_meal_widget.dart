import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAddMealWidget extends StatefulWidget {
  CustomAddMealWidget({super.key});

  @override
  State<CustomAddMealWidget> createState() => _CustomAddMealWidgetState();
}

class _CustomAddMealWidgetState extends State<CustomAddMealWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var getImageMeal = AppCubit.get(context).MealImageFile;

    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Meal to The Menu',
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
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: getImageMeal == null
                              ? NetworkImage(
                                  'https://better1.co/wp-content/uploads/2018/02/1560.jpg',
                                )
                              : FileImage(getImageMeal) as ImageProvider,
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              AppCubit.get(context).getMealImage();
                            },
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is MealImagePickerSuccessState)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(color)),
                        onPressed: () {
                          setState(() {
                            AppCubit.get(context).uploadMealImage(
                              name: nameController.text,
                              price: priceController.text,
                              description: descriptionController.text,
                              rate: rateController.text,
                            );
                          });
                        },
                        child: const Text(
                          'Get Meal Image',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Name',
                ),
                CustomTextFormField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                CustomTextFormField(
                  controller: rateController,
                  hintText: 'Rate',
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: 'description',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: CustomButton(
                    width: 50,
                    text: 'Add',
                    onPressed: () {
                      AppCubit.get(context).uploadMealImage(
                        name: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        rate: rateController.text,
                      );
                      nameController.clear();
                      priceController.clear();
                      rateController.clear();
                      descriptionController.clear();
                      AppCubit.get(context).removeMealmage();
                    },
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
