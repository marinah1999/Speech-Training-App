def speed():
    fp=open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8")
    count = 0
    for line in fp:
        words = line.split(" ")
        count =+ len(words)
    fp.close();
    print("number of words that you said:",count)
    countresult=count
    speakrate=countresult/0.5
    print("speakrate(word per mins) is:",speakrate)
    if speakrate>=100 and speakrate<=150:
        print("speakrate is good")
        return "Great job.. You don't have any problem in speakrate" 
    elif speakrate>150:
        print("speakrate very speed")
        return "Your speak rate is fast..please Try to practice more to get better in the next time" 
    elif speakrate<100 and speakrate>0:
        print("speakrate very bad")
        return "Your speak rate is slow.. You have to work harder to get better"
    else :
        print("you are not speak please record your voice in page voice record")
        return "Please go to record page.. Read and record the text out loud for us to get your voice and give you your results"
     