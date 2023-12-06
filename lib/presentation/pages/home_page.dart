import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salt_technical_test/config/methods.dart';
import 'package:salt_technical_test/config/theme.dart';

import '../../config/value.dart';
import '../../data/models/list_user.dart';
import '../bloc/user_bloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataUser> listData = [];
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            listData = state.dataUser;
          }
          if (state is UserFailed) {
            showCustomSnackbar(context, message: state.e);
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: mainColors,
              ),
            );
          }
          if (state is UserInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "$assetImagePath/nodata.png",
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserBloc>().add(GetUserData());
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: mainColors),
                    child: Text(
                      "No Data Found",
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final data = listData[index];
              return UserItem(
                  imageUrl: data.avatar ?? "null",
                  name: "${data.lastName}, ${data.firstName}",
                  email: data.email ?? "null");
            },
          );
        },
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.email,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: mainColors.withOpacity(0.5),
            offset: const Offset(0.0, 2.0),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: mainColors,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        title: Text(
          name,
          style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
        ),
        subtitle: Text(email, style: blackTextStyle),
      ),
    );
  }
}
