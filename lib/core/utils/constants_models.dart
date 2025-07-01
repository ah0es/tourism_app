import 'package:tourism_app/features/authentication/login/data/models/login_model.dart';
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

class ConstantsModels {
  static LoginModel? loginModel;
  static List<PlaceModel>? placeModel;
  static List<RestaurantModel>? restaurantModel;
  static List<HotelModel>? hotelModel;
  static List<CityModel>? cityModel;
  static EventModel? eventModel;
  static List<PlanModel>? planModel;
  static List<TourGuidModel>? tourGuidModel;
  static List<FavoriteModel>? favoriteModel;
  static ReviewModel? reviewModel;
  static List<ActivityModel>? activityList;
  static List<BookingModel>? myBooking;
}
