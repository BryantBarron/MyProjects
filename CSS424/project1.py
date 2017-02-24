'''
For this assignment, you will write a program that 
implements a Caesar Cipher (encryption and decryption).
A Caesar Cipher is a simple encryption method that 
encrypts a message by shifting each character either
forward or backward a fixed number of positions in
the alphabet.

Example plain text and cipher text below. 

plain:    meet    me  after      the     toga   party
cipher: PHHW PH DIWHU WKH WRJD SDUWB

Project done by: Bryant Barron
'''

alphabet = 'abcdefghijklmnopqrstuvwxyz'

#set bool to true for while loop
again = 'yes'

#function to encrypt the phrase we want
def encryption(encrypt,shift):
    print("\nYour phrase before encryption is: ")
    print(encrypt)
    encrypted = ''
    for i in encrypt.lower():
            if(i == ' '):
                encrypted += i
            else:
                i = (alphabet.index(i) + shift) % 26
                encrypted += alphabet[i]
    print("\nYour phrase after encryption is: ")
    print(encrypted + "\n")
            
    
#function to decrypt the phrase we want 
def decryption(decrypt,shift):
    print("\nYour phrase before decryption is: ")
    print(decrypt)
    decrypted = ''
    for i in decrypt.lower():
        if(i == ' '):
            decrypted += i
        else:
            i = (alphabet.index(i) - shift) % 26
            decrypted += alphabet[i]
    print("\nYour phrase after encryption is: ")
    print(decrypted + "\n")

#ask the user to do stuff, run this while again is true
print("Welcome to project 1.")
while (again == 'yes'):
    x = input("\nWould you like to encrypt a message " +
          "or decrypt a message?(e or d)")
    if(x.lower() == 'e'):
        encrypt = input("\nPlease enter the phrase you " 
            + "would like encrypted.\n")
        shift = int(input("\nPlease enter how many shifts "+ 
            "you would like.(Please enter only a number.)\n"))
        #call fxn to encrypt
        encryption(encrypt,shift)
    elif(x.lower() == 'd'):
        decrypt = input("Please enter the phrase you " 
            + "would like decrypted.\n")
        shift = int(input("\nPlease enter how many shifts "+ 
            "you would like.(Please enter only a number.)\n"))
        #call fxn to decrypt
        decryption(decrypt,shift)
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
    




