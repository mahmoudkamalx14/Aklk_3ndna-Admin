import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/build_meal_item.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAllMealsWidget extends StatelessWidget {
  const CustomAllMealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: SearchBoxWidget(),
          ),
          body: AppCubit.get(context).allMeals.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildMealItem(
                        AppCubit.get(context).allMeals[index], context),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: AppCubit.get(context).allMeals.length,
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
