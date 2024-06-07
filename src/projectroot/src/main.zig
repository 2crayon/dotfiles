const std = @import("std");

pub fn main() !void {
    var arena_impl = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const arena = arena_impl.allocator();

    const cwd = try std.fs.cwd().realpathAlloc(arena, ".");

    var it = std.mem.tokenizeScalar(u8, cwd, '/');

    var new_path = std.ArrayList(u8).init(arena);

    var i: usize = 0;
    while (it.next()) |p| : (i += 1) {
        try new_path.append('/');
        try new_path.appendSlice(p);

        if (i == 3) {
            try std.io.getStdOut().writer().print("{s}", .{new_path.items});
            std.process.exit(0);
        }
    }

    std.process.exit(1);
}
