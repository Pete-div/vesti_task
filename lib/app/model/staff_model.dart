class Staff {
  String fullname;
  String emailAddress;
  String skills;

  Staff(
    this.skills,
    this.fullname,
    this.emailAddress,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Staff &&
          runtimeType == other.runtimeType &&
          fullname == other.fullname &&
          emailAddress == other.emailAddress &&
          skills == other.skills;

  @override
  int get hashCode =>
      fullname.hashCode ^ emailAddress.hashCode ^ skills.hashCode;
}
