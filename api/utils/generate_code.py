import string
import random


def generate_code(length=7):
    """
    Generate a random code of fixed length.
    """
    letters = string.ascii_letters + string.digits
    return ''.join(random.choice(letters) for _ in range(length))