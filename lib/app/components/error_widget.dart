import 'package:flutter/material.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';

class ErrWidget extends StatelessWidget {
  final Object error;
  const ErrWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 8),
          Text(
            '${SC.error}: $error',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 8),
          Text(
            SC.errorTryAgain,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
