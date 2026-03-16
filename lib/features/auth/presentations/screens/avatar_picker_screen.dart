import 'package:flutter/material.dart';

class AvatarPickerScreen extends StatefulWidget {
  const AvatarPickerScreen({super.key});

  @override
  State<AvatarPickerScreen> createState() => _AvatarPickerScreenState();
}

class _AvatarPickerScreenState extends State<AvatarPickerScreen> {
  int _selectedAvatar = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Avatar')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: 12,
              itemBuilder: (context, index) {
                final avatarId = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedAvatar = avatarId);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedAvatar == avatarId
                            ? Colors.blue
                            : Colors.grey[300]!,
                        width: _selectedAvatar == avatarId ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Avatar $avatarId',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Save selected avatar and proceed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Avatar $_selectedAvatar selected')),
                );
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
