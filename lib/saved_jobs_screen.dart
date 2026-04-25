import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});
  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  List<dynamic> _saved = [];
  bool _loading = true;

  @override
  void initState() { super.initState(); _fetch(); }

  Future<void> _fetch() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;
    try {
      final data = await Supabase.instance.client
          .from('saved_jobs')
          .select('id, created_at, listings(title, category, location, job_type)')
          .eq('user_id', user.id)
          .order('created_at', ascending: false);
      if (mounted) setState(() { _saved = data; _loading = false; });
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _unsave(String id) async {
    await Supabase.instance.client.from('saved_jobs').delete().eq('id', id);
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Jobs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF5B8DB8),
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _saved.isEmpty
              ? const Center(child: Text('No saved jobs yet.', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _saved.length,
                  itemBuilder: (ctx, i) {
                    final s = _saved[i];
                    final j = s['listings'];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        title: Text(j?['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${j?['category'] ?? ''} • ${j?['location'] ?? ''}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark_remove, color: Color(0xFF5B8DB8)),
                          onPressed: () => _unsave(s['id'].toString()),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
