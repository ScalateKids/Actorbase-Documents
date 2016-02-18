build:
	@mkdir -p "build"
	@rm -f build/*
	@script/async_build

verify:
	@script/verify

verifygloss:
	@script/verifygloss

readability:
	@script/install
	@script/readability

readability2:
	@script/readability_alt
