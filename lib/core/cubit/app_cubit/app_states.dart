abstract class AppStates {}

class InitialState extends AppStates {}

//get All Meals
class GetAllMealsLoadingState extends AppStates {}

class GetAllMealsSuccessState extends AppStates {}

class GetAllMealsErrorState extends AppStates {
  final String error;
  GetAllMealsErrorState(this.error);
}

// Search

class SearchMealLoadingState extends AppStates {}

class SearchMealSuccessState extends AppStates {}

class SearchMealErrorState extends AppStates {}

/////////////////////////////////////////////////////////////////////
//Meal Image Picker
class MealImagePickerLoadingState extends AppStates {}

class MealImagePickerSuccessState extends AppStates {}

class MealImagePickerErrorState extends AppStates {}

class DeleteMealImagePickerErrorState extends AppStates {}

//Upload Meal Image
class UpdateMealImageLoadingState extends AppStates {}

class UpdateMealImageSuccessState extends AppStates {}

class UpdateMealImageErrorState extends AppStates {}

//Update Meal Image
class UploadMealImageLoadingState extends AppStates {}

class UploadMealImageSuccessState extends AppStates {}

class UploadMealImageErrorState extends AppStates {}

// Add Meal State

class AddMealLoadingState extends AppStates {}

class AddMealSuccessState extends AppStates {}

class AddMealErrorState extends AppStates {}

// Update Meal State

class UpdateMealLoadingState extends AppStates {}

class UpdateMealSuccessState extends AppStates {}

class UpdateMealErrorState extends AppStates {}

// Delete Meal State

class DeleteMealLoadingState extends AppStates {}

class DeleteMealSuccessState extends AppStates {}

class DeleteMealErrorState extends AppStates {}
