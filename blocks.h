//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "~/dwmblocks/scripts/packages.sh",	1,		0},
	{"", "~/dwmblocks/scripts/battery.sh",  20,		0},
	{"", "~/dwmblocks/scripts/internet.sh", 1,		0},
	{"", "~/dwmblocks/scripts/volume.sh", 	1,		0},
	{"", "~/dwmblocks/scripts/memory.sh",	30,		0},
	{"", "~/dwmblocks/scripts/cpu.sh",		1,		0},
	{"", "~/dwmblocks/scripts/clock.sh",	60,		0}, 
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 3;
