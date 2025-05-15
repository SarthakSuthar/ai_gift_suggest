// /*import 'package:ai_gift_suggest/app_constant.dart';
// import 'package:ai_gift_suggest/bloc/gift_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _occassionController = TextEditingController();
//   final TextEditingController _fromBudgetController = TextEditingController();
//   final TextEditingController _toBudgetController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Container(
//               color: Colors.white,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 Stack(
//                   alignment: Alignment.topLeft,
//                   children: [
//                     Column(
//                       children: [
//                         const SizedBox(height: 40),
//                         Image.asset(
//                           scale: 1.25,
//                           "assets/images/moto.png",
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Image.asset(
//                           scale: 2,
//                           "assets/images/logo.png",
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 50),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 18.0),
//                         child: Text(
//                           "Choose Occasion",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       TextField(
//                         controller: _occassionController,
//                         decoration: InputDecoration(
//                             filled:
//                                 true, // Ensure the background color is applied
//                             fillColor: Colors.white,
//                             hintStyle: const TextStyle(
//                               color: Colors.blue,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             hintText: "Random suggestions",
//                             isDense: true, // Added this
//                             contentPadding: const EdgeInsets.all(10)),
//                         style: const TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0),
//                             child: Text(
//                               "Price Range",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextField(
//                                   controller: _fromBudgetController,
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     filled:
//                                         true, // Ensure the background color is applied
//                                     fillColor: Colors
//                                         .white, // Set background color to black
//                                     hintStyle: const TextStyle(
//                                       color: Colors.blue,
//                                     ), // Set hint text color
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                     hintText: "  ₹- Min",
//                                     isDense: true,
//                                     contentPadding: const EdgeInsets.all(10),
//                                   ),
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                   ), // Ensure text color is white
//                                 ),
//                               ),
//                               const SizedBox(width: 20),
//                               Expanded(
//                                 child: TextField(
//                                   controller: _toBudgetController,
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     filled:
//                                         true, // Ensure the background color is applied
//                                     fillColor: Colors
//                                         .white, // Set background color to black
//                                     hintStyle: const TextStyle(
//                                         color:
//                                             Colors.blue), // Set hint text color
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                     hintText: "  ₹- Max",
//                                     isDense: true,
//                                     contentPadding: const EdgeInsets.all(10),
//                                   ),
//                                   style: const TextStyle(
//                                     color: Color.fromARGB(1, 66, 108, 139),
//                                   ), // Ensure text color is white
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         height: 45,
//                         width: double.infinity,
//                         child: OutlinedButton(
//                           onPressed: () {
//                             final occassion = _occassionController.text;
//                             final fromBudget =
//                                 double.parse(_fromBudgetController.text);
//                             final toBudget =
//                                 double.parse(_toBudgetController.text);

//                             if (occassion.isEmpty &&
//                                 fromBudget > 0 &&
//                                 toBudget > fromBudget) {
//                               context.read<GiftBloc>().add(GetGiftEvent(
//                                   occassion, fromBudget, toBudget));
//                             }

//                             // Implementation requires statemanagment
//                           },
//                           style: OutlinedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.card_giftcard,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Let's Gift",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       BlocBuilder<GiftBloc, GiftState>(
//                         builder: (context, state) {
//                           if (state is GiftSuggestionLoadingState) {
//                             return const CircularProgressIndicator();
//                           } else if (state is GiftSuggestionLoadedState) {
//                             return Text(
//                               "Suggested Gift: ${state.suggestedGift}",
//                               style: const TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             );
//                           } else if (state is GiftSuggestionErrorState) {
//                             return Text("Error: ${state.error}",
//                                 style: const TextStyle(color: Colors.red));
//                           } else {
//                             return Container();
//                           }
//                         },
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }*/

// import 'package:ai_gift_suggest/bloc/gift_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _occassionController = TextEditingController();
//   final TextEditingController _fromBudgetController = TextEditingController();
//   final TextEditingController _toBudgetController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),

//             // 🎉 Occasion Input
//             _buildLabel("Choose Occasion"),
//             _buildTextField(_occassionController, "Random suggestions"),

//             const SizedBox(height: 30),

//             // 💰 Price Range Inputs
//             _buildLabel("Price Range"),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(_fromBudgetController, "₹- Min",
//                       isNumber: true),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: _buildTextField(_toBudgetController, "₹- Max",
//                       isNumber: true),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 30),

//             // 🎁 Gift Suggestion Button
//             _buildGiftButton(),

//             const SizedBox(height: 50),

