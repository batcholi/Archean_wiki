# XenonCode IDE
The **XenonCode IDE** is an interface that allows you to create/edit scripts and programs to control components and systems. It is based on the **XenonCode** programming language, which has been written especially for this game.

## Features
- **Text Editor**: A text editor with syntax highlighting for writing scripts/programs.
- **Node Editor**: An alternative programming system based on visual nodes for creating scripts in a visual and intuitive way.
- **Console**: A console for displaying information, debugging and error messages.
- **Toolbar**: A toolbar for creating/deleting scripts/programs, restarting the system, and accessing the documentation available on the [Archean](archean.md) page.

---
## Using the IDE on computers
The `CODE` button on computers allows access to the IDE. From there, you can start writing scripts and programs to control components and systems.

### IDE Library
The IDE includes a Library feature that allows you to locally save and reuse XenonCode files across different computers. This is useful for sharing common functions, utility scripts, or templates between multiple in-game computers without having to copy-paste code manually.

### Additional information specific to computers
#### [Computer](../components/computers/Computer.md)
The computer has an integrated touch screen and a UI BIOS that displays system information and available programs on the hard drive at startup. You can select a program to execute by aiming at it and pressing the `F` key.

#### [Mini Computer](../components/computers/MiniComputer.md)
The MiniComputer is smaller than the Computer and does not have a touch screen or a visual BIOS. It will natively execute the first program created on the hard drive.

## Interface
The XenonCode IDE's interface works a lot like a normal IDE that programmers use, except that instead of having a file hierarchy, all the files in that virtual computer's HDD will always be opened as Tabs.  
Tabs can be moved around and docker in and out of the IDE, put side-to-side, top-down, etc.  
You may have multiple IDEs (meaning from multiple in-game computers) open at the same time in the game, althought they cannot be docker/snapped together.  

## Creating a custom BIOS
It is possible to customize the computer's BIOS by creating a file named `main.xc`. This file is the first to be executed when a computer starts up. You can use it to modify the appearance of the BIOS or to automatically load a program or directly execute any type of code.

## Programs vs Files
A Program is a file that can be loaded using `load_program()`, and its name will end in `*.main.xc` (you don't have to add that in the name, just write the prefix).  
A File is to be included within a program, cannot be loaded as a standalone program, but can be a custom bios when named exactly `main.xc` without any prefix.  
Programs can be written with either the Node system or pure Code, whereas normal files can only be written in pure Code.  
Programs may `include()` files or other programs, as long as there's no naming conflict in their contents, and only one `init` entry point is defined.  

## Switching between modes (visual nodes / code)
When you create a program, it will start with the Visual Nodes mode and a few initial IO nodes as an example which you may delete.  
The Visual Nodes system will always automatically generate code in the background as you make modifications.  
You may "Switch To Code" at any time, however it won't be editable right away.  
To make it editable, you can "Convert to Code", which will simply comment out the first #NODES line that defines the nodes, and you will be able to edit the code.  
After editing in code, if you want to switch back to nodes, your code will be overridden by the nodes that you had before you initially switched to code.  
This means that typically, when converting to code, it's permanent, unless you want to revert it back to how it was.  

## Running the code
The in-game computers will always auto-reboot whenever a change has been saved in the current file (CTRL+S).  
Saving without making any change won't do anything, but you can force it to reboot using CTRL+SHIFT+S, which will also force-save ALL open files.  
Upon rebooting after saving a change, the computer will immediately load the previous program if there was one runnin, without going through the BIOS.  
If an error occured, either from a syntax error or a runtime error (like a division by zero or bad indexing), the computer will freeze and blank the screen, and the error will appear in the console. At this point, you will need to fix the issue and reboot it by saving the changed file.  

## Persistency
In-game computers all run on the server-side, and they will keep running when you log out, if you're playing on a dedicated server.  
Files are saved on the server's HDD in plain text, including a temporary file for unsaved changes, which is updated at every single change, so you won't lose your code.  
Even if you had not saved your file, if your game crashes, whether you're playing solo or remotely, you will recover it when you log back in.  
If you prefer using an IDE external to the game, like vscode, you can also edit the files directly on the server, if you're hosting it yourself or playing solo.  
The virtual HDDs are stored in `Archean-data/server/worlds/<WORLD_NAME>/ARCHEAN_computer/HDD-*` and they contain the .xc files as you've created them, as well as the `storage` subdirectory which will contain storage variables in their own individual files with their values in plain text, newline-separated for arrays.  
When editing a file externally, the game will detect any changes made to the currently running program and will automatically reboot the computer.  
Editing a storage file however, won't cause a reboot, and the values won't be used immediately, as they are cached in the computer's memory upon load.  
The storage files will be updated immediately on the server's hdd upon modifying the value though.  

## Collaboration
The IDE is collaborative, meaning multiple players are able to at least view the contents, while a single player at a time can edit the code.  
Whenever the editor player makes a change, even if not saved, other players will see the change happen in realtime, whether it's in Code or Nodes mode.  
Non-editor players are read-only, they cannot edit the code or nodes, until they click on Edit, in which case they will become the current editor and the previous editor will become a read-only viewer.  

## Shortcut keys
- `CTRL+S` Save the current file and reboot the computer
- `CTRL+SHIFT+S` Save all files and reboot the computer
- `CTRL+D` Select the next occurance in the code, or Dupplicate the selected node(s) when using Nodes mode
- `CTRL+C` Copy selected code or nodes
- `CTRL+V` Paste code or nodes
- `CTRL+N` Create a new File
- `CTRL+SHIFT+N` Create a new Program
- `CTRL+Q` Close the IDE

## VSCode
We have made available a vscode extension to support XenonCode syntax highlighting as well as some linting, if you wish to use it.  

---
