## Examples

    heroku-config aws-rotate APP

## Example with Output

    $ heroku-config aws-rotate protected-oasis-24054
    => heroku config:get AWS_ACCESS_KEY_ID -a protected-oasis-24054
    Updating access key for user: bob
    Created new access key: AKIAXZ6ODJLQQEXAMPLE
    Checking if new AWS key is usable yet.
    Confirmed that new AWS key is usable.
    => heroku config:set AWS_ACCESS_KEY_ID=AKIAXZ6ODJLQQEXAMPLE AWS_SECRET_ACCESS_KEY=sp4gmsuif0XgYG2cPiZbkvl93kTGaeDDhEXAMPLE -a protected-oasis-24054
    Setting heroku config variables
    Setting AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and restarting protected-oasis-24054... done, v21

    AWS_ACCESS_KEY_ID:     AKIAXZ6ODJLQQEXAMPLE
    AWS_SECRET_ACCESS_KEY: sp4gmsuif0XgYG2cPiZbkvl93kTGaeDDhEXAMPLE
    Old access key deleted: AKIAXZ6ODJLQSEXAMPLE
    $