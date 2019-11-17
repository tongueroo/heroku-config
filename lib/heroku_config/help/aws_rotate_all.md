## Examples

    heroku-config aws-rotate-all

## Example with Output

    $ cat ~/heroku-apps.txt
    radiant-fortress-40674
    protected-oasis-24054
    $ heroku-config aws-rotate-all ~/heroku-apps.txt
    => heroku config:get AWS_ACCESS_KEY_ID -a radiant-fortress-40674
    WARN: No AWS_ACCESS_KEY_ID found for radiant-fortress-40674 app.
    => heroku config:get AWS_ACCESS_KEY_ID -a protected-oasis-24054
    Updating access key for user: bob
    Created new access key: AKIAXZ6ODJLQSEXAMPLE
    Checking if new AWS key is usable yet.
    Aws::STS::Errors::InvalidClientTokenId: The security token included in the request is invalid.
    New IAM key not usable yet. Delaying for 5 seconds and retrying...
    Confirmed that new AWS key is usable.
    => heroku config:set AWS_ACCESS_KEY_ID=AKIAXZ6ODJLQSEXAMPLE AWS_SECRET_ACCESS_KEY=SGxokj5/9PYaAtqu3C6UOqPPUi+C0yPT6EXAMPLE -a protected-oasis-24054
    Setting heroku config variables
    Setting AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and restarting protected-oasis-24054... done, v27

    AWS_ACCESS_KEY_ID:     AKIAXZ6ODJLQSEXAMPLE
    AWS_SECRET_ACCESS_KEY: SGxokj5/9PYaAtqu3C6UOqPPUi+C0yPT6EXAMPLE
    Old access key deleted: AKIAXZ6ODJLQZEXAMPLE
    $
