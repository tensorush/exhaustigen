const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const root_source_file = b.path("src/Gen.zig");
    const version = std.SemanticVersion{ .major = 0, .minor = 1, .patch = 0 };

    // Module
    _ = b.addModule("Gen", .{ .root_source_file = root_source_file });

    // Library
    const lib_step = b.step("lib", "Install library");

    const lib = b.addStaticLibrary(.{
        .name = "Gen",
        .target = target,
        .version = version,
        .optimize = optimize,
        .root_source_file = root_source_file,
    });

    const lib_install = b.addInstallArtifact(lib, .{});
    lib_step.dependOn(&lib_install.step);
    b.default_step.dependOn(lib_step);

    // Test suite
    const tests_step = b.step("test", "Run test suite");

    const tests = b.addTest(.{
        .target = target,
        .version = version,
        .root_source_file = root_source_file,
    });

    const tests_run = b.addRunArtifact(tests);
    tests_step.dependOn(&tests_run.step);
    b.default_step.dependOn(tests_step);

    // Formatting checks
    const fmt_step = b.step("fmt", "Run formatting checks");

    const fmt = b.addFmt(.{
        .paths = &.{
            "src/",
            "build.zig",
        },
        .check = true,
    });
    fmt_step.dependOn(&fmt.step);
    b.default_step.dependOn(fmt_step);
}
