#KVM#

Build the dockerfile by

    docker build --no-cache=true -t kvm:2.1.2 .

Create a qcow2 image by

    docker run --rm --name kvm-worker -v $PWD:/media \
     kvm:2.1.2 \
    qemu-img create -f qcow2 /media/primary.img 40G

Create a qcow2 image with the specific backing image by

    docker run --rm --name kvm-worker -v $PWD:/media \
     kvm:2.1.2 \
    qemu-img create -f qcow2 -b /media/base.img /media/primary.img

Shrink a qcow2 image by

    docker run --rm --name kvm-worker -v $PWD:/media \
     kvm:2.1.2 \
    qemu-img convert -c -O qcow2 /media/primary.img /media/shrunk.img


Start a VM with an ISO file mounted by

    qemu-system-x86_64 \
     -enable-kvm -cpu host \
     -hda /media/primary.img \
     -cdrom /media/en_windows_8.1_pro_n_vl_with_update_x64_dvd_6050969.iso \
     -m 2048 \
     -boot d \
     -device rtl8139,netdev=net0,mac=DE:AD:BE:EF:51:52 \
     -netdev user,id=net0,hostfwd=tcp::3389-:3389

Start a VM with NAT network by

    docker run --rm --name kvm-worker -v $PWD:/media \
     --privileged \
     --net=host \
     kvm:2.1.2 \
    qemu-system-x86_64 \
     -enable-kvm -cpu host \
     -hda /media/primary.img \
     -m 2048 \
     -nographic \
     -device e1000,netdev=net0,mac=DE:AD:BE:EF:51:52 \
     -netdev user,id=net0,hostfwd=tcp::3389-:3389


Start a VM with BRIDGE network by

    docker run --rm --name kvm-worker -v $PWD:/media \
     --privileged \
     --net=host \
     kvm:2.1.2 \
    qemu-system-x86_64 \
     -enable-kvm -cpu host \
     -hda /media/primary.img \
     -m 2048 \
     -nographic \
     -device e1000,netdev=net0,mac=DE:AD:BE:EF:51:52 -netdev tap,id=net0
