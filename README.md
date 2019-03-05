# Woojoong's dev environment for Ubuntu (dev_env_woojoong)
![GitHub](https://img.shields.io/github/license/woojoong88/dev_env_woojoong.svg)
![GitHub top language](https://img.shields.io/github/languages/top/woojoong88/dev_env_woojoong.svg)
![GitHub language count](https://img.shields.io/github/languages/count/woojoong88/dev_env_woojoong.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/woojoong88/dev_env_woojoong.svg)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/woojoong88/dev_env_woojoong.svg)
![GitHub All Releases](https://img.shields.io/github/downloads/woojoong88/dev_env_woojoong/total.svg)

![GitHub issues](https://img.shields.io/github/issues-raw/woojoong88/dev_env_woojoong.svg)
![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/woojoong88/dev_env_woojoong.svg)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/woojoong88/dev_env_woojoong.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/woojoong88/dev_env_woojoong.svg)

Personal dev environment for Ubuntu (from Ubuntu 14.04 to 18.04)

## Preliminaries
Nothing

## Install

### 1. Run setup.sh
```
ubuntu$ ./setup.sh
```

## Release information
* Release 1: [Mar. 5, 2019] Initial version to install necessary tools including vim and tmux
* Backlog 1: previous commits before release 1 -- no longer support
* Master: Might unstable

## Appendix 1. Troubleshooting
### * If you want to change tmux name in the status bar
```
ubuntu$ vim ./.tmux.conf
# Find Woojoong@ONF/POSTECH
# Then, replace that to $wg_user_host
```

