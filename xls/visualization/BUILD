# Copyright 2022 The XLS Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package(
    default_applicable_licenses = ["//:license"],
    default_visibility = ["//xls:xls_internal"],
    features = [
        "layering_check",
        "parse_headers",
    ],
    licenses = ["notice"],  # Apache 2.0
)

cc_binary(
    name = "sched_printer_main",
    srcs = ["sched_printer_main.cc"],
    visibility = ["//xls:xls_users"],
    deps = [
        "//xls/common:init_xls",
        "//xls/common/file:filesystem",
        "//xls/common/status:status_macros",
        "//xls/estimators/delay_model:analyze_critical_path",
        "//xls/estimators/delay_model:delay_estimator",
        "//xls/ir",
        "//xls/ir:ir_parser",
        "//xls/ir:op",
        "//xls/ir:verifier",
        "//xls/scheduling:pipeline_schedule",
        "//xls/scheduling:run_pipeline_schedule",
        "//xls/scheduling:scheduling_options",
        "//xls/tools:scheduling_options_flags",
        "//xls/tools:scheduling_options_flags_cc_proto",
        "@abseil-cpp//absl/container:flat_hash_map",
        "@abseil-cpp//absl/container:flat_hash_set",
        "@abseil-cpp//absl/flags:flag",
        "@abseil-cpp//absl/log",
        "@abseil-cpp//absl/log:check",
        "@abseil-cpp//absl/status",
        "@abseil-cpp//absl/status:statusor",
        "@abseil-cpp//absl/strings",
        "@abseil-cpp//absl/strings:str_format",
    ],
)
