import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:stuwise/core/models/loan_class.dart';
import 'package:stuwise/core/service/firebase_firestore_service.dart';
import 'package:stuwise/ui/constants/exports.dart';
import 'package:stuwise/ui/views/loan_calc_view.dart';
import 'package:stuwise/ui/views/loan_details_view.dart';

class DebtsView extends StatefulWidget {
  const DebtsView({super.key});

  @override
  State<DebtsView> createState() => _DebtsViewState();
}

class _DebtsViewState extends State<DebtsView> {
  final FirebaseFireStoreService _firebaseFireStoreService =
      FirebaseFireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/background.png",
            ),
            fit: BoxFit.cover,
          )),
          child: StreamBuilder(
              stream: _firebaseFireStoreService.getUserLoanList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  // print("${snapshot.data!.docs.first.data()} has data");
                  return snapshot.data!.docs.isEmpty
                      ? const Center(child: Text("No debts added yet"))
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final dataList = snapshot.data!.docs;
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 16.v, left: 16.h, right: 16.h),
                              child: FocusedMenuHolder(
                                onPressed: () {},
                                menuWidth:
                                    MediaQuery.of(context).size.width * 0.50,
                                blurSize: 5.0,
                                menuItemExtent: 45,
                                menuBoxDecoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                duration: const Duration(milliseconds: 100),
                                animateMenuItems: true,
                                blurBackgroundColor: Colors.black54,
                                openWithTap:
                                    false, // Open Focused-Menu on Tap rather than Long Press
                                menuOffset:
                                    10.0, // Offset value to show menuItem from the selected item
                                bottomOffsetHeight: 80.0,
                                menuItems: <FocusedMenuItem>[
                                  // Add Each FocusedMenuItem  for Menu Options

                                  FocusedMenuItem(
                                      title: Text(
                                        "Delete",
                                        style: kSmallBoldTextStyle.copyWith(
                                            fontSize: 20.adaptSize,
                                            color: Colors.redAccent),
                                      ),
                                      trailingIcon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () {
                                        _firebaseFireStoreService
                                            .deleteSingleLoanItem(
                                                context, dataList[index].id);
                                      }),
                                ],
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                LoanDetailsView(
                                                  loan: Loan(
                                                      currency: dataList[index]
                                                              ["currency"] ??
                                                          '\$',
                                                      principal: dataList[index]
                                                          ["loanPrincipal"],
                                                      interestRate: dataList[
                                                              index]
                                                          ["loanInterestRate"],
                                                      termInMonths: dataList[
                                                              index]
                                                          ["loanTermInMonths"]),
                                                )));
                                  },
                                  child: Container(
                                    height: 185.v,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: AppColors.kWhiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.v, horizontal: 16.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Loan Name: ${dataList[index]['loanName']}",
                                              style: kBodyRegularTextStyle
                                                  .copyWith(
                                                      fontSize: 20.adaptSize)),
                                          verticalSpaceMicroSmall,
                                          Text(
                                            "Principal: ${dataList[index]["loanPrincipal"]}",
                                            style: kSubtitleRegularTextStyle,
                                          ),
                                          verticalSpaceMicroSmall,
                                          Text(
                                            "Loan Interest Rate: ${dataList[index]["loanInterestRate"] * 100}%",
                                            style: kSubtitleRegularTextStyle,
                                          ),
                                          verticalSpaceMicroSmall,
                                          Text(
                                            "Loan Term (years): ${(int.parse(dataList[index]["loanTermInMonths"].toString()) ~/ 12)}",
                                            style: kSubtitleRegularTextStyle,
                                          ),
                                          verticalSpaceMicroSmall,
                                          Text(
                                            "Total Interest Paid: ${double.parse(dataList[index]["totalInterestPaid"].toString()).toStringAsFixed(2)}",
                                            style: kSubtitleRegularTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16.v,
                            );
                          },
                          itemCount: snapshot.data!.docs.length);
                }
                if (snapshot.hasError) {
                  print(snapshot.error);

                  return const Text("Has Error");
                }

                return const SizedBox.shrink();
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoanCalcView()));
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.kPrimaryColor.withOpacity(0.7),
        child: const Icon(
          Icons.add,
          color: AppColors.kWhiteColor,
        ),
      ),
    );
  }
}
