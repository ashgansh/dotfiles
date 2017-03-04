# -*- coding: utf-8 -*-


from i3pystatus import Status

status = Status(standalone=True)

# Clock
status.register("clock",
                format="⌚ %Y-%m-%d %H:%M",)

# Disk usage (/)
status.register("disk",
                path="/",
                critical_limit=3,
                format="{avail} GiB available",)


status.run()
