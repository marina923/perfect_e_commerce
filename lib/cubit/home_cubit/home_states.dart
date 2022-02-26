abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class GetHomeDataSuccessState extends HomeStates{}
class GetHomeDataLoadingState extends HomeStates{}
class GetHomeDataErrorState extends HomeStates{
  final String error;
  GetHomeDataErrorState(this.error);
}