import 'package:dartz/dartz.dart';
import 'package:weather_app/data/models/default_model.dart';
 
abstract class UseCase<Type, Params> {
  Future<Either<DefaultModel, Type>> call(Params params);
}
