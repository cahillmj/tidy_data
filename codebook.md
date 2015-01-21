##Resulting tidy dataset contains 68 variables as follows: 
### Grouping Variables
* Subject
* Activity- One of LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, and WALKING UPSTAIRS

### Signals- for each signal, there is a Mean and StDev (standard deviation) variable.  If XYZ listed, then the signal measured for each of the X, Y, and Z directions. In the tidy dataset, all signal variables are collapsed across subject and activity.
* timeBodyAccel(XYZ)
* timeGravityAccel(XYZ)
* timeBodyAccelJerk(XYZ)
* timeBodyGyroscope(XYZ)
* timeBodyGyroscopeJerk(XYZ)
* timeBodyAccelMagnitude
* timeBodyAccelJerkMagnitude
* timeBodyGyroscopeMagnitude
* timeBodyGyroscopeJerkMagnitude
* freqBodyAccel(XYZ)
* freqBodyAccelJerk(XYZ)
* freqBodyGyroscope(XYZ)
* freqBodyAccelMagnitude
* freqBodyAccelJerkMagnitude
* freqBodyGyroscopeMagnitude
* freqBodyGyroscopeMagnitude
* freqBodyGyroscopeJerkMagnitde