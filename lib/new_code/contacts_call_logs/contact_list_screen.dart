import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../custom_code/actions/hashed_phone.dart';
import '../backend/repos/contacts_call_logs_repo.dart';
import 'my_contacts_class.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final CallLogsRepo repository = CallLogsRepo();
  List<myContact> allContacts = [];
  List<myContact> contacts = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      await getContacts();
    }
  }

  Future<void> getContacts() async {
    allContacts = await ExtendedFlutterContacts.getContactsAndConvertToBase64();
    contacts = allContacts.take(25).toList();
    setState(() {
      sendContactsData();
    });
  }

  void sendContactsData() async {
    var data = {'hashedPhone': hashedPhone('9999999998'), 'contacts': contacts};

    try {
       print('data.contacts : ${data['contacts']}');
      await repository.sendContacts(data['hashedPhone'] as String?, data['contacts'] as List<myContact>);
    } catch (error) {
      print("Error 1: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "All Contacts",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
      body: contacts.isNotEmpty
          ? ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(contacts[index].toString());
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
