# HerokuConfig

[![Gem Version](https://badge.fury.io/rb/heroku-config.png)](http://badge.fury.io/rb/heroku-config)

Easily rotate AWS keys and heroku configs.

## Usage

    heroku-config aws-rotate APP

## Example with Output

    $ heroku-config aws-rotate protected-oasis-24054
    => heroku config:get AWS_ACCESS_KEY_ID -a protected-oasis-24054
    Updating access key for user: bob
    Created new access key: AKIAXZ6ODJLQQEXAMPLE
    => heroku config:set AWS_ACCESS_KEY_ID=AKIAXZ6ODJLQQEXAMPLE AWS_SECRET_ACCESS_KEY=sp4gmsuif0XgYG2cPiZbkvl93kTGaeDDhEXAMPLE -a protected-oasis-24054
    Setting heroku config variables
    Setting AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and restarting protected-oasis-24054... done, v21

    AWS_ACCESS_KEY_ID:     AKIAXZ6ODJLQQEXAMPLE
    AWS_SECRET_ACCESS_KEY: sp4gmsuif0XgYG2cPiZbkvl93kTGaeDDhEXAMPLE
    Old access key deleted: AKIAXZ6ODJLQSGGE27KK
    $

## Installation

Add this line to your application's Gemfile:

    gem "heroku-config"

And then execute:

    bundle

Or install it yourself as:

    gem install heroku-config

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
