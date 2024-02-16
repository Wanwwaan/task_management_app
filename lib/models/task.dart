class Task {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "status": status,
      };
}
