import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/providers/home_details_arguments.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import '../../http.dart';
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

  final _listingNameFocusNode = FocusNode();
  final _shortDescFocusNode = FocusNode();
  final _longDescFocusNode = FocusNode();
  final _categorizationFocusNode = FocusNode();
  final _capacityFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  final _postalCodeFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();

  @override
  void dispose() {
    _listingNameFocusNode.dispose();
    _shortDescFocusNode.dispose();
    _longDescFocusNode.dispose();
    _categorizationFocusNode.dispose();
    _priceFocusNode.dispose();
    _locationFocusNode.dispose();
    _postalCodeFocusNode.dispose();
    _imageUrlFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeDetailsArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as HomeDetailsArguments?;
    Accommodation? editAccommodation = arguments?.accommodation;

    bool editScreen = editAccommodation != null;

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: NewPlaceAppBar(
                title: "Add new place",
                action: () {
                  final validationCheck = _formKey.currentState?.validate();

                  if (validationCheck != null && validationCheck) {
                    Accommodation accommodation = Accommodation(
                        id: editAccommodation?.id ?? '',
                        imageUrl:
                            _formKey.currentState?.fields['imageUrl']?.value,
                        title: _formKey.currentState?.fields['title']?.value,
                        shortDescription: _formKey
                            .currentState?.fields['shortDescription']?.value,
                        longDescription: _formKey
                            .currentState?.fields['longDescription']?.value,
                        location:
                            _formKey.currentState?.fields['location']?.value,
                        postalCode:
                            _formKey.currentState?.fields['postalCode']?.value,
                        price: int.parse(
                            _formKey.currentState?.fields['price']?.value),
                        categorization: int.parse(_formKey
                            .currentState?.fields['categorization']?.value),
                        capacity: int.parse(
                            _formKey.currentState?.fields['capacity']?.value),
                        accommodationType: _formKey
                            .currentState?.fields['accommodationType']?.value,
                        freeCancelation: _formKey
                            .currentState?.fields['freeCancelation']?.value);

                    _formKey.currentState?.save();
                    FocusScope.of(context).unfocus();

                    editScreen
                        ? http.editPlace(accommodation)
                        : http.addNewPlace(accommodation);

                    Future.delayed(const Duration(milliseconds: 1000), () {
                      router.navigateTo(context, Routes.myPlacesScreen);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: editScreen
                              ? Text(
                                  'Edited listing ${editAccommodation.title}')
                              : Text(
                                  'Added new listing ${_formKey.currentState?.fields['title']?.value}'),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(20.0),
                        ),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Validation failed! Check your inputs!'),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20.0),
                      ),
                    );
                  }
                }),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FormBuilder(
                      key: _formKey,
                      initialValue: {
                        'title': editAccommodation?.title,
                        'shortDescription': editAccommodation?.longDescription,
                        'longDescription': editAccommodation?.shortDescription,
                        'imageUrl': editAccommodation?.imageUrl,
                        'categorization':
                            editAccommodation?.categorization.toString(),
                        'accommodationType':
                            editAccommodation?.accommodationType,
                        'capacity': editAccommodation?.capacity.toString(),
                        'price': editAccommodation?.price.toString(),
                        'location': editAccommodation?.location,
                        'postalCode': editAccommodation?.postalCode.toString(),
                        'freeCancelation': editAccommodation?.freeCancelation,
                      },
                      child: SingleChildScrollView(
                        child: Column(children: [
                          const SizedBox(height: 10),
                          FormBuilderTextField(
                            focusNode: _listingNameFocusNode,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            name: 'title',
                            decoration: InputDecoration(
                              labelText: 'Listing name',
                              labelStyle: TextStyle(
                                  color: _listingNameFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            name: 'shortDescription',
                            decoration: InputDecoration(
                              labelText: 'Short description',
                              labelStyle: TextStyle(
                                  color: _shortDescFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.minLength(1),
                              FormBuilderValidators.maxLength(100),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            name: 'longDescription',
                            decoration: InputDecoration(
                              labelText: 'Long description',
                              labelStyle: TextStyle(
                                  color: _longDescFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.minLength(1),
                              FormBuilderValidators.maxLength(500),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          
                            name: 'categorization',
                            decoration: InputDecoration(
                              labelText: 'Categorization (Number of stars)',
                              labelStyle: TextStyle(
                                  color: _categorizationFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.integer(),
                              FormBuilderValidators.min(1),
                              FormBuilderValidators.max(5)
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            name: 'accommodationType',
                            decoration: InputDecoration(
                              labelText: 'Accommodation type',
                              labelStyle: TextStyle(color: ThemeColors.gray500),
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
                            name: 'capacity',

                            decoration: InputDecoration(
                              labelText: 'Capacity',
                              labelStyle: TextStyle(
                                  color: _capacityFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.numeric(),
                              FormBuilderValidators.min(1),
                              FormBuilderValidators.max(4)
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            name: 'price',

                            decoration: InputDecoration(
                              labelText: 'Price',
                              labelStyle: TextStyle(
                                  color: _priceFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.numeric(),
                              FormBuilderValidators.min(10),
                              FormBuilderValidators.max(10000)
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                name: 'location',
                                decoration: InputDecoration(
                                  labelText: 'Location',
                                  labelStyle: TextStyle(
                                      color: _locationFocusNode.hasFocus
                                          ? ThemeColors.coral500
                                          : ThemeColors.gray500),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeColors.gray200)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ThemeColors.coral500,
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.minLength(1),
                                  FormBuilderValidators.maxLength(20),
                                ]),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                name: 'postalCode',
                                decoration: InputDecoration(
                                  labelText: 'Postal code',
                                  labelStyle: TextStyle(
                                      color: _postalCodeFocusNode.hasFocus
                                          ? ThemeColors.coral500
                                          : ThemeColors.gray500),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeColors.gray200)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ThemeColors.coral500,
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.minLength(3),
                                  FormBuilderValidators.maxLength(20),
                                ]),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                            name: 'imageUrl',
                            decoration: InputDecoration(
                              labelText: 'Listing image URL',
                              labelStyle: TextStyle(
                                  color: _imageUrlFocusNode.hasFocus
                                      ? ThemeColors.coral500
                                      : ThemeColors.gray500),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColors.gray200)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeColors.coral500,
                                ),
                              ),
                            ),
                            validator: FormBuilderValidators.url(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          FormBuilderSwitch(
                            name: 'freeCancelation',
                            title: Text('Free cancellation available',
                                style: textTheme.bodyText1),
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