//             // 📦 Suggested Gift Display
//             BlocBuilder<GiftBloc, GiftState>(
//               builder: (context, state) {
//                 if (state is GiftSuggestionLoadingState) {
//                   return const CircularProgressIndicator();
//                 } else if (state is GiftSuggestionLoadedState) {
//                   return _buildGiftResult(state.suggestedGift);
//                 } else if (state is GiftSuggestionErrorState) {
//                   return _buildErrorText(state.error);
//                 }
//                 return Container();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🏷️ Builds a Label
//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18.0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }

//   /// 🔤 Generic TextField
//   Widget _buildTextField(TextEditingController controller, String hint,
//       {bool isNumber = false}) {
//     return TextField(
//       controller: controller,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         hintStyle: const TextStyle(color: Colors.blue),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//         hintText: hint,
//         contentPadding: const EdgeInsets.all(10),
//       ),
//       style: const TextStyle(color: Colors.blue),
//     );
//   }

//   /// 🎁 "Let's Gift" Button
//   Widget _buildGiftButton() {
//     return SizedBox(
//       height: 45,
//       width: double.infinity,
//       child: OutlinedButton(
//         onPressed: _suggestGift,
//         style: OutlinedButton.styleFrom(backgroundColor: Colors.pink),
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.card_giftcard, color: Colors.white, size: 20),
//             SizedBox(width: 5),
//             Text("Let's Gift",
//                 style: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.w700)),
//           ],
//         ),
//       ),
//     );
//   }

//   /// 📦 Gift Suggestion Display
//   Widget _buildGiftResult(String gift) {
//     return Text(
//       "Suggested Gift: $gift",
//       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     );
//   }

//   /// ❌ Error Text
//   Widget _buildErrorText(String error) {
//     return Text("Error: $error", style: const TextStyle(color: Colors.red));
//   }

//   /// 🚀 Suggest Gift Function
//   void _suggestGift() {
//     final occasion = _occassionController.text.trim();
//     final fromBudget = double.tryParse(_fromBudgetController.text) ?? 0;
//     final toBudget = double.tryParse(_toBudgetController.text) ?? 0;

//     if (occasion.isNotEmpty && fromBudget > 0 && toBudget > fromBudget) {
//       context
//           .read<GiftBloc>()
//           .add(GetGiftEvent(occasion, fromBudget, toBudget));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter valid details")),
//       );
//     }
//   }
// }

import 'package:ai_gift_suggest/bloc/gift_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _occasionController = TextEditingController();
  final TextEditingController _fromBudgetController = TextEditingController();
  final TextEditingController _toBudgetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _occasionController.dispose();
    _fromBudgetController.dispose();
    _toBudgetController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final occasion = _occasionController.text.trim();
    final fromBudget = double.tryParse(_fromBudgetController.text) ?? 0;
    final toBudget = double.tryParse(_toBudgetController.text) ?? 0;

    if (fromBudget >= toBudget) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum budget must be greater than minimum budget'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<GiftBloc>().add(GetGiftEvent(
          occasion: occasion,
          fromBudget: fromBudget,
          toBudget: toBudget,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 50),
                  _buildInputSection(),
                  const SizedBox(height: 30),
                  _buildSubmitButton(),
                  const SizedBox(height: 30),
                  _buildResultSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              "assets/images/moto.png",
              scale: 1.25,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            "assets/images/logo.png",
            scale: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(
          label: "Choose Occasion",
          controller: _occasionController,
          hintText: "Enter occasion",
          validator: (value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Please enter an occasion';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            "Price Range",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                controller: _fromBudgetController,
                hintText: "₹ Min",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Enter minimum budget';
                  if (double.tryParse(value!) == null) return 'Invalid amount';
                  if (double.parse(value) <= 0) return 'Must be greater than 0';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildInputField(
                controller: _toBudgetController,
                hintText: "₹ Max",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Enter maximum budget';
                  if (double.tryParse(value!) == null) return 'Invalid amount';
                  if (double.parse(value) <= 0) return 'Must be greater than 0';
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField({
    String? label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        if (label != null) const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.blue),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(15),
            errorStyle: const TextStyle(color: Colors.red),
          ),
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.card_giftcard, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              "Let's Gift",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultSection() {
    return BlocBuilder<GiftBloc, GiftState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              if (state is GiftSuggestionLoadingState)
                const CircularProgressIndicator(color: Colors.blue)
              else if (state is GiftSuggestionLoadedState)
                Text(
                  "Suggested Gift: ${state.suggestion}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                )
              else if (state is GiftSuggestionErrorState)
                Text(
                  state.error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        );
      },
    );
  }
}
