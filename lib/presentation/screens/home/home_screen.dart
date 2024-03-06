import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/home/captured_page/pokemon_captured_page.dart';
import 'package:flutter_pokedex/presentation/screens/home/home_screen_viewmodel.dart';
import 'package:flutter_pokedex/presentation/screens/home/pokemon_list_page/pokemon_list_page.dart';
import 'package:flutter_pokedex/presentation/utils/theme/icon_locations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final pages = [
    PokemonListPage(),
    PokemonCapturedPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState homeState = ref.watch(homeViewModelProvider);
    int selectedIndex = homeState.selectedIndex;
    return Scaffold(
      backgroundColor: DvColor.background,
      appBar: AppBar(
        title: DvText.bodyM("Pokédex").styles(color: DvColor.textPrimary),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DvColor.background,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: DvColor.primary,
        unselectedItemColor: DvColor.textSecondary,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconLocations.home,
              width: 25,
              height: 25,
              colorFilter: ColorFilter.mode(DvColor.textSecondary, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              AppIconLocations.home,
              width: 25,
              height: 25,
              colorFilter: ColorFilter.mode(DvColor.primary, BlendMode.srcIn),
            ),
            label: "Pokédex",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconLocations.pokeball,
              width: 25,
              height: 25,
              colorFilter: ColorFilter.mode(DvColor.textSecondary, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              AppIconLocations.pokeball,
              width: 25,
              height: 25,
              colorFilter: ColorFilter.mode(DvColor.primary, BlendMode.srcIn),
            ),
            label: "Captured",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(homeViewModelProvider.notifier).changePage(index);
        },
      ),
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   final pages = [
//     const WelcomePage(),
//     LibraryPage1(),
//     const SettingsPage(),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.width;
//     ThemeData theme = Theme.of(context);

//     // rebuild the widget when the todo list changes
//     HomeState homeState = ref.watch(homeStateProvider);
//     Widget selectedPage = homeState.page;
//     int selectedIndex = homeState.selectedIndex;

//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//       ),
//       body: selectedPage,
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 0,
//         backgroundColor: theme.scaffoldBackgroundColor,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(PhosphorIcons.houseSimple),
//             label: "Principal",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(PhosphorIcons.flowerLotus),
//             label: "Librería",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(PhosphorIcons.user),
//             label: 'Perfil',
//           ),
//         ],
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         currentIndex: selectedIndex,
//         onTap: (idx) => _onItemTap(idx, ref),
//       ),
//     );
//   }

//   void _onItemTap(int index, WidgetRef ref) {
//     HomeViewModel homeViewModel = ref.read(homeStateProvider.notifier);
//     homeViewModel.changePage(pages[index], index);
//   }
// }

