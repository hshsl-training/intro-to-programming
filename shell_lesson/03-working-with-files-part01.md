---
title: "Working with Files and Directories"
---

## Lesson Objectives

**Objectives**
- View, search within, copy, move, and rename files. Create new directories.
- Use wildcards (`*`) to perform operations on multiple files.
- Make a file read only.
- Use the `history` command to view and repeat recently used commands.
  

**Questions to be answered in this lesson**
- "How can I view and search file contents?"
- "How can I create, copy and delete files and directories?"
- "How can I control who has permission to modify a file?"
- "How can I repeat recently used commands?"


## Working with Files

### Our data set: FASTQ files

Now that we know how to navigate around our directory structure, let's
start working with our sequencing files. We did a sequencing experiment and 
have two results files, which are stored in our `untrimmed_fastq` directory. 

### Wildcards

Navigate to your `untrimmed_fastq` directory:

~~~
$ cd Desktop/CLI_Class_Directory/shell_data/untrimmed_fastq
~~~
{: .bash}

We are interested in looking at the FASTQ files in this directory. We can list
all files with the .fastq extension using the command:

~~~
$ ls *.fastq
~~~
{: .bash}

~~~
SRR097977.fastq  SRR098026.fastq
~~~
{: .output}

The `*` character is a special type of character called a wildcard, which can be used to represent any number of any type of character. 
Thus, `*.fastq` matches every file that ends with `.fastq`. 

This command: 

~~~
$ ls *977.fastq
~~~
{: .bash}

~~~
SRR097977.fastq
~~~
{: .output}

lists only the file that ends with `977.fastq`.

This command:

