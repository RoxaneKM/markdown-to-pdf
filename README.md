# Markdown to PDF command line converter

* [Pre-requisites](https://github.com/RoxaneKM/markdown-to-pdf/blob/master/README.md#pre-requisites)
* [Installation](https://github.com/RoxaneKM/markdown-to-pdf/blob/master/README.md#installation)
* [How to use](https://github.com/RoxaneKM/markdown-to-pdf/blob/master/README.md#how-to-use)
* [Stylesheet](https://github.com/RoxaneKM/markdown-to-pdf/blob/master/README.md#stylesheets)

## Pre-requisites

### Pandoc 

Download link : [https://github.com/jgm/pandoc/releases/tag/2.4](https://github.com/jgm/pandoc/releases/tag/2.4)

### wkhtmltopdf

Link to website: [https://wkhtmltopdf.org/](https://wkhtmltopdf.org/)

#### Linux 
Install through terminal : `sudo apt-get install wkhtmltopdf` 

#### Windows
Download and install the .msi : [https://wkhtmltopdf.org/downloads.html](https://wkhtmltopdf.org/downloads.html)

Then add install location `C:\Program Files\wkhtmltopdf\bin` to system **Path**.

## Installation

Download zip or clone this project: `git clone git@github.com:RoxaneKM/markdown-to-pdf.git`

### Linux 
For ease of use, open your .bashrc file :
`sudo gedit ~/.bashrc`

And create an alias : 
`alias='~/path-to-script-folder-location/mdtopdf/'`

### Windows
For ease of use, add path to executable (example: `D:\Scripts\markdown-to-pdf\`) in system **Path**.

## How to use

Run in terminal: 
`mdtopdf my_markdown.md result.pdf`  

**Note:** First and second parameters are mandatory (in the example above, default css used will be github style).

### How to use my custom stylesheet?
To use you own css file, add your stylesheet to the *styles* folder. 

And run this command in the terminal :
`mdtopdf my_markdown.md result.pdf my_awesome_stylesheet.css` 

### How to add my custom header and/or footer?

To use you own custom header, add *my_awesome_header.html* in the *headers* folder. In the same manner, for footer just add *my_awesome_footer.html* in the *footers* folder.

By default, *headers/default.html* and *footers/footer.html* are used.

Terminal to use custom header and footer:
`mdtopdf my_markdown.md result.pdf my_awesome_stylesheet.css my_awesome_header.html my_awesome_footer.html`

## Stylesheets

The current default stylesheet is github.css that I did to be as close as possible to the github style. However, the stylesheet is not yet complete and will be completed soon.

If you want to add a stylesheet of your own add it to the *styles* folder.

## Author

* [RKM](https://github.com/RoxaneKM) - Initial work







