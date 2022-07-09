import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managementexample/core/constants/navigation_constants.dart';
import 'package:managementexample/core/extension/job_extension.dart';
import 'package:managementexample/features/home/cubit/home_cubit.dart';
import 'package:managementexample/product/router/app_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.router.replaceNamed(NavigationConstants.LOGIN);
              },
              icon: const Icon(Icons.exit_to_app)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Management App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    "Bir sorun oluştu!",
                    style: TextStyle(color: Colors.white),
                  )));
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeCompleted) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              )),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  trailing: Chip(
                                      backgroundColor: Colors.white,
                                      label: Text(state.model.job.toJob())),
                                  title: Text(state.model.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  leading: CircleAvatar(
                                      maxRadius: 30,
                                      backgroundImage: NetworkImage(
                                          state.model.profileImage)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Bolu / Merkez",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      state.model.phone,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      state.model.email,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Visibility(
                    visible: state.model.job < 1,
                    child: ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Text(
                          "Yapılan İşler",
                          style: Theme.of(context).textTheme.headline6,
                        )),
                  ),
                  Visibility(
                      visible: state.model.job != 0, child: const Spacer()),
                  Visibility(
                    visible: state.model.job != 0,
                    child: InkWell(
                      onTap: () {
                        context.router.push(QRCheckRoute(
                            siteId: state.model.siteId,
                            job: state.model.job,
                            userName: state.model.name));
                      },
                      child: const Card(
                          color: Colors.lightBlueAccent,
                          child: Icon(Icons.qr_code_scanner,
                              color: Colors.white, size: 200)),
                    ),
                  ),
                  Expanded(
                      child: Visibility(
                    visible: state.model.job < 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.blue,
                                Colors.lightBlueAccent,
                              ],
                            )),
                        child: state.orders.isNotEmpty
                            ? RefreshIndicator(
                              onRefresh: () async{
                                await context.read<HomeCubit>().getUser();
                              },
                              child: ListView.builder(
                                  itemCount: state.orders.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.check_circle,
                                            color: Colors.greenAccent,
                                            size: 40,
                                          ),
                                          title: Text(
                                              '${state.orders[index].name} - ${state.orders[index].number}'),
                                          subtitle: Text(
                                              '${state.orders[index].staff} - ${state.orders[index].dateTime}'),
                                          trailing: Chip(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            label: Text(
                                                state.orders[index].job
                                                    .toJobName(),
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            )
                            : Center(
                                child: Text("Henüz Yapılan İş Yok!",
                                    style: TextStyle(color: Colors.white)),
                              ),
                      ),
                    ),
                  )),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
