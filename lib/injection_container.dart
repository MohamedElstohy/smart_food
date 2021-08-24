import 'package:get_it/get_it.dart';
import 'package:smart_food/provider/get_categories.dart';

final sl = GetIt.instance;

Future<void> init(){
  sl.registerFactory(() => GetCategories());

}