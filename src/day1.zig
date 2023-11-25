const std = @import("std");

pub fn day1() !void {
    const file = try std.fs.cwd().openFile("input_files/day1.txt", .{ .mode = .read_only });
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const in_stream = buf_reader.reader();

    var number: u32 = 0;
    var total: u32 = 0;

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        number = std.fmt.parseInt(u32, line, 10) catch 0;
        total += number;
    }
    std.debug.print("Hello, world! (total: {})\n", .{total});
}
