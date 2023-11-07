# Github CLI Clean Notifications

A small [gh](https://github.com/cli/cli) extension to help cleanup notifications
for when a pull request or issue is marked as closed or merged.

## Usage

```shell
gh clean-notifications [Flags]
```

| Flags      | Description                                                                         | Example                                                  |
|------------|-------------------------------------------------------------------------------------|----------------------------------------------------------|
| <none>     | Run default clean up                                                                | `gh clean-notifications`                                 |
| `-h`       | Print help                                                                          | `gh clean-notifications -h`                              |
| `-l NUM`   | Change the limit for the number of notifications grabbed per page. Default 50       | `gh clean-notifications -l 20`                           |
| `-v`       | Add verbose printing                                                                | `gh clean-notifications -v`                              |
| `-q QUERY` | Change the query used for getting the notifications. Default is `is:unread is:read` | `gh clean-notifications -q "is:unread org:paulbarton90"` |
