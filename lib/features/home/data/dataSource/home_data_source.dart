import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/network/dio_helper.dart';
import 'package:tourism_app/core/network/end_points.dart';
import 'package:tourism_app/core/network/errors/failures.dart';
import 'package:tourism_app/features/Profile/Payment/mybooking/data/booking_model.dart';
import 'package:tourism_app/features/home/data/models/activity_model.dart';
import 'package:tourism_app/features/home/data/models/booking_model.dart';
import 'package:tourism_app/features/home/data/models/city_model.dart';
import 'package:tourism_app/features/home/data/models/event_model.dart';
import 'package:tourism_app/features/home/data/models/favorite_model.dart';
import 'package:tourism_app/features/home/data/models/hotel_model.dart';
import 'package:tourism_app/features/home/data/models/place_mode.dart';
import 'package:tourism_app/features/home/data/models/plane_model.dart';
import 'package:tourism_app/features/home/data/models/restaurant_model.dart';
import 'package:tourism_app/features/home/data/models/review_model.dart';
import 'package:tourism_app/features/home/data/models/tourguid_model.dart';

class HomeDataSource {
  static Future<Either<Failure, List<CityModel>>> getCities() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.cities);
      List<CityModel> cities = [];
      if (response.data is List) {
        cities = (response.data as List).map((place) => CityModel.fromJson(place)).toList();
      }
      return Right(cities);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, EventModel>> getEvent() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.events);

      return Right(EventModel.fromJson(response.data));
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<PlaceModel>>> getPlace() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.places);
      List<PlaceModel> places = [];
      if (response.data is List) {
        places = (response.data as List).map((place) => PlaceModel.fromJson(place)).toList();
      }
      return Right(places);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<PlanModel>>> getPlane() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.plans);
      List<PlanModel> plans = [];
      if (response.data is List) {
        plans = (response.data as List).map((place) => PlanModel.fromJson(place)).toList();
      }
      return Right(plans);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<RestaurantModel>>> getRestaurant() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.restaurants);
      List<RestaurantModel> restaurants = [];
      if (response.data is List) {
        restaurants = (response.data as List).map((restaurant) => RestaurantModel.fromJson(restaurant)).toList();
      }
      return Right(restaurants);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<HotelModel>>> getHotels() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.hotels);
      List<HotelModel> hotels = [];
      if (response.data is List) {
        hotels = (response.data as List).map((restaurant) => HotelModel.fromJson(restaurant)).toList();
      }
      return Right(hotels);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<FavoriteModel>>> getFavorite() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.favorites);
      List<FavoriteModel> favorities = [];
      if (response.data is List) {
        favorities = (response.data as List).map((place) => FavoriteModel.fromJson(place)).toList();
      }
      return Right(favorities);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<BookingModel>>> getMyBooking() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.myBookings);
      List<BookingModel> bookingModel = [];
      if (response.data is List) {
        bookingModel = (response.data as List).map((place) => BookingModel.fromJson(place)).toList();
      }
      return Right(bookingModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, String>> confirmBooking({required int bookingId}) async {
    try {
      await DioHelper.postData(endPoint: '${EndPoints.confirmBooking}/$bookingId/confirm', data: {"paymentMethodId": "pm_card_visa"});

      return Right('success');
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<ActivityModel>>> getActivityByPlaceId({required int placeId}) async {
    try {
      final response = await DioHelper.getData(url: '${EndPoints.activity}/$placeId/activities');
      List<ActivityModel> activityModel = [];
      if (response.data is List) {
        activityModel = (response.data as List).map((place) => ActivityModel.fromJson(place)).toList();
      }
      return Right(activityModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, String>> postFavorite({required String entityType, required int entityId}) async {
    try {
      await DioHelper.postData(endPoint: EndPoints.favorites, data: {"entityType": entityType, "entityId": entityId});

      return Right('success');
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, List<TourGuidModel>>> getTourGuids() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.tourGuides);
      List<TourGuidModel> tourGuids = [];
      if (response.data is List) {
        tourGuids = (response.data as List).map((place) => TourGuidModel.fromJson(place)).toList();
      }
      return Right(tourGuids);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, ReviewModel>> getReviews({required String entityName, required int entityId}) async {
    try {
      final response = await DioHelper.getData(url: '${EndPoints.reviews}/$entityName/$entityId?sortOrder=recent&page=1&pageSize=10');

      return Right(ReviewModel.fromJson(response.data));
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  static Future<Either<Failure, String>> createReview(
      {required String entityName, required int entityId, required int rate, required String comment}) async {
    try {
      final response = await DioHelper.postData(
          endPoint: EndPoints.reviews, data: {"entityType": entityName, "entityId": entityId, "rating": rate, "comment": comment});

      return Right('your review createed successfully');
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
