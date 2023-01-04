with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8") as f1: # test.txt contains the same typo-filled text from the last example 
    text = f1.read()

def Delay(text):    
    words=text.split()
    len(words)
   
    repet_words={}
    g=0
    for i in range(0, len(words)):
      duplicat = {}
      repet = {}
      for k in range(0,len(words[i])):
         r=0
         index=0
         char=words[i][k]
         for j in range(0, len(words[i])-2):

           char=words[i][j]
           charr=words[i][j+1]
           charrr=words[i][j+2]
         
           if char == charr:
             if charr == charrr:
               r=r+1
               repet[index]=char
           else:
                if r!=0:
                  duplicat[index]=r
                  index+=1
                  r=0;
    #  print(repet)
    #  print(duplicat)
         string=words[i]
         if(repet):
          repet_words[g]=string
          g+=1
    #  for z in repet:
    #      print(string)
    #      string=string.replace(repet[z], "",duplicat[z] )
    #      print(string)
    #      break
    index=0
    if not repet_words:
       return ("Great you dont have delay with any word")
    else :return ("You have a delay in Some  words ")



