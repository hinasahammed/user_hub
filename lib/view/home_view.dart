import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:user_hub/model/user_model/user_model.dart';
import 'package:user_hub/view/user_details_view.dart';
import 'package:user_hub/viewmodel/provider/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final homeProvider = Provider.of<HomeViewmodel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<List<UserModel>>(
        future: HomeViewmodel().fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData ||
              snapshot.data != null ||
              snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Consumer<HomeViewmodel>(
                  builder: (context, value, child) => Card(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            data.username ?? '',
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "Sincere@april.biz",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(.5),
                            ),
                          ),
                          const Gap(20),
                          MouseRegion(
                            onEnter: (event) {
                              homeProvider.changeHeight(60);
                            },
                            onExit: (event) {
                              homeProvider.changeHeight(50);
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetailsView(user: data),
                                  ),
                                );
                              },
                              child: AnimatedContainer(
                                width: double.infinity,
                                height: value.currenteight.toDouble(),
                                padding: const EdgeInsets.all(8),
                                duration: const Duration(milliseconds: 400),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: value.currenteight != 50
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.surface,
                                  border: Border.all(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(.2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "View Profile",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        color: value.currenteight != 50
                                            ? theme.colorScheme.onPrimary
                                            : theme.colorScheme.onSurface,
                                      ),
                                    ),
                                    if (value.currenteight != 50) const Gap(10),
                                    if (value.currenteight != 50)
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "No data found",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            );
          }
        },
      )),
    );
  }
}
