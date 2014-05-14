#!/bin/bash
for((domID=1; domID<10; domID+=1));do
    for((vcpu=1; vcpu<6; vcpu+=1));do
        filename="litmus${domID}-${vcpu}.xl.pvlinux"
        rm ${filename}
        echo "name=\"litmus${domID}\"" >> ${filename}
        echo "memory=512" >> ${filename}
        echo "vcpus = ${vcpu}" >> ${filename}
        echo "cpus = \"1-5\"" >> ${filename}
        echo "disk = ['file:/home/panda/Research/rt-xen/images/litmus${domID}.img,xvda,w']" >> ${filename}
        echo "vif= ['bridge=xenbr0']" >> ${filename}
        echo "bootloader = \"pygrub\"" >> ${filename}

    done
done
