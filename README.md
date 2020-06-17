# sleep-impulsivity-mood-project
1.	load packages that are needed for the calculations and to read excel sheets. Load the packages library(plyr), library(readr), library(tidyverse),                 library(readxl)

    a.	Since I don't know how to decide this, I used the two that were already integrated by Phill
    
    b.	I also included readxl, since the script needs to read and edit Excel tables, and I thought the package might be useful;                 Additionally I included tidyverse since both were recommended by other tutors. however, it could be that this is duplicated and         is already included in the two functions of Phill

2.	define the path where the project and all data can be found and saved; declare this path with the name "project_path”

3.	define the path where the individual data of the participants can be found and declare this path with the name "data_filepath”

4.	define the path where one can find the outputs of the following analysis and declare this path with the name "output_filepath”

5.	define the participant(s) that should to be included in the following analysis and define the individual ID as "patient_name”

6.	a document must be drawn up in which the output of all individual assessments collected per individual participant is summarized in one table. It is still empty at this time. It is named “survey_data”.

7.	the folder survey_answers contains the data that are to be included in the following analyses; it can be found in a subfolder under     each individual patient_name. The corresponding path is the one of data_filepath which is supplemented by the respective patient         name ("patient_name") and the subfolder "survey_answers".

8.	each Excel sheet has time and date listed as title and the participant ID is only contained in the name of the respective folder,       but not in the document itself as information. Both information must be added to the document.

    a.	If Excel-Sheets are contained in the folder "survey_answers" and the number of rows in the document is greater than zero, then           insert a new column with the name "date_time" into each Excel-Sheet, which contains the name of the respective Excel-Sheet for           each existing row in the document. Repeat this command until the new column is inserted in every existing document and then end         this process.
   
   b.	If Excel sheets are contained in the folder "survey_answers" and the number of rows in the document is greater than zero, insert         a new column called "participant_ID" in each Excel sheet. This column contains the name of the folder where the document is             stored for each existing row in the document. Repeat this command until the new column is inserted in every existing document           and then end this process.
    
9.	Since we are not interested in all questions, only those questions that are relevant for our calculation will be sorted out in the       following. Since I couldn't find a word, which only appears in our questions but not in the rest of the questions, I thought you         could just use the corresponding question ID.

    a.	If the Excel-Sheets in the folder "survey_answers" in the column "question_ID" is greater than zero, then scan the existing             question IDs and delete all rows that do not contain any of the following IDs: “cf18ad3d-5656-479f-a530-353849a8316c”,                   “fdc292c2-1046-4ffe-acbd-d3245c9bcaa9”, ….

10.	merge all existing excel-sheets into one excel-sheet named "survey_data", in which the information is stored one below the other in     the new document Store this document in the path "output_filepath" in the respective subfolder of the corresponding respondent.

11.	Merge all existing 41 excelsheets containing the aggregated information of each participant into a single document and save it under     the name "survey_data_all".
