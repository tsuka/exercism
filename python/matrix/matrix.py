class Matrix(object):
    def __init__(self, matrix_string):
        self.matrix = [[int(elem) for elem in row.split(" ")] for row in matrix_string.split("\n")]
        self.transposed = list(zip(*self.matrix))

    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        return list(self.transposed[index-1])
