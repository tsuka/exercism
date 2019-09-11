def is_armstrong(number):
    n = number
    digits = []
    while n > 0:
        digits.append(n % 10)
        n //= 10
    num_of_digits = len(digits)

    result = sum(i ** num_of_digits for i in digits)
    return result == number
