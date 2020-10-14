import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  const CountryDropdown({
    Key key,
    @required this.countries,
    @required this.country,
    @required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries
              .map(
                (e) => DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 12,
                        child: Image.asset(
                            'assets/images/${e.toLowerCase()}_flag.png'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        e,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  value: e,
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
