#!/bin/bash
# This is the script to disable all services of the machine
# Author: Ang Chen

mount / -o remount,rw

# Disable NMI Watchdog
echo 0 > /proc/sys/kernel/nmi_watchdog

# Disable Watchdog:
echo 0 > /proc/sys/kernel/watchdog
#echo 60 > /proc/sys/kernel/watchdog_thresh


# Minimize disk activity.
echo 1 > /proc/sys/vm/laptop_mode
# No swapping to disk at all.
swapoff -a

# Set RT-priority processes to run forever.
echo -1 > /proc/sys/kernel/sched_rt_runtime_us


# Stop irqbalance.
service irqbalance stop

# Number of tasks checked for softlockup.
echo 1 > /proc/sys/kernel/hung_task_check_count



TARGET=1

NR_CPUS=$(getconf  _NPROCESSORS_ONLN)

# Migrate nocb tasks to CPU 0
# Beware, this assume that there is no online CPU > NR_CPUS
for CPU in $(seq $(($NR_CPUS-1)))
do
	PIDS=$(ps -o pid= -C rcuob/$CPU,rcuos/$CPU,rcuop/$CPU)
	for PID in $PIDS
	do
		taskset -cp 0 $PID
	done
done

# Migrate irqs to CPU 0
for D in $(ls /proc/irq)
do
	if [ -x "/proc/irq/$D" ]  && [ $D != "0" ]
	then
		echo $D
		echo 1 > /proc/irq/$D/smp_affinity
	fi
done

# Delay the annoying vmstat timer far away
sysctl vm.stat_interval=120

# Shutdown nmi watchdog as it uses perf events
sysctl -w kernel.watchdog=0

# Pin the writeback workqueue to CPU0
echo 1 > /sys/bus/workqueue/devices/writeback/cpumask

