
abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppChangeNavBarState extends AppStates {}

class AppGetHomeDataSuccessState extends AppStates {}

class AppGetHomeDataLoadingState extends AppStates {}

class AppGetHomeDataErrorState extends AppStates {
  final String error;
  AppGetHomeDataErrorState(this.error);
}


class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {
  final String error;
  AppGetUserDataErrorState(this.error);
}

