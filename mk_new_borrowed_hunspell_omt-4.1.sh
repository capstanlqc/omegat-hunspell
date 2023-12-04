#!/bin/sh

# How to use this script: run
# ./mk_new_borrowed_hunspell.sh xx-XX yy_YY
# where the arguments are the input and the output locales

input_locale="$1"
output_locale="$2"

echo "Converting $input_locale to $output_locale"

unzip $input_locale.zip -d $input_locale
sleep 1
#ls -ls
cd -- "$input_locale"
rename "s/$input_locale/$output_locale/" *
zip $output_locale.zip $output_locale.aff $output_locale.dic
mv $output_locale.zip ..
cd ..
rm -r "$input_locale"
