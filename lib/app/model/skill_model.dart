class Skill {
  String skillDescription;

  Skill(this.skillDescription);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Skill &&
          runtimeType == other.runtimeType &&
          skillDescription == other.skillDescription;

  @override
  int get hashCode => skillDescription.hashCode;
}
