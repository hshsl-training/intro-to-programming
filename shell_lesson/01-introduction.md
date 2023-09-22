---
title: Introducing the Shell
code-copy: true
---

::: {.callout-note}
All text and materials in these workshops comes from the Data Carpentries. More especifically this lesson follows the Data Carpentries lesson "[Introduction to the Command Line for Genomics](https://datacarpentry.org/shell-genomics/)". 

CDABS has modified this lesson to better fit our techonogical capabilities.
:::
 

## Lesson Objectives

**Objectives**

- Describe key reasons for learning shell.
- Navigate your file system using the command line.
- Access and read help files for `bash` programs and use help files to identify useful command options.
- Demonstrate the use of tab completion, and explain its advantages.

**Questions to be answered in this lesson**

- What is a command shell and why would I use one?
- How can I move around on my computer?
- How can I see what files and directories I have?
- How can I specify the location of a file or directory on my computer?



## What is a shell and why should I care?

A *shell* is a computer program that presents a command line interface which allows you to control your computer using commands entered with a keyboard instead of controlling graphical user interfaces (GUIs) with a mouse/keyboard/touchscreen combination.

There are many reasons to learn about the shell:

- Many bioinformatics tools can only be used through a command line interface. Many more have features and parameter options which are not available in the GUI. BLAST is an example. Many of the advanced functions are only accessible to users who know how to use a shell.

- The shell makes your work less boring. In bioinformatics you often need to repeat tasks with a large number of files. With the shell, you can automate those repetitive tasks and leave you free to do more exciting things.
  
- The shell makes your work less error-prone. When humans do the same thing a hundred different times (or even ten times), they're likely to make a mistake. Your computer can do the same thing a thousand times with no mistakes.

- The shell makes your work more reproducible. When you carry out your work in the command-line (rather than a GUI), your computer keeps a record of every step that you've carried out, which you can use to re-do your work when you need to. It also gives you a way to communicate unambiguously what you've done, so that others can inspect or apply your process to new data.

- Many bioinformatic tasks require large amounts of computing power and can't realistically be run on your own machine. These tasks are best performed using remote computers or cloud computing, which can only be accessed through a shell.

In this lesson you will learn how to use the command line interface to move around in your file system.



## How to access the shell

On a Mac or Linux machine, you can access a shell through a program called "Terminal", which is already available on your computer. The Terminal is a window into which we will type commands. 

If you're using Windows, you'll need to download a separate program to access the shell called "Git Bash" which is the one we are going to use today. 

We will learn the basics of the shell by manipulating some data files. Some of these files are very large, and would take time to download to your computer.



## The Git Bash Window

As you open your Terminal, you may see something like the following:

```bash
ComputerUserName-####ABC MINGW64 ~
$
```

The dollar sign is a **prompt**, which shows us that the shell is waiting for input; your shell may use a different character as a prompt and may add information before the prompt. When typing commands, either from these lessons or from other sources, do not type the prompt, only the commands that follow it.

This symbol may be different if you are using a Linux or Mac computer.


## The Data

The data used in this lesson is related to the bioinformatics field, you will be handling `fastq` files and performing searches on it. 

To get access to the data you must learn how to unzip a `tar.gz` file.

## Extracting data from `tar.gz` file

The tar command stands for tape archive, and it creates a collection of files that can be compressed or uncompressed. 

A `tar` file is a collection of files along with their metadata. This collection of files are only grouped and not compressed.

Meanwhile, `tar.gz` file means a collection of files that have been compressed to use less storage space in the computer. 

To uncompress the data files for this lesson you need to excecute the following command: 

```bash
tar -xvf shell_data.tar.gz
```

```output
file1.txt
file2.txt
```

Now that we have uncompressed all of our data files, how can we navigate to the shell_data folder and see its content?

## Navigating your file system

The part of the operating system that manages files and directories is called the **file system**. It organizes our data into files, which hold information, and directories (also called "folders"), which hold files or other directories.

Several commands are frequently used to create, inspect, rename, and delete files and directories.

Let's find out where we are by running a command called `pwd` (which stands for "print working directory").

At any moment, our **current working directory** is our current default directory,
i.e., the directory that the computer assumes we want to run commands in, unless we explicitly specify something else.


```bash
$ pwd
```

```output
TODO
```

Let's look at how our file system is organized. We can see what files and subdirectories are in this directory by running `ls`, which stands for "listing":

```bash
$ ls
```

```output
TODO
```

