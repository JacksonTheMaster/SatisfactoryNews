# This lets you utilize Home Assistant, Alexa, and the Satisfactory Mod Circutry to get Custom (ok premade by me but still) A.D.A Alexa Notifications about your factory
You configure an image downloader to recieve a string with a webhook url whenever the factory status changes to "bad". How you measure that metric is up to you  and your creativity with circutry.



Create Alexa Skill based on -> custom -> fact skill -> akexa hosted -> python and copy paste the lambda_function.py. (for now enough documentation)
maybe change  invocation stuff (Jackie check if you changed stuff here or in alpha-1)


create script somewhere in home assistant 

img 1-3 

create automation like  /misc/sample_alert.yml

call GET endpoint and the json is saved and exposed to https://url/local/satisfactory_alert_state.json

alexa skill can then get the json and determine wich sound to play.


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
