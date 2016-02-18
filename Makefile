default:
	@script/install

build:
	@mkdir -p "build"
	@rm -f build/*
	@script/async_build

verify:
	@script/verify

verifygloss:
	@script/verifygloss

readability:
	@script/readability

