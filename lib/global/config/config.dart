import 'package:flutter/material.dart';
import 'package:todo/main.dart';

//*--------------------------------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;
//*----------------------------------(Media_Query)
Size size = MediaQuery.of(globalContext).size;
