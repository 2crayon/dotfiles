const std = @import("std");

pub fn main() !void {
    var arena_impl = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const arena = arena_impl.allocator();

    const cwd = try std.fs.cwd().realpathAlloc(arena, ".");

    var it = std.mem.tokenizeScalar(u8, cwd, '/');

    var new_path = std.ArrayList(u8).init(arena);

    var reached_project: bool = false;
    while (it.next()) |p| {
        try new_path.append('/');
        try new_path.appendSlice(p);

        if (reached_project) {
            try std.io.getStdOut().writer().print("{s}", .{new_path.items});
            std.process.exit(0);
        }
        if (std.mem.eql(u8, p, "src") or std.mem.eql(u8, p, "repos")) {
            reached_project = true;
        }
    }

    std.process.exit(1);
}
