import re

class Phone(object):
    def __init__(self, phone_number):
        match = re.match(r'^(?:\+?1{1})?\D*(\d{3})\D*(\d{3})\D*(\d{4})\D*$', phone_number)
        if match:
            g = match.groups()
            if g[0][0] == "0" or g[0][0] == "1" or g[1][0] == "0" or g[1][0] == "1":
                raise ValueError("wrong area code or exchange code")
            self.groups = g
            self.area_code = g[0]
            self.number = "".join(g)
        else:
            raise ValueError("wrong format")

    def pretty(self):
        return f"({self.groups[0]}) {self.groups[1]}-{self.groups[2]}"
