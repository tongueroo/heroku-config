# heroku-config

[![Gem Version](https://badge.fury.io/rb/heroku-config.png)](http://badge.fury.io/rb/heroku-config)

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

Quickly rotate [AWS credential keys](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html) and [heroku configs](https://devcenter.heroku.com/articles/config-vars).

Do you have long-term AWS credentials like `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` deployed to your Heroku applications? When was the last time they were rotated?

Rotating AWS keys is one of the simplest security measures to take. Usually though, we're too busy with developing features and rotating keys take a back seat. This tool automates the boring and manual process of rotating keys. Run this on your CodeBuild, jenkins server, a lambda function, or just manually when you have to.

## Usage

Switch to an AWS_PROFILE with the permissions to create and delete AWS keys, usually an admin.

    export AWS_PROFILE=yourprofile

Run the `aws-rotate` command.

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

## Rotate Multiple Apps

You can use the `aws-rotate-all` command to rotate a list of heroku apps.

    heroku-config aws-rotate-all FILE

The FILE should contain a list of apps separated by new lines.  Example:

~/heroku-apps.txt:

    radiant-fortress-40674
    protected-oasis-24054

Then the command would be:

    heroku-config aws-rotate-all ~/heroku-apps.txt

For more help:

    heroku-config aws-rotate-all -h

## Custom Heroku Config Variable Names for AWS Key and Secret

Your app may not be using `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for the heroku config vars. You can specify the config vars to use with the `--id-key-name` and `--secret-key-name` options. Example:

    heroku-config aws-rotate protected-oasis-24054 --id-key-name AWS_KEY --secret-key-name AWS_SECRET

For the `heroku-config aws-rotate-all` command, use a `:` to separate the app, id key name, and secret key name for the FILE format. Example:

    radiant-fortress-40674
    protected-oasis-24054:aws_key:aws_secret

Here `radiant-fortress-40674` will use the default `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`, whereas `protected-oasis-24054` will use `aws_key` and `aws_secret`.

## Installation

Install with:

    gem install heroku-config

Prerequisite:

[The heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) must be installed. This tool calls out to it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
