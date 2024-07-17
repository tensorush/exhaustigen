# exhaustigen

[![CI][ci-shd]][ci-url]
[![LC][lc-shd]][lc-url]

## Exhaustive testing library based on [exhaustigen-rs](https://github.com/graydon/exhaustigen-rs).

### :rocket: Usage

- Add `exhaustigen` dependency to `build.zig.zon`.

```sh
zig fetch --save https://github.com/tensorush/exhaustigen/archive/<git_tag_or_commit_hash>.tar.gz
```

- Use `exhaustigen` dependency in `build.zig`.

```zig
const exhaustigen_dep = b.dependency("exhaustigen", .{
    .target = target,
    .optimize = optimize,
});
const exhaustigen_mod = exhaustigen_dep.module("exhaustigen");
<compile>.root_module.addImport("exhaustigen", exhaustigen_mod);
```

<!-- MARKDOWN LINKS -->

[ci-shd]: https://img.shields.io/github/actions/workflow/status/tensorush/exhaustigen/ci.yaml?branch=main&style=for-the-badge&logo=github&label=CI&labelColor=black
[ci-url]: https://github.com/tensorush/exhaustigen/blob/main/.github/workflows/ci.yaml
[lc-shd]: https://img.shields.io/github/license/tensorush/exhaustigen.svg?style=for-the-badge&labelColor=black
[lc-url]: https://github.com/tensorush/exhaustigen/blob/main/LICENSE
