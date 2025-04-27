![github-submission-banner](https://github.com/user-attachments/assets/a1493b84-e4e2-456e-a791-ce35ee2bcf2f)

# 🚀 Project Title

> SURAKSHABUDDY

---

## 📌 Problem Statement

Select the problem statement number and title from the official list given in Participant Manual.

**Example:**  
**Problem Statement 1 – "Smart emergency response system — alert, capture, survive." **

---

## 🎯 Objective

“Create a smart, real-time personal safety system that works with or without
 internet, instantly alerts contacts, captures emergency evidence, and ensures rapid response during
 critical situations, especially for women and vulnerable groups." 

---

## 🧠 Team & Approach

### Team Name:  
`Xplorer's`

### Team Members:  
- Nakul Kanhaiyya Dhande (GitHub - Rrever/ LinkedIn - Nakul Dhande / Role - backend ,frontend)  
- Manoj Anil Patil (GitHub / LinkedIn - Manoj Patil/ Role - backend ,frontend)  
- Mazhar Rashad Kakar (GitHub / LinkedIn - Mazhar Kakar  / Role - UI/Ux)  
*(Add links if you want)*

### Your Approach:  
🔵 Why We Chose This Problem:
We observed that most existing personal safety apps fail when there is no internet connection — a critical limitation during emergencies in rural areas, basements, public transport, or disaster zones.
We wanted to create a system that ensures safety without depending solely on mobile data — combining offline and online capabilities to maximize survival chances.
Our vision was to build an app that saves lives, not just alerts.

🔵 Key Challenges We Addressed:

Ensuring SOS triggers work even without internet connectivity.

Capturing and securely storing emergency evidence (audio/video) during critical moments.

Real-time alerting trusted contacts through SMS when apps usually depend on push notifications.

Seamless offline-to-online data syncing once network reconnects.

Integrating AI (Groq API) to transcribe audio evidence for legal or investigative support.

🔵 Pivots, Brainstorms, and Breakthroughs During Hacking:

Initial designs depended heavily on Firebase, but we pivoted to Supabase for more cost-effective, fast storage and database management.

While brainstorming offline solutions, we discovered Bluetooth Low Energy (BLE) rescue mode to alert nearby users — making true offline rescue possible.

Integrating Groq's Whisper model for instant speech-to-text transcription turned into a major breakthrough, strengthening the evidence system.

Optimized the UI for one-tap quick action, ensuring users can trigger SOS even under stress, with minimum steps and maximum reliability.

## 🛠️ Tech Stack

### Core Technologies Used:
- Frontend:  Flutter, FlutterFlow, Dart
- Backend:  Supabase (Authentication, Database, Storage)
- Database:   Supabase (Database, Storage)
- APIs:  Groq (Voice Transcription), OpenAI API
- Hosting: Supabase Hosting

### Sponsor Technologies Used (if any):
- [ ] **Groq:** Capture Voice: Use the Web Speech API or Flutter voice input to record audio when the user presses the SOS button.

Send to Groq: Send the audio file to the Groq API for transcription.

Handle Transcription: Once Groq transcribes the voice, save the text to Supabase and include it in emergency messages (SMS/email) sent to contacts.

---

## ✨ Key Features

Highlight the most important features of your project:

- ✅ SOS Button: Sends immediate alerts with location, timestamp, and emergency contact notifications  
- ✅ Offline Bluetooth Alerts: Works even without internet, sending Bluetooth-based alerts to nearby devices.
- ✅  Automatic Audio/Video Recording: Captures audio and video when the SOS button is triggered, aiding in real-time documentation.
- ✅ Voice Transcription: Uses Groq to transcribe voice input for quick and accurate messaging during emergencies

Add images, GIFs, or screenshots if helpful!

---

## 📽️ Demo & Deliverables

- **Demo Video Link:** [[(https://youtube.com/shorts/LylZqKeHkCY?si=xEHoct85hvbHGHji)]]  
- **Pitch Deck / PPT Link:** [[(https://www.canva.com/design/DAGVopTd4Ls/mwRCAGBxJBtdBs1mMJ2QUA/edit?utm_content=DAGVopTd4Ls&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)  ]]

---


## 🧪 How to Run the Project

### Requirements:
Flutter Dependencies:
firebase_core: For Firebase integration (if using FCM or any Firebase services).
firebase_auth: For user authentication (if using Firebase alongside Supabase).
supabase_flutter: For interacting with Supabase (authentication, database, storage).
geolocator: To get the user's location for the SOS feature.
permission_handler: To request necessary permissions like location, microphone, and camera.
flutter_bluetooth_serial: For offline Bluetooth alerts.
audio_recorder or flutter_sound: For audio recording during SOS.
speech_to_text: For converting speech to text (if you're using voice commands without Groq)
http: For making API requests to Groq and OpenAI.
groq_dart (if available): For easy interaction with Groq’s transcription API.
video_player: If you plan to record and play video.
flutter_local_notifications: For local notifications, like alerting the user of actions taken.

Backend (Supabase)
supabase-dart: The Supabase Dart client to interact with your Supabase backend.
http: For making HTTP requests to any external APIs (like Groq or OpenAI).
Optional (For AI or Transcription):
openai (if you're using OpenAI API).
groq (for the transcription API).

### Local Setup:
```bash
# Clone the repo
git clone https://github.com/Rrever/surakshabuddy

# Install dependencies
cd surakshabuddy
flutter pub get
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^1.10.0
  supabase_flutter: ^0.2.9
  geolocator: ^9.0.1
  permission_handler: ^10.2.0
  flutter_bluetooth_serial: ^0.2.2
  flutter_sound: ^9.1.0
  speech_to_text: ^5.5.0
  http: ^0.14.0
  flutter_local_notifications: ^12.0.0
  video_player: ^2.4.5


# Start development server
flutter run
```

Provide any backend/frontend split or environment setup notes here.
Install Flutter SDK:
Ensure you have Flutter installed on your machine. If not, follow the official setup guide:
Flutter Installation Guide

Set Up Supabase:
Sign up for a Supabase account: Supabase
Create a project and set up tables for user authentication and SOS logs.
Add Supabase keys to your Flutter app (you’ll get the URL and Key from your Supabase project dashboard).
---

## 🧬 Future Scope

List improvements, extensions, or follow-up features:

1. Multi-language Support
Feature: Add support for multiple languages to make the app accessible to a wider user base.
How: Integrate localization for UI and transcribe voice inputs in various languages.
Benefits: Enables the app to be used by non-English speakers and increases user adoption globally

2. Integration with AI-based Sentiment Analysis
Feature: Analyze the tone of voice or text to identify whether the user is in distress (e.g., using OpenAI or a custom sentiment analysis model).
How: When the user speaks, use AI to determine if they are in an emergency or just sending a regular message.
Benefits: Automatically categorizes emergency situations and prioritizes them for quick response.

3. Geofencing and Real-time Tracking
Feature: Implement geofencing to alert nearby contacts or authorities when the user enters a high-risk area.
How: Use GPS coordinates to create safe zones and trigger alerts when a user leaves the zone.
Benefits: Increases user safety by notifying emergency contacts about their location in real-time.

4. Integration with Wearables (Smartwatches, Fitness Bands)
Feature: Enable SOS functionality through wearables (such as a smartwatch or fitness band).
How: Users can press a button or gesture on the wearable to trigger the SOS alert in case they can’t access their phone.
Benefits: Provides a backup method for emergencies, ensuring the user can send alerts even without their phone.

5. AI Chatbot for Emergency Assistance
Feature: Add an AI-powered chatbot (using OpenAI or other services) to help guide users through emergency situations.
How: The chatbot can provide instructions on how to handle different emergencies or connect the user with authorities.
Benefits: Offers instant guidance and support during emergencies.

6. Integration with Police and Medical Services
Feature: Allow users to directly alert police, medical services, or other emergency responders.
How: Set up partnerships with local authorities or integrate with emergency service APIs to send distress signals and provide the user’s location.
Benefits: Reduces response time and ensures the user gets immediate help.

7. Video Streaming to Emergency Contacts
Feature: Live stream video (captured during an emergency) to emergency contacts.
How: Allow users to initiate video streaming during an SOS alert, so contacts can see the situation in real-time.
Benefits: Increases situational awareness for emergency contacts and responders.

8. Voice-Activated Commands
Feature: Add hands-free, voice-activated commands for triggering the SOS button or other safety features.
How: Use a speech-to-text API or local device voice recognition to trigger SOS alerts by voice (e.g., “Call for help”).
Benefits: Useful for situations where the user can't physically interact with the phone (e.g., in danger).

9. Customizable Safety Plans
Feature: Allow users to create personalized safety plans and share them with family or friends.
How: Users can set emergency contacts, define safe routes, and share plans for specific situations (e.g., traveling alone at night).
Benefits: Prepares the user for emergencies with pre-defined responses, increasing safety during risky situations.

10. Real-Time Crime Data and Alerts
Feature: Provide users with real-time data on crime rates or incidents in their area.
How: Use external crime data APIs to display a map or feed showing recent incidents near the user’s location.
Benefits: Helps users avoid high-risk areas and be more aware of their surroundings.

11. Emergency Fund Integration
Feature: Implement a feature to link to emergency funds or quick access financial services.
How: Allow users to send money to trusted contacts in case of emergencies (e.g., through a payment gateway like Stripe or PayPal).
Benefits: Helps in cases where the user needs immediate financial assistance.

12. Offline Data Syncing
Feature: Improve offline functionality by allowing all collected data (SOS logs, recorded videos, etc.) to sync once the internet is restored.
How: Use background data syncing to upload the data to the cloud or notify emergency contacts when the network is available.
Benefits: Ensures data is stored and sent even in low/no network areas.

13. Community Reporting Feature
Feature: Allow users to report local dangers or unsafe areas (e.g., suspicious activities, road accidents) to help others stay safe.
How: Provide a platform for users to send real-time alerts about hazards in their environment, which other users can see.
Benefits: Promotes a community-driven safety network and keeps everyone informed about nearby risks.

14. Emergency Simulation and Drills
Feature: Integrate an emergency drill feature where users can practice safety measures in virtual scenarios.
How: Users can simulate common emergency situations (e.g., fire, assault) and practice the steps to take.
Benefits: Prepares users psychologically and physically for actual emergencies.

---

## 📎 Resources / Credits

- APIs or datasets used
 Supabase
Purpose: Backend database and authentication services.
Link: https://supabase.io

- Open source libraries or tools referenced  
- Acknowledgements  

---

## 🏁 Final Words

SurakshaBuddy has been an incredible journey for our team. From conceptualizing the idea to building an app that could potentially make a real difference in people's lives, every step of the way has been both challenging and rewarding. For a complete first year and begginer team HACKHAZARD was great experience.

---
