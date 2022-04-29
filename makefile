.PHONY: release debug

build-dir = build
debug-dir = debug
release-dir = release

key = VmY5dG9yRFcyWk93MzJEZmhVdEk5Y3NMOA==
secret = MThCRXIxbWRESDQ2Y0podzVtVU13SGUyVGlCRXhPb3BFRHhGYlB6ZkpybG5GdXZaSjI=

release:
	@meson setup $(build-dir)/$(release-dir) \
		-Dbuildtype=release \
		-Dconsumer_key_base64=$(key) \
		-Dconsumer_secret_base64=$(secret)
	@ninja -C $(build-dir)/$(release-dir)

debug:
	@meson setup $(build-dir)/$(debug-dir) \
		-Dbuildtype=debug \
		-Dconsumer_key_base64=$(key) \
		-Dconsumer_secret_base64=$(secret)
	@ninja -C $(build-dir)/$(debug-dir)

default:
	release
