import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpApiService {
  static const String _baseUrl = 'https://your-api.com'; // 🔴 CHANGE

  static Future<bool> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Assuming API returns: { success: true }
        return data['success'] == true;
      } else {
        return false;
      }
    } catch (e) {
      print('OTP Verify Error: $e');
      return false;
    }
  }
}
