import random
import string

class Robot(object):
    used_names = []

    def __init__(self):
        self.name = self.new_name()

    def reset(self):
        self.name = self.new_name()

    def new_name(self):
        while True:
            new_name = "".join(random.choices(string.ascii_uppercase, k=2) + random.choices(string.digits, k=3))
            if not new_name in Robot.used_names:
                break
        Robot.used_names.append(new_name)
        return new_name
