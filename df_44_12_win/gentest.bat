cd df_44_12_win

ECHO Test = gentest, %1 >> Test_Results.txt
TimeMem-1.0.exe Dwarf_Fortress.exe -gen 101 3498 %1 >> Test_Results.txt

cd data/save/
rmdir /S /Q region101
cd ../../../






