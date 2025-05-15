import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(color: Colors.cyan),),
        darkTheme: ThemeData(primarySwatch: Colors.cyan,
            appBarTheme : AppBarTheme(color: Colors.lightBlue),
        ),
        debugShowCheckedModeBanner: false,
        home:HomeActivity());
  }

}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(message,context)
  {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New App",
          style: TextStyle(
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarOpacity: 1,
        toolbarHeight: 60,
        elevation: 10,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){MySnackBar("I am comment", context);}, icon: Icon(Icons.comment,)),
          IconButton(onPressed: (){MySnackBar("I am search", context);}, icon: Icon(Icons.search,)),
        ],

      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.blue,
        onPressed: (){
          MySnackBar("I am floating action button", context);
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.blue,
        elevation: 10,
        selectedIconTheme: IconThemeData(
          opacity: 1,
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          opacity: 0.6,
          size: 20,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "Contract"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index){
          if(index==0)
            {
              MySnackBar("I am home bottom menu", context);
            }

          if(index==1)
          {
            MySnackBar("I am contract bottom menu", context);
          }

          if(index==2)
          {
            MySnackBar("I am profile bottom menu", context);
          }

        },
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  accountName: Text("Rabbi"),
                  accountEmail: Text("abdurrahmarrabbi51@gmail.com"),
                  currentAccountPicture: Image.network("https://img.icons8.com/color/512/flutter.png"),

                )
                    
            ),
            ListTile(leading: Icon(Icons.home),title: Text("Home"),
              onTap: () {
              MySnackBar("Home", context);
              },),
            ListTile(leading: Icon(Icons.comment),title: Text("Contact"),
              onTap: () {
              MySnackBar("Contact", context);
              },),
            ListTile(leading: Icon(Icons.person),title: Text("Profile"),
              onTap: () {
              MySnackBar("Profile", context);
              },),
            ListTile(leading: Icon(Icons.email),title: Text("Email"), 
              onTap: () {
              MySnackBar("Email", context);
              },),

          ],
        ),
      ),
      
    );
  }

}
