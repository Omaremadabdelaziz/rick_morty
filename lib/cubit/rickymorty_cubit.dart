import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rickymorty_state.dart';

class RickymortyCubit extends Cubit<RickymortyState> {
  RickymortyCubit() : super(RickymortyInitial());

  static RickymortyCubit get(context) => BlocProvider.of(context);


  final dio = Dio();

  Future<void> getData()  {
    emit(RickymortyLoading());
    return dio.get('https://rickandmortyapi.com/api/character').then((value) {
      emit(RickymortySuccess(value));
    }).catchError((error){
      emit(RickymortyError(error));
    });
    // print(response.data['results'][1]['name']);
    // print(response.data['results'][1]['image']);
  }


}
