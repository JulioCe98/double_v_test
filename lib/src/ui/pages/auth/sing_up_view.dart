import 'package:double_v_store/src/core/utils/forms_verifications.dart';
import 'package:double_v_store/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:double_v_store/src/app/providers.dart';
import 'package:double_v_store/src/ui/widgets/forms/custom_text_form_field.dart';
import 'package:double_v_store/src/ui/widgets/sliders/custom_slider.dart';
import 'package:double_v_store/src/core/constants/app_consts.dart';

class SingUpFormWidget extends ConsumerStatefulWidget {
  final Function changePage;
  const SingUpFormWidget({Key? key, required this.changePage}) : super(key: key);

  @override
  ConsumerState<SingUpFormWidget> createState() => _SingUpFormWidgetState();
}

class _SingUpFormWidgetState extends ConsumerState<SingUpFormWidget> {
  late int _currentPage;
  late PageController _pageViewController;

  late GlobalKey<FormState> _personalDataFormKey;
  late GlobalKey<FormState> _addressDataFormKey;
  late GlobalKey<FormState> _accountDatFormKey;

  @override
  void initState() {
    _currentPage = 0;
    _pageViewController = PageController();

    _personalDataFormKey = GlobalKey();
    _addressDataFormKey = GlobalKey();
    _accountDatFormKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: size.height * 0.2, bottom: size.height * 0.05),
        width: double.infinity,
        child: Column(children: [
          Expanded(
              child: PageView(controller: _pageViewController, children: [
            _PersonalDataFormWidget(formKey: _personalDataFormKey),
            _AddressFormWidget(formKey: _addressDataFormKey),
            _AccountFormWidget(formKey: _accountDatFormKey)
          ])),
          CustomSliderWidget(currentPage: _currentPage, moveBackward: _moveBackward, moveForward: _moveForward, limit: 2),
          if (_currentPage == 2)
            TextButton(
                onPressed: () => _singUp(),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text(
                      AppConsts.buttonConst["SINGUP"]!,
                      style: const TextStyle(color: Colors.white),
                    ))),
          GestureDetector(
            onTap: () => widget.changePage(0),
            child: RichText(
                text: TextSpan(style: TextStyle(color: Colors.black, fontSize: size.width * 0.035), children: [
              TextSpan(text: "${AppConsts.informativeConst["HAVE_ACCOUNT"]!} "),
              TextSpan(
                  text: AppConsts.informativeConst["LOGIN"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
            ])),
          )
        ]));
  }

  void _moveForward() {
    if (_verifyCurrentForm()) {
      _updateCurrentPage("forward");
      _pageViewController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  void _moveBackward() {
    _updateCurrentPage("backward");
    _pageViewController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void _updateCurrentPage(String action) {
    if (action == "forward") {
      setState(() {
        _currentPage++;
      });
    } else {
      setState(() {
        _currentPage--;
      });
    }
  }

  bool _verifyCurrentForm() {
    switch (_currentPage) {
      case 0:
        return _personalDataFormKey.currentState?.validate() ?? false;
      default:
        return _addressDataFormKey.currentState?.validate() ?? false;
    }
  }

  void _singUp() async {
    bool validateAccountForm = _accountDatFormKey.currentState?.validate() ?? false;
    if (validateAccountForm) {
      bool status = await ref.read(userNotifierProvider).saveUser();
      if (status) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    }
  }
}

class _PersonalDataFormWidget extends StatelessWidget {
  final GlobalKey formKey;
  const _PersonalDataFormWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer(builder: (context, ref, child) {
      return Form(
          key: formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(AppConsts.informativeConst["COMPLETE_PERSONAL_DATA"]!, style: TextStyle(color: Colors.black, fontSize: size.width * 0.035)),
            SizedBox(height: size.height * 0.03),
            CustomTextFormFieldWidget(
                title: AppConsts.informativeConst["NAME"]!,
                initialValue: ref.read(userNotifierProvider).user.name,
                hint: AppConsts.informativeConst["NAME_HINT"]!,
                icon: Icons.person,
                rounded: true,
                validator: FormsVerifications.verifyName,
                onChanged: (name) => ref.read(userNotifierProvider).user.name = name),
            SizedBox(height: size.height * 0.02),
            CustomTextFormFieldWidget(
                title: AppConsts.informativeConst["LAST_NAME"]!,
                initialValue: ref.read(userNotifierProvider).user.lastname,
                hint: AppConsts.informativeConst["LAST_NAME_HINT"]!,
                icon: Icons.person,
                rounded: true,
                validator: FormsVerifications.verifyLastName,
                onChanged: (lastname) => ref.read(userNotifierProvider).user.lastname = lastname),
            SizedBox(height: size.height * 0.02),
            Padding(
                padding: EdgeInsets.only(left: size.width * 0.02),
                child: Row(children: [
                  Expanded(child: Text(AppConsts.informativeConst["BIRTHDATE"]!, style: TextStyle(fontSize: size.width * 0.04))),
                  ElevatedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(AppConsts.buttonConst["SELECT"]!))
                ]))
          ]));
    });
  }

  void _selectDate(context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (selected != null) {
      context.read(userNotifierProvider).user.birthdate = selected.toString();
    }
  }
}

