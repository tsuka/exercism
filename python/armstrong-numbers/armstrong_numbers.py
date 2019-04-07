def is_armstrong(number):
    num_str = str(number)
    num_of_digits = len(num_str)
    result = 0
    for s in num_str:
        result += int(s) ** num_of_digits
    return result == number
