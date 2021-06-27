# Lazarus makefile example

This is a skeleton project that allows you to use [GNU Make](https://www.gnu.org/software/make/) to build your [Lazarus](https://www.lazarus-ide.org/) project without opening Lazarus IDE and fiddling around with buttons. This is extremely helpful for building projects quickly and more or less universally. Plus, sources are in `src` directory and binaries are in `build` directory, just like you expect to.

Feel free to change files around to suit your needs. You can start by deleting this file and replacing it with your own project readme.

If you want to use the existing example project inside `src`, use it.

If you want to create your own project from scratch, apply these changes:
- Delete everything inside `src` directory and save your Lazarus project there.
- Change **Project - Project Options - Compiler Options - Target file name (-o)** to `../build/yourbinaryname`.
- On the same page, click the **...** button besides **Build modes**, then click **Create Debug and Release modes**. Click **OK**, **OK**.
- Click **File - Save All**.

After you're done, run `make` or `make debug`. Be sure to have GNU Make and Lazarus installed on your system in order to run this.

To change Makefile rules for your project, you can look in the [wiki](https://wiki.freepascal.org/lazbuild).

# Manually create

You may be wondering how this skeleton was created? Simple. Just follow these steps if you want to recreate this:

- Create a new directory to contain everything (let's say "lazarus-makefile")
- Create 2 directories inside it named `src` and `build`
- Start Lazarus, create a new project (e.g. **Project - New Project - Application - OK**) and then click **File - Save as**, choose to save every file in the "src" directory.
- Go to **Project - Project Options - Compiler Options** and add `../build/` before **Target file name (-o)**. For example, if it was "project1" before, make it "../build/project1".
- On the same page, click the **...** button besides **Build modes**, then click **Create Debug and Release modes**.
- Click **OK**, **OK**.
- Save the project by clicking **File - Save All**.
- Now create a file named `Makefile` inside the "lazarus-makefile" directory and enter:

```
default: release

release:
	lazbuild --build-mode=Release -B src/*.lpi

debug:
	lazbuild --build-mode=Debug -B src/*.lpi
```

- Now open a terminal, `cd` into the "lazarus-makefile" directory and run `make`. It should build the project and output the executable inside `build`. If you want a bebug build, just run `make debug`.
- To keep binaries from not being committed to code repo, add `build/*` in `.gitignore`. You can optionally add `src/lib/` and `src/backup/` to make it cleaner. Check the `.gitignore` on this project for a full example.
