# Analytics development

Read CONTRIBUTING.md before changing metric logic. Preserve pure functions,
missing-input refusal, method citations and the current internal package names.
Protocol decoding belongs in the protocol repository; app, storage and Bluetooth
orchestration belong in the app repository.

## Setup and checks

Run `bash scripts/setup.sh` from a fresh checkout or worktree. This prepares Dart
dev dependencies only. `scripts/dart.sh` resolves DART_BIN, PATH, the workspace's
Flutter 3.41.6 SDK. It does not install host tools.
The pubspec SDK constraint remains authoritative. CI checks Dart 3.5.0 and stable.

Run `bash scripts/dart.sh analyze --fatal-infos` and
`bash scripts/dart.sh test --concurrency=2 --reporter=expanded` before submitting.
The library intentionally ignores pubspec.lock. A checkout's first setup resolves
it; later setup uses --enforce-lockfile. Update that local resolution deliberately
when changing dependencies. Do not commit pubspec_overrides.yaml or replace the
pinned protocol Git dependency with an implicit sibling path.

## Parallel work and data

Use a separate branch and worktree per task. Each owns .dart_tool, build output,
and its local pub lockfile. This package runs no server or database, so it needs
no port reservation. Share commits between machines, not generated directories.
Agree on file ownership when tasks touch the same metric family.

Use committed synthetic fixtures for new tests. Do not copy private captures or
health databases into worktrees. Existing replay tests can skip when their
external recording is absent; report those skips separately from synthetic tests.
Algorithm changes also need the validation and app version coordination described
in CONTRIBUTING.md. Setup success does not prove device sync or physiological
accuracy.

Import the repository's Setup and Check actions in T3 for each environment.
Setup must run on worktree creation and finish before the agent starts. A checked-in
t3.json alone does not prove that the actions have been imported or run.
