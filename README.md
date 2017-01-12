# Adobe Acrobat (acroread)

Unofficial build of Adobe Acrobat 9.5.5 running within a docker container and
rendered by the local X Server. Based on [chrisdaish/acroread](https://github.com/chrisdaish/docker-acroread)
but with a different approach when it comes to configuration files. By running this image *you* have accepted
Adobes EULA for Acrobat Reader. It is also possible to enable `cups` by setting environment variable `DOCKER_BRIDGE_IP`
to the IP address of `docker0` bridge on the host.

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
