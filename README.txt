DF mark is a simple benchmark of dwarf fortress. 
It has two tests: world generation and a year-long run of a dwarf fortress embark.
The metric being measured is time to completion of the two tests, with shorter being better.

For accurate results, do not tamper with the dwarf fortress window that the script creates,
as pausing-resuming, or otherwise interacting with the game can distort results.
Never resize the dwarf fortress window and always make sure the dwarf fortress window is topmost to prevent skewing the graphical fps, which can affect results.
It's also best if you do not run anything else while running the benchmark, especially resource intensive programs.

It is suggested to run each test multiple times and take the average, to eliminate run-time variance, and to disregard the results from the first run.

Run_Tests:
	This script is where you run your tests from. The syntax for calling tests is CALL :testname PARAMETER

	By default it calls gentest eight times and embarktest four times each.

	Run_Tests writes to a log file called Test_Results.txt
	Each test results writes a log in this format:

		Test = TESTNAME, PARAMETERNAME, Run #
		Exit code	: XXXXXXXX
		Elapsed time	: XXXX.XX
		Kernel time	: XXXX.XX (XX%)
		User time	: XXXX.XX (XX%)
		page fault #    : XXXXXX
		Working set     : XXXX KB
		Paged pool      : XXXX KB
		Non-paged pool  : XXXX KB
		Page file size  : XXXX KB

	Elapsed time is the time it takes to complete the test in seconds.
TESTS:
	gentest
		CALL: ./gentest PARAMETERNAME
		A world gen test - generates world with selected advanced world generation parameters.
 
		With the default Run_Tests script, it runs:
		TESTSMALLGEN, a 65 x 65 world gen with a history of 250 years.
		TESTSMALLGEN, a 65 x 65 world gen with a history of 250 years.

		If you want to load custom parameters, create them in dwarf fortress or edit worldgen.txt,
		then call them with CALL :gentest YOURPARAMETERNAME
	
		NOTE: Dwarf Fortress generates slightly different worlds on Windows and Linux, so be careful when comparing between platforms.
	embarktest
		CALL: ./embarktest WORLDNAME
		A fort mode test - runs embark for the amount of time set in onMapLoad.init, by default one year.
		
		With the default Run_Tests script, it runs:
		a 3 x 3 one year old embark with parameters = TESTSMALLEMBARK, 19 dwarves, only a few tunnels, and few items. NOTE: SMALLEMBARK has produced unreliable results.
		a 6 x 6 three year old embark with parameters = TESTBIGEMBARK, over 100 dwarves, large stockpiles with many items.

		If you want to test your own fortresses, put them in the save folder and call them with CALL embarktest YOURWORLDNAME
		Your world has to have an active fortress embark to load

		NOTE: Make sure your fortress can take care of itself for the alloted time without too much !FUN!,
		or the benchmark will stall at the game-over screen. (Because of this invaders is turned off in init.txt).

		NOTE: The dfhack hermit script is loaded to prevent the outpost liaison from coming, which will pause the game and stall the benchmark.   
