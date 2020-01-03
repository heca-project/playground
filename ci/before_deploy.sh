#!/bin/sh

set -e
cargo build --target "$TARGET" --release --target-dir=/tmp/heca

set -e
strip "/tmp/heca/$TARGET/release/playground"
name="playground-${TRAVIS_TAG}-${TARGET}"
mkdir -p /tmp/heca-staging-1
mkdir -p /tmp/heca-staging
cp "/tmp/heca/$TARGET/release/heca" "/tmp/heca-staging-1/$name"
xz "/tmp/heca-staging-1/$name"
cp "/tmp/heca-staging-1/$name.xz" "/tmp/heca-staging/"
cp "/tmp/heca/$TARGET/release/playground" "/tmp/heca-staging/$name"
