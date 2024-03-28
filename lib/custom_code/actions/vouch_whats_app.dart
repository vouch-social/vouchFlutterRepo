// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> vouchWhatsApp(dynamic bountyDetails) async {
  // Extracting bountyDetails for Person Y
  var requesterName = bountyDetails['bountyUser']['name'];
  var urgency = bountyDetails['urgency'];
  var requesterLinkedIn = bountyDetails['bountyUser']['vanityName'];

  // Defining urgency phrases
  var urgencyPhrases = {
    'Immediately':
        "They're pretty eager to get the ball rolling on this, so the sooner, the better. 🚀",
    'Eventually':
        "There's no massive rush, but they'd love to touch base sooner rather than later. 🌼",
    'Leisurely':
        "Whenever you have the time, there's no rush at all. Just thought it could be a beneficial chat for both of you when you're ready. 🍃"
  };

  // Crafting the message
  String whatsappMessage = """
Hello! 

👋 Hope you're doing well.
Quick thing.. $requesterName ( https://www.linkedin.com/in/$requesterLinkedIn ) mentioned they're really interested in talking to you.
${urgencyPhrases[urgency]}
I thought it'd be great to connect you with them.
Would you be okay if I shared your number with $requesterName, or if you prefer, I can set up a group chat here on WhatsApp?

Let me know what works best for you! 😊
""";

  // Returning the crafted message
  return whatsappMessage;
}
