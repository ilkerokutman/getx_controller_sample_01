import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_controller_sample_01/controllers/user.dart';
import 'package:getx_controller_sample_01/data/models/league.dart';
import 'package:getx_controller_sample_01/data/provider/network.dart';

class AppController extends GetxController {

  RxBool _isLoading = false.obs;
  bool get loading => _isLoading.value;

  

  @override
  void onReady() {
    super.onReady();
  }

  final RxInt _counter = 0.obs;
  final RxString _text = "asfas".obs;

  int get counter => _counter.value;

  String get text => _text.value;

  void addToCounter() {
    _counter.value++;
    update();

    log("counter value is now $counter");
  }

  void removeFromCounter() {
    _counter.value--;
    update();

    log("counter value is now $counter");
  }

  void saveText(String s) {
    _text.value = s;
    update();
  }

  final RxList<League> _leagueList = <League>[].obs;
  List<League> get leagueList => _leagueList;

  void populateList() async {
    _isLoading.value = true;
    update();

    var jsonList = await AppNetwork.getLeagueList();
    var mylist = <League>[];
    for (var i = 0; i < jsonList.length; i++) {
      if (i >= counter) break;
      mylist.add(League.fromMap(jsonList[i]));
    }

    if (counter % 2 == 0) {
      mylist.sort((a, b) => a.name.compareTo(b.name));
    } else {
      mylist.sort((a, b) => a.name.length.compareTo(b.name.length));
    }

    final UserController _user = Get.find();
    _user.setUsername(mylist.first.id);

    _leagueList.assignAll(mylist);
    _isLoading.value=false;
    update();
  }
}
