#!/usr/bin/python3
import cgi
import subprocess
import pickle
import numpy as np


print('content-type: text/html')
print('Access-Control-Allow-Origin: *')
print()

temp_array = list()
f = cgi.FieldStorage()

# Load the Linear Regression model
filename = 'Batting-score-LassoReg-model.pkl'
regressor = pickle.load(open(filename, 'rb'))

batting_team = f.getvalue("a")
if batting_team == 'Chennai Super Kings':
	temp_array = temp_array + [1,0,0,0,0,0,0,0]
elif batting_team == 'Delhi Daredevils':
	temp_array = temp_array + [0,1,0,0,0,0,0,0]
elif batting_team == 'Kings XI Punjab':
	temp_array = temp_array + [0,0,1,0,0,0,0,0]
elif batting_team == 'Kolkata Knight Riders':
	temp_array = temp_array + [0,0,0,1,0,0,0,0]
elif batting_team == 'Mumbai Indians':
	temp_array = temp_array + [0,0,0,0,1,0,0,0]
elif batting_team == 'Rajasthan Royals':
	temp_array = temp_array + [0,0,0,0,0,1,0,0]
elif batting_team == 'Royal Challengers Bangalore':
	temp_array = temp_array + [0,0,0,0,0,0,1,0]
elif batting_team == 'Sunrisers Hyderabad':
	temp_array = temp_array + [0,0,0,0,0,0,0,1]

bowling_team = f.getvalue("b")
if bowling_team == 'Chennai Super Kings':
	temp_array = temp_array + [1,0,0,0,0,0,0,0]
elif bowling_team == 'Delhi Daredevils':
	temp_array = temp_array + [0,1,0,0,0,0,0,0]
elif bowling_team == 'Kings XI Punjab':
	temp_array = temp_array + [0,0,1,0,0,0,0,0]
elif bowling_team == 'Kolkata Knight Riders':
	temp_array = temp_array + [0,0,0,1,0,0,0,0]
elif bowling_team == 'Mumbai Indians':
	temp_array = temp_array + [0,0,0,0,1,0,0,0]
elif bowling_team == 'Rajasthan Royals':
	temp_array = temp_array + [0,0,0,0,0,1,0,0]
elif bowling_team == 'Royal Challengers Bangalore':
	temp_array = temp_array + [0,0,0,0,0,0,1,0]
elif bowling_team == 'Sunrisers Hyderabad':
	temp_array = temp_array + [0,0,0,0,0,0,0,1]

Venue = f.getvalue("c")
if Venue == 'M Chinnaswamy Stadium':
	temp_array = temp_array + [1,0,0,0,0,0,0,0]
elif Venue == 'Eden Gardens':
	temp_array = temp_array + [0,1,0,0,0,0,0,0]
elif Venue == 'Feroz Shah Kotla':
	temp_array = temp_array + [0,0,1,0,0,0,0,0]
elif Venue == 'MA Chidambaram Stadium, Chepauk':
	temp_array = temp_array + [0,0,0,1,0,0,0,0]
elif Venue == 'Punjab Cricket Association Stadium, Mohali':
	temp_array = temp_array + [0,0,0,0,1,0,0,0]
elif Venue == 'Wankhede Stadium':
	temp_array = temp_array + [0,0,0,0,0,1,0,0]
elif Venue == 'Sawai Mansingh Stadium':
	temp_array = temp_array + [0,0,0,0,0,0,1,0]
elif Venue == 'Rajiv Gandhi International Stadium, Uppal':
	temp_array = temp_array + [0,0,0,0,0,0,0,1]

overs = float(f.getvalue("d"))
runs = int(f.getvalue("e"))
wickets = int(f.getvalue("f"))
runs_in_prev_5 = int(f.getvalue("g"))
wickets_in_prev_5 = int(f.getvalue("h"))
        
temp_array = temp_array + [overs, runs, wickets, runs_in_prev_5, wickets_in_prev_5]
        
data = np.array([temp_array])
my_prediction = int(regressor.predict(data)[0])
print(my_prediction)


