import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/features/add_meal/views/add_meal_view.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/views/all_meals_view.dart';
import 'package:aklk_3ndna/features/home/presentation/logic/bottom_nav_bar_cubit.dart';
import 'package:aklk_3ndna/features/home/presentation/view/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> screens = const [
    const HomeView(),
    AddMealView(),
    const AllMealsView(),
  ];

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavBarCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  _buildBody() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: screens,
      physics: BouncingScrollPhysics(),
    );
  }

  BottomAppBar _bottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.089,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSingleNavBarBottom(
            context,
            defaultIcon: IconlyLight.home,
            page: 0,
            label: "Orders",
            filledIcon: IconlyBold.home,
          ),
          _buildSingleNavBarBottom(
            context,
            defaultIcon: Icons.add_circle_rounded,
            page: 1,
            label: "Add Meal",
            filledIcon: Icons.add_circle_rounded,
          ),
          _buildSingleNavBarBottom(
            context,
            defaultIcon: Icons.fastfood_rounded,
            page: 2,
            label: "Meals",
            filledIcon: Icons.fastfood_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleNavBarBottom(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        if (page == 2) AppCubit.get(context).getAllMeals();
        BlocProvider.of<BottomNavBarCubit>(context).changeSelectedIndex(page);
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Column(
        children: [
          Icon(
            context.watch<BottomNavBarCubit>().state == page
                ? filledIcon
                : defaultIcon,
            color: context.watch<BottomNavBarCubit>().state == page
                ? Colors.amber
                : Colors.grey,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.aBeeZee(
              color: context.watch<BottomNavBarCubit>().state == page
                  ? Colors.amber
                  : Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: context.watch<BottomNavBarCubit>().state == page
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
