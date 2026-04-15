import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _phoneController = TextEditingController();
  String _countryCode = '+91';
  bool _isLoading = false;

  final List<Map<String, String>> _countries = [
    {'code': '+91', 'flag': '🇮🇳', 'name': 'India'},
    {'code': '+1', 'flag': '🇺🇸', 'name': 'USA'},
    {'code': '+44', 'flag': '🇬🇧', 'name': 'UK'},
    {'code': '+61', 'flag': '🇦🇺', 'name': 'Australia'},
    {'code': '+971', 'flag': '🇦🇪', 'name': 'UAE'},
    {'code': '+65', 'flag': '🇸🇬', 'name': 'Singapore'},
  ];

  void _sendOTP() async {
    if (_phoneController.text.length < 10) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter valid phone number')));
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    if (mounted) {
      Navigator.pushNamed(
        context,
        '/otp-verify',
        arguments: {'phone': '$_countryCode${_phoneController.text}'},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Logo small
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.purple, AppColors.teal],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text('🤖', style: TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 28),
              const Text('Welcome back 👋', style: AppTextStyles.heading),
              const SizedBox(height: 8),
              const Text(
                'Enter your phone number to continue',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 40),

              // Country + Phone input
              Row(
                children: [
                  GestureDetector(
                    onTap: _showCountryPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: AppDecorations.inputField,
                      child: Row(
                        children: [
                          Text(
                            _countries.firstWhere(
                              (c) => c['code'] == _countryCode,
                            )['flag']!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _countryCode,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.textMuted,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: AppDecorations.inputField,
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 10,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          hintText: '98765 43210',
                          hintStyle: TextStyle(color: AppColors.textMuted),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "We'll send a one-time code to verify your number",
                style: TextStyle(fontSize: 12, color: AppColors.textMuted),
              ),
              const SizedBox(height: 24),

              // Send OTP Button
              GestureDetector(
                onTap: _isLoading ? null : _sendOTP,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: AppDecorations.gradientButton,
                  child: Center(
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Send OTP →', style: AppTextStyles.button),
                  ),
                ),
              ),
              const Spacer(),

              // Security note
              Row(
                children: const [
                  Icon(
                    Icons.lock_outline,
                    color: AppColors.textMuted,
                    size: 14,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Secured by Firebase Authentication. Your number is never shared.',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ListView(
        padding: const EdgeInsets.all(16),
        children: _countries
            .map(
              (c) => ListTile(
                leading: Text(c['flag']!, style: const TextStyle(fontSize: 24)),
                title: Text(
                  c['name']!,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  c['code']!,
                  style: const TextStyle(color: AppColors.textMuted),
                ),
                onTap: () {
                  setState(() => _countryCode = c['code']!);
                  Navigator.pop(context);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
