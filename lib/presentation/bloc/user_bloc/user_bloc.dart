import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/list_user.dart';
import '../../../data/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserData) {
        List<DataUser> listData = [];
        try {
          emit(UserLoading());
          await UserDataService().getData().then((value) {
            if (value.isNotEmpty) {
              listData = value;
              emit(UserSuccess(listData));
            } else {
              emit(UserInitial());
            }
          });
          emit(UserSuccess(listData));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
