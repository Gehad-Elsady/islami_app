import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/bloc/cubit.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/RadioModel.dart';
import 'package:islami_app/screens/widget/radio-item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..fetchRadioData(),
      child: BlocConsumer<RadioCubit, RadioStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RadioCubit.get(context);

          if (state is RadioGetSourcesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RadioGetSourcesSuccessState) {
            List<Radios> radios = cubit.radioModel?.radios ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Image.asset(
                    "assets/images/radio-bg.png",
                    height: 222,
                  ),
                ),
                const SizedBox(
                  height: 57,
                ),
                if (radios.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RadioItem(
                            player: cubit.player,
                            radio: radios[index],
                          ),
                        );
                      },
                      itemCount: radios.length,
                    ),
                  )
                else
                  const Center(child: Text("No radio channels available")),
              ],
            );
          } else {
            return const Center(child: Text("Failed to load radio data"));
          }
        },
      ),
    );
  }
}
