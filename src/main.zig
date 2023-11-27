const day1 = @import("day1.zig");
const day2 = @import("day2.zig");

pub fn main() !void {
    try day1.day1_part1();
    try day1.day1_part2();
    try day2.day2_part1();
    try day2.day2_part2();
}
