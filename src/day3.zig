const std = @import("std");

pub fn part1() !void {
    const file = try std.fs.cwd().openFile("input_files/day3.txt", .{ .mode = .read_only });
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const in_stream = buf_reader.reader();

    var first_half: []u8 = undefined;
    var second_half: []u8 = undefined;
    var count: u32 = 0;

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        count += 1;
        first_half = line[0 .. line.len / 2];
        second_half = line[line.len / 2 .. line.len];

        outer: for (first_half) |c1| {
            for (second_half) |c2| {
                if (c1 == c2) {
                    if (c1 >= 'a') {
                        count += c1 - 'a';
                    } else {
                        count += (c1 - 'A') + 26;
                    }
                    break :outer;
                }
            }
        }
    }
    std.debug.print("Day3 Part1) Total: {}\n", .{count});
}
