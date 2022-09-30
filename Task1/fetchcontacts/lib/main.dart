import 'package:fetchcontacts/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = []; //
  List<Contact> filteredContacts = []; // to avoid mutability in contacts
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
  }

  //getting contacts
  void getAllContacts() async {
    // Get all contacts without thumbnail (faster)
    List<Contact> _contacts = await ContactsService.getContacts();
    _contacts.removeWhere(((element) => element.displayName == null));
    print(_contacts.length);
    setState(() {
      contacts = _contacts;
    });
  }

  void filterContacts() {
    List<Contact> _contact = [];

    _contact.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contact.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase().trim();
        String? contactName = contact.displayName!.toLowerCase().toString();

        // print('{$searchTerm $contactName}');
        return contactName.contains(searchTerm);
      });

      setState(() {
        filteredContacts = _contact;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearch = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Contacts'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isSearch == true
                      ? filteredContacts.length
                      : contacts.length,
                  itemBuilder: (BuildContext context, index) {
                    Contact? contact = isSearch == true
                        ? filteredContacts[index]
                        : contacts[index];
                    var ph;
                    for (int i = 0; i < contact.phones!.length; i++) {
                      if (contact.phones![i].value!.isNotEmpty) {
                        ph = contact.phones![i].value!;
                      } else {
                        ph = 0;
                      }
                    }
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ContactDetails(
                                  contact,
                                  onContactDelete: (Contact? _contact) {
                                    // reloadContacts();
                                    Navigator.of(context).pop();
                                  },
                                  onContactUpdate: (Contact? _contact) {
                                    // reloadContacts();
                                  },
                                )));
                      },
                      title: Text(contact.displayName.toString()),
                      subtitle: Text(ph.toString()),
                      // ignore: prefer_is_empty
                      leading: (contact.avatar != null &&
                              (contact.avatar!.length > 0))
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(contact.avatar!),
                            )
                          : CircleAvatar(child: Text(contact.initials())),
                    );
                  },
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () async {
          try {
            Contact contact = await ContactsService.openContactForm();
            if (contact != null) {
              getAllContacts();
            }
          } on FormOperationException catch (e) {
            switch (e.errorCode!) {
              case FormOperationErrorCode.FORM_OPERATION_CANCELED:
              case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
              case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
                print(e.toString());
            }
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
