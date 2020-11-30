import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class StatCard extends StatelessWidget {
// Properteis

  final String title, value;
  final Color color;
  final IconData icon;
  final Function onTap;

// Constructor

  StatCard({
    this.title,
    this.value,
    this.color,
    this.icon,
    this.onTap,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 7.5),
          decoration: ColorTheme.cardDecoration(),
          height: 120,
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
                right: -7,
                child: Container(
                  child: Center(
                    child: icon != null
                        ? Icon(
                            icon,
                            color: color.withAlpha(30),
                            size: 60,
                          )
                        : Text(
                            value,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withAlpha(25),
                            ),
                          ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: color != null ? color : ColorTheme.darkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      title.toUpperCase(),
                      style: ColorTheme.mainHeading(
                        Colors.grey.withAlpha(100),
                        1.3,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
