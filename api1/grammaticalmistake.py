
#orginial txt
#Stuttering — also called stammering or childhood-onset fluency disorder — is a speech disorder that involves frequent and significant problems with normal fluency
#  and flow of speech. People who stutter know what they want to say, but have difficulty saying it
def compare(text1, text2):  
    l1 = text1.split()
    l2 = text2.split()
    good = 0
    bad = 0
    for i in range(0, len(l2)):
        if l1[i] != l2[i]:
            bad += 1
        else:
            good += 1
    return (good, bad)
    
    

# Helper function to calculate the percentage of misspelled words
def percentageOfBad(x):
    message="Total percentage of errors it's\n"
    mm=str((x[1] / (x[0] + x[1])) * 100)
    message+=mm
    return message
    message="Repeatation found in your speech, you've repeated:\n"

with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/orginial.txt", "r",encoding="utf8") as f1: # test.txt contains the same typo-filled text from the last example 
    t1 = f1.read()

with open("C:/Users/MHDAH/Downloads/Telegram Desktop/flutter_application_1/api1/record.txt", "r",encoding="utf8") as f2: # original.txt contains the text from the actual book 
    t2 = f2.read()



mistakesCompCorrected = compare(t1, t2)


print("Mistakes compared to corrected ", mistakesCompCorrected, "\n")


print("Percentage of  mistakes: ", str(percentageOfBad(mistakesCompCorrected)), "%", "\n")



