import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    // Simulate network/login delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    // TODO: Replace with real auth logic (API call / Firebase)
    final email = _emailController.text.trim();
    final pass = _passwordController.text;

    if (email == 'demo@ex.com' && pass == 'password') {
      // success
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Welcome back — logged in!')),
      );
      // navigate to home or pop
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials — try demo@ex.com/password')),
      );
    }
  }
  
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple.shade400, Colors.purpleAccent.shade100],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: const Icon(Icons.flash_on, size: 42, color: Colors.white),
        ),
        const SizedBox(height: 12),
        const Text(
          'Excellerate',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.6),
        ),
        const SizedBox(height: 6),
        const Text('Build fast. Learn far. ✨', style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  InputDecoration _inputDecoration({required String hint, IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon == null ? null : Icon(icon, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.purple.shade300),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red.shade400),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration(hint: 'Email', icon: Icons.email_outlined),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Email is required';
                  final pattern = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");
                  if (!pattern.hasMatch(v.trim())) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscure,
                decoration: _inputDecoration(hint: 'Password', icon: Icons.lock_outline).copyWith(
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Password is required';
                  if (v.length < 6) return 'Password must be 6+ chars';
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (_) {}),
                      const Text('Remember me', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password flow
                    },
                    child: const Text('Forgot?', style: TextStyle(fontSize: 13)),
                  )
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _tryLogin,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    elevation: MaterialStateProperty.all(6),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.deepPurple.shade400, Colors.purpleAccent.shade200]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: _loading
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Text('Log in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(children: const [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('OR', style: TextStyle(fontSize: 12, color: Colors.black54))), Expanded(child: Divider())]),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: hook up Google sign-in
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      label: const Text('Google'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                      label: const Text('Apple'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account?", style: TextStyle(fontSize: 13)),
                TextButton(
                  onPressed: () {
                    // TODO: navigate to signup
                  },
                  child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.w600)),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: media.width < 600 ? media.width : 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLogo(),
                const SizedBox(height: 22),
                _buildFormCard(context),
                const SizedBox(height: 18),
                Text('By continuing you agree to Excellerate\'s Terms & Privacy', style: TextStyle(fontSize: 11, color: Colors.grey.shade600), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

