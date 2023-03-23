import 'package:flutter/material.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/presentation/widgets/text_widget.dart';

class ItemSchedulingWidget extends StatelessWidget {
  final Scheduling scheduling;
  final VoidCallback onTap;

  const ItemSchedulingWidget({Key? key, required this.scheduling, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _contentWidget(context);
  }

  Widget _contentWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _leadingWidget(),
              const SizedBox(width: 10),
              _titleWidget(),
            ],
          ),
          _trailingWidget(),
        ],
      ),
    );
  }

  Widget _leadingWidget() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.green,
      child: TextWidget(
        text: scheduling.name,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: scheduling.userName,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.water_drop_outlined, color: Colors.green),
                const SizedBox(width: 8),
                TextWidget(
                  text: '${scheduling.precipitationPercentage}%',
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined, color: Colors.green),
                const SizedBox(width: 8),
                TextWidget(
                  text: scheduling.scheduledDay.toString().substring(0, 10),
                  fontSize: 15,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _trailingWidget() {
    return GestureDetector(
      onTap: () => onTap(),
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.delete,
          color: Colors.green,
        ),
      ),
    );
  }
}


