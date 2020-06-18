1. LOAD packages
	(read xls, time handling, filter)
2. DEFINE input and output paths
	(input: path to data)
	(output: path to save the aggregated surveys)
3. CREATE/GET patient cohort
	(cohort: get a list of folder names in `input`)
4. INITIALIZE a dataframe to store surveys
5. LOOP through patient cohort  (n)
	5a. LOOP through each survey folder (s)
		5a1. LOOP through each specific survey (q)
			5a1a. READ-IN a specific survey
				5a1a1. IF this survey is NOT empty
					5a1b. SUBSET a specific row/question (m)
					5a1c. ADD a column with date/time
					5a1d. APPEND a modified specific survey (5a1c) to dataframe in (4)
					NEXT
6. SAVE dataframe (4) to the disk
