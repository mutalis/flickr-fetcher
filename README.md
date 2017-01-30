# Flickr fetcher App.

## App. requirements

Write a Ruby command line application that

* accepts a list of search keywords as arguments
* queries the Flickr API for the top-rated (term: interestingness) image for each keyword
* downloads the results
* crops them rectangularly
* assembles a collage grid from ten images and
* writes the result to a user-supplied filename
* host your code repository on github or bitbucket

If given less than ten keywords, or if any keyword fails to
result in a match, retrieve random words from a dictionary
source such as `/usr/share/dict/words`. Repeat as necessary
until you have gathered ten images.

Be careful and conservative in your handling of files and
other IO. Bonus points for wrapping the application in a
Gem. Please include a README with instructions on how to
install and run your application.

Hint: You're free to use any existing Gem which helps you to
get the challenge done.

## Usage
flickr.rb keywords filename
 
If not keywords or filename are given, it will use the dictionary and the output filename will be collage.jpg

The last argument is the name of the jpeg image, an .jpg extension will be added to this name.

Example:
flickr.rb art music dance sunset collage-image


## License

Source code released under the [GNU General Public License](http://www.gnu.org/licenses/gpl-3.0.html) as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. Docs released under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).

[![GPL V3](http://www.gnu.org/graphics/gplv3-88x31.png)](http://www.gnu.org/licenses/gpl-3.0.html) [![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)
