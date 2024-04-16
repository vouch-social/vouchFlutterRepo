import 'dart:convert';
import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';

// class ExtendedFlutterContacts extends FlutterContacts {
//
//   static Future<List<myContact>> getContactsAndConvertToBase64() async {
//     List<Contact> contacts = await FlutterContacts.getContacts(
//         withPhoto: true,withProperties: true,withAccounts: true,withGroups: true,withThumbnail: true
//     );
//     List<myContact> myContacts =[];
//     for (var contact in contacts) {
//       String? base64Photo = "";
//       String? base64Thumbnail = "";
//
//       // if (contact.photo != null) {
//       //   base64Photo = base64Encode(contact.photo!);
//       //   contact.photo = null;
//       // }
//       // if (contact.thumbnail != null) {
//       //   base64Thumbnail = base64Encode(contact.thumbnail!);
//       //   contact.thumbnail = null;
//       // }
//       myContacts.add(myContact(contact,base64Photo,base64Thumbnail));
//     }
//
//
//     return myContacts;
//   }
// }
//
// class myContact {
//   /// The unique identifier of the contact.
//   String id = "";
//
//   /// The contact display name.
//   String displayName = "";
//
//   /// A low-resolution version of the [photo].
//   String? thumbnail= "";
//
//   /// The full-resolution contact picture.
//   String? photo= "";
//
//   /// Returns the full-resolution photo if available, the thumbnail otherwise.
//   String? get photoOrThumbnail => photo ?? thumbnail;
//
//   /// Whether the contact is starred (Android only).
//   bool isStarred = false;
//
//   /// Structured name.
//   Name name;
//
//   /// Phone numbers.
//   List<Phone> phones;
//
//   /// Email addresses.
//   List<Email> emails;
//
//   /// Postal addresses.
//   List<Address> addresses;
//
//   /// Organizations / jobs.
//   List<Organization> organizations;
//
//   /// Websites.
//   List<Website> websites;
//
//   /// Social media / instant messaging profiles.
//   List<SocialMedia> socialMedias;
//
//   /// Events / birthdays.
//   List<Event> events;
//
//   /// Notes.
//   List<Note> notes;
//
//   /// Raw accounts (Android only).
//   List<Account> accounts;
//
//   /// Groups.
//   List<Group> groups;
//
//   /// Whether the low-resolution thumbnail was fetched.
//   bool thumbnailFetched = true;
//
//   /// Whether the high-resolution photo was fetched.
//   bool photoFetched = true;
//
//   /// Whether this is a unified contact (and not a raw contact).
//   bool isUnified = true;
//
//   /// Whether properties (name, phones, emails, etc).
//   bool propertiesFetched = true;
//
//   myContact(Contact contact, this.photo, this.thumbnail)
//       : displayName = contact.displayName,
//         id = contact.id,
//         isStarred = contact.isStarred,
//         name = contact.name,
//         phones = contact.phones ?? <Phone>[],
//         emails = contact.emails ?? <Email>[],
//         addresses = contact.addresses ?? <Address>[],
//         organizations = contact.organizations ?? <Organization>[],
//         websites = contact.websites ?? <Website>[],
//         socialMedias = contact.socialMedias ?? <SocialMedia>[],
//         events = contact.events ?? <Event>[],
//         notes = contact.notes ?? <Note>[],
//         accounts = contact.accounts ?? <Account>[],
//         groups = contact.groups ?? <Group>[];
//
//   @override
//   String toString() {
//     return '{id: $id, displayName: $displayName, thumbnail: $thumbnail, photo: $photo, isStarred: $isStarred, name: $name, phones: $phones, emails: $emails, addresses: $addresses, organizations: $organizations, websites: $websites, socialMedias: $socialMedias, events: $events, notes: $notes, accounts: $accounts, groups: $groups, thumbnailFetched: $thumbnailFetched, photoFetched: $photoFetched, isUnified: $isUnified, propertiesFetched: $propertiesFetched}';
//   }
//
//
//
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'displayName': displayName,
//       'thumbnail': thumbnail,
//       'photo': photo,
//       'isStarred': isStarred,
//       'name': name.toJson(),
//       'phones': phones.map((phone) => phone.toJson()).toList(),
//       'emails': emails.map((email) => email.toJson()).toList(),
//       'addresses': addresses.map((address) => address.toJson()).toList(),
//       'organizations': organizations.map((org) => org.toJson()).toList(),
//       'websites': websites.map((website) => website.toJson()).toList(),
//       'socialMedias': socialMedias.map((socialMedia) => socialMedia.toJson()).toList(),
//       'events': events.map((event) => event.toJson()).toList(),
//       'notes': notes.map((note) => note.toJson()).toList(),
//       'accounts': accounts.map((account) => account.toJson()).toList(),
//       'groups': groups.map((group) => group.toJson()).toList(),
//       'thumbnailFetched': thumbnailFetched,
//       'photoFetched': photoFetched,
//       'isUnified': isUnified,
//       'propertiesFetched': propertiesFetched,
//     };
//   }
// }

Future<List<CallLogEntry>> getCallLogs() async {
  Iterable<CallLogEntry> entries = await CallLog.get();
  return entries.toList();
}

Future<List<Contact>> myGetContacts() async {
  Iterable<Contact> entries = await ContactsService.getContacts(

  );
  return entries.toList();
}