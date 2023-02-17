import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_cubit.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_state.dart';
import 'package:app_acai/app/features/carrinho/presenter/widgets/total_preso_produtos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';

var now = DateTime.now();
final firstDay = DateTime(now.year, now.month - 1, now.day);
final lastDay = DateTime(now.year, now.month + 1, now.day);

class ControlePrecoWidget extends StatefulWidget {
  const ControlePrecoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ControlePrecoWidget> createState() => _ControlePrecoWidgetState();
}

class _ControlePrecoWidgetState extends State<ControlePrecoWidget> {
  bool isChecked = false;
  CalendarFormat format = CalendarFormat.week;
  double valorTotalProdutos = 0.0;
  double taxa = 3.00;
  late double valorTotalCompra = valorTotalProdutos + taxa;

  final cubit = GetIt.I.get<CarrinhoCubit>();

  @override
  void initState() {
    super.initState();

    cubit.somaPrecoCarrinho();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrinhoCubit, CarrinhoState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is CarrinhoCarregando) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsApp.purplePrimary,
            ),
          );
        }

        if (state is CarrinhoErro) {
          return Center(
            child: Text(
              state.erro.errorMessage,
            ),
          );
        }

        if (state is CarrinhoSomaProduto) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              Row(
                children: const [
                  Text('Valor total dos produtos: '),
                  TotalPrecosProdutosWidget(),
                ],
              ),
              Row(
                children: const [
                  Text('Taxa de entrega: '),
                  Text(
                    'R\$ 3.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text('Taxa total da compra: '),
                  Text(
                    'R\$ 54.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Agenda entrega: '),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
              isChecked == true
                  ? TableCalendar(
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
                    )
                  : Container(),
            ],
          );
        }

        return Container();
      },
    );
  }
}
