'''

For this assignment, you will explain your design of the Feistel 
cipher, write a program that implements encryption and decryption
 of Feistel cipher and show examples of the output.

 Bryant Barron
 March 2017

 Unable to test if decryption works the say it is supposed to
 I believe that it does, will update when I figure it out. 
 '''
from symbol import xor_expr

#encryption alogrithm
def encryption(encrypt,rounds,key):
    print("\nYour phrase before encryption is: ")
    print(encrypt)
    key = rounds * key
   
    while(rounds != 0):
        length = len(encrypt)
        if(length%2==0):  
            split = int(length/2)
            l_half= encrypt[split:]
            f_half = encrypt[:split]
            #print(f_half,l_half)
            encrypt_arr1 = []
            for i in range(len(f_half)):
                j = ord(f_half[i])
                encrypt_arr1.append(j)
                first_half = list(map(int,encrypt_arr1))
            f_h = first_half
            #print(f_h)
            encrypt_arr2 = []
            for i in range(len(l_half)):
                j = ord(l_half[i])
                encrypt_arr2.append(j)
                last_half = list(map(int,encrypt_arr2))
        
            l_h = last_half
            #print(l_h)
            temp = l_h[:]
            #print(l_h)
            #print(temp)

            for i,x in enumerate(l_h):
                temp[i] = x +(key)%5
            #print(temp)
            #print(l_h)
       
            #print(f_h)
            for i in range(len(f_h)):
                f_h[i] = ((f_h[i] ^ temp[i]))
            #print(f_h)

            temp = f_h
            f_h = last_half
            l_h = temp
        
            round1 = f_h + l_h
            #print(round1)
            word = ''
            for i in range(len(round1)):
                letter = chr(round1[i])
                #print(letter)
                word = word + letter

            #print(word)
            encrypt = word
            rounds -= 1
        else:
            #create a new word shorter from encrypt
            #pop the last letter off
            #save that letter
            shorter = list(encrypt)
            #print(shorter)
            lastletter = list(shorter)
            #returns last letter of list
            lastletter = lastletter[-1]
            #print(lastletter)
            shorter.pop()
            #print(shorter)

            split = int(length/2)
            l_half= shorter[split:]
            f_half = shorter[:split]
            #print(f_half,l_half)
            encrypt_arr1 = []
            for i in range(len(f_half)):
                j = ord(f_half[i])
                encrypt_arr1.append(j)
                first_half = list(map(int,encrypt_arr1))
            f_h = first_half
            #print(f_h)
            encrypt_arr2 = []
            for i in range(len(l_half)):
                j = ord(l_half[i])
                encrypt_arr2.append(j)
                last_half = list(map(int,encrypt_arr2))
        
            l_h = last_half
            #print(l_h)
            temp = l_h[:]
        
            #print(l_h)
            #print(temp)
            for i,x in enumerate(l_h):
                temp[i] = x +(key)%5
            #print(temp)
            #print(l_h)
       
            #print(f_h)
            for i in range(len(f_h)):
                f_h[i] = ((f_h[i] ^ temp[i]))
            #print(f_h)
            temp = f_h
            f_h = last_half
            l_h = temp
        
            round1 = f_h + l_h
            #print(round1)
            word = ''
            for i in range(len(round1)):
                letter = chr(round1[i])
                #print(letter)
                word = word + letter

            #print(word)
            word = word + lastletter
            encrypt = word
            #print(encrypt)
            rounds -= 1
    print("\nYour phrase after encryption is: ")
    print(encrypt)
            
