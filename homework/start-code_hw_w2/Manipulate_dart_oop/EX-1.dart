enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipcode;

  Address(this._city, this._street , this._zipcode);

  String get Street => _street;
  String get city => _city;
  String get zipcode => _zipcode;
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary , this._skills , this._address , this._yearsOfExperience);

  String get name => name;
  double get baseSalary => baseSalary;
  List<Skill> get skills => skills;
  Address get address => address;
  int get yearsOfExperience => yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for (var skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else {
        salary += 1000;
      }
    }

    return salary;
  }
  void printDetails() {
    print('Employee: ${_name}, Base Salary: ${_baseSalary}');
    print('Address: ${_address._street}, ${_address.city}, ${_address._zipcode}');
    print('Years of Experience: ${_yearsOfExperience}');
    print('Skills: ${_skills}');
    print('Computed Salary: ${computeSalary()}');
  }

}

// void main() {
//   var emp1 = Employee('Sokea', 40000);
//   emp1.printDetails();

//   var emp2 = Employee('Ronan', 45000);
//   emp2.printDetails();
// }
void main() {
  var address1 = Address('Phnom Penh', 'Street 123', '12000');
  var address2 = Address('Siem Reap', 'Street 456', '17000');

  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.DART],
    address1,
    3,
  );

  var emp2 = Employee(
    'Ronan',
    45000,
    [Skill.DART, Skill.OTHER],
    address2,
    5,
  );

  emp1.printDetails();
  emp2.printDetails();
}