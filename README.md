# ShareSched 📅
Have you ever wanted to compare schedules with a friend but found it too tedious to compare every little time, professor, and location? ShareSched is an app that allows you to upload a picture of a schedule and extract the key details from it. ShareSched can also find similarities in your schedule and your friend’s whether it’s location, professor, class section, or more! ScareSched is the app you need when schedule planning time comes up.


## MVP

 - User account with user authentication
 - My Schedule tab for user’s schedule
-   Friend Schedule’s tab for schedule of friends	 
- User is able to upload a picture of a schedule and user is able to take photo of schedule within the app
- Image to text conversion of schedule image to schedule
- Comparison feature to find similarities between 2 uploaded schedules
	- Percentage indicator of how similar 2 schedules are


## Stretch Goals
-   Implementation of Google Calendar API to take school schedule from ShareSched and put them on a user's schedule
	- [Google Calendar API](https://developers.google.com/calendar/api/guides/overview) 
-   Implementation of the RateMyProf API to provide further insight into a user's schedule	- https://github.com/tisuela/ratemyprof-api
-   Social aspect that allows you to find other people with the same class (i.e include discord link for a certain class)
- QR Code feature that allows users to compare schedules without taking a picture of the schedule
- Analytics tab that includes useful insights about the schedules
	- Ex: total time spent in class



## Milestones
 **Week 1**
Meet team, decide frontend/backend teams, set up development environment, finalize tech stack

**Week 2**
- Flesh out collective vision for the app
- Learn basics of Flutter
- Frontend:
	-	Create wireframes for UI in Figma/AdobeXD
	-	Learn Flutter frontend
- Backend:
	- Plan out database design schema
	- Learn basics of Google Firebase

**Weeks 3/4**
- Backend and frontend communication to ensure cohesive application
- Frontend: 
	- Finalize UI Design
	- Code initial screens
		- Sign up and login screens
		- My schedule tab
	- Research how to upload images/take pictures in a Flutter app
- Backend:
	- Set up user authentication
	- Set up database to store user information and user schedule objects
	- Research Google Cloud OCR and plan out usage for ShareSched backend
    

**Weeks 5/6**
- Backend and frontend communication to start integrating backend with frontend
- Frontend: 
	- Finish screens:
		- Friend screen
		- Compare screen
	- Implement ability to upload images and take pictures of schedules
- Backend:
	- Implement Google Cloud OCR API to gather data from schedule images
	- Work on schedule comparison features

**Weeks 7/8**
- Backend and frontend communication to finish integrating backend with frontend to connect and test
- If far along enough, start working on stretch goals:
	- Analytics tab OR
	- RateMy Prof API implementation in some way OR
	- Social aspect w/ Discord links OR
	- QR Code feature
 - Frontend:
	- Polish up MVP features and help backend if needed
- Backend
	-	Finish schedule comparison feature
    
**Weeks 9/10**
- Prepare for presentation
- Polish app so it is presentation ready




## Tech Stack

**Front-End: Flutter**
- **[Flutter Installation](https://www.youtube.com/watch?v=8saLa5fh0ZI)**
	- Easy to learn, works on both macs and windows, good for mobile applications, contains helpful libraries as well
-   Resources:
	- [Flutter Basics](https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)
	- [Using Flutter w/ Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)
	- [Taking Picture with Flutter](https://docs.flutter.dev/cookbook/plugins/picture-using-camera)
	- [Flutter Docs](https://docs.flutter.dev/)
	- [Flutter - Text Recgnition w/ Google ML Kit](https://www.youtube.com/watch?v=jZqTjFOxiC4)
	- 
    
**Back-End: Firebase**
-   Easily compatible with Flutter
- Works well with Google Cloud OCR
-   Resources:
	- [Using Flutter w/ Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)
	- [Youtube Playlist: Flutter + Firebase](https://www.youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
	- [Google Cloud OCR Documentation](https://cloud.google.com/vision/docs/ocr)
    -   [Google Cloud OCR + Flutter](https://firebase.google.com/docs/ml/android/recognize-text)
    - [OCR Tutorial](https://cloud.google.com/functions/docs/tutorials/ocr)
    - [Implement OCR with Firebase Cloud Functions](https://www.youtube.com/watch?v=bTEU10c3gds)

**-   APIs**
-   [Rate My Prof](https://github.com/tisuela/ratemyprof-api)
-   [Google Calendar API](https://developers.google.com/calendar/api/guides/overview)
- [Google Cloud OCR](https://cloud.google.com/vision/docs/ocr)
- [Flutter Calendar Option 1](https://fluttergems.dev/packages/table_calendar/)
-  [Flutter Calendar Option 2](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/#installation)

## Software to Install
-   [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
-   [Git](https://git-scm.com/downloads) (version control)
-   [Flutter](https://docs.flutter.dev/get-started/editor)
-   [Firebase](https://firebase.google.com/docs/cli)

## Other Resources
-   [Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)
-   [Git in-depth tutorial](https://youtu.be/RGOj5yH7evk)
-   [Postman set up tutorial](https://youtu.be/3eHJkcA8mTs)    
-   Sharing any graphics using [Box](https://utdallas.account.box.com/login)  
-   Sign up for [Figma](https://www.figma.com/signup)  
-   [Wireframe design inspiration](https://dribbble.com/shots/popular/web-design)  
-   Resources to make presentations:
-   [Pitch](https://pitch.com/) (more “professional” templates)

## Team ShareSched
**Developers:**
- Noel Emmanuel the coolest
- Nadeeba Atiqui the best
- Aldrin Roshan the aim bot
- Faizan Kalam

**Industry Mentor:**
- Erik Rodriguez

**Project Manager:**
- Karina Batra

