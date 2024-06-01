import 'package:flutter/material.dart';
import 'package:learn_api/users_deatils_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersScreen(),
    );
  }
}

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.teal,
          title: Center(
            child: Text("Unsplash applications"),
          ),
        ),
        body: RefreshIndicator(
          child: FutureBuilder(
            future: UsersSplashClass().getImage(),
            builder: (context, snapshot) {
              var image = snapshot.data;
              return ListView.builder(
                itemCount: image?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            "${image?[index].user?.profileImage?.small}")),
                    title: Text(
                      "${image?[index].user?.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${image?[index].user?.firstName}",
                    ),
                  );
                },
              );
            },
          ),
          onRefresh: () {
            return UsersSplashClass().getImage();
          },
        ));
  }
}