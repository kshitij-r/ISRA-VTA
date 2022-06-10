void transpose(unsigned int wgt_mem[][COL], unsigned int wgt_mem_prime[][COL])
{
    int i, j;
    for (i = 0; i < COL; i++)
        for (j = 0; j < COL; j++)
            wgt_mem_prime[i][j] = wgt_mem[j][i];
}

unsigned int* matrixMultiply(unsigned int mat1[], unsigned int mat2[])
{
    // int res_index = 0;
    unsigned int res = 0;
    for(int i = 0; i < 3; i++)
    {
        res += mat1[i] * mat2[i];
    }
    result[res_index] = res;
    res_index++;
    return result;
}