`ls` prints the names of the files and directories in the current directory in alphabetical order, arranged neatly into columns. We'll be working within the `shell_data` subdirectory, and creating new subdirectories, throughout this workshop.

The command to change locations in our file system is `cd`, followed by a directory name to change our working directory. `cd` stands for "change directory".

Let's say we want to navigate to the `shell_data` directory we saw above. We can use the following command to get there:

```bash
$ cd shell_data
```

Let's look at what is in this directory:

```bash
$ ls
```

```output
sra_metadata  untrimmed_fastq
```

We can make the `ls` output more comprehensible by using the **flag** `-F`,
which tells `ls` to add a trailing `/` to the names of directories:

```bash
$ ls -F
```

```output
sra_metadata/  untrimmed_fastq/
```

Anything with a "/" after it is a directory. Things with a "\*" after them are programs. If there are no decorations, it's a file. `ls` has lots of other options. 

To find out what they are, we can type:

```bash
$ ls -- help
```

`ls -- help` (short for manual) displays detailed documentation (also referred as man page or man file) for `bash` commands. It is a powerful resource to explore `bash` commands, understand their usage and flags. Some manual files are very long. You can scroll through the file using your keyboard's down arrow or use the <kbd>Space</kbd> key to go forward one page and the <kbd>b</kbd> key to go backwards one page. When you are done reading, hit <kbd>q</kbd> to quit.



## Exercise

Use the `-l` option for the `ls` command to display more information for each item
in the directory. What is one piece of additional information this long format
gives you that you don't see with the bare `ls` command?

```bash
$ ls -l
```

```output
total 8
drwxr-x--- 2 dcuser dcuser 4096 Jul 30  2015 sra_metadata
drwxr-xr-x 2 dcuser dcuser 4096 Nov 15  2017 untrimmed_fastq
```

The additional information given includes the name of the owner of the file,
when the file was last modified, and whether the current user has permission
to read and write to the file.

::: {.callout-note}

No one can possibly learn all of these arguments, that's what the manual page
is for. You can (and should) refer to the manual page or other help files
as needed.

:::

Let's go into the `untrimmed_fastq` directory and see what is in there.

```bash
$ cd untrimmed_fastq
$ ls -F
```

```output
SRR097977.fastq  SRR098026.fastq
```

This directory contains two files with `.fastq` extensions. FASTQ is a format for storing information about sequencing reads and their quality. We will be learning more about FASTQ files in a later lesson.



## Shortcut: Tab Completion

Typing out file or directory names can waste a lot of time and it's easy to make typing mistakes. Instead we can use tab complete as a shortcut. When you start typing out the name of a directory or file, then hit the <kbd>Tab</kbd> key, the shell will try to fill in the rest of the directory or file name.

Return to your home directory:

```bash
$ cd
```

then enter:

```bash
$ cd she<tab>
```

The shell will fill in the rest of the directory name for
`shell_data`.

Now change directories to `untrimmed_fastq` in `shell_data`

```bash
$ cd shell_data
$ cd untrimmed_fastq
```

Using tab complete can be very helpful. However, it will only autocomplete a file or directory name if you've typed enough characters to provide a unique identifier for the file or directory you are trying to access.

For example, if we now try to list the files which names start with `SR`
by using tab complete:

```bash
$ ls SR<tab>
```

The shell auto-completes your command to `SRR09`, because all file names in the directory begin with this prefix. When you hit <kbd>Tab</kbd> again, the shell will list the possible choices.

```bash
$ ls SRR09<tab><tab>
```

```output
SRR097977.fastq  SRR098026.fastq
```

Tab completion can also fill in the names of programs, which can be useful if you remember the beginning of a program name.

```bash
$ pw<tab><tab>
```

```output
pwck      pwconv    pwd       pwdx      pwunconv
```

Displays the name of every program that starts with `pw`.

## Summary

We now know how to move around our file system using the command line. This gives us an advantage over interacting with the file system through a GUI as it allows us to work on a remote server, carry out the same set of operations on a large number of files quickly, and opens up many opportunities for using bioinformatic software that is only available in command line versions.

In the next few episodes, we'll be expanding on these skills and seeing how using the command line shell enables us to make our workflow more efficient and reproducible.

**Lesson Keypoints**

- The shell gives you the ability to work more efficiently by using keyboard commands rather than a GUI.
- Useful commands for navigating your file system include: `ls`, `pwd`, and `cd`.
- Most commands take options (flags) which begin with a `-`.
- Tab completion can reduce errors from mistyping and make work more efficient in the shell.
