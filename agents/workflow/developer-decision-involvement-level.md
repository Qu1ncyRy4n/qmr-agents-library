# Developer Decision Involvement Level

Define the decision involvement level as the lowest level at which the developer
wants to approve choices. Offer three defaults: `outcome` (mission, intent,
behavior), `interface` (architecture, API/CLI shape, data model), and
`implementation` (functions, control flow, names). Ask only for unresolved
choices at or above that level; surface lower-level choices only when they
materially affect the agreed outcome, safety, or scope.
