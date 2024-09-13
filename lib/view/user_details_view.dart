import 'package:flutter/material.dart';
import 'package:user_hub/model/user_model/user_model.dart';

class UserDetailsView extends StatelessWidget {
  final UserModel user;
  const UserDetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name ?? '',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.email ?? '',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            Text(
              user.phone ?? '',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            Text(
              user.website ?? '',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            const Divider(),
            Text(
              "${user.address!.city ?? ''},${user.address!.street ?? ''},${user.address!.suite ?? ''},${user.address!.zipcode ?? ''}",
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            const Divider(),
            Text(
              user.company!.name ?? '',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              user.company!.catchPhrase ?? '',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            Text(
              user.company!.bs ?? '',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
