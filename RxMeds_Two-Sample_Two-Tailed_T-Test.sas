DATA BeforeY2KvsAfterY2K;
INPUT RxMeds Year $;
DATALINES;
3 B
20 B
2 B
15 B
46 B
27 B
90 B
57 B
72 B
20 B
14 B
39 B
281 B
54 B
105 B
54 B
73 B
245 B
44 B
159 B
119 B
126 B
1181 B
210 B
261 B
198 B
206 B
797 B
159 B
217 B
235 B
340 B
2349 B
218 B
538 B
696 B
1096 B
2805 B
940 B
1253 B
970 B
1252 B
5695 B
1353 B
1877 B
2429 B
6590 B
8913 B
3279 B
3661 B
5444 B
8508 B
29009 A
8384 A
9907 A
8813 A
23876 A
28957 A
16569 A
17938 A
24084 A
33595 A
55212 A
44176 A
64637 A
83397 A
152425 A
223394 A
;
/* Before (1940-1999) Y2K = B, After (2000-2015) Y2K = A, RxMeds = New RxMeds #s per Year */

PROC PRINT;
RUN;

/* F-test for polled variance */
/* Null: pooled variance */
/* Alt: non-pooled variance */

/* two sample t-test */
/* Null: mean New RxMeds Purchases Per Year 1940-1999 = mean New RxMeds Purchases Per Year 2000-2015 */
/* Alt: mean New RxMeds Purchases Per Year 1940-1999 != mean New RxMeds Purchases Per Year 2000-2015 */

PROC TTEST data=BeforeY2KvsAfterY2K H0=0 SIDES=2;
	CLASS Year;
	VAR RxMeds;
RUN;

