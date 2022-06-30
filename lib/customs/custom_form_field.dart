import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants/app_assets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.enabled,
    this.onSuffixIconClick,
    this.isLabelEnabled = true,
    this.isContactField = false,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final bool obscureText;
  final bool showSuffixIcon;
  final String labelText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool? enabled;
  final Function()? onSuffixIconClick;
  final bool isLabelEnabled;
  final bool isContactField;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isLabelEnabled) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 10.h),
        ],
        TextFormField(
          enabled: enabled,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          cursorHeight: 20,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: showSuffixIcon
                ? IconButton(
                    onPressed: onSuffixIconClick,
                    icon: SvgPicture.asset(
                      !obscureText ? AppAssets.eyeOpenSVG : AppAssets.eyeSVG,
                      color: Theme.of(context).canvasColor,
                    ),
                  )
                : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
