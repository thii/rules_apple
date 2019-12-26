# Copyright 2019 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Partial implementation for the AppleBundleInfo provider."""

load(
    "@build_bazel_rules_apple//apple:providers.bzl",
    "AppleResourceBundleInfo",
)
load(
    "@bazel_skylib//lib:partial.bzl",
    "partial",
)

def _apple_resource_bundle_info_partial_impl(ctx, bundle_id):
    """Implementation for the AppleResourceBundleInfo processing partial."""

    return struct(
        providers = [
            AppleResourceBundleInfo(
                bundle_id = bundle_id,
            ),
        ],
    )

def apple_resource_bundle_info_partial(bundle_id = None):
    """Constructor for the AppleResourceBundleInfo processing partial.

    This partial propagates the AppleResourceBundleInfo provider for this target.

    Args:
      bundle_id: The bundle ID to configure for this target.

    Returns:
      A partial that returns the AppleResourceBundleInfo provider.
    """
    return partial.make(
        _apple_resource_bundle_info_partial_impl,
        bundle_id = bundle_id,
    )
