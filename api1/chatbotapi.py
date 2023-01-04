from urllib import response
import json
from flask import Flask, jsonify, request
import chatbot
import speech_recognition as sr
import pyttsx3
from urllib import response
import json
import grammaticalmistake
response=''
import repeatition
import speed
import delay


response=''
app = Flask(__name__)

@app.route('/chatbot', methods=["GET", "POST"])
def chatbotResponse():

    global response

    if(request.method == 'POST'):
        request_data=request.data
        request_data=json.loads(request_data.decode('utf-8'))
        the_question = request_data['text']
        response = chatbot.chatbot_response(the_question)
        
        return jsonify({"response": response })
    else:
         return jsonify({"response": response })    
       
@app.route("/voicerecorder", methods=["GET", "POST"])
def index():
    record = ""
    if request.method == "POST":
        request_data=request.data
        request_data=json.loads(request_data.decode('utf-8'))
        record=request_data['text']
        #print("you Said : ")
        #print(record)
        with open('C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt', 'w') as fp:
         #fp.write(textCorrected)
         fp.write(str(record))
        return "Done"


@app.route('/gm', methods=["GET", "POST"])
def featureresponse():

    global response1
    
    if(request.method == 'GET'):
        
        response1 = grammaticalmistake.percentageOfBad(grammaticalmistake.mistakesCompCorrected)
        #print(response)
        return jsonify({"response": response1 })

@app.route('/rep', methods=["GET", "POST"])
def featureresponse2():

    global response2
    
    if(request.method == 'GET'):

        with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8") as f1: # test.txt contains the same typo-filled text from the last example 
         text = f1.read()
        response2 = repeatition.Repeatation(text)
        #print(response2)
        return jsonify({"response2": response2 })

@app.route("/speed", methods=["GET", "POST"])
def speedres():
    global response3
    if request.method == "GET":
        response3 =speed.speed()
        #print(response3)
        return jsonify({"response3": response3})  

@app.route("/delay", methods=["GET", "POST"])
def delayres():
    global response4
    if request.method == "GET":
        with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8") as f1: # test.txt contains the same typo-filled text from the last example 
         text = f1.read()
        response4 =delay.Delay(text)
       # print(response4)
        return jsonify({"response4": response4})  

if __name__ == "__main__":
    app.run(host="192.168.1.104", port=40222)
    #app.run(host="192.168.1.104", port=40222)
      #هون لازم تغير  ip فوت عل ipconfi من cmd وخود ipv4