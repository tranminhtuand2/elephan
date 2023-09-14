// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class InformationProfileDetail extends StatefulWidget {
  const InformationProfileDetail({Key? key}) : super(key: key);

  @override
  _InformationProfileDetailState createState() =>
      _InformationProfileDetailState();
}

class _InformationProfileDetailState extends State<InformationProfileDetail> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  int? _editingIndex;
  bool _isEditing = false;
  bool _isModified = false;

  // Tạo biến sao lưu dữ liệu ban đầu
  String _originalName = "";
  String _originalPhone = "";
  String _originalEmail = "";
  String _originalSex = "";
  String _originalDateOfBirth = "";
  String _originalJob = "";

  @override
  void initState() {
    super.initState();
    _originalName = "Lê Hoài Nam";
    _originalPhone = "0366946417";
    _originalEmail = "lehoainam2506@gmail.com";
    _originalSex = "Nam";
    _originalDateOfBirth = "25-06-2002";
    _originalJob = "Sinh viên";

    _nameController.text = _originalName;
    _phoneController.text = _originalPhone;
    _emailController.text = _originalEmail;
    _sexController.text = _originalSex;
    _dateOfBirthController.text = _originalDateOfBirth;
    _jobController.text = _originalJob;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required int index,
  }) {
    bool isEditingThisField = index == _editingIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 85, 85, 85),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                readOnly: !_isEditing || !isEditingThisField,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onChanged: (newValue) {
                  setState(() {
                    _isModified = true;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(isEditingThisField ? Icons.check : Icons.edit),
              onPressed: () {
                setState(() {
                  if (isEditingThisField) {
                    _editingIndex = null;
                    if (_isModified) {
                      _showConfirmationDialog(controller, index);
                    }
                  } else {
                    _editingIndex = index;
                    _isModified = false;
                    controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: controller.text.length));
                  }
                  _isEditing = !_isEditing;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  void _showConfirmationDialog(TextEditingController controller, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận thay đổi'),
          content: const Text('Bạn có muốn lưu thay đổi không?'),
          actions: [
            TextButton(
              child: const Text('Không'),
              onPressed: () {
                controller.text = index == 0
                    ? _originalName
                    : index == 1
                        ? _originalPhone
                        : index == 2
                            ? _originalEmail
                            : index == 3
                                ? _originalSex
                                : index == 4
                                    ? _originalDateOfBirth
                                    : _originalJob;
                Navigator.of(context).pop();
                _editingIndex = null;
                _isEditing = false;
                _isModified = false;
              },
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                Navigator.of(context).pop();
                _editingIndex = null;
                _isEditing = false;
                _isModified = false;
                if (index == 0) {
                  _originalName = controller.text;
                } else if (index == 1) {
                  _originalPhone = controller.text;
                } else if (index == 2) {
                  _originalEmail = controller.text;
                } else if (index == 3) {
                  _originalSex = controller.text;
                } else if (index == 4) {
                  _originalDateOfBirth = controller.text;
                } else if (index == 5) {
                  _originalJob = controller.text;
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'Tên',
            index: 0,
          ),
          const Divider(),
          _buildTextField(
            controller: _phoneController,
            label: 'Số điện thoại',
            index: 1,
          ),
          const Divider(),
          _buildTextField(
            controller: _emailController,
            label: 'Địa chỉ Email',
            index: 2,
          ),
          const Divider(),
          _buildTextField(
            controller: _sexController,
            label: 'Giới tính',
            index: 3,
          ),
          const Divider(),
          _buildTextField(
            controller: _dateOfBirthController,
            label: 'Ngày sinh',
            index: 4,
          ),
          const Divider(),
          _buildTextField(
            controller: _jobController,
            label: 'Nghề nghiệp',
            index: 5,
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _sexController.dispose();
    _dateOfBirthController.dispose();
    _jobController.dispose();
    super.dispose();
  }
}
