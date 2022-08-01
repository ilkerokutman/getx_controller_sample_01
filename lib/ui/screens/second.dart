import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_sample_01/controllers/app.dart';

class SecondScreen extends GetView<AppController> {
  SecondScreen({Key? key}) : super(key: key);
  
  final TextEditingController _t = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _t.text = controller.text;

    return Scaffold(
      appBar: AppBar(title: Text("${controller.counter}"),),
      body: Column(children: [
        TextField(
          controller: _t,
        ),
        ElevatedButton(onPressed: _save, child: Text("kaydet")),
        GetBuilder<AppController>(builder: (app) => Text("${app.leagueList.last.name}")),
      ]),
    );
  }

  void _save() {
    //
    controller.saveText(_t.text);
    Get.back();
  }
}
