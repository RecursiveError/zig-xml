const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const tracer = b.dependency("zig_tracer", .{}).module("zig-tracer");

    const parser = b.addModule("xml-parser", .{
        .root_source_file = b.path("src/mod.zig"),
        .target = target,
        .optimize = optimize,
    });

    parser.addImport("tracer", tracer);
}
