Assignment 5
==========

#### Bundler

If your machine does not have bundler installed do

```
$ gem install bundler
```

visit http://bundler.io for more detail instructions

First install all the nessary gems for facecook app (view facecook/Gemfile for list of gems).

```
cd facecook
bundle install
```

Once all the required gems are installed run

```
rails server  => start local server on your machine
```

After server is started. Go to http://localhost:3000

The url takes a parameter named **"keyword"** for recipe search (Example: http://localhost:3000/?keyword=mocha) 