.PHONY: tests

tests:
	@echo "Running coverage tests"
	@flutter test --coverage
	@genhtml coverage/lcov.info -o coverage/html
	@echo "Oppening coverage report"
	@open coverage/html/index.html