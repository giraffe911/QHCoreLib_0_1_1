.PHONY: lint, release, bump, tag, push

lint:
	pod lib lint --verbose --sources="https://github.com/CocoaPods/Specs.git,http://github.com/QHLib/QHLibSpecs.git"

release: bump tag push

bump:
	podspec-bump $(type) -w
	git commit -am "bump `podspec-bump --dump-version`"

tag:
	git tag "`podspec-bump --dump-version`"
	git push --tags origin master

push:
	pod repo push qhlib --verbose
