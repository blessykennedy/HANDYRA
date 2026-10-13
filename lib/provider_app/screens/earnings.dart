import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/earnings_transaction_card.dart';

class Earnings extends StatelessWidget {
  const Earnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==========================================
              // HEADER
              // ==========================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  14,
                  25,
                  14,
                  10,
                ),
                color: const Color(0xFFF4E0D2),

                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Earnings",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      "Track your income and payouts",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // ==========================================
              // TOTAL THIS MONTH
              // ==========================================

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),

                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFF8F1E9),
                  borderRadius:
                  BorderRadius.circular(9),
                ),

                child: Column(
                  children: [

                    const Text(
                      "Total This Month",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      "₹28,500",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      "↑16% from last month",
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 7),

              // ==========================================
              // SUMMARY CARDS
              // ==========================================

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),

                child: Row(
                  children: [

                    Expanded(
                      child: _summaryCard(
                        "₹8,200",
                        "This Week",
                      ),
                    ),

                    const SizedBox(width: 7),

                    Expanded(
                      child: _summaryCard(
                        "₹1,080",
                        "Pending",
                      ),
                    ),

                    const SizedBox(width: 7),

                    Expanded(
                      child: _summaryCard(
                        "₹24,870",
                        "Withdrawable",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ==========================================
              // MONTHLY EARNINGS
              // ==========================================

              _monthlyEarnings(),

              const SizedBox(height: 9),

              // ==========================================
              // WITHDRAWABLE BALANCE
              // ==========================================

              _withdrawableBalance(context),

              const SizedBox(height: 12),

              // ==========================================
              // RECENT TRANSACTIONS
              // ==========================================

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),

                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              const EarningsTransactionCard(
                name: "Daffne",
                service: "Bridal Makeup",
                date: "Dec 15",
                bookingId: "#BK001",
                amount: "+₹3,150",
                status: "Paid",
                isPending: false,
              ),

              const EarningsTransactionCard(
                name: "Meena",
                service: "Engagement Makeup",
                date: "Dec 10",
                bookingId: "#BK002",
                amount: "+₹2,250",
                status: "Paid",
                isPending: false,
              ),

              const EarningsTransactionCard(
                name: "Roshini",
                service: "Party Makeup",
                date: "Dec 5",
                bookingId: "#BK003",
                amount: "₹1,080",
                status: "Pending",
                isPending: true,
              ),

              const EarningsTransactionCard(
                name: "Arul",
                service: "Hair Styling",
                date: "Nov 28",
                bookingId: "#BK004",
                amount: "+₹750",
                status: "Paid",
                isPending: false,
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      // ==========================================
      // BOTTOM NAVIGATION
      // ==========================================

      bottomNavigationBar: const BottomNav(
        selectedIndex: 3,
      ),
    );
  }

  // ==========================================
  // SUMMARY CARD
  // ==========================================

  static Widget _summaryCard(
      String amount,
      String title,
      ) {
    return Container(
      height: 45,

      decoration: BoxDecoration(
        color: const Color(0xFFF8F5F1),
        borderRadius:
        BorderRadius.circular(7),
      ),

      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Text(
            amount,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            title,
            style: const TextStyle(
              fontSize: 7,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // MONTHLY EARNINGS
  // ==========================================

  static Widget _monthlyEarnings() {
    final months = [
      ["₹18K", "Aug"],
      ["₹22K", "Sep"],
      ["₹20K", "Oct"],
      ["₹25K", "Nov"],
      ["₹29K", "Dec"],
    ];

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      padding: const EdgeInsets.fromLTRB(
        14,
        12,
        14,
        10,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const Text(
            "Monthly Earnings",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.end,

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: List.generate(
              months.length,
                  (index) {

                final item = months[index];

                return Column(
                  children: [

                    Text(
                      item[0],
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight:
                        FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: 19,

                      height: index == 4
                          ? 55
                          : 48,

                      decoration: BoxDecoration(
                        color: index == 4
                            ? const Color(
                          0xFFF0D7C8,
                        )
                            : const Color(
                          0xFFF1EEE9,
                        ),

                        borderRadius:
                        BorderRadius.circular(6),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      item[1],
                      style: const TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // WITHDRAWABLE BALANCE
  // ==========================================

  static Widget _withdrawableBalance(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB9F3A5),
            Color(0xFF55C936),
          ],
        ),

        borderRadius:
        BorderRadius.circular(10),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Withdrawable Balance",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "₹24,870",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Withdraw Earnings"),
                      content: const Text(
                        "Are you sure you want to withdraw ₹24,870 to your registered bank account (HDFC ****4521)?\n\nTransfer will complete within 24 hours.",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Withdrawal request initiated successfully!"),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text("Confirm Withdraw", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),

                  child: const Text(
                    "Withdraw",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          const Text(
            "Bank: HDFC 4521. Transfer within 24 hours",
            style: TextStyle(
              fontSize: 7,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}