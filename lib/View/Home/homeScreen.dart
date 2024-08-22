import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Data/Response/responseStatus.dart';
import 'package:getx_mvvm/Resources/Components/generalException.dart';
import 'package:getx_mvvm/Resources/Components/internetExceptionwidget.dart';
import 'package:getx_mvvm/Resources/Routes/RoutesNames.dart';
import 'package:getx_mvvm/ViewModel/Controller/Home/HomeViewModel.dart';
import 'package:getx_mvvm/ViewModel/Controller/user_preferences/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homecontroller.userListApi();
  }

  final homecontroller = Get.put(HomeViewModel());

  UserPreferences userPreferences = UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome"),
        actions: [
          IconButton(
              onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.delete<HomeViewModel>();
                  Get.toNamed(RoutesNames.loginScreen);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Obx(() {
        switch (homecontroller.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            // if (kDebugMode) {
            //   print(homecontroller.error.value);
            // }
            if (homecontroller.error.value ==
                "type 'Null' is not a subtype of type 'Map<String, dynamic>'") {
              return InternetExceptionWidget(onPressed: () {
                homecontroller.userListApi();
              });
            } else {
              return GeneralExceptionWidget(onPressed: () {
                homecontroller.userListApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homecontroller.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      subtitle: Text(homecontroller
                          .userList.value.data![index].email
                          .toString()),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(homecontroller
                              .userList.value.data![index].avatar
                              .toString())),
                      title: Text(homecontroller
                          .userList.value.data![index].firstName
                          .toString()),
                    ),
                  );
                });
          default:
            return Text('Hello');
        }
      }),
    );
  }
}
