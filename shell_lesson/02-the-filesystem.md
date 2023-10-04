---
title: Navigating Files and Directories
code-copy: true
---

::: {.callout-note appearance="minimal"}

**Objectives**

- Use a single command to navigate multiple steps in your directory structure, including moving backwards (one level up).
- Perform operations on files in directories outside your working directory.
- Work with hidden directories and hidden files.
- Interconvert between absolute and relative paths.
- Employ navigational shortcuts to move around your file system.

**Questions to be answered in this lesson**

- How can I perform operations on files outside of my working directory?
- What are some navigational shortcuts I can use to make my work more efficient?
:::

## Moving around the file system

We've learned how to use `pwd` to find our current location within our file system. We've also learned how to use `cd` to change locations and `ls` to list the contents of a directory. Now we're going to learn some additional commands for moving around within our file system.

Use the commands we've learned so far to navigate to the `shell_data/untrimmed_fastq` directory, if you're not already there.

```bash
$ cd
$ cd Desktop
$ cd unix_lesson
$ cd shell_data
$ cd untrimmed_fastq
```

What if we want to move back up and out of this directory and to our top level directory? Can we type `cd shell_data`? Try it and see what happens.

Command:
```bash
$ cd shell_data
```
Output:
*Note: This is an example*
```output
$ cd cd: shell_data: No such file or directory
```
 
Your computer looked for a directory or file called `shell_data` within the directory you were already in. It didn't know you wanted to look at a directory level above the one you were located in.

We have a special command to tell the computer to move us back or up one directory level.

```bash
$ cd ..
```

Now we can use `pwd` to make sure that we are in the directory we intended to navigate to, and `ls` to check that the contents of the directory are correct.

Command:
```bash
$ pwd
```

Command:
```bash
$ ls
```
Output:
```output
sra_metadata  untrimmed_fastq
```

From this output, we can see that `..` did indeed take us back one level in our file system.

Command:
```bash
$ ls ../../
```
## Exercise

**Finding hidden directories**

First navigate to the `shell_data` directory. There is a hidden directory within this directory. Explore the options for `ls` to find out how to see hidden directories. List the contents of the directory and identify the name of the text file in that directory.

Hint: hidden files and folders in Unix start with `.`, for example `.my_hidden_directory`

First use the `--help` command to look at the options for `ls`.

```bash
$ --help ls
```

::: {.callout-tip collapse="true"}
## Solution

The `-a` option is short for `all` and says that it causes `ls` to "not ignore entries starting with ." 
This is the option we want.

Command:
```bash
$ ls -a
```
Output:
```output
.  ..  .hidden	sra_metadata  untrimmed_fastq
```
:::

The name of the hidden directory is `.hidden`. We can navigate to that directory using `cd`.

```bash
$ cd .hidden
```

And then list the contents of the directory using `ls`.

Command:
```bash
$ ls
```
Output:
```output
youfoundit.txt
```

The name of the text file is `youfoundit.txt`. 

In most commands the flags can be combined together in no particular order to obtain the desired results/output.
```
$ ls -Fa
$ ls -laF
``` 

## Examining the contents of other directories

By default, the `ls` commands lists the contents of the working directory (i.e. the directory you are in). You can always find the directory you are in using the `pwd` command. However, you can also give `ls` the names of other directories to view Navigate to your home directory if you are not already there.

```bash
$ cd
```

Then enter the command:
```bash
$ ls shell_data
```
Output:
```output
sra_metadata  untrimmed_fastq
```

This will list the contents of the `shell_data` directory without you needing to navigate there.
The `cd` command works in a similar way.

Try entering:

```bash
$ cd
$ cd shell_data/untrimmed_fastq
```

This will take you to the `untrimmed_fastq` directory without having to go through the intermediate directory.

## Exercice

**Navigating practice**

Navigate to your home directory. From there, list the contents of the `untrimmed_fastq` directory.

::: {.callout-tip collapse="true"}
## Solution
Command:
```bash
$ cd
$ ls shell_data/untrimmed_fastq/
```
Output:
```output
SRR097977.fastq  SRR098026.fastq 
```
:::

## Full vs. Relative Paths

The `cd` command takes an argument which is a directory name. Directories can be specified using either a *relative* path or a full *absolute* path. The directories on the computer are arranged into a hierarchy. 

The full path tells you where a directory is in that hierarchy. 

Navigate to the home directory, then enter the `pwd` command.

Command:
```bash
$ cd ~
$ pwd  
```
Output:
*Note: This is an example*
```output
$ /usr/home/⟨username⟩
```

This command will display the full name of your home directory. The very top of the hierarchy is a directory called `/` which is usually referred to as the *root directory* .

Now lets navigate directly to the `.hidden` folder using the full path. 

```bash
$ cd /usr/home/⟨username⟩/Desktop/unix_lesson/shell_data/.hidden
```

This jumps forward multiple levels to the `.hidden` directory. Now go back to the home directory.

```bash
$ cd 
```
You can also navigate to the `.hidden` directory using:

```bash
$ cd Desktop/unix_lesson/shell_data/.hidden
```

These two commands have the same effect, they both take us to the `.hidden` directory. The first uses the absolute path, giving the full address from the home directory. The second uses a relative path, giving only the address from the working directory. A full path always starts with a `/`. A relative path does not.

A relative path is like getting directions from someone on the street. They tell you to "go right at the stop sign, and then turn left on Main Street". That works great if you're standing there together, but not so well if you're trying to tell someone how to get there from another country. A full path is like GPS coordinates. It tells you exactly where something is no matter where you are right now.

You can usually use either a full path or a relative path depending on what is most convenient. If we are in the home directory, it is more convenient to enter the full path. If we are in the working directory, it is more convenient to enter the relative path since it involves less typing.

Over time, it will become easier for you to keep a mental note of the structure of the directories that you are using and how to quickly navigate amongst them.

## Navigational Shortcuts

The root directory is the highest level directory in your file system and contains files that are important for your computer to perform its daily work. While you will be using the root (`/`) at the beginning of your absolute paths, it is important that you avoid working with data in these higher-level directories, as your commands can permanently alter files that the operating system needs to function. Dealing with the `home` directory is very common. The tilde character, `~`, is a shortcut for your home directory.

Now Navigate to the `shell_data` directory:

```bash
$ cd ..
```
Then enter the command:

```bash
$ ls ~
```

This prints the contents of your home directory, without you needing to type the full path.

The commands `cd`, and `cd ~` are very useful for quickly navigating back to your home directory.  

**Lesson Keypoints**

- The `/`, `~`, and `..` characters represent important navigational shortcuts.
- Hidden files and directories start with `.` and can be viewed using `ls -a`.
- Relative paths specify a location starting from the current location, while absolute paths specify a location from the root of the file system.
