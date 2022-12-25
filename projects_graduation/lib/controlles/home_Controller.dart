import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> categoryList = ['education', 'health', 'orphans'];
  RxBool selected = false.obs;
}
