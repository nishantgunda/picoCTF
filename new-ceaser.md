i was able to understand the code.
It first has an set variable key which is a single character which is a letter from a to p.
The function encrypts the flag first by taking each letter in the main string and the breaks its binary ascii value into 2 parts(a charavter is 1 byte which is
8 bits it puts first 4 bits one side and other 4 bits on another side and replaces that character with the 2 alphabets having the same index as the 2 parts' value)
then it rotates the output string by rotating the alphabets such that each 'a' in the key becomes the key,'b' becomes the letter after key ... and 'p' becomes the letter 
before key.
I wasn't able to develop a program to reverse this
