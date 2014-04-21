Site Reducer
============

This is a fun script that uses Nokogiri to strip an input website down to a tree of its tags and any additional attributes of those tags.  

To get the Nokogiri gem:
```
gem install nokogiri
```

Example
-------
To print a site tree of Google's homepage with just tag names:
```
ruby siteReducer.rb http://www.google.com
```

To print the same tree showing tag id's, class's, and href's for any links:
```
ruby siteReducer.rb http://www.google.com id class href
```

Further work:
*Different output formats
*Use to create a new html file with "stripped down" version of site