# Healthrific
Your Health Pal
Our Hardware setup and App focus on minimizing the self testing procedure held in public places in the covid-19 times. And, This device also useful after this pandemic situation. 
## Inspiration

During this Global Crisis of COVID -19, Our Doctors, Nurses, Police, etc are working on the front-line against this. So, why are we falling back? After all, we are engineers with an innovative mind.  Now, we are here with the combined Hardware and Software solution which is called **“HEALTHRIFIC”**, after a thorough analysis of some problems faced by our covid-19 fighters. We have tried to make the next generation Healthcare Device for Protecting vulnerable population during and after this pandemic situation.

## What it does
 There is a Hardware setup which consists of a self shoe sole sanitation device, Self-Test kiosk and Contact free basin. So, the pedestal comes near to our setup and stands over it through that way the shoe sole is sanitized by UV light (this way it restricts the transmission of coronavirus through shoe sole). Then, there is a self-test kiosk for which users connected our app with the setup through bluetooth. Afterwards, user’s place their finger over the sensor which measures Heart Rate, Blood Oxygen Saturation Level and Body Temperature, and get the whole data over the app.In last there is contact free basin to wash their hands in public spaces ( everyone washes their hands without touching the tap, means restricted the transmission of the Coronavirus through the surface and reduce wastage of water).
In our app, there so many specifications-
1.	Shows no. of COVID cases in your region
2.	Health Tips ( About self protection guide, Immunity boosting diet, Healthy diet for children and senior citizen)
3.	Self Assessment Test  (Result valid for 1 week)
4.	Self-Test Kiosk (data from hardware setup)
5.	QR Code Generator ( which is valid for 45 mins)

That QR Code only generates after when both tests (pt.3 and pt. 4) are passed by user and scan that code in the malls, banks, stations, etc. Due to this generated code, we try to reduce the extra workforce of people who are thermal scanning the body temperature at the public space.  

## How we built it
 In the Hardware setup of this project, shoe sole sanitization device by using UV-C type and its choke, contact free basin by mechanical parts like pedal, spring, metal wire, cistern, etc and self-test kiosk is done by Arduino Uno, Max30102 (for Heart Rate and Blood Saturation), Ds18b20 (for body temperature ) & Bluetooth HC-05.

We build our app on Flutter which is a hybrid platform using dart language. Because Flutter apps can run on both ios and android phones, it is economically feasible. Then, we used an API provided by disease.sh for details related to COVID-19 like total cases, active, deaths, etc.and did some other stuff also with our skills.

## Challenges we ran into
Due to lockdown, we don’t have NodeMCU (IoT device) to store data over the cloud. So, we tried to figure out this with Arduino Uno and Bluetooth. First, we send data over mobile app then to over firestore.

## Accomplishments that we're proud of
 Working, Self-Test kiosk with real-time data functioning backend servers for data management easy to use app which can present real-time data to the user over the app.
And generate QR Code after successfully completion of both tests.

And whole hardware setup cost around  59 USD including all taxes (and which is useful in many ways) which is less than single electronic sensor sinks (90 USD)
 
## What we learned
Learned a lot about that without having an IoT device, how to store data over a server and also, about the new sensors. 
Moreover, built a more functioning mobile app.

## What's next for Healthrific
In terms of enhancing the project, we can identify the user’s state of mind using EEG or GSR reading & Machine Learning. Also, determine blood pressure through self-test kiosk.
In terms of marketing the product, we would like to initially target public spaces of our region.

For more information: https://devpost.com/software/healthrific

