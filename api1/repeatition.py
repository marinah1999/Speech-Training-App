import language_tool_python
tool = language_tool_python.LanguageTool('en-US')
import itertools

#List 1 contains unique words only
#List 2 contains repeated words only

def Repeatation(text):
  unique = []
  repeated=[]
  current_word = None
  for i in text.split():
      if i != current_word:
          unique.append(i)
          current_word = i
      else:
          repeated.append(i)

  
  unique=' '.join(unique)
  repeated=' '.join(repeated)

  text=unique
  
  matches = tool.check(text)
 
  matches
  my_mistakes = []
  my_corrections = []
  start_positions = []
  end_positions = []
 
  for rules in matches:
      if len(rules.replacements)>0:
          start_positions.append(rules.offset)
          end_positions.append(rules.errorLength+rules.offset)
          my_mistakes.append(text[rules.offset:rules.errorLength+rules.offset])
          my_corrections.append(rules.replacements[0])
     
 
     
  my_new_text = list(text)
 
 
  for m in range(len(start_positions)):
      for i in range(len(text)):
          my_new_text[start_positions[m]] = my_corrections[m]
          if (i>start_positions[m] and i<end_positions[m]):
              my_new_text[i]=""

  my_new_text = "".join(my_new_text)
  mm=""
  message="Repeatation found in your speech, you've repeated:\n"
  for i in itertools.groupby(repeated.split()):
    mm=mm+"The word %a\n"%(i[0].capitalize())
  message+=mm
  #m="Text after correction: %a"%(my_new_text)
  #message+=m
  return message

with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8") as f1: # test.txt contains the same typo-filled text from the last example 
    text = f1.read()

print(Repeatation(text))