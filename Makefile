#
# Swift-Scripting
#

MODULE_NAME = main
SDK = macosx
ARCH = x86_64

SCRIPT_FILE = $(CURDIR)/script.swift

XCODE_PATH = /Applications/Xcode.app
XCODE_BETA_PATH = /Applications/Xcode-beta.app
SDK_PATH = $(shell xcrun --show-sdk-path --sdk $(SDK))
SRC_PATH = $(CURDIR)/src
BUILD_PATH = $(CURDIR)/build
FRAMEWORKS_PATH = $(SDK_PATH)/../../Library/Frameworks
ROME_PATH = $(CURDIR)/Rome
PODS_PATH = $(CURDIR)/Pods
SWIFT_FILES = $(wildcard $(SRC_PATH)/*.swift)

SWIFTC = $(shell xcrun -f swiftc)
SWIFT = $(shell xcrun -f swift)
CLANG = $(shell xcrun -f clang)
POD = $(shell type -p pod)

switch-beta:
	sudo xcode-select -s $(XCODE_BETA_PATH)/Contents/Developer/
	xcrun swift --version

switch-current:
	sudo xcode-select -s $(XCODE_PATH)/Contents/Developer/
	xcrun swift --version

build-swift:
	mkdir -p $(BUILD_PATH)
	$(SWIFTC) -sdk $(SDK_PATH) -F $(ROME_PATH) -Xlinker -rpath -Xlinker $(ROME_PATH) -o $(BUILD_PATH)/$(MODULE_NAME) $(SWIFT_FILES)

init-rome: clean-pods clean-rome
	$(POD) install

clean-rome:
	rm -rf $(ROME_PATH)

clean-pods:
	rm -rf $(PODS_PATH)

clean:
	rm -rf $(BUILD_PATH)

run: build-swift
	$(BUILD_PATH)/$(MODULE_NAME)

runscript:
	$(SWIFT) -sdk $(SDK_PATH) -I $(SRC_PATH) -F $(ROME_PATH) -Xlinker -rpath -Xlinker $(ROME_PATH) $(SCRIPT_FILE)

shell:
	$(SWIFT) -sdk $(SDK_PATH) -I $(SRC_PATH) -F $(ROME_PATH) -Xlinker -rpath -Xlinker $(ROME_PATH)
