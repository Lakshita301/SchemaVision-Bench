# Final model configurations

Use one YAML file per evaluated model. Do not point two manifest model entries
at the same file. Copy `model.template.yaml`, replace every placeholder with
the provider's exact dated values, and keep API secrets only in `.env`.

For a paid run, set both of these manifest flags:

```yaml
experiment:
  require_complete_model_metadata: true
  prompts_frozen: true
```

The orchestrator then rejects missing provider/version/endpoint, vision,
pricing, token-limit, JSON-mode, retry/backoff, or retry-cost fields. It also
stores the secret-free resolved configs, prompt source snapshots, and prompt
SHA-256 hashes in the experiment output.

`module2_parsing` and `module6_direct_baseline` must declare
`vision_capable: true`. Module 3 remains text-only.
