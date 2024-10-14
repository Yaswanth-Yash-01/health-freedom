class Friend {
  final int userId;
  final String username;
  final int? totalSteps;

  Friend({
    required this.userId,
    required this.username,
    this.totalSteps,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      userId: json['userId'],
      username: json['username'],
      totalSteps: json['totalSteps'],
    );
  }
}
