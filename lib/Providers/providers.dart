import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'authentication_provider.dart';
import 'common_provider.dart';
import 'test_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CommonProvider>(
    create: (context) => CommonProvider(),
  ),
  ChangeNotifierProvider<TestProvider>(
    create: (context) => TestProvider(),
  ),
  ChangeNotifierProvider<AuthenticationProvider>(
    create: (context) => AuthenticationProvider(),
  ),
];