~~~
$ ls ~/Desktop/CLI_Class_Directory/notes/*.txt
~~~
{: .bash}

~~~
/Users/jpcourneya/Desktop/CLI_Class_Directory/notes/commandline_is_cool.txt	
/Users/jpcourneya/Desktop/CLI_Class_Directory/notes/lab_notes.txt
/Users/jpcourneya/Desktop/CLI_Class_Directory/notes/intro_commandline.txt
~~~
{: .output}

Lists every file in `~/Desktop/CLI_Class_Directory/notes` that ends in the characters `.txt`.
Note that the output displays __full__ paths to files, since
each result starts with `/`.

## Exercise
Do each of the following tasks from your current directory using a single `ls` command for each:

1.  List all of the files in `~/Desktop` that start with the letter 'c'.
2.  List all of the files in `~/Desktop` that contain the letter 'a'. 
3.  List all of the files in `~/Desktop` that end with the letter 'o'.

Bonus: List all of the files in `~/Desktop` that contain the letter 'a' or the letter 'c'.
 
Hint: The bonus question requires a Unix wildcard that we haven't talked about yet. Try searching the internet for information about Unix wildcards to find what you need to solve the bonus problem.

**Solution**
1. `ls ~/Desktop/c*`
2. `ls ~/Desktop/*a*`
3. `ls ~/Desktop/*o`  
Bonus: `ls ~/Desktop/*[ac]*`


## Exercise
`echo` is a built-in shell command that writes its arguments, like a line of text to standard output. 

The `echo` command can also be used with pattern matching characters, such as wildcard characters. 

Here we will use the `echo` command to see how the wildcard character is interpreted by the shell.
 
 ~~~
 $ echo *.fastq
 ~~~
 {: .bash}
 
 ~~~
 SRR097977.fastq SRR098026.fastq
 ~~~
 {: .output}
 
The `*` is expanded to include any file that ends with `.fastq`. We can see that the output of
`echo *.fastq` is the same as that of `ls *.fastq`.
 
What would the output look like if the wildcard could *not* be matched? Compare the outputs of `echo *.missing` and `ls *.missing`.

**Solution**
~~~
$ echo *.missing
~~~
{: .bash}
 
~~~
*.missing
~~~
{: .output}
 
~~~
$ ls *.missing
~~~
{: .bash}
 
~~~
ls: cannot access '*.missing': No such file or directory
~~~
{: .output}
 
{: .solution}
{: .challenge}

## Command History

If you want to repeat a command that you've run recently, you can access previous commands using the up arrow on your keyboard to go back to the most recent command. Likewise, the down arrow takes you forward in the command history.

A few more useful shortcuts: 

- <kbd>Ctrl</kbd>+<kbd>C</kbd> will cancel the command you are writing, and give you a fresh prompt.
- <kbd>Ctrl</kbd>+<kbd>R</kbd> will do a reverse-search through your command history. This is very useful.
- <kbd>Ctrl</kbd>+<kbd>L</kbd> or the `clear` command will clear your screen.

You can also review your recent commands with the `history` command, by entering:

~~~
$ history
~~~
{: .bash}

to see a numbered list of recent commands. You can reuse one of these commands directly by referring to the number of that command.

For example, if your history looked like this:

~~~
259  ls *
260  ls ~/Desktop/CLI_Class_Directory/notes/*.txt
261  ls *R1*fastq
~~~
{: .output}

then you could repeat command #260 by entering:

~~~
$ !260
~~~
{: .bash}

Type `!` (exclamation point) and then the number of the command from your history.
You will be glad you learned this when you need to re-run very complicated commands.
For more information on advanced usage of `history`, read section 9.3 of
[Bash manual](https://www.gnu.org/software/bash/manual/html_node/index.html).

## Exercise
Find the line number in your history for the command that listed all the .txt files in `~/Desktop`. Rerun that command.

**Solution**

First type `history`. Then use `!` followed by the line number to rerun that command.


## Examining Files

We now know how to switch directories, run programs, and look at the contents of directories, but how do we look at the contents of files?

One way to examine a file is to print out all of the contents using the program `cat`. 

Enter the following command from within the `untrimmed_fastq` directory: 

~~~
$ cat SRR098026.fastq
~~~
{: .bash}

This will print out all of the contents of the `SRR098026.fastq` to the screen.

## Exercise

1. Print out the contents of the `~/Desktop/CLI_Class_Directory/shell_data/untrimmed_fastq/SRR097977.fastq` file. What is the last line of the file? 
2.  From your home directory, and without changing directories, use one short command to print the contents of all of the files in the `~/Desktop/CLI_Class_Directory/shell_data/untrimmed_fastq` directory.

**Solution**
1. The last line of the file is `C:CCC::CCCCCCCC<8?6A:C28C<608'&&&,'$`.
2. `cat ~/shell_data/untrimmed_fastq/*`

`cat` is a terrific program, but when the file is really big, it can be annoying to use. The program, `less`, is useful for this case. `less` opens the file as read only, and lets you navigate through it. The navigation commands are identical to the `man` program.

Enter the following command:

~~~
$ less SRR097977.fastq
~~~
{: .bash}

Some navigation commands in `less`:

| key     | action |
| ------- | ---------- |
| <kbd>Space</kbd> | to go forward |
|  <kbd>b</kbd>    | to go backward |
|  <kbd>g</kbd>    | to go to the beginning |
|  <kbd>G</kbd>    | to go to the end |
|  <kbd>q</kbd>    | to quit |

`less` also gives you a way of searching through files. Use the "/" key to begin a search. Enter the word you would like to search for and press `enter`. The screen will jump to the next location where that word is found. 

**Shortcut:** If you hit "/" then "enter", `less` will  repeat the previous search. `less` searches from the current location and works its way forward. Scroll up a couple lines on your terminal to verify you are at the beginning of the file. Note, if you are at the end of the file and search for the sequence "CAA", `less` will not find it. You either need to go to the beginning of the file (by typing `g`) and search again using `/` or you can use `?` to search backwards in the same way you used `/` previously.

For instance, let's search forward for the sequence `TTTTT` in our file. You can see that we go right to that sequence, what it looks like, and where it is in the file. If you continue to type `/` and hit return, you will move forward to the next instance of this sequence motif. If you instead type `?` and hit  return, you will search backwards and move up the file to previous examples of this motif.

## Exercise

What are the next three nucleotides (characters) after the first instance of the sequence quoted above?

**Solution**
`CAC`


Remember, the `man` program actually uses `less` internally and therefore uses the same commands, so you can search documentation using "/" as well!

There's another way that we can look at files, and in this case, just look at part of them. This can be particularly useful if we just want to see the beginning or end of the file, or see how it's formatted.

The commands are `head` and `tail` and they let you look at the beginning and end of a file, respectively.

~~~
$ head SRR098026.fastq
~~~
{: .bash}

~~~
@SRR098026.1 HWUSI-EAS1599_1:2:1:0:968 length=35
NNNNNNNNNNNNNNNNCNNNNNNNNNNNNNNNNNN
+SRR098026.1 HWUSI-EAS1599_1:2:1:0:968 length=35
!!!!!!!!!!!!!!!!#!!!!!!!!!!!!!!!!!!
@SRR098026.2 HWUSI-EAS1599_1:2:1:0:312 length=35
NNNNNNNNNNNNNNNNANNNNNNNNNNNNNNNNNN
+SRR098026.2 HWUSI-EAS1599_1:2:1:0:312 length=35
!!!!!!!!!!!!!!!!#!!!!!!!!!!!!!!!!!!
@SRR098026.3 HWUSI-EAS1599_1:2:1:0:570 length=35
NNNNNNNNNNNNNNNNANNNNNNNNNNNNNNNNNN
~~~
{: .output}

~~~
$ tail SRR098026.fastq
~~~
{: .bash}

~~~
+SRR098026.247 HWUSI-EAS1599_1:2:1:2:1311 length=35
#!##!#################!!!!!!!######
@SRR098026.248 HWUSI-EAS1599_1:2:1:2:118 length=35
GNTGNGGTCATCATACGCGCCCNNNNNNNGGCATG
+SRR098026.248 HWUSI-EAS1599_1:2:1:2:118 length=35
B!;?!A=5922:##########!!!!!!!######
@SRR098026.249 HWUSI-EAS1599_1:2:1:2:1057 length=35
CNCTNTATGCGTACGGCAGTGANNNNNNNGGAGAT
+SRR098026.249 HWUSI-EAS1599_1:2:1:2:1057 length=35
A!@B!BBB@ABAB#########!!!!!!!######
~~~
{: .output}

The `-n` option to either of these commands can be used to print the
first or last `n` lines of a file. 

~~~
$ head -n 1 SRR098026.fastq
~~~
{: .bash}

~~~
@SRR098026.1 HWUSI-EAS1599_1:2:1:0:968 length=35
~~~
{: .output}

~~~
$ tail -n 1 SRR098026.fastq
~~~
{: .bash}

~~~
A!@B!BBB@ABAB#########!!!!!!!######
~~~
{: .output}

**Keypoints**

- You can view file contents using `less`, `cat`, `head` or `tail`.
- The commands `cp`, `mv`, and `mkdir` are useful for manipulating existing files and creating new directories.
- You can view file permissions using `ls -l` and change permissions using `chmod`.
- The `history` command and the up arrow on your keyboard can be used to repeat recently used commands.
