// Packages
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Controllers
import 'package:task_manager/modules/utils/controllers/authed_user_controller.dart';
import 'package:task_manager/modules/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authedUserController = Modular.get<AuthedUserController>();
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    if (_authedUserController.authedUser == null) {
      Modular.to.navigate('/auth/login');
    }

    final String username =
        _authedUserController.authedUser!.displayName.toString();
    final String email = _authedUserController.authedUser!.email.toString();

    return Scaffold(
      drawer: Drawer(
          child: Column(children: [
        UserAccountsDrawerHeader(
            accountName: Text(
              username,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              email,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: Icon(Icons.add),
            title: Text("Adicionar Tarefa"),
            onTap: () => Modular.to.pushNamed("/task/create")),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Sair"),
          onTap: () {
            _authedUserController.logout();
          },
        )
      ])),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
          child: AppBar(
            leading: Builder(builder: (context) {
              return Container(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            }),
            title: Text(
              "Home",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.cyan,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: double.infinity),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Minha lista de Tarefas",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // Tarefas
            _homeController.buildTasksList()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text(
              "Adicionar Tarefa",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        onPressed: () => Modular.to.pushNamed("/task/create"),
      ),
    );
  }
}
