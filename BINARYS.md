# Cracked Server with LibCOD

If you use the libcod libary you dont need to use a cracked binary. simply put `+set sv_cracked 1` in your STARTUP ENV!


# Cracked Server with Binarys

## Server binaries
You can find here original and cracked server binary files.

## Usage
Custom server binary naming explanations (credits to **Mitch** on [this thread](https://killtube.org/showthread.php?1719-Latest-cod2-linux-binaries-(1-0-1-2-1-3)) and [this post](https://killtube.org/showthread.php?1337-CoD2-Tutorial-How-to-make-your-cracked-server-show-up-in-the-master-list&p=16844&viewfull=1#post16844)):
- `1_0a`, `1_2c`, `1_3`: server version for compatibility with your game
- `nodelay`: changes the minimum required master server offline time before you can connect to an original server (from ~30 minutes to 5 seconds)
- `cracked`: disable the master server + "nodelay"
- `loc`: no spam of non-localized strings
- `va`: patch for string overrun in call to va() function (more than 1024 chars), can be considered a security patch and should be used

## Example ENV Options

- `1_0a`
- `1_0a_va`
- `1_0a_va_loc`
- `1_2c`
- `1_2c_nodelay`
- `1_2c_nodelay_va_loc`
- `1_2c_patch_va_loc`
- `1_3`
- `1_3_cracked`
- `1_3_nodelay`
- `1_3_nodelay_va_loc`
- `1_3_patch_va_loc`

Use the one that fit your needs.

## Sources
Cracked server binary files credits goes to **Kung Foo Man** and **Mitch** from [Killtube](https://killtube.org/showthread.php?1719-Latest-cod2-linux-binaries-(1-0-1-2-1-3)).
It might be usefull if you want to create a public server to play on without a valid CD key ;-)

