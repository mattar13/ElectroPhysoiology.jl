using Revise
using ElectroPhysiology
using DataFrame
#%% Add the ability to extract csv files from the data

#open test data
test_data = "test/to_analyze.abf"
data = readABF(test_data)
data.data_array

for ch in eachchannel(data)
     println(ch.chNames)
end

#%% 
paths = "C:\\Users\\mtarc\\OneDrive - The University of Akron\\Data\\ERG\\Retinoschisis\\2022_04_21_a13MelCreAdult\\Mouse2_Adult_WT\\BaCl_LAP4\\Rods" |> parseABF
data_WT30A = readABF(paths) |> truncate_data
baseline_adjust(data_WT30A)

data |> typeof |> fieldnames

#%% Section 1, Opening Matlab IRIS files
PhysiologyAnalysis.__init__()
using DataFrames, Query, XLSX
using MAT
file = raw"C:\Users\mtarc\OneDrive - The University of Akron\Data\MAT files\2022-Feb-26_RBC_SPR.mat"
data = matopen(file)
vars = matread(file)

#%% Section 2, Saving ABF files

#%% Saving a section of the data to a CSV file


#%% Saving a file as a .abf
file_open = raw"C:\Users\mtarc\The University of Akron\Renna Lab - General\Data\ERG\Paul\Cones\2019_07_23_WT_P14_m1\Cones\Drugs\Green\nd0.5_1p_1ms\19723190.abf"
file_save = raw"C:\Users\mtarc\The University of Akron\Renna Lab - General\Data\ERG\Paul\Cones\2019_07_23_WT_P14_m1\Cones\Drugs\Green\nd0.5_1p_1ms\test.abf"
data = readABF(file_open, channels=-1) #This is necessary for saving
saveABF(data, file_save)