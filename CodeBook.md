---
title: "CodeBook"
date: "January 25, 2015"
output: html_document
---
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


1        subject

2	activitynames

3	timebodyaccelerationmeanxaxis

4	timebodyaccelerationmeanyaxis

5	timebodyaccelerationmeanzaxis

6	tgravityaccelerationmeanxaxis

7	tgravityaccelerationmeanyaxis

8	tgravityaccelerationmeanzaxis

9	timebodyaccelerationjerkmeanxaxis

10	timebodyaccelerationjerkmeanyaxis

11	timebodyaccelerationjerkmeanzaxis

12	timebodygyroscopemeanxaxis

13	timebodygyroscopemeanyaxis

14	timebodygyroscopemeanzaxis

15	timebodygyroscopejerkmeanxaxis

16	timebodygyroscopejerkmeanyaxis

17	timebodygyroscopejerkmeanzaxis

18	timebodyaccelerationmagmean

19	tgravityaccelerationmagmean

20	timebodyaccelerationjerkmagmean

21	timebodygyroscopemagmean

22	timebodygyroscopejerkmagmean

23	frequencybodyaccelerationmeanxaxis

24	frequencybodyaccelerationmeanyaxis

25	frequencybodyaccelerationmeanzaxis

26	frequencybodyaccelerationmeanfreqxaxis

27	frequencybodyaccelerationmeanfreqyaxis

28	frequencybodyaccelerationmeanfreqzaxis

29	frequencybodyaccelerationjerkmeanxaxis

30	frequencybodyaccelerationjerkmeanyaxis

31	frequencybodyaccelerationjerkmeanzaxis

32	frequencybodyaccelerationjerkmeanfreqxaxis

33	frequencybodyaccelerationjerkmeanfreqyaxis

34	frequencybodyaccelerationjerkmeanfreqzaxis

35	frequencybodygyroscopemeanxaxis

36	frequencybodygyroscopemeanyaxis

37	frequencybodygyroscopemeanzaxis

38	frequencybodygyroscopemeanfreqxaxis

39	frequencybodygyroscopemeanfreqyaxis

40	frequencybodygyroscopemeanfreqzaxis

41	frequencybodyaccelerationmagmean

42	frequencybodyaccelerationmagmeanfreq

43	frequencybodybodyaccelerationjerkmagmean

44	frequencybodybodyaccelerationjerkmagmeanfreq

45	frequencybodybodygyroscopemagmean

46	frequencybodybodygyroscopemagmeanfreq

47	frequencybodybodygyroscopejerkmagmean

48	frequencybodybodygyroscopejerkmagmeanfreq

49	angletimebodyaccelerationmeangravityaxis

50	angletimebodyaccelerationjerkmeangravitymean

51	angletimebodygyroscopemeangravitymean

52	angletimebodygyroscopejerkmeangravitymean

53	anglexgravitymean

54	angleygravitymean

55	anglezgravitymean

56	timebodyaccelerationstdxaxis

57	timebodyaccelerationstdyaxis

58	timebodyaccelerationstdzaxis

59	tgravityaccelerationstdxaxis

60	tgravityaccelerationstdyaxis

61	tgravityaccelerationstdzaxis

62	timebodyaccelerationjerkstdxaxis

63	timebodyaccelerationjerkstdyaxis

64	timebodyaccelerationjerkstdzaxis

65	timebodygyroscopestdxaxis

66	timebodygyroscopestdyaxis

67	timebodygyroscopestdzaxis

68	timebodygyroscopejerkstdxaxis

69	timebodygyroscopejerkstdyaxis

70	timebodygyroscopejerkstdzaxis

71	timebodyaccelerationmagstd

72	tgravityaccelerationmagstd

73	timebodyaccelerationjerkmagstd

74	timebodygyroscopemagstd

75	timebodygyroscopejerkmagstd

76	frequencybodyaccelerationstdxaxis

77	frequencybodyaccelerationstdyaxis

78	frequencybodyaccelerationstdzaxis

79	frequencybodyaccelerationjerkstdxaxis

80	frequencybodyaccelerationjerkstdyaxis

81	frequencybodyaccelerationjerkstdzaxis

82	frequencybodygyroscopestdxaxis

83	frequencybodygyroscopestdyaxis

84	frequencybodygyroscopestdzaxis

85	frequencybodyaccelerationmagstd

86	frequencybodybodyaccelerationjerkmagstd

87	frequencybodybodygyroscopemagstd

88	frequencybodybodygyroscopejerkmagstd

