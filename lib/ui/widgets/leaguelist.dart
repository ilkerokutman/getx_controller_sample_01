import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_sample_01/controllers/app.dart';

class LeagueListWidget extends StatelessWidget {
  const LeagueListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: GetBuilder<AppController>(
          builder: (app) => app.leagueList.isEmpty
              ? Center(
                  child: Text('bos liste'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) =>
                      LeagueListRowWidget(name: app.leagueList[index].name, id: app.leagueList[index].id),
                  itemCount: app.leagueList.length,
                )),
    );
  }
}

class LeagueListRowWidget extends StatelessWidget {
  final String name;
  final String id;
  const LeagueListRowWidget({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green.withOpacity(0.3),
      title: Text(name),
      subtitle: Text(id),
    );
  }
}
