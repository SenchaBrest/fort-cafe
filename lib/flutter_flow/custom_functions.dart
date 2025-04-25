import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

List<dynamic>? addItemToCart(
  List<dynamic>? cart,
  String id,
  String name,
  double price,
  String category,
  String imageUrl,
) {
  cart ??= [];

  final index = cart.indexWhere((item) => item['id'] == id);

  if (index == -1) {
    cart.add({
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'count': 1,
    });
  } else {
    cart[index]['count'] += 1;
  }

  return cart;
}

List<dynamic>? removeItemFromCart(
  List<dynamic>? cart,
  String id,
) {
  if (cart == null) {
    return cart;
  }

  // Проверяем, есть ли товар с данным id в корзине
  int index = cart.indexWhere((item) => item['id'] == id);

  if (index != -1) {
    // Если товар найден, уменьшаем его количество
    cart[index]['count'] -= 1;

    // Если количество становится 0 или меньше, удаляем товар из корзины
    if (cart[index]['count'] <= 0) {
      cart.removeAt(index);
    }
  }

  return cart;
}

double getTotaPrice(List<String> listOfItems) {
  return listOfItems.fold<double>(
    0.0,
    (sum, item) =>
        sum +
        (double.tryParse(RegExp(r'price\s*:\s*"?([\d.]+)"?')
                        .firstMatch(item)
                        ?.group(1) ??
                    '0.0') ??
                0.0) *
            (double.tryParse(RegExp(r'count\s*:\s*"?([\d.]+)"?')
                        .firstMatch(item)
                        ?.group(1) ??
                    '0.0') ??
                0.0),
  );
}

List<dynamic>? deleteItem(
  List<dynamic>? cart,
  String? items,
) {
  if (cart == null || items == null || items.isEmpty) {
    return cart;
  }

  // Удаляем все товары, id которых есть в списке items
  cart.removeWhere((item) => items.contains(item['id']));

  return cart;
}

String formatOrderSummary(List<String> listOfItems) {
  return listOfItems.map((item) {
    final name =
        RegExp(r'name\s*:\s*"?([^,"]+)"?').firstMatch(item)?.group(1) ??
            'Неизвестный продукт';

    final count = double.tryParse(RegExp(r'count\s*:\s*"?([\d.]+)"?')
                    .firstMatch(item)
                    ?.group(1) ??
                '0.0')
            ?.toInt() ??
        0;

    return '$name x$count';
  }).join('\n');
}
