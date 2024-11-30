// import 'package:auxilio_emergencial/source/constants/breakpoints.dart';
// import 'package:auxilio_emergencial/source/features/common/widgets/drawer.dart';
// import 'package:auxilio_emergencial/source/features/common/widgets/responsive_center.dart';
// import 'package:auxilio_emergencial/source/features/user/data/user_repository.dart';
// import 'package:auxilio_emergencial/source/features/user/domain/user.dart';
// import 'package:auxilio_emergencial/source/utils/async_value_ui.dart';
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class EditUserScreen extends ConsumerStatefulWidget {
//   const EditUserScreen({super.key, this.user});

//   final User? user;

//   @override
//   ConsumerState<EditUserScreen> createState() => _EditUserPageState();
// }

// class _EditUserPageState extends ConsumerState<EditUserScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String? _name;
//   int? _ratePerHour; 

//   @override
//   void initState() {
//     super.initState();
//     if (widget.user != null) {
//       _name = widget.user?.name;

//     }
//   }

//   bool _validateAndSaveForm() {
//     final form = _formKey.currentState!;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }

//   Future<void> _submit() async {
//     if (_validateAndSaveForm()) {
//       final success =
//           await ref.read(editUserScreenControllerProvider.notifier).submit(
//                 userId: widget.userId,
//                 oldUser: widget.user,
//                 name: _name ?? '',
//                 ratePerHour: _ratePerHour ?? 0,
//               );
//       if (success && mounted) {
//         context.pop();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen<AsyncValue>(
//       editUserScreenControllerProvider,
//       (_, state) => state.showAlertDialogOnError(context),
//     );
//     final state = ref.watch(editUserScreenControllerProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.user == null ? 'New User' : 'Edit User'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: state.isLoading ? null : _submit,
//             child: const Text(
//               'Save',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: _buildContents(),
//     );
//   }

//   Widget _buildContents() {
//     return SingleChildScrollView(
//       child: ResponsiveCenter(
//         maxContentWidth: Breakpoint.tablet,
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: _buildForm(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: _buildFormChildren(),
//       ),
//     );
//   }

//   List<Widget> _buildFormChildren() {
//     return [
//       TextFormField(
//         decoration: const InputDecoration(labelText: 'User name'),
//         keyboardAppearance: Brightness.light,
//         initialValue: _name,
//         validator: (value) =>
//             (value ?? '').isNotEmpty ? null : 'Name can\'t be empty',
//         onSaved: (value) => _name = value,
//       ),
//       TextFormField(
//         decoration: const InputDecoration(labelText: 'Rate per hour'),
//         keyboardAppearance: Brightness.light,
//         initialValue: _ratePerHour != null ? '$_ratePerHour' : null,
//         keyboardType: const TextInputType.numberWithOptions(
//           signed: false,
//           decimal: false,
//         ),
//         onSaved: (value) => _ratePerHour = int.tryParse(value ?? '') ?? 0,
//       ),
//     ];
//   }
// }
