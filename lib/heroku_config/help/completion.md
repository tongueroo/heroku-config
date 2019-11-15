## Examples

    heroku-config completion

Prints words for TAB auto-completion.

    heroku-config completion
    heroku-config completion hello
    heroku-config completion hello name

To enable, TAB auto-completion add the following to your profile:

    eval $(heroku-config completion_script)

Auto-completion example usage:

    heroku-config [TAB]
    heroku-config hello [TAB]
    heroku-config hello name [TAB]
    heroku-config hello name --[TAB]
