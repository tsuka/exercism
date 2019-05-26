class Matrix(object):
    def __init__(self, matrix_string):
        matrix = []
        for row in matrix_string.split("\n"):
            cur_row = []
            for elem in row.split(" "):
                cur_row.append(int(elem))
            matrix.append(cur_row)
        self.matrix = matrix


    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        col = []
        for i in range(0, len(self.matrix)):
            col.append(self.matrix[i][index-1])
        return col
