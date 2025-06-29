import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/network/dio_helper.dart';
import 'package:tourism_app/core/network/end_points.dart';
import 'package:tourism_app/core/network/errors/failures.dart';

class GuideDataSource {
  static Future<Either<Failure, String>> getToureGuid() async {
    try {
      await DioHelper.getData(url: EndPoints.tourGuides);
      return Right('Request created successfully');
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
