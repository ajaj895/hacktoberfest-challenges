      *This is a learning reference for Cobol for the --
      *CSA-Hacktoberfest-Challenges 2020
      *Written by Evan Colwell
      *September 23, 2020
      *
      *GnuCOBOL or Open-Cobol is needed to compile this program on
      *linux. That's what I have done, using the following command to
      *compile: 
      *
      * cobc -x evancolwell.cbl
      *
      *Note: The asterisk is a comment in Cobol, it is ignored.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVANCOLWELL.
       AUTHOR. EVANCOLWELL.
      *Cobol is divided into 4 "Divisions" of the code. Similar to how
      *classes and methods work in java, specifically the static void
      *main() to very much simlify it.
      *The IDENTIFICATION DIVISION is the only required division,
      *everything below it, until the next division is stated, is a part
      *of the IDENTIFICATION DIVISION. 
      *
      *The four divisions include:
      * - IDENTIFICATION DIVISION. --For giving the program information
      *about itself like it's name and the author.
      * - DATA DIVISION. --This is your area to store data such as local
      * and global variables, along with initializing them with values.
      * - PROCEDURE DIVISION. --This is the area where you actually have
      * your program and it's operations and code that does the
      * computation or "procedures."
      * - ENVIRONMENT DIVISION. --This is where you designate input and
      * outfiles and where they are.
      *
      *One last note: Treat each line and division as sentences, with
      *periods at the end of the line and with select division key words
      *(look at the IDENTIFICATION DIVISION. above for my example for
      *the select key words)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Individual variables
       01 WS-HELLO PIC A(5) VALUE 'Hello'.
       01 WS-WORLD PIC A(5) VALUE 'world'.
      *Group variables
       01 HELLO-WORLD-GROUP.
           02 HELLO PIC A(5) VALUE 'Hello'.
           02 SEP PIC A(1) VALUE ' '.
           02 WORLD PIC A(6) VALUE 'world!'.
      *The data division is where you store data variables. This is an
      *optional division that is not needed.
      *The DATA DIVISION. has three sections that can be used:
      * - FILE SELECTION. --describes the data from files that the
      * program is going to get. This section also describes where in
      * the file to look and what for.
      * - WORKING-STORAGE SECTION. --This section is where you would
      * define and store regular and general variables.
      * - LINKAGE SECTION. --This is the area where the data that is
      * available to other programs is declared. Personally, I don't
      * fully know how this section works.
      *
      * Explaining the code above. The number determines what "level"
      * the variable is in. O1 denotes either individual variables or
      * group. Any variable that is in a group is usually related to the
      * group or to the parent variable. Next comes the name of the
      * variable, it doesn't have to be in all caps but it's easier that
      * way. PIC is always needed for defining a variable. The A lets
      * cobol know it's going to be a string or a collection of
      * characters. The number allocates the number of bytes or
      * characters that will be in the string. VALUE lets cobol know
      * that what comes next is what you want the value to be. Then the
      * stuff inside the quotes is what will be stored in the variable.
      * If the string in the quotes is longer than the allocated
      * memory, then the string will be cut off as soon as the n'th
      * character is saved.
       PROCEDURE DIVISION.
           DISPLAY 'Hello world!'.
      * The code above is just a basic print function ^
           DISPLAY WS-HELLO" "WS-WORLD"!".
      * The code above prints out using the stored individual variables
           DISPLAY HELLO-WORLD-GROUP.
      * The code above prints out every child of the group
           STOP RUN.           
      * The code above tells the PROCEDURE DIVISION. to stop running,
      * this is necessary.
