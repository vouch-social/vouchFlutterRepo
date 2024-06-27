import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/settings/wallet/wallet_controller.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

final walletController = Get.put(WalletController());
var walletData;
var transactionsData;

  Future<void> fetchWallet() async {
    var fetchWalletData = await walletController.getWalletController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        walletData = fetchWalletData.responseData;
      });
    });
  }

Future<void> fetchTransactions() async {
  var fetchTransactionData = await walletController.getTransactions();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return;
    setState(() {
      transactionsData = fetchTransactionData.responseData;
    });
  });
}

void _initializeData() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    fetchWallet();
    fetchTransactions();
  });
}
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: const CustomAppBar(
        title: "Wallet",
        showProfileButton: false,
        showBackButton: true,
        showNotificationButton: true,
        showHistoryButton: true,
      ),
      body: SafeArea(
          child:
      Padding(
        padding:EdgeInsets.all(16.0.w),
        child: Obx(
            () => Column(
            children: [
              walletController.isLoading.value || walletData == null ?
                  Center(
                    child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ):
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                    padding: EdgeInsets.all(16.0.w),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0.w),
                     color: FlutterFlowTheme.of(context).pastelTint
                   ),
                   child: AutoSizeText("Wallet Balance: ${walletData.balance}",
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack
                      ),
                      ),
                  ),
                 SizedBox(height: 20.0.h,),
                 AutoSizeText("Transactions ",
                 style: FlutterFlowTheme.of(context).titleLarge,
                 ),
                 SizedBox(height: 16.0.h,),

               ],
             ),
            ],
          ),
        ),
      )
      ),
    );
  }
}
