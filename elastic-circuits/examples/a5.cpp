//------------------------------------------------------------------------
// My customized example
//------------------------------------------------------------------------

int a_2(int a, int b)
{
	int sum = 0;
	if(a < b) {
		sum = b * 2;
	} else {
		if(a > b)
			sum = a * 4;

		else
			sum = sum * 3;
	}

	return sum;
}