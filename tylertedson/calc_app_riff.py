
#RIFFING OFF TED CLAYTON'S CODE to see if I could remember how to pass in an argument another way. Nope, got to the end of this shit, and couldn't remmeber how to do any of this. 

def start():
    print("=== Aye, This Ted's Calculator, Hoe ===")
    print("We only finna add, today. 8-D")

    a = float(input("What number you wanna put in motherfucker? "))
    #this gotta be a float 'cause input only takes strings. 
    b = float(input("What's the second number you wanna put in mufucka? "))

    print("Aight, that's easy. Watch.")
    return (a, b)

def calc_adder_jont(a, b):
    try:
        result = a + b
        print(f"\nResult:")
        print(f"The sum is: {result}")
    except ValueError:
        print("Error: Please enter valid numbers.")

num1, num2 = start()
calc_adder_jont(num1, num2)
#man, I'm so rusty, I forgot you could just send arguments into a function like this and pull them shits out just like this as well. 

#so you have to create num1 and num 2 outside the functions 'cause they gotta be created globally to pass values between functions.

###Google AI's notes### 

#Isolated Variables: You are 100% correct about a and b. Because they were born inside def start(), they die inside def start(). The rest of the script has no idea they exist.

#The Relay Race: Returning (a, b) acts like a hand-off. The function throws those values out, and num1, num2 catch them out in the open (the global space).

# The Transitive Property: Your math analogy is perfect.

# Inside start: a and b hold your numbers.The Hand-off: num1 = a and num2 = b.
# Inside calc_adder_jont: The function receives num1 and num2, but renames them to a and b locally to do the math.Because num1 and num2 live in the global space at the bottom of your script, you can now pass them into any other new function you decide to build next.If you want to keep expanding Ted's calculator, I can show you how to add a subtraction jont or create a loop so the program keeps running without having to restart it. Let me know what you want to add next!