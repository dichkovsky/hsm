typedef UserID = String;

class AppUser {
  final UserID uid;
  final String? email;
  final bool emailVerified;

  AppUser(
    {
      required this.uid, 
      this.email, 
      this.emailVerified = false
    }
  );

  Future<void> sendEmailVerification() async {
    // no-op - implemented by subclasses
  }

  Future<bool> isPremium() {
    return Future.value(false);
  }

  Future<void> forceRefreshIdToken() async {
    // no-op - implemented by subclasses
  }

  // * Here we override methods from [Object] directly rather than using
  // * [Equatable], since this class will be subclassed or implemented
  // * by other classes.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser && other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email)';
}
