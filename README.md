# Relative-RMSD
**Relative Root-mean-square deviation** (Relative-RMSD) is a measure of the
row-based overall differences between multi-row, multi-column values of Sample-A
and Sample-B values in multiply rows, same number of columns.
>   Run *findRelationshipByRMSD4.m*, using **data.xlsx** (two Excel sheets for
>   Sample-A and -B) as input and printing all Relative-RMSD results for rows
>   and the final result (ans =) to Command Window.
# RMSD-based fluctuating-portion searching in a curve
With the given **XY coordinate values** for a dotted line, plot the dots in a
Cartesian coordinate system and find the portion moving up and down around a
level by analyzing RMSD. The reference lines equally divide the y-axis to
subject the dots to *n* groups. For a group, the dotted segments with the two
ends in the middle of a presupposed threshold-line and the lower reference line
(Figure A) are further analyzed. The distances of the covered dots to the lower
reference line are calculated; the RMSD of the distance values is then
calculated. Compare all of the *n* RMSD values and find the smallest one (Figure
B). The dotted segment with the smallest such RMSD value is the desired
fluctuating portion. The more reference line numbers and a proper threshold
value are desired to attain an ideal result.

>   Run *testfindhorizontal.m* to calculate RMSDs and analysis with the
>   modifiable parameters using **data.xlsx sheet1** (column A for x, column B
>   for y) as input, outputting a dotted curve with blue reference lines
>   attached with RMSD values on the right, marking the reference line that the
>   smallest RMSD appears with red, and writing the coordinates of the target
>   dots to **data.xlsx sheet2**.
