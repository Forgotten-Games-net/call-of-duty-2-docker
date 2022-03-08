#!/bin/bash

# Download linux serverfiles for Call of Duty 2
if [ ! -d "/gameserver/main/" ]; then
    echo "---| Download Serverfiles for Call of Duty 2"
    echo "---| This can take some minutes so be patient"
    cd /gameserver
    if wget -nv --show-progress --progress=bar:force:noscroll "https://dl.forgotten-games.net/cod/cod2_lnxded.tar.gz" ; then
         echo "---| Successfully downloaded, now extracting |---"
         tar xzvf cod2_lnxded.tar.gz -C /gameserver/
         rm cod2_lnxded.tar.gz
         echo "---| Download finished |---"
            else
             echo "---| Can't download 'cod2_lnxded.tar.gz', putting server into sleep mode... |---"
         sleep infinity
        fi
fi

# Start a Vanilla Call of Duty 2 Server
if [ "${COD_GAME}" == "main" ]; then
    echo "---| Checking if the config file 'dedicated.cfg' for Call of Duty 2 is present"
      if [ ! -f "/config/default/dedicated.cfg" ]; then
          echo "---|  No 'dedicated.cfg' for Call of Duty 2 found, copying default dedicated.cfg"
          mkdir /config/default
          cp /opt/config/dedicated.cfg /config/default/dedicated.cfg
          cp /opt/config/punkbuster.cfg /config/default/punkbuster.cfg
          echo "---|  Change 'dedicated.cfg to your needs and restart the container"
          sleep infinity
        else
          echo "---| Call of Duty config 'dedicated.cfg' found, continuing"
          echo "---| Start Call of Duty Server 2 with Version ${COD_VERSION} and LibCOD ${LIBCOD}"
          cd /gameserver/
          LD_PRELOAD="libs/libcod2_${LIBCOD}.so" ./cod2_lnxded_${COD_VERSION} +set fs_basepath /gameserver +set fs_game main ${STARTUP}
      fi
fi

# Start a Modded Call of Duty Server
if [ "${COD_GAME}" == "mod" ]; then
     echo "---| Please be sure you upload all needed mod files and create the configs."
     echo "---| Change the Startup ENV to your mods's needings."
     echo "---| Server will start in 3 Seconds."
     cd /gameserver/
     LD_PRELOAD="libs/libcod2_${LIBCOD}.so" ./${STARTUP}

fi
