## IAN BARNETT'S SCRIPT ##
#Preprocessing for survey data from EMA - GRMPY

## LOAD LIBRARIES ####
library(plyr) #load packge --> Tools for Splitting, Applying and Combining Data
library(readr)#load packge --> reads rectangular data; we need it to read the csv data

## ORGANIZE DATA ####
#Set working directory

#setwd("C:/Users/Alina/Desktop/UPENN/EMA-sleep/Statistik/data_for_alina") #dont use

#Set data_filepath, patient_name, output_filepath
project_path="C:/Users/Alina/Desktop/UPENN/EMA-sleep/Statistik" #Path is assigned / defined to the name project_path;this declaration of the path makes it universally usable, because only "Alina" has to be changed
data_filepath<-file.path(project_path,"TEST/data") #The section of the path (TEST/data) is added to path project_path by the function file.path which constructs the path to a file; the entire path is defined as data_filepath; this is where all data for the analysis can be found
output_filepath<-file.path(project_path,"TEST/output") #This is the same function as data_filepath, with the difference that this time the path for the outputs is defined and added; the entire path is defined as output_filepath. All outputs can be found here at the end of the analysis.


patient_name<-"1bbcybpt" # The letter sequence is assigned to / defined as patient_name; in this case, we only have one subject


#Ian script
  survey_data = list() #survey_data is declared as a list; it is still empty at this point.
  surveys_data_filepath = paste(data_filepath, patient_name, "survey_answers",sep="/") # data_filepath, patient_name and surver_ansers are joined together, each separated with / and defined as surveys_data_filepath; ie. in the path surceys_data_filepath the single answers can be found 
    survey_names = list.files(surveys_data_filepath) #all survey_answers found in the surveys_data_filepath are listed and defined as survey_names
    
    for(survey_name in survey_names){ #For loop: for each survey_name in survey_names (in our case, both include the same number 1) the following commands apply, which are performed one after the other for all survey_name
      surveys_filepath = paste(surveys_data_filepath,survey_name,sep="/") #join surveys_data_filepath and survey_name and separate them with /; define it as surveys_filepath.
      specific_surveys = list.files(surveys_filepath) #specific survey names (each survey_name) should be listed one after the other and defined as specific_surveys;  
      
      for(specific_survey in specific_surveys){ #for each specific_survey in all specific_surveys the following loop applies; i.e. for each individual date plus specific time the following loop applies (each individual date plus specific time (specific_survey) in the entire overview at individual specific_survey (specific_surveys)the loop applies)
        specific_survey_filepath = paste(surveys_filepath,specific_survey,sep="/") # surveys_filepath and specific_survey are joined to one path each separated with / and defined as specific_survey_filepath
                specific_survey_data=read.csv2(specific_survey_filepath,header=T,sep=",") # read the csv file which has a header in the first colum and wich includes the specific_survey_filepath within every information is seperated with a comma; this output is defined as specific_survey_data
                #header=T --> Header is set to TRUE if and only if the first row contains one fewer field than the number of columns spalte; csv= comma-separated values
        
        if(nrow(specific_survey_data)>0){ #if the following condition is true, the if loop is run, otherwise skipped; the condition means that at least 1 specific data set must be present; i.e. it is a good way to understand whether data is available at all
          date = as.POSIXct(gsub("_",":",gsub(".csv","",specific_survey)),origin="1970-01-01") #origin: starting in Januray 1st 1970;
          # a Date-Time Conversion Functions is done usin as.POSIXct;  the whole thing is defined as date.
          # dont understand: "_",":"; does it mean that _ and : are matched and replaced; and I dont understand why it is done twice; I assume that the clamps are released from the inside out?  
          #gsub(".csv","",specific_survey): 
          timestamp = as.numeric(date) # date is a number and is defined as timestamp
          specific_survey_data[,"survey_id"]      = survey_name #survey_name (the name within the actual data specific_survey) is defined as specific_survey_data with the column name survey_id outcome document(?)
          specific_survey_data[,"patient_name"]   = patient_name #patient_name (the name within the actual data specific_survey) is defined as specific_survey_data with the column name patient_name outcome document (?)
          specific_survey_data[,"timestamp"]      = timestamp #timestamp (the name within the actual data specific_survey) is defined as specific_survey_data with the column name timestamp in outcome document (?)
          specific_survey_data[,"date"]           = as.Date(date) #as.Date(date)(the name within the actual data specific_survey) is defined as specific_survey_data with the column name date in outcome document (?)
          survey_data[[specific_survey_filepath]] = specific_survey_data #I think that we need [[ due to the reason that we are working with a list; specific_survey_data is defined as the specific_survey_filepath within the list which the if loop is currently running (?)  
         }
       }
     }
    survey_data = do.call(rbind, survey_data) #Executing the function call (do.call) to combine (rbind) the servey_data by rows into a matrix; an overview file with all collected information is created (?)
    rownames(survey_data) = seq(nrow(survey_data)) #sequences of the number of rows within the document survey_dat is defined as row names (survey_data)
    write.table(survey_data, file=paste(output_filepath,"Preprocessed_Data/Individual",patient_name,"survey_data.csv", 
                                        sep="/"),sep=",", col.names=T, row.names = F)
    }
}

        #dont get this line besides the fact that the table is conducted why the double sep?
        #conduct a table including survey_data which comprises a file in which the  output_filepath,"Preprocessed_Data/Individual",patient_name,"survey_data.csv" is joined and separated with /
        #sep="," = separated through columns?
        #do we have col.names=T, row.names = F due to the fact that we didn't define names for the rows but for the columns? 

