import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/user_role.dart';
// Rolni olish uchun Dashboarddagi providerni chaqiramiz (yoki Auth providerni)
import '../../dashboard/presentation/main_navigation.dart';
// Ichki vidjetlar (Hozir pastda bularni ham yaratamiz)
import '../widgets/home_header.dart';
import '../widgets/chef_home_body.dart';
import '../widgets/nurse_home_body.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Hozirgi foydalanuvchi rolini "eshitamiz"
    final role = ref.watch(userRoleProvider);

    return Scaffold(
      backgroundColor: Colors.white, // Orqa fon oq
      body: SafeArea(
        bottom: false, // Pastki qismni navigation bar yopadi
        child: Column(
          children: [
            // 2. DOIMIY QISM: Header (Ism, Rasm, Qo'ng'iroqcha)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: HomeHeader(),
            ),

            // 3. O'ZGARUVCHAN QISM: Body (Rolga qarab)
            Expanded(child: _buildBodyForRole(role)),
          ],
        ),
      ),
    );
  }

  // 4. MANTIQ: Rolga qarab kerakli oynani qaytarish
  Widget _buildBodyForRole(UserRole role) {
    switch (role) {
      case UserRole.oshpaz:
        return const ChefHomeBody();
      case UserRole.hamshira:
        return const NurseHomeBody();
      // Admin yo'q, default holat shart emas, chunki Enumda faqat 2 tasi bor
    }
  }
}
