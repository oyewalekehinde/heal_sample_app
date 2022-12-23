import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sample_consultation/consultation_model.dart';
import 'package:sample_consultation/tag-chip.dart';
import 'package:sample_consultation/web_view_page.dart';
import 'api-medic-symptoms.dart';
import 'app_color.dart';
import 'condition-checker.dart';
import 'new_textfield.dart';

class CallDoctorPage extends StatefulWidget {
  const CallDoctorPage({Key? key}) : super(key: key);

  @override
  _CallDoctorPageState createState() => _CallDoctorPageState();
}

class _CallDoctorPageState extends State<CallDoctorPage> {
  late Color enabledBorderColorEmail;
  late Color enabledBorderColorPass;

  final List<ApiMedicSymptoms> filteredList = [];
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _autocompleteKey = GlobalKey();
  List<String> autocompleteList = [
    ApiMedicSymptoms(iD: "1", name: "malaria"),
    ApiMedicSymptoms(iD: "2", name: "Headache"),
    ApiMedicSymptoms(iD: "3", name: "Back pain"),
    ApiMedicSymptoms(iD: "4", name: "Pregancy"),
    ApiMedicSymptoms(iD: "5", name: "Leg pain"),
    ApiMedicSymptoms(iD: "6", name: "cough"),
    ApiMedicSymptoms(iD: "7", name: "Neck pain"),
    ApiMedicSymptoms(iD: "8", name: "Diahorria"),
    ApiMedicSymptoms(iD: "9", name: "Typhoid"),
    ApiMedicSymptoms(iD: "10", name: "muslce pull"),
    ApiMedicSymptoms(iD: "11", name: "Fracture"),
  ].map((e) => e.name!.toLowerCase()).toList();
  String timeOfFirstNotice = 'Time of first notice';
  String assessmentRole = 'This assessment is for?';
  String discomfortStatus = 'Scale of discomfort';
  bool isSearching = false;
  List<ConditionChecker> selectedChips = [];

  List<ApiMedicSymptoms> apiMedicSymptoms = [
    ApiMedicSymptoms(iD: "1", name: "malaria"),
    ApiMedicSymptoms(iD: "2", name: "Headache"),
    ApiMedicSymptoms(iD: "3", name: "Back pain"),
    ApiMedicSymptoms(iD: "4", name: "Pregancy"),
    ApiMedicSymptoms(iD: "5", name: "Leg pain"),
    ApiMedicSymptoms(iD: "6", name: "cough"),
    ApiMedicSymptoms(iD: "7", name: "Neck pain"),
    ApiMedicSymptoms(iD: "8", name: "Diahorria"),
    ApiMedicSymptoms(iD: "9", name: "Typhoid"),
    ApiMedicSymptoms(iD: "10", name: "muslce pull"),
    ApiMedicSymptoms(iD: "11", name: "Fracture"),
  ];

