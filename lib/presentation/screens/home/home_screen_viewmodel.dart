import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(
      //const PokemonListPage(),
      0,
    );
  }

  void changePage(
    //Widget page,
    int selectedIndex,
  ) {
    state = HomeState(
      //page,
      selectedIndex,
    );
  }
}

class HomeState {
  // Widget page;
  int selectedIndex;
  //Contructor
  HomeState(
    //this.page,
    this.selectedIndex,
  );
}

final homeViewModelProvider = NotifierProvider<HomeViewmodel, HomeState>(HomeViewmodel.new);
