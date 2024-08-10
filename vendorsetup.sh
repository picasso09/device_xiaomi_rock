if [ -d "hardware/mediatek" ]; then
    rm -rf "hardware/mediatek"
fi

git clone -b lineage-21 https://github.com/MT6789-Rock/hardware_mediatek.git --depth=1 "hardware/mediatek"
