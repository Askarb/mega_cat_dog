import 'package:bloc/bloc.dart';
import 'package:dogs/models/dogs_model.dart';
import 'package:dogs/repo/get_dogs_repo.dart';
import 'package:meta/meta.dart';

import '../models/cats_model.dart';

part 'get_dogs_event.dart';
part 'get_dogs_state.dart';

class GetDogsBloc extends Bloc<GetDogsEvent, GetDogsState> {
  GetDogsBloc({required this.repo}) : super(GetDogsInitial()) {
    on<GetDataEvent>(
      (event, emit) async {
        try {
          if (event.isDog) {
            emit(
              GetDogsSuccess(
                model: await repo.getDogsData(
                  count: event.count,
                ),
              ),
            );
          } else {
            emit(
              GetCatsSuccess(
                model: await repo.getCatsData(),
              ),
            );
          }
        } catch (e) {
          print(e);
          emit(GetDogsError());
        }
      },
    );
  }
  final GetDogsRepo repo;
}
