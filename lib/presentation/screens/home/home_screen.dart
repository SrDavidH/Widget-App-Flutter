import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/theme/menu/menu_items.dart';
import 'package:widget_app/presentation/screens/home/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3 '),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return ListView.builder(

      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        
        return _CustomListTile(menuItem: menuItem);
      } );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon( menuItem.icon ),
      trailing: Icon( Icons.arrow_forward_ios_rounded, color:colors.primary),
      title: Text(menuItem.title),
      subtitle: Text( menuItem.subtitle ),
      onTap: (){
        //navegar a otra pantalla
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => ButtonsScreen(),
      //     ),
      // );
      context.push( menuItem.link);//router
      },
    );
  }
}