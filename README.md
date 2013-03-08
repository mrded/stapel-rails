stapel-rails
============

An experimental jQuery plugin that will group thumbnails by a shared data-attribute into a pile. When clicking on the pile, the thumbnails that belong to that pile will be spread into a grid using CSS transitions.

How to install:
------------

Add this to your Gemfile:

    gem 'stapel-rails', :git => "git://github.com/mrded/stapel-rails.git"

Run:

    bundle install

How to use:
------------

    stapel = Stapel::Items.new

    item = {
      title: 'Hello!',
      tags: ['Group 1', 'Group2'],
      image: 'http://funypicture.com/image.png',
      link: 'http://google.com',
    }

    stapel.add item

    stapel.prepare
    stapel.html
