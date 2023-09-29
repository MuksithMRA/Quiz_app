import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/Widgets/HomeScreen/test_tile_details.dart';
import 'package:quiz_app/models/test_model.dart';
import 'package:quiz_app/providers/test_provider.dart';

import '../utils/loader_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (context, cTest, child) {
        return ListView.builder(
          itemCount: cTest.testList.length,
          itemBuilder: (BuildContext context, int index) {
            TestModel tileItem = cTest.testList[index];
            return TestTileCard(
              tileItem: tileItem,
            );
          },
        );
      },
    );
  }

  void initialize() async {
    await LoadingOverlay.of(context)
        .during(context.read<TestProvider>().getAllTests());
  }
}

class TestTileCard extends StatelessWidget {
  final dynamic tileItem;
  const TestTileCard({Key? key, this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Material(
        elevation: 5,
        color: kWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: SizedBox(
          height: 250,
          child: Column(
            children: [
              tileImage(tileItem.image),
              TestTileDetails(
                tileItem: tileItem,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tileImage(String img) {
    return Expanded(
      child: Material(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/test-default.jpg'),
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
