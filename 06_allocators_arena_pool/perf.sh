sudo sysctl kernel.perf_event_paranoid=-1
perf stat -e cpu-cycles,instructions,cache-misses ./alloc_opt
