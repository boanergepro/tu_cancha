import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/presentation/controllers/new_scheduling_controller.dart';
import 'package:tu_cancha/src/presentation/widgets/appbar_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/date_picker_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/selector_field_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/text_field_widget.dart';
import 'package:tu_cancha/src/presentation/widgets/text_widget.dart';

class NewSchedulingView extends StatelessWidget {
  const NewSchedulingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _contentWidget(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBarWidget _appBar(BuildContext context) {
    return AppBarWidget(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const TextWidget(
        text: 'Nuevo agendamiento',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    var controller = context.read<NewSchedulingController>();

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectorFieldWidget(
            label: 'Selecciona la cancha',
            onSelected: (value) {
              controller.field = value;
            },
          ),
          const SizedBox(height: 25),
          TextFieldWidget(
            controller: controller.userNameController,
            label: 'Nombre del usuario',
          ),
          const SizedBox(height: 25),
          DatePickerWidget(
            onDateSelected: (date) {
              controller.selectedDate = date;
              controller.getProbabilityPrecipitation();
            },
          ),
          const SizedBox(height: 25),
          Consumer<NewSchedulingController>(
            builder: (_, controller, __) {
              return Row(
                children: [
                  const TextWidget(
                    text: 'Probabilidad de lluvia: ',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  controller.isShowProbability
                      ? TextWidget(
                          text: '${controller.probabilityPrecipitation}%',
                          fontWeight: FontWeight.bold,
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _floatingActionButton(context) {
    return Consumer<NewSchedulingController>(
      builder: (_, controller, __) {
        return FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: controller.isLoading
              ? () {}
              : () async {
                  var result = await controller.saveScheduling();
                  if (result is Scheduling) {
                    Navigator.pop(context, result);
                  } else {
                    await EasyLoading.showError(
                      'Upps! Ya hay 3 reservas para este dia, por favor elija otro dia',
                      duration: const Duration(seconds: 4),
                    );
                    Navigator.pop(context);
                  }
                },
          label: controller.isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const TextWidget(
                  text: 'Guardar',
                  color: Colors.white,
                ),
        );
      },
    );
  }
}
