# Call of Duty 2 Docker Image!

Here you get a Docker Image for the Game Call of Duty 2. You can host easily multiple gameserver instances with one gamedir! 

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/keinnerd/cod2docker?style=flat-square) ![Docker Pulls](https://img.shields.io/docker/pulls/keinnerd/cod2docker?style=flat-square)

## 📦 What you get
 - Well documented Game Configurations
 - Multiple Versions (`1.0a`, `1.2c`, `1.3`)
 - Multiple Servers with one install
 - Download latest Serverfiles
 - LibCOD from [Freekers Mirror](https://github.com/Freekers/libcod-mirror) included 
 - Also "cracked" binaries so any user can join!
 - Easy Mod Support

## 🚀 How to start
For a fast start simply 

     docker create \
      --name cod2docker \
      -p 28960:28960 \
      -p 28960:28960/udp \
      -v <your/path/to/game/>:/gameserver \
      -v <your/path/to/game/>:/config \
      -e COD_VERSION="1_3" \
      -e COD_GAME="main" \
      -e STARTUP="+set fs_homepath config/default +set dedicated 2 +exec dedicated.cfg" \
    keinnerd/cod2docker:latest

## 🔧 Envs

|Env             |Options                       |Description                         |
|----------------|-------------------------------|-----------------------------|
|COD_VERSION     | Basic: `1_0a` or `1_2c` or `1_3` | There a several Binarys check the [BINARYS.md](BINARYS.md) for more informations|
|COD_GAME        | `main` or `mod` |`main` = Call of Duty 2 / `mod` = Call of Duty 2 with Mod Options|
|LIBCOD          | `1_0` or `1_2` or `1_3` (must match the Binary Version) | LibCod fixes Bugs and add better modding support 
|STARTUP         | "`+set fs_homepath config/ +set dedicated 2 +exec dedicated.cfg`" | Adjust your Start command (fs_basepath is hardcoded to /gameserver) Hint: use `+set sv_cracked 1`

## 📁 Multiple Servers

If you want to host multiple servers, create a new container then create inside your config folder different dirs and change `+set fs_homepath config/default` to `config/server1` the next to `config/server2`. Create Configs inside the dirs and spin up the container. 

```
── /config
 ├──> server1 (e.g call of duty)
 ├──────> dedicated.cfg
 ├──────> punkbuster.cfg
 ├──> server2 (e.g call of duty UO)
 ├──────> dedicateduo.cfg
 ├──────> punkbuster.cfg
 ├──> server3 (e.g AWEMod)
 ├──────> dedicated.cfg & aweconfig.cfg
 └──────> punkbuster.cfg
```

To enable comment the Punkbuster vars in your dedicated.cfg out!

Open needed Ports in your firewall! Default Ports: 28960/tcp 28960/udp

## 👾 Mods

If you want to play a Modification you need to upload your mod in the `gamedir` and adjust some ENV's

- Change `COD_GAME` to `mod`
- Change `LIBCOD` must match the Binary version
- Change `STARTUP` to `+set fs_game YOURMOD +set fs_homepath config/YOURMOD/ +set dedicated 2 +exec YOURMODCONFIG.cfg` 


## 📝 ToDo

- nothing today

## 👐 Contribution

Feel free to fork and make pull requests. This are my first attempts with creating docker images so please give me feedback. 
