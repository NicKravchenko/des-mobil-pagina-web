import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/categories_screen.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/orders_screens.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/products_screen.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:multistore_webbapp/views/screens/side_bar_screens/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _selectedScreen = const DashboardScreen();

  _screenSelector(item) {
    switch(item.route) {
      case DashboardScreen.routName:
        setState(() => _selectedScreen = const DashboardScreen());
        break;
      case OrderScreen.routName:
        setState(() => _selectedScreen = const OrderScreen());
        break;
      case ProductsScreen.routName:
        setState(() => _selectedScreen = const ProductsScreen());
        break;
      case VendorsScreen.routName:
        setState(() => _selectedScreen = const VendorsScreen());
        break;
      case CategoriesScreen.routName:
        setState(() => _selectedScreen = const CategoriesScreen());
        break;
      case WithdrawalScreen.routName:
        setState(() => _selectedScreen = const WithdrawalScreen());
        break;
      case UploadBannerScreen.routName:
        setState(() => _selectedScreen = const UploadBannerScreen());
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(title: const Text('Multi Store Admin Panel'),),
      backgroundColor: Colors.white,
      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text('Multi Store Admin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        items:
        const [
          AdminMenuItem(
              title: 'Dashboard',
              route: DashboardScreen.routName,
              icon: Icons.dashboard
          ),
          AdminMenuItem(
              title: 'Categories',
              route: CategoriesScreen.routName,
              icon: Icons.category
          ),
          AdminMenuItem(
              title: 'Orders',
              route: OrderScreen.routName,
              icon: Icons.shopping_cart
          ),
          AdminMenuItem(
              title: 'Products',
              route: ProductsScreen.routName,
              icon: Icons.shopping_cart
          ),
          AdminMenuItem(
              title: 'Vendors',
              route: VendorsScreen.routName,
              icon: Icons.person_3
          ),
          AdminMenuItem(
              title: 'Withdrawal',
              route: WithdrawalScreen.routName,
              icon: Icons.attach_money_sharp
          ),
          AdminMenuItem(
              title: 'Upload Banner',
              route: UploadBannerScreen.routName,
              icon: Icons.add
          )
        ],
        selectedRoute: '/',
        onSelected: (item) => _screenSelector(item),
      ),
      body: _selectedScreen,
    );
  }
}
