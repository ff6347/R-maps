R-maps
======

fiddling with R and maps

![](openpaths-map.png)
![](map.png)
![](output.png)


##How 2 Setup R on MACOSX 10.9.2 

This is a short documentation what I did to setup a [R](http://cran.r-project.org) environment I like. Mostly for me not to forget what I did. The `$` at the beginning of the commandos is an indicator for the command prompt of the terminal or iTerm. Not a real command.

###install homebrew  

follow [this guide](http://www.computersnyou.com/2025/2013/06/install-command-line-tools-in-osx-10-9-mavericks-how-to/) to install the XCode command line tools. Then go to to [brew.sh](http://brew.sh) and follow the installation instructions.  

###install XQaurtz with homebrew cask  

    $ brew tap phinze/cask
    $ brew install brew-cask
    $ brew cask install XQuartz

###install iTerm2 with homebrew cask  

    $ brew cask install iterm2   

###install r by download  

[go to here](http://mirrors.softliste.de/cran/) and follow the installation instructions

###install r via homebrew (alternative. can create errors. not fully tested)  
[found here](http://davidsimpson.me/2013/02/26/installing-r-on-os-x/)

    brew update
    brew tap homebrew/science
    brew install gfortan
    brew install r

###Create rLibrary  
In iTerm enter:  

    $ mkdir -p ~/rLibrary  

###Check if it working  

Enter the following command in iterm
This should open the REPL of r.

- Set the libpath as shown below
- Write q() to end it.  

This is what you should see:

    $ r
    R version 3.0.2 (2013-09-25) -- "Frisbee Sailing"
    Copyright (C) 2013 The R Foundation for Statistical Computing
    Platform: x86_64-apple-darwin10.8.0 (64-bit)
    R ist freie Software und kommt OHNE JEGLICHE GARANTIE.
    Sie sind eingeladen, es unter bestimmten Bedingungen weiter zu verbreiten.
    Tippen Sie 'license()' or 'licence()' für Details dazu.
    R ist ein Gemeinschaftsprojekt mit vielen Beitragenden.
    Tippen Sie 'contributors()' für mehr Information und 'citation()',
    um zu erfahren, wie R oder R packages in Publikationen zitiert werden können.
    Tippen Sie 'demo()' für einige Demos, 'help()' für on-line Hilfe, oder
    'help.start()' für eine HTML Browserschnittstelle zur Hilfe.
    Tippen Sie 'q()', um R zu verlassen.

    $ > 2 + 4
    $ > .libPaths("Users/YourHomeFolder/rLibrary")
    $ > q()  



###Setup R Environment  

Start the r REPL by writing:
The getwd() and setwd() commands give the the location your r console is running.  

    $ r
    $ > getwd()
    [1] "/Users/YourHomeFolder/"


create a Environment file in your home directory.

    $ echo "R_LIBS=/Users/$HOME/rLibrary" > $HOME/.Renviron

###install Sublime Text  

go to [here](http://www.sublimetext.com) and follow the instructions

###install Sublime Package Manager  

go to [here](https://sublime.wbond.net/installation) and follow the instructions

###install SublimeREPL via Package Manager  

in the Sublime Text Command palette (shift + cmd + p) enter REPL

###install Sublime Enhanced-R via Package Manager  

- in the Sublime Text Command palette (shift + cmd + p) enter Enhanced. 
- open Sublime Text>Preferences>Package Settings>Enhanced R>Settings Default
- open Sublime Text>Preferneces>Package Settings>Enhanced R>Settings User
- copy the whole content from Default to user and change the osx.app settings to iterm  

It should look like this:  

    "osx" : {
        // R / R64 / Terminal / iTerm

        "App" : "iTerm"
        // path to Rscript binary
        // "Rscript" : "/usr/bin/Rscript",
    },


###Finally write some code  

Open a iterm window and enter `r` to open the REPL 

    $ r

Create a new file in Sublime Text and save it as test.r  
write into it:

    vec = c(1,20,30,40,100,200,200)  
    plot(vec, main="Hello World")

select the whole code you want to execute and hit cmd + enter. This is the execute command from Enhanced-R and should send the selected code to iterm. iterm executes it and XQuartz should open an new window.  

###install a r package  

Enter into your testfile.  

    install.packages("maps")  
    require(maps)
    map('world')

Select it and hit cmd+enter.

