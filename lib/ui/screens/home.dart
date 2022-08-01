import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_controller_sample_01/controllers/app.dart';
import 'package:getx_controller_sample_01/controllers/user.dart';
import 'package:getx_controller_sample_01/ui/screens/second.dart';
import 'package:getx_controller_sample_01/ui/widgets/leaguelist.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final AppController _app = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(() => SecondScreen());
      }),
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              _app.populateList();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _app.addToCounter();
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _app.removeFromCounter();
            },
          ),
        ],
      ),
      body: GetBuilder<AppController>(
        builder: (app) => app.loading ? Center(child: CircularProgressIndicator(),) : Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  _widgetA,
                  _widgetB,
                ],
              ),
            ),
            Expanded(flex: 4, child: LeagueListWidget()),
          ],
        ),
      ),
    );
  }

  Widget get _widgetA => Expanded(
      flex: 3,
      child: Center(
        child: Obx(()=>Text("${_app.counter}\nWidth:${Get.width}\nHeight:${Get.height}\nisAndroid:${GetPlatform.isAndroid}")),
      ));


  Widget get _widgetB => Expanded(
      flex: 2,
      child: Container(
        child: GetBuilder<AppController>(
          builder: (app) => GetBuilder<UserController>(
            builder: (user) {
              return Text("${app.text} - ${user.username}");
            }
          ),
        ),
      ));
}
