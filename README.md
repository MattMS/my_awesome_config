# My Awesome WM configuration

## Testing

Open Awesome using dev_rc.lua with Xephyr:

```sh
./dev_start.sh
```

### Detailed version

http://awesome.naquadah.org/wiki/Using_Xephyr

```sh
Xephyr -ac -br -noreset -screen 800x600 :1
```

- `-ac` disables access control restrictions.

- `-br` creates the root window with a black background.

- `-noreset` stops a reset after the last client exists.

- `-screen 800x600` specifies the screen characteristics.


```sh
DISPLAY=:1.0
awesome -c dev_rc.lua
```
