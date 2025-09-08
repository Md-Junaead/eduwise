import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';
import 'package:eduwise/screens/default/consultant-profile/con_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 🔹 Tab Section with Experience, Skills, Biography, Portfolio, Service
class ConsultantTabSection extends StatelessWidget {
  final ConsultantProfileModel consultant;

  const ConsultantTabSection({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
            labelColor: TColors.secondary,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            indicatorColor: TColors.secondary,
            isScrollable: true,
            tabs: [
              Tab(text: "Experience"),
              Tab(text: "Skill"),
              Tab(text: "Service"),
              Tab(text: "Biography"),
              Tab(text: "Portfolio"),
            ],
          ),
          const SizedBox(height: 8),
          // UPDATED: increased height a bit to accommodate filter row + list
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.32, // UPDATED
            child: TabBarView(
              children: [
                _buildPlainList(consultant.experience, "No Experience Added"),
                _buildChipList(consultant.skills, "No Skills Added"),
                _buildServiceFilterAndCards(context, consultant), // UPDATED
                _buildBiography(consultant.biography),
                _buildPlainList(consultant.portfolio, "No Portfolio Added"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Plain Modern List (for Experience & Portfolio)
  Widget _buildPlainList(List<String> items, String emptyMessage) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 20, thickness: 0.5),
      itemBuilder: (context, index) => Text(
        "• ${items[index]}",
        style: const TextStyle(
          fontSize: 15,
          height: 1.5,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// 🔹 Modern Chip List (for Skills)
  Widget _buildChipList(List<String> items, String emptyMessage) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: items
            .map(
              (e) => Chip(
                label: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: Colors.blue.shade50,
                side: BorderSide(color: Colors.blue.shade200),
              ),
            )
            .toList(),
      ),
    );
  }

  /// NEW: Service tab — filter (service, country) + modern cards
  Widget _buildServiceFilterAndCards(
    BuildContext context,
    ConsultantProfileModel c,
  ) {
    final provider = context.watch<ConsultantProfileProvider>();

    // NEW: Unique options for dropdowns (from the consultant's own services)
    final serviceNames = {for (final s in c.services) s.serviceName}.toList()
      ..sort();
    final countries = {for (final s in c.services) s.country}.toList()..sort();

    // NEW: The filtered list based on Provider state (one/both/none)
    final filtered = provider.filteredServicesFor(c);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6, // ✅ updated from 9 → 6 as you noted
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  // Service dropdown (≈45% of width)
                  Expanded(
                    flex: 4, // 4 parts out of total 9 (≈44%)
                    child: DropdownButtonFormField<String?>(
                      value: provider.serviceNameFilter, // can be null
                      isDense: true,
                      isExpanded:
                          true, // ✅ ensures it fits width & truncates if needed
                      decoration: const InputDecoration(
                        labelText: "Filter by Service",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                      // ✅ Truncate the displayed (selected) value safely
                      selectedItemBuilder: (context) {
                        final itemsForDisplay = <String?>[
                          null,
                          ...serviceNames,
                        ];
                        return itemsForDisplay
                            .map(
                              (val) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  val ?? "All Services",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ),
                            )
                            .toList();
                      },
                      items: <DropdownMenuItem<String?>>[
                        // ✅ Use ellipsis in menu items too
                        DropdownMenuItem(
                          value: null,
                          child: const Text(
                            "All Services",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        ...serviceNames.map(
                          (name) => DropdownMenuItem(
                            value: name,
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (val) =>
                          provider.setServiceNameFilter(val), // ✅
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Country dropdown (≈45% of width)
                  Expanded(
                    flex: 4, // 4 parts out of total 9 (≈44%)
                    child: DropdownButtonFormField<String?>(
                      value: provider.countryFilter, // can be null
                      isDense: true,
                      isExpanded:
                          true, // ✅ ensures it fits width & truncates if needed
                      decoration: const InputDecoration(
                        labelText: "Filter by Country",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                      // ✅ Truncate the displayed (selected) value safely
                      selectedItemBuilder: (context) {
                        final itemsForDisplay = <String?>[null, ...countries];
                        return itemsForDisplay
                            .map(
                              (val) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  val ?? "All Countries",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ),
                            )
                            .toList();
                      },
                      items: <DropdownMenuItem<String?>>[
                        // ✅ Use ellipsis in menu items too
                        DropdownMenuItem(
                          value: null,
                          child: const Text(
                            "All Countries",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        ...countries.map(
                          (ct) => DropdownMenuItem(
                            value: ct,
                            child: Text(
                              ct,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (val) => provider.setCountryFilter(val), // ✅
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Clear button (≈10% of width)
                  /*
                  SizedBox(
                    width: 48, // ✅ keeps it compact, prevents overflow
                    child: IconButton(
                      tooltip: "Clear filters",
                      onPressed: provider.clearFilters, // ✅
                      icon: const Icon(Icons.filter_alt_off),
                    ),
                  ),
                  */
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 6),

        // The list of modern service cards
        Expanded(
          child: filtered.isEmpty
              ? const Center(
                  child: Text(
                    "No Services Found",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final s = filtered[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top row: country + flag (right)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  s.country,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Image.network(
                                    s.flagUrl,
                                    width: 28,
                                    height: 20,
                                    fit: BoxFit.cover,
                                    // small safety for broken images
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.flag_outlined,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Service name
                            Text(
                              s.serviceName,
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  /// 🔹 Biography with Modern Styling
  Widget _buildBiography(String text) {
    if (text.isEmpty) {
      return const Center(
        child: Text(
          "No Biography Added",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.6, // line spacing
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
