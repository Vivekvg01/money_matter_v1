import 'package:flutter/material.dart';

import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/all_transaction/all_transaction_screen.dart';
import 'package:money_matter/screens/all_transaction/widgets/transaction_tile_widget.dart';

String dropDownValue = "All";
final List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

class ViewAllTransactions extends StatefulWidget {
  const ViewAllTransactions({Key? key}) : super(key: key);

  @override
  State<ViewAllTransactions> createState() => _ViewAllTransactionsState();
}

class _ViewAllTransactionsState extends State<ViewAllTransactions> {
  @override
  Widget build(BuildContext context) {
    DateTime todayFil = DateTime.now();
    return ValueListenableBuilder(
      valueListenable: transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> transactionDatas, _) {
        return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          itemCount: transactionDatas.length,
          itemBuilder: (ctx, index) {
            TransactionModel dataAtIndex;
            try {
              dataAtIndex = transactionDatas[index];
            } catch (e) {
              return Container();
            }

            if (dropDownValue == 'Income' &&
                dataAtIndex.type == CategoryType.income) {
              if (dataFilterValue == 'Today') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              } else if (dataFilterValue == 'Yesterday') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day - 1) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              } else if (dataFilterValue == 'All') {
                return incomeTileWidget(
                  context,
                  dataAtIndex,
                  index,
                );

                //month Income Filter
              } else if (dataFilterValue == 'Month') {
                if (monthFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Feb' &&
                    dataAtIndex.date.month == 2) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Mar' &&
                    dataAtIndex.date.month == 3) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Apr' &&
                    dataAtIndex.date.month == 4) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'May' &&
                    dataAtIndex.date.month == 5) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Jun' &&
                    dataAtIndex.date.month == 6) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Jul' &&
                    dataAtIndex.date.month == 7) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Aug' &&
                    dataAtIndex.date.month == 8) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Sep' &&
                    dataAtIndex.date.month == 9) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Oct' &&
                    dataAtIndex.date.month == 10) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Nov' &&
                    dataAtIndex.date.month == 11) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Dec' &&
                    dataAtIndex.date.month == 12) {
                  return incomeTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              }
              return Container();
            }

            //Expense Filter
            else if (dropDownValue == 'Expense' &&
                dataAtIndex.type == CategoryType.expense) {
              if (dataFilterValue == 'All') {
                return expenseTileWidget(
                  context,
                  dataAtIndex,
                  index,
                );
              } else if (dataFilterValue == 'Today') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              } else if (dataFilterValue == 'Yesterday') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day - 1) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              } else if (dataFilterValue == 'Month') {
                if (monthFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Feb' &&
                    dataAtIndex.date.month == 2) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Mar' &&
                    dataAtIndex.date.month == 3) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Apr' &&
                    dataAtIndex.date.month == 4) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'May' &&
                    dataAtIndex.date.month == 5) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Jun' &&
                    dataAtIndex.date.month == 6) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Jul' &&
                    dataAtIndex.date.month == 7) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Aug' &&
                    dataAtIndex.date.month == 8) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Sep' &&
                    dataAtIndex.date.month == 9) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Oct' &&
                    dataAtIndex.date.month == 10) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Nov' &&
                    dataAtIndex.date.month == 11) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                } else if (monthFilterValue == 'Dec' &&
                    dataAtIndex.date.month == 12) {
                  return expenseTileWidget(
                    context,
                    dataAtIndex,
                    index,
                  );
                }
              }

              return Container();
            } else {
              if (dropDownValue == "All") {
                if (dataAtIndex.type == CategoryType.income) {
                  if (dataFilterValue == 'All') {
                    return incomeTileWidget(
                      context,
                      dataAtIndex,
                      index,
                    );
                  } else if (dataFilterValue == 'Today') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  } else if (dataFilterValue == 'Yesterday') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day - 1) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  } else if (dataFilterValue == 'Month') {
                    if (monthFilterValue == 'Jan' &&
                        dataAtIndex.date.month == 1) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Feb' &&
                        dataAtIndex.date.month == 2) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Mar' &&
                        dataAtIndex.date.month == 3) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Apr' &&
                        dataAtIndex.date.month == 4) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'May' &&
                        dataAtIndex.date.month == 5) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Jun' &&
                        dataAtIndex.date.month == 6) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Jul' &&
                        dataAtIndex.date.month == 7) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Aug' &&
                        dataAtIndex.date.month == 8) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Sep' &&
                        dataAtIndex.date.month == 9) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Oct' &&
                        dataAtIndex.date.month == 10) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Nov' &&
                        dataAtIndex.date.month == 11) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Dec' &&
                        dataAtIndex.date.month == 12) {
                      return incomeTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  }
                  return Container();
                } else {
                  if (dataFilterValue == 'All') {
                    return expenseTileWidget(
                      context,
                      dataAtIndex,
                      index,
                    );
                  } else if (dataFilterValue == 'Today') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  } else if (dataFilterValue == 'Yesterday') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day - 1) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  } else if (dataFilterValue == 'Month') {
                    if (monthFilterValue == 'Jan' &&
                        dataAtIndex.date.month == 1) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Feb' &&
                        dataAtIndex.date.month == 2) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Mar' &&
                        dataAtIndex.date.month == 3) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Apr' &&
                        dataAtIndex.date.month == 4) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'May' &&
                        dataAtIndex.date.month == 5) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Jun' &&
                        dataAtIndex.date.month == 6) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Jul' &&
                        dataAtIndex.date.month == 7) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Aug' &&
                        dataAtIndex.date.month == 8) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Sep' &&
                        dataAtIndex.date.month == 9) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Oct' &&
                        dataAtIndex.date.month == 10) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Nov' &&
                        dataAtIndex.date.month == 11) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    } else if (monthFilterValue == 'Dec' &&
                        dataAtIndex.date.month == 12) {
                      return expenseTileWidget(
                        context,
                        dataAtIndex,
                        index,
                      );
                    }
                  }
                  return Container();
                }
              } else {
                return Container();
              }
            }
          },
        );
      },
    );
  }
}


