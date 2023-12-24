# Github CLI Clean Notifications

A small [gh](https://github.com/cli/cli) extension to help cleanup notifications
for when a pull request or issue is marked as closed or merged.

## Prerequisite

Prior to setting up this tool to be used, you'll need to add the "notifications"
scope to your gh token. Your token can be refreshed to get the scope via `gh
auth refresh --scopes notifications`.

The correct scopes can be verified via `gh auth status`. The last line it prints
informs you of the "Token scopes".

Other requirements:
* `awk`
* `gh>=2.40`
* `jq`
* `sort`

## Usage

```shell
gh clean-notifications [Flags]
```

| Flags       | Description                                                                         | Example                                                  |
|-------------|-------------------------------------------------------------------------------------|----------------------------------------------------------|
| <none>      | Run default clean up                                                                | `gh clean-notifications`                                 |
| `-h`        | Print help                                                                          | `gh clean-notifications -h`                              |
| `-c` | Check gh version, and api scopes are all ok | `gh clean-notifications -c` |
| `-l NUM`    | Change the limit for the number of notifications grabbed per page. Default 50       | `gh clean-notifications -l 20`                           |
| `-q QUERY`  | Change the query used for getting the notifications. Default is `is:unread is:read` | `gh clean-notifications -q "is:unread org:paulbarton90"` |
| `-s STATES` | The states to mark items as done with. Default is `merged,closed`                   | `gh clean-notifications -s merged`                       |
| `-v`        | Add verbose printing                                                                | `gh clean-notifications -v`                              |
