import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism_app/core/utils/constants_models.dart';
import 'package:tourism_app/core/utils/utils.dart';
import 'package:tourism_app/features/home/data/dataSource/home_data_source.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit of(BuildContext context) => BlocProvider.of<FavoriteCubit>(context);

  Future<void> getFavorites({required BuildContext context}) async {
    if (isClosed) return;
    emit(FavoriteLoading());
    await HomeDataSource.getFavorite().then((value) async {
      value.fold(
        (l) {
          Utils.showToast(title: l.errMessage, state: UtilState.error);
          if (isClosed) return;
          emit(FavoriteError(e: l.errMessage));
        },
        (r) async {
          ConstantsModels.favoriteModel = r;
          if (isClosed) return;
          emit(FavoriteSuccess());
        },
      );
    });
  }
}
