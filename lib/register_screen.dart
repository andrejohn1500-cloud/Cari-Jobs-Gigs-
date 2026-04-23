import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the Terms of Service to continue.'), backgroundColor: Color(0xFFD66A5E)),
      );
      return;
    }
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/account-type');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42, height: 42,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE8E4DE), width: 1.5)),
                      child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Color(0xFF2D3436)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text('Create Account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
              const SizedBox(height: 8),
              const Text('Join the Caribbean jobs and gigs community', style: TextStyle(fontSize: 15, color: Color(0xFF636E72))),
              const SizedBox(height: 36),
              _buildLabel('Full Name'),
              const SizedBox(height: 8),
              _buildTextField(controller: _nameController, hint: 'Your full name', icon: Icons.person_outline_rounded),
              const SizedBox(height: 20),
              _buildLabel('Email Address'),
              const SizedBox(height: 8),
              _buildTextField(controller: _emailController, hint: 'you@example.com', icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              _buildLabel('Password'),
              const SizedBox(height: 8),
              _buildPasswordField(controller: _passwordController, hint: 'Create a password', obscure: _obscurePassword, onToggle: () => setState(() => _obscurePassword = !_obscurePassword)),
              const SizedBox(height: 20),
              _buildLabel('Confirm Password'),
              const SizedBox(height: 8),
              _buildPasswordField(controller: _confirmController, hint: 'Repeat your password', obscure: _obscureConfirm, onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm)),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
                    activeColor: const Color(0xFF5B8DB8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 13, color: Color(0xFF636E72), height: 1.5),
                          children: [
                            TextSpan(text: 'I agree to the '),
                            TextSpan(text: 'Terms of Service', style: TextStyle(color: Color(0xFF5B8DB8), fontWeight: FontWeight.w600)),
                            TextSpan(text: ' and '),
                            TextSpan(text: 'Privacy Policy', style: TextStyle(color: Color(0xFF5B8DB8), fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity, height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B8DB8),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: _isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                    : const Text('Create Account', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(color: Color(0xFF636E72), fontSize: 15)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                    child: const Text('Sign In', style: TextStyle(color: Color(0xFF5B8DB8), fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF2D3436)));
  }

  Widget _buildTextField({required TextEditingController controller, required String hint, required IconData icon, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E4DE), width: 1.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 15, color: Color(0xFF2D3436)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB2BEC3)),
          prefixIcon: Icon(icon, color: const Color(0xFF5B8DB8), size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPasswordField({required TextEditingController controller, required String hint, required bool obscure, required VoidCallback onToggle}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E4DE), width: 1.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 15, color: Color(0xFF2D3436)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB2BEC3)),
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF5B8DB8), size: 20),
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: const Color(0xFF636E72), size: 20),
            onPressed: onToggle,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
