# Dotfile configurations :rocket:

# Apps
## Mac

App lists are in the  [osx_config](./osx_config/) folder.

```sh
# Install apps
cat osx_config/apps.txt osx_config/cli_apps.txt | xargs brew install
xargs brew install --cask < gui_apps.txt
```

### Install manually

- [Hiddenbar](https://github.com/dwarvesf/hidden)
  - Hide taskbar icons
  - Via Appstore
  - Brew version not being accepted


Click to import config file in Stats.
