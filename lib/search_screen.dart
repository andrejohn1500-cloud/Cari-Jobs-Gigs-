import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final jobs = [
    {'title': 'Web Developer', 'company': 'TechSVG Ltd', 'location': 'Kingstown, SVG', 'type': 'Full-Time', 'salary': r'$2,500/mo'},
    {'title': 'Electrician', 'company': 'PowerPro TT', 'location': 'Port of Spain, TT', 'type': 'Contract', 'salary': r'$800/wk'},
    {'title': 'Marketing Officer', 'company': 'Caribbean Brands', 'location': 'Bridgetown, BB', 'type': 'Full-Time', 'salary': r'$3,000/mo'},
    {'title': 'Nurse', 'company': 'Milton Cato Hospital', 'location': 'Kingstown, SVG', 'type': 'Full-Time', 'salary': r'$2,000/mo'},
    {'title': 'Security Guard', 'company': 'SafeGuard SVG', 'location': 'Kingstown, SVG', 'type': 'Part-Time', 'salary': r'$600/wk'},
    {'title': 'Teacher', 'company': 'St. Vincent Grammar', 'location': 'Kingstown, SVG', 'type': 'Full-Time', 'salary': r'$2,200/mo'},
  ];

  final gigs = [
    {'title': 'Professional Logo Design', 'seller': 'Marcus D.', 'price': r'From $50', 'rating': '4.9'},
    {'title': 'Roof Repair', 'seller': 'Roy Construction', 'price': r'From $200', 'rating': '5.0'},
    {'title': 'CXC Maths Tutoring', 'seller': 'Miss Clarke', 'price': r'From $30/hr', 'rating': '4.8'},
    {'title': 'Photography', 'seller': 'Shawn Pics', 'price': r'From $100', 'rating': '4.7'},
    {'title': 'Plumbing Services', 'seller': 'Fix-It Fast', 'price': r'From $80', 'rating': '4.9'},
  ];

  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filteredJobs = jobs.where((j) =>

    final filteredGigs = gigs.where((g) =>

    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _query = v),
                    decoration: const InputDecoration(
                      hintText: 'Search jobs, gigs, companies...',
                      hintStyle: TextStyle(color: Color(0xFFB0BEC5), fontSize: 14),
                      prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF5B8DB8)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TabBar(
                  controller: _tabController,
                  labelColor: const Color(0xFF5B8DB8),
                  unselectedLabelColor: const Color(0xFF9E9E9E),
                  indicatorColor: const Color(0xFF5B8DB8),
                  tabs: const [Tab(text: 'Jobs'), Tab(text: 'Gigs')],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                filteredJobs.isEmpty
                  ? const Center(child: Text('No jobs found', style: TextStyle(color: Color(0xFF9E9E9E))))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredJobs.length,
                      itemBuilder: (ctx, i) {
                        final j = filteredJobs[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFEFE8E4), width: 1.5),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              const SizedBox(height: 8),
                              Row(children: [
                                const Icon(Icons.location_on_outlined, size: 13, color: Color(0xFFB2BEC3)),
                                const SizedBox(width: 3),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: const Color(0xFF5B8DB8).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                ),
                              ]),
                              const SizedBox(height: 6),
                            ],
                          ),
                        );
                      },
                    ),
                filteredGigs.isEmpty
                  ? const Center(child: Text('No gigs found', style: TextStyle(color: Color(0xFF9E9E9E))))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredGigs.length,
                      itemBuilder: (ctx, i) {
                        final g = filteredGigs[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFEFE8E4), width: 1.5),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
                          ),
                          child: Row(children: [
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                const SizedBox(height: 6),
                                Row(children: [
                                  const Icon(Icons.star_rounded, size: 14, color: Color(0xFFFFD443)),
                                  const SizedBox(width: 3),
                                ]),
                              ],
                            )),
                          ]),
                        );
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
