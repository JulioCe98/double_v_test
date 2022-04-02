import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:double_v_store/src/app/providers.dart';
import 'package:double_v_store/src/core/constants/app_consts.dart';
import 'package:double_v_store/src/core/models/user.dart';
import 'package:double_v_store/src/ui/widgets/backgrounds/home_background.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(painter: HomeBackground(), child: const _HomeScreenBodyWidget()),
        ),
      ),
    );
  }
}

class _HomeScreenBodyWidget extends StatelessWidget {
  const _HomeScreenBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: const Color(0xffF5F3FB),
        padding:
            EdgeInsets.only(top: size.height * 0.1, left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
        child: Consumer(builder: (context, ref, child) {
          final user = ref.watch(userNotifierProvider).user;
          List<String> userAddreses = _concatenateAddresses(user);
          return Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: Column(children: [
                  RichText(
                      text: TextSpan(style: TextStyle(color: Colors.black, fontSize: size.height * 0.03), children: [
                    TextSpan(text: AppConsts.informativeConst["HELLO"]!),
                    TextSpan(
                        text: user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.04, color: Colors.blue.shade800))
                  ])),
                  SizedBox(height: size.height * 0.01),
                  const Text("Sunt irure velit qui in deserunt commodo ut sunt enim veniam sit cupidatat dolor.",
                      maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
                ])),
            SizedBox(height: size.height * 0.05),
            const _SearchBar(),
            SizedBox(height: size.height * 0.05),
            Container(
                width: double.infinity,
                height: size.height * 0.2,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //TITLE
                  Text(AppConsts.informativeConst["ADDRESSES"]!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.03, color: Colors.blue.shade800)),
                  SizedBox(height: size.height * 0.02),
                  //SLIDER
                  Expanded(
                    child: ListView.builder(
                        itemCount: userAddreses.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          return _AddressCardWidget(userAddress: userAddreses[index], index: index);
                        }),
                  )
                ])),
            SizedBox(height: size.height * 0.05),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.1),
                    decoration: BoxDecoration(color: Colors.blue.shade800, borderRadius: BorderRadius.circular(12.0)),
                    child: Row(children: [
                      //DATA
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
                              child: Column(children: [
                                Text(AppConsts.informativeConst["COMPANY_DATA"]!,
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
                                Text(user.email, style: TextStyle(color: Colors.white, fontSize: size.width * 0.03)),
                              ]))),
                      //IMAGE
                      Icon(MdiIcons.naturePeople, color: Colors.white, size: size.height * 0.2)
                    ])))
          ]);
        }));
  }

  List<String> _concatenateAddresses(User user) {
    List<String> addresses = [];
    addresses.add(user.address);

    if (user.secondaryAddresses!.isNotEmpty) {
      for (String address in user.secondaryAddresses!) {
        addresses.add(address);
      }
    }
    return addresses;
  }
}

class _AddressCardWidget extends StatelessWidget {
  const _AddressCardWidget({Key? key, required this.userAddress, required this.index}) : super(key: key);

  final int index;
  final String userAddress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.7,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Row(children: [
          Icon(Icons.location_city, size: size.height * 0.1),
          SizedBox(width: size.width * 0.05),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(index == 0 ? AppConsts.informativeConst["ADDRESS"]! : "${AppConsts.informativeConst["SECONDARY_ADDRESS"]!} $index",
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.height * 0.01),
                    Text(userAddress)
                  ])))
        ]));
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0, 8.0), blurRadius: 20.0)],
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(children: [
        Expanded(child: Text(AppConsts.searchBars["SEARCH"]!, style: TextStyle(color: Colors.grey))),
        Container(
          padding: EdgeInsets.all(size.height * 0.01),
          decoration: BoxDecoration(color: Colors.blue.shade800, borderRadius: BorderRadius.circular(5.0)),
          child: const Icon(Icons.search, color: Colors.white),
        )
      ]),
    );
  }
}