#decryption algorithm
def decryption(decrypt,rounds,key):
    print("\nYour phrase before decryption is: ")
    print(decrypt)
    key = rounds * key
    while(rounds != 0):
        length = len(decrypt)
        if(length%2==0):
            split = int(length/2)
            l_half= decrypt[split:]
            f_half = decrypt[:split]
            #print(f_half,l_half)
            decrypt_arr1 = []
            for i in range(len(f_half)):
                j = ord(f_half[i])
                decrypt_arr1.append(j)
                first_half = list(map(int,decrypt_arr1))
            f_h = first_half
           #print(f_h)
            decrypt_arr2 = []
            for i in range(len(l_half)):
                j = ord(l_half[i])
                decrypt_arr2.append(j)
                last_half = list(map(int,decrypt_arr2))
        
            l_h = last_half
            #print(l_h)
            temp = l_h[:]
           
            #swap left and right
            temp = f_h
            f_h = last_half
            l_h = temp
            
            #print(l_h)
            for i in range(len(l_h)):
                l_h[i] = ((l_h[i] ^ temp[i]))
            #print(l_h)

            for i,x in enumerate(f_h):
                temp[i] = x -(key)%5
            #print(temp)
            #print(f_h)
            
            round1 = f_h + l_h
            #print(round1)
            word = ''
            for i in range(len(round1)):
                letter = chr(round1[i])
                #print(letter)
                word = word + letter

            #print(word)
            rounds -= 1
        else:

            shorter = list(decrypt)
            #print(shorter)
            lastletter = list(shorter)
            #returns last letter of list
            lastletter = lastletter[-1]
            #print(lastletter)
            shorter.pop()
            #print(shorter)

            split = int(length/2)
            l_half= decrypt[split:]
            f_half = decrypt[:split]
            #print(f_half,l_half)
            decrypt_arr1 = []
            for i in range(len(f_half)):
                j = ord(f_half[i])
                decrypt_arr1.append(j)
                first_half = list(map(int,decrypt_arr1))
            f_h = first_half
            #print(f_h)
            decrypt_arr2 = []
            for i in range(len(l_half)):
                j = ord(l_half[i])
                decrypt_arr2.append(j)
                last_half = list(map(int,decrypt_arr2))
        
            l_h = last_half
            #print(l_h)
            temp = l_h[:]
           
            #swap left and right
            temp = f_h
            f_h = last_half
            l_h = temp
            
            #print(l_h)
            for i in range(len(l_h)):
                l_h[i] = ((l_h[i] ^ temp[i]))
            #print(l_h)

            for i,x in enumerate(l_h):
                temp[i] = x +(key)%5
            #print(temp)
            #print(f_h)
            
            round1 = f_h + l_h
            #print(round1)
            word = ''
            for i in range(len(round1)):
                letter = chr(round1[i])
                #print(letter)
                word = word + letter

            #print(word)
            decrypt = word
            rounds -= 1
    print("\nYour phrase before decryption is: ")
    print(decrypt)
            

'''
user interaction
ask user for message
ask user for encryption decryption
ask user for key
ask user for how many rounds
apply some error checking 
allow to repeat
allow to close program
'''
#set bool to true for while loop
again = 'yes'
print("Welcome to project 2.")
while (again == 'yes'):
    x = input("\nWould you like to encrypt a message " +
          "or decrypt a message?(e or d)")
    if(x.lower() == 'e'):
        encrypt = input("\nPlease enter the phrase you " 
            + "would like encrypted.\n")
        rounds = int(input("\nPlease enter how many rounds "+ 
            "you would like.(Please enter only a number.)\n"))
        key = int(input("\nPlease enter your key.\n"))
        #call fxn to encrypt
        encryption(encrypt,rounds,key)
        
    elif(x.lower() == 'd'):
        decrypt = input("Please enter the phrase you " 
            + "would like decrypted.\n")
        rounds = int(input("\nPlease enter how many rounds "+ 
            "you would like.(Please enter only a number.)\n"))
        key = int(input("\nPlease enter your key.\n"))
        #call fxn to decrypt
        decryption(decrypt,rounds,key)
        
    else:
        print("Incorrect Choice, program closing")
        break

    again = input("Would you like to encrypt/decrypt " +
        "another phrase?(yes/no)\n")
    #if user does answer yes or no keep telling them to
    while(again != 'yes' and again != 'no'):
        again = input("Please enter only yes or no. Try " +
            " again.\n")
    #force lowercase matching
    again = again.lower()
