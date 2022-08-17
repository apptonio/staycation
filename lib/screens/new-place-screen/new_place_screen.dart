import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import '../../router.dart';
import 'widgets/new_place_app_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NewPlaceScreen extends StatefulWidget {
  const NewPlaceScreen({Key? key}) : super(key: key);
  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  late FocusNode _listingNameFocusNode;
  final _shortDescFocusNode = FocusNode();
  final _longDescFocusNode = FocusNode();
  final _categorizationFocusNode = FocusNode();
  final _accommodationTypeFocusNode = FocusNode();
  final _capacityFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  final _postalCodeFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _freeCancellationFocusNode = FocusNode();

  @override
  void dispose() {
    _listingNameFocusNode.dispose();
    _shortDescFocusNode.dispose();
    _longDescFocusNode.dispose();
    _categorizationFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _listingNameFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: NewPlaceAppBar(
              title: "Add new place",
              action: () {
                _formKey.currentState?.save();

                //ScaffoldMessengerState.showSnackBar(context);

                final formData = _formKey.currentState?.value;

                print(formData);

                FocusScope.of(context).unfocus();
                router.navigateTo(context, Routes.myPlacesScreen);
              },
            ),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          FormBuilderTextField(
                            focusNode: _listingNameFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Listing name',
                            decoration: InputDecoration(
                              labelText: 'Listing name',
                              labelStyle: TextStyle(
                                  color: _listingNameFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _shortDescFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Short description',
                            decoration: InputDecoration(
                              labelText: 'Short description',
                              labelStyle: TextStyle(
                                  color: _shortDescFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              FocusScope.of(context)
                                  .requestFocus(_longDescFocusNode);
                            },
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _longDescFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Long description',
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: 'Long description',
                              labelStyle: TextStyle(
                                  color: _longDescFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _categorizationFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            name: 'Categorization',
                            decoration: InputDecoration(
                              labelText: 'Categorization (Number of stars)',
                              labelStyle: TextStyle(
                                  color: _categorizationFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              FocusScope.of(context)
                                  .requestFocus(_accommodationTypeFocusNode);
                            },
                          ),
                          const SizedBox(height: 20),
                          FormBuilderDropdown(
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 'apartment',
                                child: Text('Apartment'),
                              ),
                              DropdownMenuItem(
                                value: 'room',
                                child: Text('Room'),
                              ),
                            ],
                            focusNode: _accommodationTypeFocusNode,
                            name: 'Accommodation type',
                            decoration: InputDecoration(
                              labelText: 'Accommodation type',
                              labelStyle: TextStyle(color: ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _capacityFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Capacity',
                            decoration: InputDecoration(
                              labelText: 'Capacity',
                              labelStyle: TextStyle(
                                  color: _capacityFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _priceFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Price',
                            decoration: InputDecoration(
                              labelText: 'Price',
                              labelStyle: TextStyle(
                                  color: _priceFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
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
                                focusNode: _locationFocusNode,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                name: 'Location',
                                decoration: InputDecoration(
                                  labelText: 'Location',
                                  labelStyle: TextStyle(
                                      color: _locationFocusNode.hasFocus
                                          ? ThemeColors.coral500
                                          : ThemeColors.gray200),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeColors.gray200)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ThemeColors.coral500,
                                    ),
                                  ),
                                ),
                              )),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: FormBuilderTextField(
                                focusNode: _postalCodeFocusNode,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                name: 'Postal code',
                                decoration: InputDecoration(
                                  labelText: 'Postal code',
                                  labelStyle: TextStyle(
                                      color: _postalCodeFocusNode.hasFocus
                                          ? ThemeColors.coral500
                                          : ThemeColors.gray200),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeColors.gray200)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ThemeColors.coral500,
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            focusNode: _imageUrlFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'Listing image URL',
                            decoration: InputDecoration(
                              labelText: 'Listing image URL',
                              labelStyle: TextStyle(
                                  color: _imageUrlFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray200),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                          ),
                          FormBuilderSwitch(
                            name: 'Free cancellation available',
                            title: Text('Free cancellation available', style: textTheme.bodyText1),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            activeTrackColor: ThemeColors.mint200,
                            activeColor: ThemeColors.mint500,
                          ),
                        ]),
                      ))),
            )));
  }
}
