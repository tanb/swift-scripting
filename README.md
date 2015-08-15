# swift-scripting

## Requisites
Cocoapods (install via gem)
Cocoapods-Rome (install via gem)

## Makefile
Switch to Swift2.0 in Xcode-beta.app
```
$ make switch-beta
```

Switch to current version Swift 1.2 (It can't run this repo's scripts. These are written in 2.0.)
```
$ make switch-current
```

Run Swift REPL
```
$ make shell
```

Build src directory swift script
```
$ make build-swift
```

Build and run
```
$ make run
```

Run swift script
```
$ make runscript SCRIPT_FILE="csv_script.swift"
```
