# 🏋️‍♂️ BeeFit-SSC2025

A great virtual assistant for tracking your progress in doing push-ups and squats in a very playful and challenging way.

https://github.com/user-attachments/assets/41df4388-2337-4072-a399-60c70276a178

## Brief description
I created the **'Bee Fit'** as my submission for the **Swift Studet Challenge 2025**. Sport is the most important par of my life, hence the idea for this app came to me when I was exercising. I thought about creating some kind of tracker of reps you are doing. That's how essentially **'Bee Fit'** was established.

## Features

- 🎮 Is very interactive and user-friendly
- 👫 Adjust reps needed to pass based on gender
- 📸 Uses your camera to track push-ups & squats.

## Prologue



## Technologies I have used

For this project I have mainly used an Apple framework for writing on Swift called SwiftUI. As Challenge requires you to write the code in the Swift Playgrounds, the functionality is much smaller than in XCode. To be more precise, I have used the following things:

> [!NOTE]
>  Initially, I wanted to create the logic of the reps-counting using **Core ML** framework. I have gathered the training material and build the ML Model. However, as the project was built in the Swift Playground, I did not figure out how to work with ML Model there. That's why I decided to track the point on the user's body and, using some algorithms, count each rep.

- ***AVFoundation***: Captures and processes the front camera feed.
- ***Combine***: Manages real-time data streams, including hand gestures and head tracking.
- ***Vision***: Detects facial landmarks to track the user's position relative to the screen.
- ***SwiftUI***: Builds the user interface and handles app-wide data and state management.

> [!IMPORTANT]
> Even though my app was not selected as a winner for this challenge, I was very excited to be a part of this journey. The experience and knowledge I got is really tremendous, so I do recommend everybody, who is interested in iOS developmnet, to take part in this challenge annually. 
