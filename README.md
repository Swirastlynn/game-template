Bloc/Cubit MVP Architecture with the tests set up - just a template to copy-paste repository to add the game inside.

### How do I get set up?

FVM
Install [fvm](https://fvm.app/) on your machine. Project configuration for fvm is in [.fvm/fvm_config.json](.fvm/fvm_config.json). To set up the same Flutter SDK version like the one I was working on, run in your project path: 
```bash
fvm install
``` 

## Testing
How to run tests:
```
flutter test
```

To be able to see the code coverage:
1. Install Coverage Gutters VS plugin
2. Set in your `settings.json` a `"coverage-gutters.showGutterCoverage": true` line to see which lines are test-uncovered. Or `false` to be able to set up breakpoints. There's a bug (13.02.2023) so you can't do both at the same time.

## Before Pull Request

Call 
```
make check
```
from command line. 

The command setup is in the `Makefile` at the root directory. It formats code, calls static analysis, linter, and a few code metrics. If everything is fine, you'll see `GOOD JOB, THE CODE IS SPOTLESS CLEAN AND READY FOR PULL REQUEST!`.

### Next steps

* Think about smarter than get_it (service locator) solution for Dependency Injection. Riverpod and its Providers? 
They give possibility to _scope_, so the operational memory would be used more efficient for injected objects.
* Set up rules for the other devs to unify how we code, eg. use trailing commas
* Set up code of conduct for code reviews, pull requests
* Graphic description of the architecture while it's close to complete (there's ALWAYS room for improvement, but we have to stop engineering and accept some amount of technical debt)
* Set up flavors for iOS/Android along with remote events logging
* Tablet/desktop version
* Advanced static analysis, custom lint rules added after few months of coding to avoid repeatable code review discussions
* Some kind of widget/integration tests, preferably screenshot tests - faster to write. Especially if there would be a few developers in the project.
* CI/CD
* Streamline development process with mvp architecture code generator. One will be able to write a feature with a page, a presenter, use cases with unit tests by using only few commands:
```
mason make presenter
mason make usecase
mason make page // voila 300 lines of clean code in a minute
```
Thanks to `mason` creating code from templates.