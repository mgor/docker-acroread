# Adobe Acrobat (acroread)

Unofficial build of Adobe Acrobat 9.5.5 running within a docker container and
rendered by the local X Server. Based on [chrisdaish/acroread](https://github.com/chrisdaish/acroread)
with the following changes:
+ By running this image, you have accepted the EULA automatically
+ /etc/cups/client.conf is automagically created if variable `DOCKER_BRIDGE_IP` is set

## Wrapper script

```
sudo cp acroread /usr/local/bin
```

### Application launcher

Install the application launcher:

```
desktop-file-install --dir=$HOME/.local/share/applications acroread.desktop
```

## FAQ

Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```

Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```
