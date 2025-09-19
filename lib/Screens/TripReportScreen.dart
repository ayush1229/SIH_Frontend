import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../backend_config.dart';
import 'TripChainScreen.dart';

class TripReportScreen extends StatefulWidget {
  const TripReportScreen({super.key});

  @override
  State<TripReportScreen> createState() => _TripReportScreenState();
}

class _TripReportScreenState extends State<TripReportScreen> {
  File? _pdfFile;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tripNumberCtrl = TextEditingController();
  final TextEditingController _originCtrl = TextEditingController();
  final TextEditingController _destinationCtrl = TextEditingController();
  final TextEditingController _modeCtrl = TextEditingController();
  final TextEditingController _timeCtrl = TextEditingController();
  final TextEditingController _accompanyingCtrl = TextEditingController();
  bool _consent = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _tripNumberCtrl.dispose();
    _originCtrl.dispose();
    _destinationCtrl.dispose();
    _modeCtrl.dispose();
    _timeCtrl.dispose();
    _accompanyingCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() {
        _pdfFile = file;
      });

      // Upload to backend extract endpoint
      try {
        final uri = Uri.parse('$backendUrl/api/extract');
        final req = http.MultipartRequest('POST', uri);
        req.files.add(
          await http.MultipartFile.fromPath('ticket_pdf', file.path),
        );
        final streamed = await req.send();
        final resp = await http.Response.fromStream(streamed);
        if (resp.statusCode == 200) {
          final parsed = Map<String, dynamic>.from(jsonDecode(resp.body));
          if (parsed['success'] == true) {
            setState(() {
              if (parsed['trip_number'] != null) {
                _tripNumberCtrl.text = parsed['trip_number'];
              }
              if (parsed['origin'] != null) _originCtrl.text = parsed['origin'];
              if (parsed['destination'] != null) {
                _destinationCtrl.text = parsed['destination'];
              }
              if (parsed['time'] != null) _timeCtrl.text = parsed['time'];
              if (parsed['mode'] != null) _modeCtrl.text = parsed['mode'];
            });
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Extraction failed (status: ${resp.statusCode})'),
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Extraction error: $e')));
        }
      }
    }
  }

  Future<void> _saveReport() async {
    if (!_consent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consent is required to save the trip.')),
      );
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    try {
      // Build a minimal payload.
      final uri = Uri.parse('$backendUrl/api/trips');
      var request = http.MultipartRequest('POST', uri);
      request.fields['trip_number'] = _tripNumberCtrl.text;
      request.fields['origin'] = _originCtrl.text;
      request.fields['destination'] = _destinationCtrl.text;
      request.fields['mode'] = _modeCtrl.text;
      request.fields['time'] = _timeCtrl.text;
      request.fields['accompanying'] = _accompanyingCtrl.text;

      if (_pdfFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath('ticket_pdf', _pdfFile!.path),
        );
      }

      // Send request
      final resp = await request.send();
      if (!mounted) return;
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Trip saved successfully')),
        );
        // Build a small payload to show on the TripChain screen
        final tripData = {
          'trip_number': _tripNumberCtrl.text,
          'origin': _originCtrl.text,
          'destination': _destinationCtrl.text,
          'mode': _modeCtrl.text,
          'time': _timeCtrl.text,
          'accompanying': _accompanyingCtrl.text,
        };
        // Navigate to TripChainScreen to display the saved trip in context
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TripChainScreen(tripData: tripData),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save trip (status: ${resp.statusCode})'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving trip: $e')));
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Trip'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Upload ticket (optional) and provide trip details. Consent is required to save.',
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _pickPdf,
                  icon: const Icon(Icons.upload_file),
                  label: Text(
                    _pdfFile == null
                        ? 'Upload PDF Ticket'
                        : 'Replace PDF (${_pdfFile!.path.split('/').last})',
                  ),
                ),
                if (_pdfFile != null) ...[
                  const SizedBox(height: 8),
                  Text('Selected: ${_pdfFile!.path.split('/').last}'),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: _tripNumberCtrl,
                  decoration: const InputDecoration(labelText: 'Trip number'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter trip number' : null,
                ),
                TextFormField(
                  controller: _originCtrl,
                  decoration: const InputDecoration(labelText: 'Origin'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter origin' : null,
                ),
                TextFormField(
                  controller: _destinationCtrl,
                  decoration: const InputDecoration(labelText: 'Destination'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter destination' : null,
                ),
                TextFormField(
                  controller: _modeCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Mode (bus/train/etc)',
                  ),
                ),
                TextFormField(
                  controller: _timeCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Departure time',
                  ),
                ),
                TextFormField(
                  controller: _accompanyingCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Accompanying travellers (count/details)',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Manual nudges (use these fields to add missing details)',
                ),
                const SizedBox(height: 8),
                // A simple set of nudges as example
                TextFormField(
                  decoration: const InputDecoration(
                    labelText:
                        'Nudge: Purpose of trip (work/education/leisure)',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nudge: Ticket type (single/return)',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: _consent,
                      onChanged: (v) => setState(() => _consent = v ?? false),
                    ),
                    const Expanded(
                      child: Text(
                        'I consent to share the trip data with NATPAC for planning purposes.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isSaving ? null : _saveReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                  ),
                  child: _isSaving
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save Trip'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
