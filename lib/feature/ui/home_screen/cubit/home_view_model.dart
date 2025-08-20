import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/ui/home_screen/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/proudects_tab/proudcts_tab.dart';
import '../tabs/user_tab/user_tab.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());
  //todo hold data handle logic

  bool isSelected = false;

  int selectedIndex = 0;

  List<Widget> bodyList = [HomeTab(), ProudctsTab(), FavoriteTab(), UserTab()];
  void bottomNaOnTap(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
