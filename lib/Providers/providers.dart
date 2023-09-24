import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'authentication_provider.dart';
import 'common_provider.dart';
import 'quiz_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CommonProvider>(
    create: (context) => CommonProvider(),
  ),
  ChangeNotifierProvider<QuizProvider>(
    create: (context) => QuizProvider(),
  ),
  ChangeNotifierProvider<AuthenticationProvider>(
    create: (context) => AuthenticationProvider(),
  ),
];
