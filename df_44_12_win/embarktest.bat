cd df_44_12_win

ECHO Test = embarktest, %1 >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe +load-save %1 >> Test_Results.txt

cd ../






