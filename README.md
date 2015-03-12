# While You're At It

Server for "While You're At It" android training project.

## Setup
You'll need to install ruby 2.1.5.
If you're using rbenv then you'll need to update your ruby-build package to be able to install ruby 2.1.5.

First, check if the ruby-build plugin is located under `~/.rbenv/plugins/ruby-build`.
If it is, then all you need to do is `cd` into the folder and run `git pull`.

If you installed it via Homebrew then you'll need to run:

1. `brew update`
2. `brew upgrade ruby-build`.

Once you've updated the `ruby-build` plugin then all you need to do is run: `rbenv install 2.1.5`

## Install gems
1. `cd` into project folder, and make sure your ruby version is correct by running `rbenv which ruby`.
2. run `gem install bundler`
3. run `bundle install --binstubs .bundle/bin`
4. run `rbenv rehash`

## Configure environment variables
1. Install the [rbenv-vars plugin](https://github.com/sstephenson/rbenv-vars).
2. In the project root folder create a `.rbenv-vars` and add the necessary environment variables.



