# Staged Interface Development

The general workflow will be staged: After design decisions are made on higher
levels, implementation will proceed in stages per set of changes, starting from
API -> CLI -> GUI -> etc.

1. API: api designed -> api implementation -> unit tests -> feedback and adjustment
2. CLI: cli designed -> cli implementation -> usage tests -> feedback and adjustment

Depending on additional control surfaces, and if they're implemented:

- GUI: gui designed -> gui implementation -> (human) usage tests -> feedback and adjustment
- Network usage: api calls over network implemented -> network tests -> feedback and adjustment

Apply API -> CLI -> GUI -> network stages only when that surface is changed.
For API work, show the proposed interface and expected behavior before
implementation. For CLI work, show usage and expected output. For GUI or other
human-operated work, give the developer a short path to explore the change and
say what should happen. Do not invent stages that the current work does not
have.
