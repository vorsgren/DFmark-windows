cd df_44_12_win

ECHO DFmark > Test_Results.txt

CALL :gentest TESTBIGGEN

CALL :gentest TESTSMALLGEN

CALL :embarktest TESTBIGEMBARK

REM CALL :embarktest TESTSMALLEMBARK

move Test_Results.txt ..
cd ../

EXIT

:gentest
ECHO. >> Test_Results.txt
ECHO Test = gentest, %1, First Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe -gen 101 3498 %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = gentest, %1, Second Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe -gen 102 3498 %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = gentest, %1, Third Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe -gen 103 3498 %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = gentest, %1, Fourth Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe -gen 104 3498 %1 >> Test_Results.txt
cd data/save/
rmdir /S /Q region101, region102, region103, region104
cd ../../
EXIT /B 0

:embarktest
ECHO. >> Test_Results.txt
ECHO Test = embarktest, %1, First Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe +load-save %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = embarktest, %1, Second Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe +load-save %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = embarktest, %1, Third Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe +load-save %1 >> Test_Results.txt
ECHO. >> Test_Results.txt
ECHO Test = embarktest, %1, Fourth Run >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe +load-save %1 >> Test_Results.txt
EXIT /B 0



