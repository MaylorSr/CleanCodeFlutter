import 'package:clean_arquitecture_solid/core/config/const/resources/resources_assets.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';
import 'package:flutter/material.dart';

class RickyMortyCard extends StatelessWidget {
  const RickyMortyCard({super.key, required this.rickyMorty});

  final RickyMortyEntity rickyMorty;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          borderOnForeground: true,
          color: Colors.white38,
          elevation: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(rickyMorty.url),
                  placeholder: const AssetImage(loading),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    rickyMorty.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