  String contactMedium = "chat";
  List<Map<String, String>> callDoctorSymptoms = [];
  static String? _urlEndpoint;
  FocusNode? focusNode = FocusNode();
  final maxLines = 5;
  final TextEditingController tapSelectSymptomsController =
      TextEditingController();
  final TextEditingController symptomDescController = TextEditingController();
  final TextEditingController probLocationController = TextEditingController();
  TextEditingController selfAssessmentPersonController =
      TextEditingController();
  TextEditingController scaleDiscomfortController = TextEditingController();
  TextEditingController timeFirstNoticeController = TextEditingController();
  TextEditingController lengthLastController = TextEditingController();
  TextEditingController intensityController = TextEditingController();
  TextEditingController query1Controller = TextEditingController();
  TextEditingController query2Controller = TextEditingController();
  TextEditingController query3Controller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: AppColors.grey1,
                )),
            // actions: [
            //   new IconButton(
            //       onPressed: () {
            //         AlertManager.showToast('Coming soon!');
            //       },
            //       icon: Icon(
            //         Icons.call,
            //         size: 27,
            //         color: AppColors.textColor,
            //       )),
            // ],
            title: Text(
              'Consult a doctor',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                fontWeight: FontWeight.w500,
                fontFamily: 'Euclid',
                color: AppColors.textColor,
              ),
            ),
            backgroundColor: Colors.white),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: HealaTextField(
                        validator: (String? val) {
                          return "";
                        },

                        // enabledBorderColor: AppColors.textColor,
                        // label: assessmentRole,
                        icon: Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                        label: "This assessment is for?",
                        textInputType: TextInputType.text,
                        enabled: false,
                        controller: selfAssessmentPersonController,
                      ),
                    ),
                    Positioned(
                        left: 14,
                        top: 10,
                        right: 20,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: Container(),
                              items: <String>['Myself'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  assessmentRole = val!;
                                  selfAssessmentPersonController.text = val;
                                });
                              }),
                        )),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
                child: RawAutocomplete<String>(
                  key: _autocompleteKey,
                  focusNode: _focusNode,
                  textEditingController: _textEditingController,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return autocompleteList.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    }).toList();
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      // cursorColor: AppColors.textColor.withOpacity(0.5),
                      controller: textEditingController,
                      focusNode: focusNode,
                      onFieldSubmitted: (String value) {
                        RawAutocomplete.onFieldSubmitted<String>(
                            _autocompleteKey);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 12.5,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Euclid',
                          color: AppColors.grey1,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            textEditingController.clear();
                          },
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey1,
                          ),
                        ),
                        labelText: "Search for a symptom/illness",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Euclid',
                          color: AppColors.blackText.withOpacity(0.5),
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.textColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.customBlue),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.borderGrey),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4.0,
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                  // selectedChips = selectedChips.reversed
                                  //     .toSet()
                                  //     .toList();
                                  setState(() {
                                    if (!selectedChips
                                        .map((e) => e.label)
                                        .contains(option)) {
                                      Map<String, String> data = new Map();
                                      data = {"name": "\"${option}\""};
                                      selectedChips.add(ConditionChecker(
                                          id: apiMedicSymptoms[index].iD,
                                          label: option,
                                          isSelected: false));
                                      callDoctorSymptoms.add(data);
                                    }
                                    FocusScope.of(context).unfocus();
                                    _textEditingController.clear();
                                  });
                                  // _textEditingController.clear();
                                },
                                child: ListTile(
                                  title: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 14.5,
                                      height: 1.6,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Euclid',
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              selectedChips.isNotEmpty
                  ? Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 12, bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedChips.toSet().length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            child: TagChip(
                              label: selectedChips[index].label!,
                              onDeleted: (val) {
                                setState(() {
                                  selectedChips.removeAt(index);
                                  callDoctorSymptoms.removeAt(index);
                                });
                              },
                              index: 1,
                              icon: Icon(
                                Icons.close_rounded,
                                size: 18,
                                color: AppColors.customBlue,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: HealaTextField(
                              validator: (String? val) {
                                return "";
                              },

                              // label: discomfortStatus,
                              icon: Container(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                              label: "Scale of discomfort",
                              textInputType: TextInputType.text,
                              enabled: false,
                              controller: scaleDiscomfortController,
                            ),
                          ),
                          Positioned(
                              left: 14,
                              top: 10,
                              right: 20,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: Container(),
                                    items: <String>[
                                      '1',
                                      '2',
                                      '3',
                                      '4',
                                      '5',
                                      '6',
                                      '7',
                                      '8',
                                      '9',
                                      '10'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(
                                          value,
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        discomfortStatus = val!;
                                        scaleDiscomfortController.text = val;
                                      });
                                    }),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: HealaTextField(
                              validator: (String? val) {
                                return "";
                              },
                              icon: Container(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                              label: 'Time of first notice',
                              textInputType: TextInputType.text,
                              enabled: false,
                              controller: timeFirstNoticeController,
                            ),
                          ),
                          Positioned(
                              left: 14,
                              top: 10,
                              right: 20,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: Container(),
                                    items: <String>[
                                      'Days ago',
                                      'Weeks ago',
                                      'Months ago',
                                      'A year or more'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(
                                          value,
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        timeOfFirstNotice = val!;
                                        timeFirstNoticeController.text = val;
                                      });
                                    }),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: symptomDescController,
                  maxLines: maxLines,
                  cursorColor: Colors.black26,
                  decoration: InputDecoration(
                      filled: true,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Euclid',
                        color: AppColors.grey1,
                      ),
                      hintText:
                          "Describe your symptoms and what you're experiencing (optional)",
                      fillColor: AppColors.greyBg,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: AppColors.dividerColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: AppColors.dividerColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: AppColors.dividerColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 10, left: 10, right: 10),
                child: Text(
                  'Select your preferred means of consultation',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Euclid',
                    color: AppColors.grey4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            contactMedium = "chat";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: contactMedium == "chat"
                                  ? AppColors.customBlue
                                  : Colors.transparent,
                              border: Border.all(color: AppColors.customBlue),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              )),
                          child: Center(
                            child: Text(
                              'Chat',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.6,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Euclid',
                                color: contactMedium != "chat"
                                    ? AppColors.customBlue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            contactMedium = "video";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: contactMedium == "video"
                                ? AppColors.customBlue
                                : Colors.transparent,
                            border: Border.all(color: AppColors.customBlue),
                          ),
                          child: Center(
                            child: Text(
                              'Video',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.6,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Euclid',
                                color: contactMedium != "video"
                                    ? AppColors.customBlue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            contactMedium = "voice";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: contactMedium == "voice"
                                ? AppColors.customBlue
                                : Colors.transparent,
                            border: Border.all(color: AppColors.customBlue),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Voice',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.6,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Euclid',
                                color: contactMedium != "voice"
                                    ? AppColors.customBlue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator.adaptive())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.customBlue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          // borderColor: AppColors.customBlue,
                          // color: AppColors.customBlue,
                          // textColor: Colors.white,
                          onPressed: () async {
                            if (selfAssessmentPersonController
                                    .text.isNotEmpty &&
                                callDoctorSymptoms.isNotEmpty &&
                                scaleDiscomfortController.text.isNotEmpty &&
                                timeFirstNoticeController.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              var requestPayload = {
                                "consultationOwner":
                                    selfAssessmentPersonController.text,
                                "patientData": {
                                  "email": "anderson@mailinator.com",
                                  "firstName": "Anderson",
                                  "lastName": "Oriahi",
                                  "phoneNumber": "08118022308",
                                  "gender": "Male",
                                  "hmoId": "121234",
                                  "image":
                                      "https://dq1z5gvyi71s7.cloudfront.net/2022-01-17-15-29-246054.png",
                                  "height": "175",
                                  "weight": "80",
                                  "bloodGroup": "A+",
                                  "genotype": "AA"
                                },
                                "symptoms": callDoctorSymptoms,
                                "discomfortLevel":
                                    scaleDiscomfortController.text,
                                "description": symptomDescController.text,
                                "firstNotice": timeFirstNoticeController.text,
                                "type": "instant",
                                "status": "pending",
                                "providerId": "639745096aef6e00134dc218",
                                "contactMedium": contactMedium,
                                "timeOffset": ""
                              };
                              var url = Uri.parse(
                                  'https://api-staging.heala.io/rest/consultations/create');
                              try {
                                var response = await http.post(url,
                                    headers: {
                                      'Content-Type': 'application/json',
                                      "Authorization":
                                          "Api-Key Pbh4HORAyJdF8D6L+Wb7"
                                    },
                                    body: jsonEncode(requestPayload));
                                setState(() {
                                  isLoading = false;
                                });
                                ConsultationResponse consultation =
                                    ConsultationResponse.fromJson(
                                        jsonDecode(response.body));
                                log(consultation.data?.url ?? "");
                                final route = MaterialPageRoute(
                                    builder: (context) => CallScreen(
                                          url: consultation.data!.url!,
                                        ));
                                Navigator.push(context, route);
                                print('Response body: ${response.body}');
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                var snackBar = SnackBar(
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }

                              // controller.forward();
                              // createConsultation(
                              //     await _apiClient?.queryCharacter(
                              //         ApiStrings().createConsultation(
                              //       "instant",
                              //       contactMedium,
                              //       selfAssessmentPersonController.text,
                              //       profile!.sId ?? "",
                              //       symptomDescController.text.trim(),
                              //       timeFirstNoticeController.text,
                              //       profile!.providerId!,
                              //       "pending",
                              //       scaleDiscomfortController.text,
                              //       "${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}",
                              //       "",
                              //       callDoctorSymptoms,
                              //     )),
                              //     controller);
                            } else {
                              var snackBar = SnackBar(
                                content:
                                    Text("Please fill all necessary details"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text('Start instant consultation'),
                        ),
                      ),
                    ),
              SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
