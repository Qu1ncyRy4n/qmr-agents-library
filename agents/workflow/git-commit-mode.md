# Use An Explicit Git Commit Mode

Use one commit mode for each task:

- **Commit only when asked:** prepare, validate, and report the change, but do
  not create a commit until the developer asks.
- **Goal -> atomic commits:** when the developer explicitly authorizes a goal,
  make focused commits as independently valid milestones toward it. Each commit
  must contain one coherent change and its relevant validation.

Default to commit only when asked. Before the first commit, state the selected
mode if it is not already clear from the task. In either mode, preserve
unrelated work, stage explicitly, and do not push, open a pull request, force an
operation, or make another external Git change unless the developer asks.
