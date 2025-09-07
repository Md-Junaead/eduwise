import 'dart:collection';
import 'package:flutter/material.dart';

/// App sections as an enum (fast, type-safe).
enum AppSection { home, about, contact, profile, services }

/// Immutable menu item model.
class MenuItem {
  final AppSection section;
  final String title;
  final IconData icon;
  final String route;

  const MenuItem({
    required this.section,
    required this.title,
    required this.icon,
    required this.route,
  });
}

/// Centralized, immutable menu registry.
/// - Using a fixed list + unmodifiable view keeps it efficient and predictable.
/// - Map for O(1) reverse lookup if needed later.
class MenuRegistry {
  static const _items = <MenuItem>[
    MenuItem(
      section: AppSection.home,
      title: 'Home',
      icon: Icons.home_outlined,
      route: '/home',
    ),
    MenuItem(
      section: AppSection.about,
      title: 'About Us',
      icon: Icons.info_outline,
      route: '/about',
    ),
    MenuItem(
      section: AppSection.contact,
      title: 'Contact',
      icon: Icons.phone_outlined,
      route: '/contact',
    ),
    MenuItem(
      section: AppSection.profile,
      title: 'Profile',
      icon: Icons.person_outline,
      route: '/profile',
    ),
    MenuItem(
      section: AppSection.services,
      title: 'Services',
      icon: Icons.design_services_outlined,
      route: '/services',
    ),
  ];

  static UnmodifiableListView<MenuItem> get items =>
      UnmodifiableListView(_items);

  static String routeOf(AppSection s) =>
      _items.firstWhere((it) => it.section == s).route;

  static MenuItem itemOf(AppSection s) =>
      _items.firstWhere((it) => it.section == s);
}
