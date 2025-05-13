load("@bazel_skylib//lib:paths.bzl", "paths")
load("@rules_cc//cc:defs.bzl", "CcInfo")

load(
    "//xls/contrib/xlscc/build_rules:xlscc_providers.bzl",
    "XlsccIncludeInfo",
)

def _ac_types_stub_headers_impl(ctx):
    prefix = ctx.attr.include_prefix
    out_files = []
    for f in ctx.attr.data[DefaultInfo].files.to_list():
        dst = ctx.actions.declare_file("_virtual_includes/%s/%s" % (prefix, f.basename))
        out_files.append(dst)
        ctx.actions.symlink(output = dst, target_file = f)

    include_dir = out_files[0].dirname
    include_dir = paths.dirname(include_dir)

    compilation_context = cc_common.create_compilation_context(
        headers = depset(out_files),
        includes = depset([include_dir]),  # this adds -I<include_dir>
    )
    return [
        DefaultInfo(files = depset(out_files)),
        XlsccIncludeInfo(
            files = depset(out_files),
            include_dir = [include_dir],
        ),
        CcInfo(compilation_context = compilation_context),
    ]

ac_types_stub_headers = rule(
    implementation = _ac_types_stub_headers_impl,
    attrs = {
        "data": attr.label(
            default = Label("@com_github_hlslibs_ac_types//:ac_types_as_data"),
            cfg = "target",
        ),
        "include_prefix": attr.string(mandatory = True)
    },
)

