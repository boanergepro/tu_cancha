import 'package:flutter/material.dart';
import 'package:tu_cancha/src/presentation/constants.dart';
import 'package:tu_cancha/src/presentation/widgets/text_widget.dart';

class SelectorFieldWidget extends StatefulWidget {
  final String label;
  final Function(String) onSelected;

  const SelectorFieldWidget({
    Key? key,
    required this.label,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<SelectorFieldWidget> createState() => _SelectorFieldWidgetState();
}

class _SelectorFieldWidgetState extends State<SelectorFieldWidget> {
  String selectedField = fieldsList.first;

  @override
  Widget build(BuildContext context) {
    return _contentWidget(context);
  }

  Widget _contentWidget(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: widget.label,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              fieldsList.length,
              (index) => _itemWidget(
                fieldsList[index],
                context,
                selectedField == fieldsList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(String itemName, BuildContext context, bool isSelected) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedField = itemName;
        });
        widget.onSelected(itemName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.transparent,
        child: Container(
          width: size.width * 0.18,
          height: size.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _imageWidget(),
              SizedBox(
                width: size.width * 0.18,
                child: _textWidget(itemName, isSelected),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageWidget() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/court.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _textWidget(String text, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: isSelected
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              )
            : null,
        border: isSelected
            ? null
            : Border(
                top: BorderSide(
                  color:
                      isSelected ? Colors.green : Colors.grey.withOpacity(0.5),
                ),
              ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
