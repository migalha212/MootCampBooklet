class MealItem {
  final num quantity;
  final String unit;
  final String item;

  MealItem({required this.quantity, required this.unit, required this.item});

  factory MealItem.fromJson(Map<String, dynamic> json) => MealItem(
    quantity: json['quantity'],
    unit: json['unit'],
    item: json['item'],
  );
}

class Meal {
  final String type;
  final List<MealItem> items;

  Meal({required this.type, required this.items});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    type: json['type'],
    items: (json['items'] as List).map((e) => MealItem.fromJson(e)).toList(),
  );
}

class MealDay {
  final String date;
  final List<Meal> meals;

  MealDay({required this.date, required this.meals});

  factory MealDay.fromJson(Map<String, dynamic> json) => MealDay(
    date: json['date'],
    meals: (json['meals'] as List).map((e) => Meal.fromJson(e)).toList(),
  );
}
