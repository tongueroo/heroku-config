# heroku-config

[![Gem Version](https://badge.fury.io/rb/heroku-config.png)](http://badge.fury.io/rb/heroku-config)

Quickly rotate [AWS credential keys](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html) and [heroku configs](https://devcenter.heroku.com/articles/config-vars).

Do you have long-term AWS credentials like `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` deployed to your Heroku applications? When was the last time they were rotated?  Rotating AWS keys is one of the simplest security measures to take. Usually though, we're too busy with developing features and rotating keys take a back seat. This tool automates the boring and manual process of rotating keys. Run this on your CodeBuild, jenkins server, a lambda function, or just manually when you have to.

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
    Old access key deleted: AKIAXZ6ODJLQSGEXAMPLE
    $

## Installation

Or install with RubyGems.

    gem install heroku-config

Prerequisite:

[The heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) must be installed. This tool calls out to it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
