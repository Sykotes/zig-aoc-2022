const std = @import("std");
pub fn day2_part1() !void {
    const file = try std.fs.cwd().openFile("input_files/day2.txt", .{ .mode = .read_only });
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const in_stream = buf_reader.reader();

    const rock: u8 = 0;
    const paper: u8 = 1;
    const scissors: u8 = 2;

    var oponent_move: u8 = undefined;
    var your_move: u8 = undefined;
    var score: u32 = 0;

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        oponent_move = line[0] - 65;
        your_move = line[2] - 88;

        switch (your_move) {
            rock => {
                score += 1;
            },
            paper => {
                score += 2;
            },
            scissors => {
                score += 3;
            },
            else => {},
        }

        if (your_move == oponent_move) {
            score += 3;
        } else if ((your_move == rock and oponent_move == scissors) or (your_move == scissors and oponent_move == paper) or (your_move == paper and oponent_move == rock)) {
            score += 6;
        }
    }
    std.debug.print("Score: {}\n", .{score});
}
