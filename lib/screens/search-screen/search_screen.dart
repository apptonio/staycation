import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/shared/widgets/wide_button.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

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
        SvgPicture.asset(Assets.icons.close),
        Center(
          child: Text(
            'Search places',
            style: textTheme.headline6!
                .merge(TextStyle(color: ThemeColors.teal800)),
          ),
        ),
        FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
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
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: FormBuilderTextField(
                      focusNode: _checkInFocusNode,
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      name: 'checkIn',
                      decoration: InputDecoration(
                        labelText: 'Check In',
                        labelStyle: TextStyle(
                            color: _checkInFocusNode.hasFocus
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
                      validator: FormBuilderValidators.dateString(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: FormBuilderTextField(
                      focusNode: _checkOutFocusNode,
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      name: 'checkOut',
                      decoration: InputDecoration(
                        labelText: 'Check Out',
                        labelStyle: TextStyle(
                            color: _checkOutFocusNode.hasFocus
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
                      validator: FormBuilderValidators.dateString(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    )),
                   // TouchSpin(),
                    //FormBuilderChoiceChip(name: 'numOfGuests', options: ),
                    
                    const SizedBox(height: 20),
                    WideButton(title: 'SEARCH', action: () {})
                    // TOUCH SPIN
                    // CHOICE CHIP
                  ],
                )
              ],
            ))
      ]),
    ));
  }
}
