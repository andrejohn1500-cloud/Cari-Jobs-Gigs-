import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String _type = 'Job';
  final _titleController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _salaryController = TextEditingController();
  final _descController = TextEditingController();
  String _jobType = 'Full-Time';

  final _types = ['Job', 'Gig'];
  final _jobTypes = ['Full-Time', 'Part-Time', 'Contract', 'Remote'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Post a Listing', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type toggle
            Container(
              decoration: BoxDecoration(color: const Color(0xFFE8F0FB), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: _types.map((t) {
                  final sel = t == _type;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _type = t),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: sel ? const Color(0xFF5B8DB8) : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(t, textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: sel ? Colors.white : Colors.black54)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            _label('${_type} Title *'),
            _field(_titleController, 'e.g. Senior Web Developer'),
            const SizedBox(height: 16),
            _label(_type == 'Job' ? 'Company Name *' : 'Your Name / Brand *'),
            _field(_companyController, 'e.g. TechSVG Ltd'),
            const SizedBox(height: 16),
            _label('Location *'),
            _field(_locationController, 'e.g. Kingstown, SVG'),
            const SizedBox(height: 16),
            _label(_type == 'Job' ? 'Salary (per month)' : 'Rate (per hour/project)'),
            _field(_salaryController, 'e.g. \$2,500'),
            const SizedBox(height: 16),
            _label('Type'),
            DropdownButtonFormField<String>(
              value: _jobType,
              decoration: InputDecoration(
                filled: true, fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              items: _jobTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => setState(() => _jobType = v!),
            ),
            const SizedBox(height: 16),
            _label('Description *'),
            TextFormField(
              controller: _descController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Describe the role, requirements, responsibilities...',
                filled: true, fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Listing submitted! (Backend coming soon)'), backgroundColor: Color(0xFF5B8DB8)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B8DB8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text('Post ${_type}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87)),
  );

  Widget _field(TextEditingController c, String hint) => TextFormField(
    controller: c,
    decoration: InputDecoration(
      hintText: hint,
      filled: true, fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );
}
