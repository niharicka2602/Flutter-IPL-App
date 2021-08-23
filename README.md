# Flutter-App

<br>
This Flutter Application predicts the score of the IPL Team based on the following input information:<br>
1. Team A <br>
2. Team B <br>
3. The Stadium <br>
4. Total Number Of Overs <br>
5. Runs Scored By The Previous Team <br>
6. Total Number Of Wickets Drawn <br> 
7. Runs Scored In The Previous 5 Overs <br>
8. Wickets Given In The Previous 5 Overs <br>
<br><br>
 The output will be presented at the bottom
 <br><br>
 
 Few things to change is the IP address of the VM/Instance you are using and the location and file name of the dart file which serves as backend code.<br>
 --> inside lib folder, go to main.dart file <br>
 --> var r = Uri.http("*Enter The IP Of Your VM or Instance*", "/cgi-bin/*Name of Your Python File with Extension*" <br>for eg - 
 *var r = Uri.http("192.168.1.18", "/cgi-bin/app.py"* <br>
 --> meanwhile, do not forget to add 3 files inside the cgi-bin folder for apache to host it on the browser <br>
 --> files to be added inside */var/www/cgi-bin* are **app.py, Batting-score-LassoReg-model.pkl, main.dart**  <br>
 --> make them executable (only python and pkl file)  <br>
 --> do not forget to import all the required libraries to execute the python code **(cgi, subprocess, pickle, numpy)**
 
 
 To check the errors make use of logs file<br>
 -->/etc/httpd <br>
 -->inside conf folder  <br>
 -->"logs" file
