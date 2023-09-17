import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../views/home/controller/home.controller.dart';

List<SingleChildWidget> providerList = [
  //*---------------------------home screen controller
  ChangeNotifierProvider(create: (context) => HomeController()),
];
