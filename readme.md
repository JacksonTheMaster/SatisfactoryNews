# Satisfactory Factory Alert System for Alexa and Home Assistant
This project enables real-time notifications via Alexa about the status of your Satisfactory game factory. By utilizing custom mod circuitry within the game, Home Assistant for local automation and control, and an Alexa Skill for voice notifications, you can get informed when your factory's status changes to "bad". The criteria for what constitutes a "bad" status is customizable, leveraging the creative potential of Satisfactory's in-game circuitry.

## Status: Work in Progress (WIP) 🚧
This project is currently under development. Future plans include releasing a fully-fledged Alexa Skill and a Home Assistant Integration for easier setup and use.

All content and code provided here are open for use, including for commercial purposes.

### Getting Started
#### Create an Alexa Skill for Custom Notifications
Navigate to the Alexa Developer Console and create a new skill:

Choose the Custom model and select the Fact Skill template.
Opt for Alexa-Hosted (Python) as your backend resource.
Name your skill appropriately.
#### Implement your skill logic:

Copy and paste the provided lambda_function.py code into the Alexa skill's code editor.
Adjust the invocation name and any specific intents or slots as necessary. (Note: If you've made changes to the invocation or interaction model, ensure they are consistent)
#### Integrate with Home Assistant

Configure Image Downloader in Circutry:

Set up an image downloader within Satisfactory / Circutry to trigger on receiving a specific string containing a webhook URL. This URL is called whenever your factory's status changes to "bad". The GET request is sent whenever the string changes.
#### Create the Home Assistant Script:

Add the script to Home Assistant to facilitate the above mechanism. This script is responsible for capturing the factory status and updating the webhook.
#### Set Up Automations:

Refer to the provided /misc/sample_alert.yml for an example automation configuration. This automation is crucial for triggering the script based on game events and updating the factory status.
Every Item currenly supported is found in /misc/supported_factories.json.

Its cruical to stick to these names so the skill can use it as a reference to play the right audio file for the item type.

#### Expose Factory Status JSON:

Ensure the automation updates and exposes a JSON file at https://<your_url>/local/satisfactory_alert_state.json. This file contains the current factory status and is accessible over the web.


## Documentation will be expanded to include detailed instructions!!!

Additional features and automation examples will be added based on community feedback and further development.
Contribution and Feedback
This project is open for contributions and feedback. Whether you have suggestions for improvements, new features, or have encountered issues, your input is valuable for making this project more robust and user-friendly.

## Create ADA Voice Sounds
(https://satisfactory.guru/articles/read/index/id/47/name/ADA+Voice, 04032024)
Go to https://cloud.google.com/text-to-speech
Scroll down to "Put Text-to-Speech into action"
Select en-US-Wavnet-C
In the "Text to speak" box, delete the example text and type in what you want
Sometimes you need to misspell things to make them sound correct.
Click the "Speak It" button
Install Audacity and capture your internal audio
Install Plugins
Download Multi-Voice chorus plugin for Audacity
https://forum.audacityteam.org/viewtopic.php?f=42&t=68007
THIS LINK -> https://forum.audacityteam.org/download/file.php?id=6115
The plugin needs to be saved to:
C:\Program Files (x86)\Audacity\Plug-Ins
Open Audacity
Tools > Add/Remove Plugins
Locate MultiVoiceChorus and select it
Click Enable
Click OK
Press Ctrl + A to select the recording
Effect > Multi voice chorus
Speed: 1.90
Depth: 2.90
Voices: 1
Mix: 3.40
Effect > Delay
Delay type: Regular
Delay level per echo (dB): -18.70
Delay time (seconds): 0.00
Pitch change effect: Pitch/Tempo
Pitch change per echo (semitones): -0.120
Number of echos: 2
Allow duration to change: Yes
 

Export the Recording
File > Export As MP3/WAV/OGG
Convert the recording (IMPORTANT)
https://v3.jovo.tech/audio-converter (non affiliated, i just like it - Jackie)
