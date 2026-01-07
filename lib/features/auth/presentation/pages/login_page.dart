import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/user_role.dart';
// Role providerni chaqiramiz (hozircha main_navigation.dart ichida turibdi)
import '../../../dashboard/presentation/main_navigation.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // Tanlangan rol (Default: Oshpaz)
  UserRole _selectedRole = UserRole.oshpaz;

  // Parol ko'rinishini boshqarish
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),

              // 1. LOGO VA SARLAVHA
              const Text(
                "Xush kelibsiz!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey900,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Tizimga kirish uchun ma'lumotlaringizni kiriting",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.grey600),
              ),

              const SizedBox(height: 48),

              // 2. INPUTLAR (Login)
              const Text(
                "Telefon raqam",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "+998 90 123 45 67",
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                    color: AppColors.grey500,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // (Parol)
              const Text(
                "Parol",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Parolingizni kiriting",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.grey500,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.grey500,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              // --- VAQTINCHALIK ROL TANLASH (TEST UCHUN) ---
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary500),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Test uchun rolni tanlang:",
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<UserRole>(
                      value: _selectedRole,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: UserRole.values.map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role.name.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedRole = val);
                      },
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------
              const SizedBox(height: 40),

              // 3. KIRISH TUGMASI
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // 1. Global holatga tanlangan rolni yozamiz
                    ref.read(userRoleProvider.notifier).state = _selectedRole;

                    // 2. Asosiy oynaga o'tamiz
                    context.go('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Kirish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
