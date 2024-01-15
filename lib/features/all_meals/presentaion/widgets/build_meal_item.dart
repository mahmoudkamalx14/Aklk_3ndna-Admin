import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/build_update_meal.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

Widget buildMealItem(MealModel model, context) => InkWell(
      onTap: () {
        Dialogs.materialDialog(
            msg: 'Delete or Update ?',
            title: "Choose",
            color: Colors.white,
            context: context,
            actions: [
              IconsOutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) =>
                            CustomUpdateMealWidget(model: model),
                      ));
                },
                text: 'Update',
                color: Colors.green,
                iconData: Icons.update_outlined,
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
              IconsButton(
                onPressed: () {
                  AppCubit.get(context).deleteMeal(
                    name: model.name!,
                    price: model.price!,
                    description: model.description!,
                    photo: model.photo!,
                    rate: model.rate!,
                  );
                  AppCubit.get(context).getAllMeals();
                },
                text: 'Delete',
                iconData: Icons.delete,
                color: Colors.red,
                textStyle: TextStyle(color: Colors.white,),
                iconColor: Colors.white,
              ),
            ]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(model.photo!),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFirebase(model, text: '${model.name}'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      textFirebase(model, text: '${model.price}'),
                      SizedBox(
                        width: 60,
                      ),
                      iconStart(),
                      SizedBox(
                        width: 5,
                      ),
                      textFirebase(model, text: '${model.rate}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget textFirebase(MealModel model, {required String text}) => Text(
      text,
      style: const TextStyle(
        height: 1.4,
        fontSize: 20,
        color: Colors.black,
      ),
      maxLines: 2,
      overflow: TextOverflow.clip,
    );

Widget iconStart() => Icon(Icons.star_rate, color: Colors.yellow);
