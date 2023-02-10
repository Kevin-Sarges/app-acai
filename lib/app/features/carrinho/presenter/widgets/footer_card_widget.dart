import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class FooterCardWidget extends StatefulWidget {
  const FooterCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FooterCardWidget> createState() => _FooterCardWidgetState();
}

class _FooterCardWidgetState extends State<FooterCardWidget> {
  bool isChecked = false;
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        Row(
          children: const [
            Text('Valor total dos produtos: '),
            Text('R\$ 37,90'),
          ],
        ),
        Row(
          children: const [
            Text('Taxa de entrega: '),
            Text('R\$ 3,00'),
          ],
        ),
        Row(
          children: const [
            Text('Taxa total da compra: '),
            Text('R\$ 40,90'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                var now = DateTime.now();
                final firstDay = DateTime(now.year, now.month - 3, now.day);
                final lastDay = DateTime(now.year, now.month + 3, now.day);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SizedBox(
                      width: 10,
                      height: 400,
                      child: TableCalendar(
                        firstDay: firstDay,
                        lastDay: lastDay,
                        focusedDay: now,
                        calendarFormat: format,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                        ),
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: ColorsApp.purplePrimary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(now, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            now = selectedDay;
                            now = focusedDay;
                          });
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancelar'),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Salvar data'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Agendar pedido',
                style: TextStyle(
                  color: ColorsApp.purplePrimary,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.purpleSecondary,
              ),
              child: const Text('Salvar Localização'),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     const Text('Agendar pedido '),
        //     Checkbox(
        //       value: isChecked,
        //       onChanged: (bool? value) {
        //         setState(() {
        //           isChecked = value!;
        //         });
        //       },
        //     ),
        //   ],
        // ),
        // isChecked == false
        //     ? Container()
        // : TableCalendar(
        //     firstDay: firstDay,
        //     lastDay: lastDay,
        //     focusedDay: now,
        //     calendarFormat: format,
        //     startingDayOfWeek: StartingDayOfWeek.monday,
        //     headerStyle: const HeaderStyle(
        //       formatButtonVisible: false,
        //     ),
        //     calendarStyle: const CalendarStyle(
        //       todayDecoration: BoxDecoration(
        //         color: ColorsApp.purplePrimary,
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //     selectedDayPredicate: (day) {
        //       return isSameDay(now, day);
        //     },
        //     onDaySelected: (selectedDay, focusedDay) {
        //       setState(() {
        //         now = selectedDay;
        //         now = focusedDay;
        //       });
        //     },
        //   )
      ],
    );
  }
}
