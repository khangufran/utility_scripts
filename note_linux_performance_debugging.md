# First steps
1. uptime : to check how load average is changing over time (1m, 5m, 15m are the intervals)
2. dmesg | tail : to check system logs
3. vmstat 1 : to check overall system metrics
4. mpstat -P ALL 1 : to check cpu balance and individual processor metrics
5. pidstat 1 : to which processes are using too much cpu
6. iostat -xz 1 : to check disk i/o
7. free -m : to check memory health
8. sar -n DEV 1 : to check network metrics and if any limit is being reached here
9. sar -n TCP,ETCP 1 : to check tcp stats
10. top : (press E to make all memory shown in mb)

# How to approach, what should be first step
**Problem** My system is slow, I need to find the reason

**Most Probable Reason** If first steps don't show anything maybe issue doesn't exist and problem is with applications logic or physical limitations of hardware itself

**Checklist before starting to debug**
- [ ] What makes you think there is a performance problem?
- [ ] Has this system ever performed well?
- [ ] What has changed recently? (Software? Hardware? Load?)
- [ ] Does the problem affect other people or just a single person?
- [ ] What is the physical configuration of system? What are the limits of hardware?
