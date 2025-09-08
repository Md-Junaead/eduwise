import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eduwise/screens/default/consultant-profile/con_provider_model.dart';

/// 🔹 Reusable filter section (Service + Country)
class ConsultantFilterSection extends StatelessWidget {
  const ConsultantFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConsultantProfileProvider>();

    // Collect unique services and countries from ALL consultants
    final serviceNames = {
      for (final c in provider.consultants)
        for (final s in c.services) s.serviceName,
    }.toList()..sort();

    final countries = {
      for (final c in provider.consultants)
        for (final s in c.services) s.country,
    }.toList()..sort();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // 🔹 Service dropdown
          Expanded(
            flex: 4,
            child: DropdownButtonFormField<String?>(
              value: provider.serviceNameFilter,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: "Filter by Service",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text("All Services"),
                ),
                ...serviceNames.map(
                  (name) => DropdownMenuItem(
                    value: name,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
              onChanged: (val) => provider.setServiceNameFilter(val),
            ),
          ),
          const SizedBox(width: 8),

          // 🔹 Country dropdown
          Expanded(
            flex: 4,
            child: DropdownButtonFormField<String?>(
              value: provider.countryFilter,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: "Filter by Country",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text("All Countries"),
                ),
                ...countries.map(
                  (ct) => DropdownMenuItem(
                    value: ct,
                    child: Text(
                      ct,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
              onChanged: (val) => provider.setCountryFilter(val),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
