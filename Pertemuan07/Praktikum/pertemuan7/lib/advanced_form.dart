import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class AdvancedForm extends StatefulWidget {
  const AdvancedForm({super.key});

  @override
  State<AdvancedForm> createState() => _AdvancedFormState();
}

class _AdvancedFormState extends State<AdvancedForm> {
  DateTime currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();
  Color _currentColor = Colors.blue;
  String? _dataFile;
  File? _imageFile;

  Widget buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tanggal'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat('EEEE, d MMMM yyyy').format(_dueDate)),
            ElevatedButton(
              child: const Text('Select'),
              onPressed: () async {
                final datePick = await showDatePicker(
                  context: context,
                  initialDate: _dueDate,
                  firstDate: DateTime(currentDate.year - 5),
                  lastDate: DateTime(currentDate.year + 5),
                );
                if (datePick != null && datePick != _dueDate) {
                  setState(() {
                    _dueDate = datePick;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Warna'),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: SlidePicker(
                      pickerColor: _currentColor,
                      onColorChanged: (Color color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: 40,
            height: 40,
            color: _currentColor,
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('File'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _pickFile,
          child: const Text('Pick File'),
        ),
        const SizedBox(height: 10),
        Text(_dataFile ?? 'Belum ada file yang dipilih'),
        if (_imageFile != null)
          Image.file(
            _imageFile!,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
      ],
    );
  }

  Future<void> _pickFile() async {
    final file = await FilePicker.pickFile(type: FileType.any);
    if (!mounted || file == null) return;

    final path = file.path;
    if (path != null) {
      await _openFile(path);
    }

    final extension = file.name.split('.').last.toLowerCase();
    final isImage = extension == 'jpg' ||
        extension == 'jpeg' ||
        extension == 'png';

    setState(() {
      _dataFile = file.name;
      if (isImage && path != null) {
        _imageFile = File(path);
      } else {
        _imageFile = null;
      }
    });
  }

  Future<void> _openFile(String filePath) async {
    await OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widget'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildDatePicker(),
            const SizedBox(height: 20),
            buildColorPicker(),
            const SizedBox(height: 20),
            buildFilePicker(),
          ],
        ),
      ),
    );
  }
}
