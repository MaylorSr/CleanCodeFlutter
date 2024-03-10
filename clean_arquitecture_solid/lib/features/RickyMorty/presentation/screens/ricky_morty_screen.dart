import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/core/di/services_locator.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/RickyMorty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RickyMortyScreen extends StatelessWidget {
  const RickyMortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtén una instancia de RickyMortyBloc desde GetIt
    final rickyMortyBloc = getIt<RickyMortyBloc>();

    return BlocProvider(
      // Proporciona el RickyMortyBloc al BlocProvider
      create: (context) => rickyMortyBloc..add(const RickyMortyEvent()),

      child: BlocBuilder<RickyMortyBloc, RickyMortyState>(
        builder: (context, state) {
          switch (state.state) {
            case GenericState.failure:
              return Scaffold(
                body: Center(child: Text(state.errMessage.toString())),
              );
            case GenericState.loading:
              return const CustomProgress();
            case GenericState.load:
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Ricky And Morty'),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MasonryGridView.count(
                    //controller: _controller,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 35,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) => RickyMortyCard(
                      rickyMorty: state.results[index],
                    ),
                  ),
                ),
              );
            default:
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MasonryGridView.count(
                    //controller: _controller,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 35,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) => RickyMortyCard(
                      rickyMorty: state.results[index],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
