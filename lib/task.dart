class Task {
  String name;
  String description;
  String goal;
  //String unit;
  int unitTarget;
  String dateTarget;
  bool checked;

  // Constructor
  Task(this.name,
      this.description,
      this.goal,
      // this.unit,
      this.unitTarget,
      this.dateTarget,
      this.checked
      );
}