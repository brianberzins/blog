## Continuous Integration

I have a fair number of strong held opinions on CI systems.
The things I have found to be most important:
- The method of testing is itself defined in code.
- The code doing the testing lives alongside the code being tested.
- Testing is independent of previous and future tests.

This tends to look like declarative pipelines, defined next to the code, with immutable and ephemeral testing nodes.