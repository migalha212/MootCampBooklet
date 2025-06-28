import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactsList extends StatelessWidget {
  final List<dynamic>?
  contacts;
  final double verticalSpacing;

  const ContactsList({
    super.key,
    required this.contacts,
    required this.verticalSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (contacts == null || contacts!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: verticalSpacing * 1.5,
        ),
        Text(
          'Contacts',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: verticalSpacing * 0.6), 
        ...contacts!.map(
          (contact) => Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: Text(contact.name),
              subtitle: Text(contact.phone),
              onTap: () async {
                if (contact.phone.isNotEmpty) {
                  await Clipboard.setData(ClipboardData(text: contact.phone));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Phone number copied to clipboard!',
                      ),
                      duration: const Duration(
                        seconds: 2,
                      ), // Optional: Control how long it shows
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No phone number available to copy.'),
                    ),
                  );
                }
              }
            ),
          ),
        ),
        SizedBox(
          height: verticalSpacing,
        ),
      ],
    );
  }
}