class _AddressFormWidget extends ConsumerStatefulWidget {
  final GlobalKey formKey;

  const _AddressFormWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  ConsumerState<_AddressFormWidget> createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends ConsumerState<_AddressFormWidget> {
  late List<Widget> _fields;
  late List<TextEditingController> _textFormFieldControllers;
  late int _numberOfTextFormFields;

  @override
  void initState() {
    _fields = [];
    _textFormFieldControllers = [];
    _numberOfTextFormFields = 0;
    super.initState();
  }

  @override
  void deactivate() {
    _saveSecondaryAddresses();
    super.deactivate();
  }

  void _saveSecondaryAddresses() {
    if (_textFormFieldControllers.isNotEmpty) {
      List<String> secondaryAddresses = [];
      for (var _tffc in _textFormFieldControllers) {
        secondaryAddresses.add(_tffc.text);
      }
      ref.read(userNotifierProvider).user.secondaryAddresses = secondaryAddresses;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(bottom: size.height * 0.01),
        child: Form(
            key: widget.formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(AppConsts.informativeConst["COMPLETE_ADDRESS_DATA"]!, style: TextStyle(color: Colors.black, fontSize: size.width * 0.035)),
              SizedBox(height: size.height * 0.03),
              CustomTextFormFieldWidget(
                  title: AppConsts.informativeConst["ADDRESS"]!,
                  initialValue: ref.read(userNotifierProvider).user.address,
                  hint: AppConsts.informativeConst["ADDRESS_HINT"]!,
                  onChanged: (address) => ref.read(userNotifierProvider).user.address = address,
                  icon: Icons.location_city,
                  validator: FormsVerifications.verifyMainAddress,
                  rounded: true),
              SizedBox(height: size.height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(Icons.add),
                InkWell(onTap: () => _addTextFormField(ref), child: Text(AppConsts.informativeConst["ADD_OTHER_ADDRESS"]!)),
              ]),
              Expanded(child: ListView(children: _fields))
            ])));
  }

  void _addTextFormField(ref) {
    TextEditingController textEditingController = TextEditingController();
    _textFormFieldControllers.add(textEditingController);

    _fields = List.from(_fields)
      ..add(CustomTextFormFieldWidget(
          controller: textEditingController,
          title: "${AppConsts.informativeConst["SECONDARY_ADDRESS"]!} ${_numberOfTextFormFields + 1}",
          hint: AppConsts.informativeConst["ADDRESS_HINT"]!,
          icon: Icons.location_city));
    setState(() => ++_numberOfTextFormFields);
  }
}

class _AccountFormWidget extends StatelessWidget {
  final GlobalKey formKey;

  const _AccountFormWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
        key: formKey,
        child: Consumer(builder: (context, ref, child) {
          return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(AppConsts.informativeConst["COMPLETE_ACCOUNT_DATA"]!, style: TextStyle(color: Colors.black, fontSize: size.width * 0.035)),
            SizedBox(height: size.height * 0.03),
            CustomTextFormFieldWidget(
                textInputType: TextInputType.emailAddress,
                title: AppConsts.informativeConst["EMAIL"]!,
                hint: AppConsts.informativeConst["EMAIL_HINT"]!,
                icon: Icons.alternate_email,
                validator: FormsVerifications.validateEmail,
                rounded: true,
                onChanged: (email) => ref.read(userNotifierProvider).user.email = email),
            SizedBox(height: size.height * 0.03),
            CustomTextFormFieldWidget(
                title: AppConsts.informativeConst["PASSWORD"]!,
                hint: AppConsts.informativeConst["PASSWORD_HINT"]!,
                icon: Icons.lock,
                rounded: true,
                obscureText: true,
                onChanged: (password) => ref.read(userNotifierProvider).user.password = password),
          ]);
        }));
  }
}
