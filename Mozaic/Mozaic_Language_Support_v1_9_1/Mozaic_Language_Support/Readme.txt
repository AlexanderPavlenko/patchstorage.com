Mozaic Scripting Language Support for Code Text Editors v1.91
=============================================================

If scripts get longer and more complicated, the process of
refactoring the script is much simpler in an external code 
text editor as these offer more editing and comfort features

This package enhances some external code text editors with
- syntax highlighting
- jump markers to all mozaic and user defined events
- code completion and mozaic templates for Textastic
- and a full Mozaic language validator and syntax checker


Syntax Highlighting
  - Consistent colors and styles for all language elements
  - Variables styling for constants, locals, parameters and globals

Code Completion
  There is code completion for Mozaic commands, functions and control 
  statements. The code completion supports parameter snippets which 
  can be stepped through using the tab and backtab key
  
Templates
  There are 4 Mozaic templates for new files 
  - The first only contains a @Description and @OnLoad block
  - The three others contain skeletons for pads, knobs and xy layout
    including optional debugging output
  All four templates support parameter snippets stepped through 
  using the tab and backtap key
  
Mozaic Language Validator
  - Knows all mozaic events, commands, functions and constants
  - Checks number and type of parameter for all commands and functions
  - Checks all expressions including parenthesis nesting
  - Checks control flow 
  - Checks variable names including indexing

Content
  The zip package consists of the following files inside a 
  Mozaic_Language_Support folder. 

    Readme.txt                      This installation guide
    Intro.moz                       Introduction to the 
    UnitTests.moz                   All unit tests done
    #Textastic                      Folder needed by Textastic
    - Monokai-Mozaic.tmTheme        Theme file
    - CodeCompletion                Folder for code completion
      - mozaic.json                     Code completion definition
    - Mozaic                        Folder for language definition
      - Mozaic.sublime-syntax           Syntax definition
      - SymClasses.tmPreferences        Symbol List: add mozaic events
      - SymFunctions.tmPreferences      Symbol List: add user events
      - SymHide.tmPreferences           Symbol List: hide @End keyword
    - Templates                     Folder for templates
      - mozaic.json                     Template file
 
  All these files are ascii textfiles and can be opened and edited in any 
  text editor.

  The Monokai-Mozaic Theme file is a slight modification of the Monkai 
  theme by Monokai, adds orange color for Mozaic keywords and dims down 
  the error-highlights.


Textastic IOS Installation
  Download the zip either with Documents app or into AudioShare. Unzip and you 
  get the MozaicLanguageSupport folder containing the above files, which all
  need to be copied into the On My Ipad / Textastic folder. 

  - If you used the Documents app to unzip, the easiest way to do this is to
    use the Documents app and navigate into the unzipped folder, select all
    3 files plus the #Textastic folder and then 'share' and 'save into files'
    selecting the On my iPad / Textastic folder as destination.

  - If you used AudioShare to unzip, use the Files app and navigate into the
    unzipped folder, select all 3 files plus the folder and then 'move'. In
    the destination dialog, select the On my iPad / Textastic folder and 
    then 'copy'

Textastic MAC Installation
  Please refer to the manual on how to open the textastic library folder
  an then copy the content of the #Textastic folder into that folder.
  
Installation for Sublime3
  Download the zip and unpack. 

  Open Sublime 3 and choose 'Preferences / Browse Packages...' to show the
  the package folder on your operating system. (on Windows this opens
  <users> / <userid> / AppData / Roaming / Sublime Text 3 / Packages )

  Create a 'User' folder (if not already present) and copy the content 
  of the #Textastic folder into this 'User' folder.

  After restarting Sublime 3, the new Mozaic syntax definition and 
  Monokai-Mozaic theme should be available. 


Testing the installation
  Opening the Intro.moz should automatically use the syntax definition, 
  since the moz extension is registered in the synatax definition

  The Monokai-Mozaic theme needs to be manually enabled:
  - In Textastic styles are found under settings/code-editor/theme. 
  - In Sublime 3 find it at preferences/color scheme

