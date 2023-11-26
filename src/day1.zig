const std = @import("std");

pub fn day1_part1() !void {
    const file = try std.fs.cwd().openFile("input_files/day1.txt", .{ .mode = .read_only });
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const in_stream = buf_reader.reader();

    var number: u32 = 0;
    var elf_total: u32 = 0;
    var max: u32 = 0;

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        number = std.fmt.parseInt(u32, line, 10) catch 0;
        if (number > 0) {
            elf_total += number;
        } else {
            if (elf_total > max) {
                max = elf_total;
            }
            elf_total = 0;
        }
    }
    std.debug.print("Highest: {}\n", .{max});
}

pub fn day1_part2() !void {
    const file = try std.fs.cwd().openFile("input_files/day1.txt", .{ .mode = .read_only });
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const in_stream = buf_reader.reader();

    var number: u32 = 0;
    var elf_total: u32 = 0;
    var top1: u32 = 0;
    var top2: u32 = 0;
    var top3: u32 = 0;

    var temp: u32 = 0;

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        number = std.fmt.parseInt(u32, line, 10) catch 0;
        if (number > 0) {
            elf_total += number;
        } else {
            if (elf_total > top3) {
                top3 = elf_total;
            }
            if (top3 > top2) {
                temp = top2;
                top2 = top3;
                top3 = temp;
            }
            if (top2 > top1) {
                temp = top1;
                top1 = top2;
                top2 = temp;
            }
            elf_total = 0;
        }
    }
    const top3_total = top1 + top2 + top3;
    std.debug.print("Total of top 3: {}\n", .{top3_total});
}
