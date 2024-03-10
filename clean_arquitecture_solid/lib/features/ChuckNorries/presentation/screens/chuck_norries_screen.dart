import 'package:clean_arquitecture_solid/core/config/const/resources/resources_assets.dart';
import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/core/di/services_locator.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/providers.dart';

class ChuckNorriesScren extends StatelessWidget {
  const ChuckNorriesScren({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtén una instancia de ChuckNorriesBloc desde GetIt
    final chuckNorriesBloc = getIt<ChuckNorriesBloc>();

    return BlocProvider(
      create: (context) => chuckNorriesBloc..add(const ChuckNorriesEvent()),
      child: BlocBuilder<ChuckNorriesBloc, ChuckNorriesState>(
        builder: (context, state) {
          switch (state.state) {
            case GenericState.failure:
              return const SizedBox();

            case GenericState.loading:
              return const CustomProgress();

            case GenericState.load:
              return _ChuckNorriesScreenInfo(
                data: state.chuckNorries!,
              );

            default:
              return const CustomProgress();
          }
        },
      ),
    );
  }
}

class _ChuckNorriesScreenInfo extends StatelessWidget {
  final ChuckNorriesEntity data;
  const _ChuckNorriesScreenInfo({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ChuckNorriesBloc>().add(
                    const ChuckNorriesEvent(),
                  );
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
        title: const Text('Chuck Norries'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: FadeInImage(
              height: 200,
              placeholder: AssetImage('assetName'),
              image: AssetImage(logoChuck),
              fit: BoxFit.cover,
            ),
          ),
          const CustomSizedBox(
            heitgh: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(data.value),
          ),
        ],
      ),
    );
  }
}
