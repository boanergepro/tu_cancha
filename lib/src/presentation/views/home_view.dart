import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/presentation/controllers/home_view_controller.dart';
import 'package:tu_cancha/src/presentation/widgets/appbar_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/empty_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/item_scheduling_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    Future.microtask(() => context.read<HomeViewController>().getListScheduling());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(context),
      body: _contentWidget(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBarWidget _appBar(BuildContext context) {
    return const AppBarWidget(
      title: TextWidget(
        text: 'Lista de agendamientos',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
  
  Widget _contentWidget(BuildContext context) {
    return Consumer<HomeViewController>(
      builder: (_, controller, __) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (controller.listScheduling.isEmpty) {
          return const EmptyWidget(message: 'No hay agendamientos');
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListView.builder(
            itemCount: controller.listScheduling.length,
            itemBuilder: (_, index) {
              final scheduling = controller.listScheduling[index];

              return ItemSchedulingWidget(
                onTap:  () async {
                  bool? resutl = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) =>  AlertDialog(
                      title: const TextWidget(
                        text: 'Eliminar agendamiento',
                        fontWeight: FontWeight.bold,
                      ),
                      content: const TextWidget(text: 'Estas seguro de eliminar este agendamiento?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const TextWidget(text:'No', color: Colors.green),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const TextWidget(text: 'Si', color: Colors.green),
                        ),
                      ],
                    ),
                  );

                  if (resutl != null && resutl) {
                    controller.deleteScheduling(scheduling.id ?? 0);
                  }
                },
                scheduling: scheduling,
              );
            },
          ),
        );
      },
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    var controller = context.read<HomeViewController>();

    return FloatingActionButton.extended(
      backgroundColor: Colors.green,
      onPressed: () async {
        Scheduling result = await Navigator.pushNamed(context, '/newScheduling') as Scheduling;
        controller.setScheduling(result);
      },
      label: const TextWidget(
        text: 'Nuevo',
        color: Colors.white,
      )
    );
  }
}
