import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController _studentController = TextEditingController();
  TextEditingController _pvtController = TextEditingController();
  TextEditingController _govtController = TextEditingController();
  TextEditingController _shopController = TextEditingController();
  TextEditingController _businessController = TextEditingController();
  TextEditingController _freeController = TextEditingController();
  TextEditingController _docController = TextEditingController();
  TextEditingController _engController = TextEditingController();
  TextEditingController _lawController = TextEditingController();
  TextEditingController _otherController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();

  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());

  String? dropdownValue;
  String? selectedStatus;


  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _handleTextChanged(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }
  bool _showTextField = false;
  bool _showTextField1 = false;
  bool _showTextField2= false;
  bool _showTextField3 = false;
  bool _showTextField4 = false;
  bool _showTextField5 = false;
  bool _showTextField6 = false;
  bool _showTextField7= false;
  bool _showTextField8 = false;
  bool _showTextField9 = false;
  bool _showTextField10 = false;
  late String _selectedOption="";
  int selectedRadio = 0;
  int selectedOption = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget buildRadio(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedRadio,
          onChanged: (val) {
            setSelectedRadio(val!);
          },
        ),
        Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0.h),
              Container(
                width: double.infinity,
                child: Text(
                  'Professional Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color:Colors.orange
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                width: 100,
                decoration: BoxDecoration(color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(50),)
                ,
                child: Text(
                  '  Step2',textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color:Colors.white
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.orange,height: 10,),
              SizedBox(height: 10,),


              Column(
                children: [
                  Column(
                    children: [
                      RadioListTile(
                        title: Text('Student'),
                        value: 'Student',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                            _showTextField1 = false;
                            _showTextField8=false;
                            _showTextField2 = false;
                            _showTextField3 = false;
                            _showTextField4 = false;
                            _showTextField5 = false;
                            _showTextField6 = false;
                            _showTextField7 = false;
                            _showTextField = true;
                            _showTextField10 = false;
                            //  selectedOption=0;
                          });
                        },
                      ),
                      Visibility(
                        visible: _showTextField,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Course",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),),

                          ),

                        ),
                      ),
                    ],
                  ),
                  RadioListTile(
                    title: Text('Private Job'),
                    value: 'Private Job',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField8 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField1 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField1,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Orgazination",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Goverment Job'),
                    value: 'Goverment Job',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField2,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Orgazination",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Shop'),
                    value: 'Shopt',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField8 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField3 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField3,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Business'),
                    value: 'Business',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField8 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField4 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField4,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Freelancer'),
                    value: 'Freelancer',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField8 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField5 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField5,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Doctor'),
                    value: 'Doctor',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField8 = false;
                        _showTextField7 = false;
                        _showTextField6 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField6,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Doctor'),
                    value: 'Doctor',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField8 = false;
                        _showTextField7 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField7,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Engineers'),
                    value: 'Engineers',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField8 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField8,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),

                  RadioListTile(
                    title: Text('Lawyers'),
                    value: 'Lawyers',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField8 = false;
                        _showTextField9 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField9,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),
                  RadioListTile(
                    title: Text('Retired'),
                    value: 'Retired',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Teacher'),
                    value: 'Teacher',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Housewife'),
                    value: 'Housewife',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField10 = false;
                        _showTextField2 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Farmer'),
                    value: 'Farmer',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Others'),
                    value: 'Others',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField10 = true;
                        _showTextField=false;
                        _showTextField8 = false;
                        _showTextField9 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField10,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: "Others",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),

                      ),

                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              Text(
                'Locatiion :-',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp,decoration: TextDecoration.underline),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:TextField(
                      //  controller: _areaController,
                      decoration: InputDecoration(
                        hintText: "Pincode",
                      ),
                    ),

                  ),

                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: DropdownButton<String>(
                      hint: Text("Select City"),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: ['Jetpur', 'Rajkot','Junagadh','Ahmedabad',].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: DropdownButton<String>(
                      hint: Text("Select District"),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: ['Rajkot', 'Jetpur','Amreli'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: DropdownButton<String>(
                      hint: Text("Select State"),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: ['Gujarat', 'Rajasthan','Punjab',].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: DropdownButton<String>(
                      hint: Text("Select Country"),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: ['India', 'America','Italy'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  Text('Hide for public',style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                ],
              ),


              SizedBox(height: 50.0.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ThirdPage()),
                    // );
                  },
                  child: Container(
                    width: 327.0.w,
                    height: 56.0.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0.r),
                      color: AppColors.buttonColor,
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}