# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=dont_flash_this by fucked_up_developers
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=oxygen
device.name2=oxygen_retail
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes
insert_line init.rc "init.lewd.rc" after "import /init.\${ro.zygote}.rc" "import /init.lewd.rc";
# end ramdisk changes

write_boot;
## end install

