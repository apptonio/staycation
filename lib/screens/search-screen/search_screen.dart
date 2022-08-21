import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/providers/homes_guests_love_arguments.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/widgets/wide_button.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final searchString = String;
  final checkIn = DateTime;
  final checkOut = DateTime;
  final capacity = int;
  final accommodationType = String;

  final _searchFocusNode = FocusNode();
  final _checkInFocusNode = FocusNode();
  final _checkOutFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _checkInFocusNode.dispose();
    _checkOutFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
          child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: SvgPicture.asset(Assets.icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ))),
      const SizedBox(height: 20),
      Center(
        child: Text(
          'Search places',
          style:
              textTheme.headline6!.merge(TextStyle(color: ThemeColors.teal800)),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(height: 10),
                FormBuilderTextField(
                  focusNode: _searchFocusNode,
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  name: 'search',
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(
                        color: _searchFocusNode.hasFocus
                            ? ThemeColors.coral500
                            : ThemeColors.gray500),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeColors.gray200)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeColors.coral500,
                      ),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(1),
                    FormBuilderValidators.maxLength(30),
                  ]),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: FormBuilderDateTimePicker(
                          name: "checkIn",
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          initialDatePickerMode: DatePickerMode.day,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          resetIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              Assets.icons.calendar,
                              color: ThemeColors.gray300,
                            ),
                          ),
                          decoration: InputDecoration(
                            labelText: "Check in",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: ThemeColors.gray200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: ThemeColors.coral400),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: FormBuilderDateTimePicker(
                          name: "checkOut",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          resetIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              Assets.icons.calendar,
                              color: ThemeColors.gray300,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Check out",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: ThemeColors.gray200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: ThemeColors.coral400),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Number of guests',
                      style: textTheme.bodyLarge!.merge(const TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 1)),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TouchSpin(
                          displayFormat: NumberFormat.compact(),
                          iconSize: 20,
                          iconActiveColor: ThemeColors.gray300,
                          min: 1,
                          max: 4,
                          textStyle: const TextStyle(fontSize: 16),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Accommodation type',
                      style: textTheme.bodyLarge!.merge(const TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 1)),
                    )),
                FormBuilderChoiceChip(
                    name: 'accommodationType',
                    options: const [
                      FormBuilderChipOption(value: 'Apartment'),
                      FormBuilderChipOption(value: 'Room'),
                      FormBuilderChipOption(value: 'Mobile home')
                    ],
                    spacing: 20,
                    backgroundColor: ThemeColors.white,
                    selectedColor: ThemeColors.mint200,
                    shape: StadiumBorder(
                        side: BorderSide(color: ThemeColors.gray300)),
                    labelStyle: TextStyle(color: ThemeColors.gray300)),
                const SizedBox(
                  height: 40,
                ),
                WideButton(
                    title: "SEARCH",
                    action: () {
                      final validationCheck = _formKey.currentState?.validate();

                      if (validationCheck != null && validationCheck) {
                        router.toHomesGuestsLoveScreen(
                            context,
                            HomesGuestsLoveListScreenArgumments(
                                filter: _formKey.currentState?.fields['search']
                                        ?.value ??
                                    ''));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Validation failed! Check your inputs!'),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(20.0),
                          ),
                        );
                      }
                    })
              ]))))
    ])));
  }
}
