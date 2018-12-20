# $1 -> markdown file to be converted
# $2 -> result pdf file name 
# $3 -> markdown styling stylesheet (if empty default will be chosen)
# $4  -> custom html header 
# $5  -> custom html footer


# Get script full path
script_full_path=$(dirname "$0")
echo $script_full_path

# Create the temporary markdown html file
tmp_html_file=${1%.md}'_tmp.html'
touch $tmp_html_file

# Add pre html
pre_html_part1='<html><head><meta charset="utf-8"><link rel="stylesheet" href="'
pre_html_part2='/styles/'
style='github.css'

if [ -n "$3" ]
  then
    style=$3
fi

pre_html_part3='"></head><body>'
pre_html="$pre_html_part1$script_full_path$pre_html_part2$style$pre_html_part3"

echo $pre_html > $tmp_html_file

# Add custom header
header="$script_full_path/headers/default.html"
if [ -n "$4" ]
  then
    header="$script_full_path/headers/$4"
fi


# Add custom footer
footer="$script_full_path/footers/default.html"
if [ -n "$5" ]
  then
    footer="$script_full_path/footers/$5"
fi


# Append markdown code to temporary html file
pandoc -f markdown -t html $1 -o md.html
cat md.html >> $tmp_html_file

# Append post html to temporary html file
post_html='</body></html>'
echo $post_html >> $tmp_html_file

# Convert html to PDF
# wkhtmltopdf $tmp_html_file  $2
wkhtmltopdf --header-html $header --footer-html $footer $tmp_html_file $2

# Remove temporary files
rm $tmp_html_file
rm md.html