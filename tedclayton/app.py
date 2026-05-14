from math_ops import add_numbers

def main():
    print("=== Team CLI Calculator ===")
    try:
        num1 = float(input("Enter first number: ")) 
        
        #so rusty on python I forgot "input" allows the user to put the numbers in - Tyler. 
        num2 = float(input("Enter second number: "))

        result = add_numbers(num1, num2)

        print(f"\nResult:")
        print(f"The sum is: {result}")
    except ValueError:
        print("Error: Please enter valid numbers.")

if __name__ == "__main__":
    main()
