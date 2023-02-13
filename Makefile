# Makefile only allow Tabs when indenting code! "missing separator" error otherwise.
check: format analyze metrics
format:
	@echo "\033[32m Formatting code... \033[0m"
	@fvm dart format lib test
analyze:
	@echo "\033[32m Flutter static analysis and linter... \033[0m"
	@fvm flutter analyze
metrics:
	@echo "\033[32m Code metrics analyze: \033[0m"
	@fvm flutter pub run dart_code_metrics:metrics analyze lib
	@echo "\033[32m Code metrics check-unused-code: \033[0m"
	@fvm flutter pub run dart_code_metrics:metrics check-unused-code . --fatal-unused
	@echo "\033[32m Code metrics check-unused-files: \033[0m"
	@fvm flutter pub run dart_code_metrics:metrics check-unused-files . --fatal-unused --exclude="{bricks/**,.dart_tool/**,}"
	@echo "\033[1;32m \n\nGOOD JOB, THE CODE IS SPOTLESS CLEAN AND READY FOR PULL REQUEST! \n\033[42m Make sure to commit any code changes \033[0m  \n\n"