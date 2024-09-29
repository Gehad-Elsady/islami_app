import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/RadioModel.dart';
import 'package:http/http.dart' as http;

class RadioCubit extends Cubit<RadioStates> {
  RadioCubit() : super(RadioInitState());

  static RadioCubit get(context) => BlocProvider.of(context);

  RadioModel? radioModel;
  AudioPlayer player = AudioPlayer();

  Future<void> fetchRadioData() async {
    try {
      emit(RadioGetSourcesLoadingState());
      var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
      var responds = await http.get(uri);

      var json = jsonDecode(responds.body);

      radioModel = RadioModel.fromJson(json);

      emit(RadioGetSourcesSuccessState());
    } catch (e) {
      RadioGetSourcesErrorState();
    }
  }
}
