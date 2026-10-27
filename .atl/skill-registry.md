# Skill Registry

**Delegator use only.** Any agent that launches sub-agents reads this registry to resolve compact rules, then injects them directly into sub-agent prompts. Sub-agents do NOT read this registry or individual SKILL.md files.

See `_shared/skill-resolver.md` for the full resolution protocol.

**Project**: fitnessgymreverseproxy (nginx reverse proxy + Docker/Compose infra repo)
**Generated**: 2026-10-07
**Scanned dirs**: `~/.config/opencode/skills/` (primary), `~/.claude/skills/` (deduped — kept opencode copies). No project-level skills (`{root}/.claude/skills`, `.gemini/skills`, `.agent/skills`, `skills/` do not exist). Skipped: `sdd-*`, `_shared`, `skill-registry`.

## User Skills

| Trigger | Skill | Path |
|---------|-------|------|
| browser automation, open website, click, screenshot, scrape, test web app | agent-browser | /home/aaron/.config/opencode/skills/agent-browser/SKILL.md |
| Akka.Hosting entity actors, sharding, reminders | akka-hosting-actor-patterns | /home/aaron/.config/opencode/skills/akka-hosting-actor-patterns/SKILL.md |
| Akka.NET + .NET Aspire config | akka-net-aspire-configuration | /home/aaron/.config/opencode/skills/akka-net-aspire-configuration/SKILL.md |
| Akka.NET best practices, EventStream vs PubSub | akka-net-best-practices | /home/aaron/.config/opencode/skills/akka-net-best-practices/SKILL.md |
| Akka.Management cluster bootstrap | akka-net-management | /home/aaron/.config/opencode/skills/akka-net-management/SKILL.md |
| Akka.NET unit/integration tests | akka-net-testing-patterns | /home/aaron/.config/opencode/skills/akka-net-testing-patterns/SKILL.md |
| public API design, wire compat, versioning | api-design | /home/aaron/.config/opencode/skills/api-design/SKILL.md |
| Aspire AppHost config emission | aspire-configuration | /home/aaron/.config/opencode/skills/aspire-configuration/SKILL.md |
| Aspire integration testing w/ xUnit | aspire-integration-testing | /home/aaron/.config/opencode/skills/aspire-integration-testing/SKILL.md |
| ServiceDefaults, OTel, resilience, health | aspire-service-defaults | /home/aaron/.config/opencode/skills/aspire-service-defaults/SKILL.md |
| ASP.NET Core Identity patterns | asp-net-core-identity-patterns | /home/aaron/.config/opencode/skills/asp-net-core-identity-patterns/SKILL.md |
| hosted services, background jobs, outbox | background-services | /home/aaron/.config/opencode/skills/background-services/SKILL.md |
| Bootstrap 5.3 UI, responsive layouts | bootstrap5-ui | /home/aaron/.config/opencode/skills/bootstrap5-ui/SKILL.md |
| PR creation (issue-first enforcement) | branch-pr | /home/aaron/.config/opencode/skills/branch-pr/SKILL.md |
| caching: output/distributed/HybridCache | caching-strategies | /home/aaron/.config/opencode/skills/caching-strategies/SKILL.md |
| PRs >400 lines, stacked/chained PRs | chained-pr | /home/aaron/.config/opencode/skills/chained-pr/SKILL.md |
| writing guides, READMEs, RFCs, docs | cognitive-doc-design | /home/aaron/.config/opencode/skills/cognitive-doc-design/SKILL.md |
| PR feedback, issue replies, review comments | comment-writer | /home/aaron/.config/opencode/skills/comment-writer/SKILL.md |
| code coverage + CRAP score analysis | crap-analysis | /home/aaron/.config/opencode/skills/crap-analysis/SKILL.md |
| async vs Channels vs Akka decision matrix | csharp-concurrency-patterns | /home/aaron/.config/opencode/skills/csharp-concurrency-patterns/SKILL.md |
| single-file C# scripts for prototyping | csharp-scripts | /home/aaron/.config/opencode/skills/csharp-scripts/SKILL.md |
| WolverineFX messaging, HTTP, outbox | csharp-wolverinefx | /home/aaron/.config/opencode/skills/csharp-wolverinefx/SKILL.md |
| avoid N+1, AsNoTracking, read/write split | database-performance | /home/aaron/.config/opencode/skills/database-performance/SKILL.md |
| Data Protection API, key management | data-protection | /home/aaron/.config/opencode/skills/data-protection/SKILL.md |
| DI registrations via IServiceCollection | dependency-injection-patterns | /home/aaron/.config/opencode/skills/dependency-injection-patterns/SKILL.md |
| accessible .NET UI, ARIA, SemanticProperties | dotnet-accessibility | /home/aaron/.config/opencode/skills/dotnet-accessibility/SKILL.md |
| adding analyzers to a .csproj | dotnet-add-analyzers | /home/aaron/.config/opencode/skills/dotnet-add-analyzers/SKILL.md |
| adding CI/CD (GitHub Actions vs Azure DevOps) | dotnet-add-ci | /home/aaron/.config/opencode/skills/dotnet-add-ci/SKILL.md |
| scaffolding test infrastructure (xUnit) | dotnet-add-testing | /home/aaron/.config/opencode/skills/dotnet-add-testing/SKILL.md |
| ADO build/test tasks, artifacts | dotnet-ado-build-test | /home/aaron/.config/opencode/skills/dotnet-ado-build-test/SKILL.md |
| composable ADO YAML pipelines | dotnet-ado-patterns | /home/aaron/.config/opencode/skills/dotnet-ado-patterns/SKILL.md |
| ADO publish, NuGet push, containers | dotnet-ado-publish | /home/aaron/.config/opencode/skills/dotnet-ado-publish/SKILL.md |
| ADO-exclusive features, environments | dotnet-ado-unique | /home/aaron/.config/opencode/skills/dotnet-ado-unique/SKILL.md |
| .NET/C# routing advisor | dotnet-advisor | /home/aaron/.config/opencode/skills/dotnet-advisor/SKILL.md |
| common agent mistakes: async, NuGet, DI | dotnet-agent-gotchas | /home/aaron/.config/opencode/skills/dotnet-agent-gotchas/SKILL.md |
| AOT-first design, source gen over reflection | dotnet-aot-architecture | /home/aaron/.config/opencode/skills/dotnet-aot-architecture/SKILL.md |
| Blazor/Uno WASM AOT, Brotli | dotnet-aot-wasm | /home/aaron/.config/opencode/skills/dotnet-aot-wasm/SKILL.md |
| DocFX / OpenAPI-as-docs | dotnet-api-docs | /home/aaron/.config/opencode/skills/dotnet-api-docs/SKILL.md |
| Identity, OAuth/OIDC, JWT, API keys | dotnet-api-security | /home/aaron/.config/opencode/skills/dotnet-api-security/SKILL.md |
| detect API changes in CI, PublicApiAnalyzers | dotnet-api-surface-validation | /home/aaron/.config/opencode/skills/dotnet-api-surface-validation/SKILL.md |
| versioning HTTP APIs (As.Versioning) | dotnet-api-versioning | /home/aaron/.config/opencode/skills/dotnet-api-versioning/SKILL.md |
| vertical slices, idempotency, error handling | dotnet-architecture-patterns | /home/aaron/.config/opencode/skills/dotnet-architecture-patterns/SKILL.md |
| UseArtifactsOutput layout | dotnet-artifacts-output | /home/aaron/.config/opencode/skills/dotnet-artifacts-output/SKILL.md |
| using .NET Aspire patterns | dotnet-aspire-patterns | /home/aaron/.config/opencode/skills/dotnet-aspire-patterns/SKILL.md |
| writing BenchmarkDotNet benchmarks | dotnet-benchmarkdotnet | /home/aaron/.config/opencode/skills/dotnet-benchmarkdotnet/SKILL.md |
| Blazor auth: AuthorizeView, Identity | dotnet-blazor-auth | /home/aaron/.config/opencode/skills/dotnet-blazor-auth/SKILL.md |
| Blazor component lifecycle, EditForm | dotnet-blazor-components | /home/aaron/.config/opencode/skills/dotnet-blazor-components/SKILL.md |
| Blazor render modes, prerender | dotnet-blazor-patterns | /home/aaron/.config/opencode/skills/dotnet-blazor-patterns/SKILL.md |
| bUnit testing of Blazor components | dotnet-blazor-testing | /home/aaron/.config/opencode/skills/dotnet-blazor-testing/SKILL.md |
| interpreting MSBuild/analyzer errors | dotnet-build-analysis | /home/aaron/.config/opencode/skills/dotnet-build-analysis/SKILL.md |
| diagnosing slow builds, binary logs | dotnet-build-optimization | /home/aaron/.config/opencode/skills/dotnet-build-optimization/SKILL.md |
| Channel<T> producer/consumer patterns | dotnet-channels | /home/aaron/.config/opencode/skills/dotnet-channels/SKILL.md |
| gate CI on perf regressions | dotnet-ci-benchmarking | /home/aaron/.config/opencode/skills/dotnet-ci-benchmarking/SKILL.md |
| CLI structure: commands/handlers, exit codes | dotnet-cli-architecture | /home/aaron/.config/opencode/skills/dotnet-cli-architecture/SKILL.md |
| AOT vs FDD, single-file, dotnet tool | dotnet-cli-distribution | /home/aaron/.config/opencode/skills/dotnet-cli-distribution/SKILL.md |
| Homebrew/winget/choco packaging | dotnet-cli-packaging | /home/aaron/.config/opencode/skills/dotnet-cli-packaging/SKILL.md |
| CLI release pipelines, matrix builds | dotnet-cli-release-pipeline | /home/aaron/.config/opencode/skills/dotnet-cli-release-pipeline/SKILL.md |
| deploying .NET containers, K8s probes, compose | dotnet-container-deployment | /home/aaron/.config/opencode/skills/dotnet-container-deployment/SKILL.md |
| multi-stage Dockerfiles, SDK container publish | dotnet-containers | /home/aaron/.config/opencode/skills/dotnet-containers/SKILL.md |
| crypto algorithm choice, AES-GCM, KDF | dotnet-cryptography | /home/aaron/.config/opencode/skills/dotnet-cryptography/SKILL.md |
| async/await, ConfigureAwait, cancellation | dotnet-csharp-async-patterns | /home/aaron/.config/opencode/skills/dotnet-csharp-async-patterns/SKILL.md |
| C# code smell review | dotnet-csharp-code-smells | /home/aaron/.config/opencode/skills/dotnet-csharp-code-smells/SKILL.md |
| Options pattern, user secrets, feature flags | dotnet-csharp-configuration | /home/aaron/.config/opencode/skills/dotnet-csharp-configuration/SKILL.md |
| MS DI keyed services, decoration | dotnet-csharp-dependency-injection | /home/aaron/.config/opencode/skills/dotnet-csharp-dependency-injection/SKILL.md |
| records, pattern matching, C# 12-15 | dotnet-csharp-modern-patterns | /home/aaron/.config/opencode/skills/dotnet-csharp-modern-patterns/SKILL.md |
| nullable reference types annotations | dotnet-csharp-nullable-reference-types | /home/aaron/.config/opencode/skills/dotnet-csharp-nullable-reference-types/SKILL.md |
| IIncrementalGenerator, GeneratedRegex | dotnet-csharp-source-generators | /home/aaron/.config/opencode/skills/dotnet-csharp-source-generators/SKILL.md |
| reading/modifying .csproj, CPM | dotnet-csproj-reading | /home/aaron/.config/opencode/skills/dotnet-csproj-reading/SKILL.md |
| EF Core vs Dapper vs ADO.NET decision | dotnet-data-access-strategy | /home/aaron/.config/opencode/skills/dotnet-data-access-strategy/SKILL.md |
| fix .NET HTTPS dev cert trust on Linux | dotnet-devcert-trust | /home/aaron/.config/opencode/skills/dotnet-devcert-trust/SKILL.md |
| docs tooling: Starlight/Docusaurus/DocFX | dotnet-documentation-strategy | /home/aaron/.config/opencode/skills/dotnet-documentation-strategy/SKILL.md |
| aggregates, value objects, domain events | dotnet-domain-modeling | /home/aaron/.config/opencode/skills/dotnet-domain-modeling/SKILL.md |
| authoring .editorconfig rules | dotnet-editorconfig | /home/aaron/.config/opencode/skills/dotnet-editorconfig/SKILL.md |
| EF Core read/write split, N+1 governance | dotnet-efcore-architecture | /home/aaron/.config/opencode/skills/dotnet-efcore-architecture/SKILL.md |
| C# file-based apps (.NET 10 SDK) | dotnet-file-based-apps | /home/aaron/.config/opencode/skills/dotnet-file-based-apps/SKILL.md |
| FileStream, RandomAccess, file I/O | dotnet-file-io | /home/aaron/.config/opencode/skills/dotnet-file-io/SKILL.md |
| GC tuning, LOH/POH, ArrayPool | dotnet-gc-memory | /home/aaron/.config/opencode/skills/dotnet-gc-memory/SKILL.md |
| setup-dotnet, NuGet caching in GHA | dotnet-gha-build-test | /home/aaron/.config/opencode/skills/dotnet-gha-build-test/SKILL.md |
| deploy .NET from GitHub Actions | dotnet-gha-deploy | /home/aaron/.config/opencode/skills/dotnet-gha-deploy/SKILL.md |
| reusable workflows, matrix, caching in GHA | dotnet-gha-patterns | /home/aaron/.config/opencode/skills/dotnet-gha-patterns/SKILL.md |
| NuGet push, container publish from GHA | dotnet-gha-publish | /home/aaron/.config/opencode/skills/dotnet-gha-publish/SKILL.md |
| README badges, CONTRIBUTING, templates | dotnet-github-docs | /home/aaron/.config/opencode/skills/dotnet-github-docs/SKILL.md |
| GitHub Releases for .NET | dotnet-github-releases | /home/aaron/.config/opencode/skills/dotnet-github-releases/SKILL.md |
| gRPC proto, host, auth | dotnet-grpc | /home/aaron/.config/opencode/skills/dotnet-grpc/SKILL.md |
| IHttpClientFactory, typed clients | dotnet-http-client | /home/aaron/.config/opencode/skills/dotnet-http-client/SKILL.md |
| input validation, ProblemDetails | dotnet-input-validation | /home/aaron/.config/opencode/skills/dotnet-input-validation/SKILL.md |
| WebApplicationFactory, Testcontainers, Aspire | dotnet-integration-testing | /home/aaron/.config/opencode/skills/dotnet-integration-testing/SKILL.md |
| PipeReader/PipeWriter, Kestrel perf | dotnet-io-pipelines | /home/aaron/.config/opencode/skills/dotnet-io-pipelines/SKILL.md |
| binary/source compat, type forwarders | dotnet-library-api-compat | /home/aaron/.config/opencode/skills/dotnet-library-api-compat/SKILL.md |
| LINQ optimization, IQueryable vs IEnumerable | dotnet-linq-optimization | /home/aaron/.config/opencode/skills/dotnet-linq-optimization/SKILL.md |
| .NET localization, .resx, IStringLocalizer | dotnet-localization | /home/aaron/.config/opencode/skills/dotnet-localization/SKILL.md |
| dotnet-tools.json local tool manifests | dotnet-local-tools | /home/aaron/.config/opencode/skills/dotnet-local-tools/SKILL.md |
| MAUI AOT, NativeAOT optimization | dotnet-maui-aot | /home/aaron/.config/opencode/skills/dotnet-maui-aot/SKILL.md |
| .NET MAUI app development, XAML/MVVM | dotnet-maui-development | /home/aaron/.config/opencode/skills/dotnet-maui-development/SKILL.md |
| Appium/XHarness MAUI testing | dotnet-maui-testing | /home/aaron/.config/opencode/skills/dotnet-maui-testing/SKILL.md |
| Mermaid diagrams for .NET | dotnet-mermaid-diagrams | /home/aaron/.config/opencode/skills/dotnet-mermaid-diagrams/SKILL.md |
| pub/sub, DLQ, sagas, outbox | dotnet-messaging-patterns | /home/aaron/.config/opencode/skills/dotnet-messaging-patterns/SKILL.md |
| Minimal APIs, route groups, TypedResults | dotnet-minimal-apis | /home/aaron/.config/opencode/skills/dotnet-minimal-apis/SKILL.md |
| modernizing outdated .NET code | dotnet-modernize | /home/aaron/.config/opencode/skills/dotnet-modernize/SKILL.md |
| authoring MSBuild targets/props | dotnet-msbuild-authoring | /home/aaron/.config/opencode/skills/dotnet-msbuild-authoring/SKILL.md |
| custom MSBuild tasks | dotnet-msbuild-tasks | /home/aaron/.config/opencode/skills/dotnet-msbuild-tasks/SKILL.md |
| MSIX packaging | dotnet-msix | /home/aaron/.config/opencode/skills/dotnet-msix/SKILL.md |
| multi-TFM, polyfill strategy | dotnet-multi-targeting | /home/aaron/.config/opencode/skills/dotnet-multi-targeting/SKILL.md |
| NativeAOT publish, ILLink descriptors | dotnet-native-aot | /home/aaron/.config/opencode/skills/dotnet-native-aot/SKILL.md |
| P/Invoke, LibraryImport marshalling | dotnet-native-interop | /home/aaron/.config/opencode/skills/dotnet-native-interop/SKILL.md |
| NuGet packaging, SDK-style csproj | dotnet-nuget-authoring | /home/aaron/.config/opencode/skills/dotnet-nuget-authoring/SKILL.md |
| OpenTelemetry traces/metrics/logs | dotnet-observability | /home/aaron/.config/opencode/skills/dotnet-observability/SKILL.md |
| OpenAPI generation, Swashbuckle | dotnet-openapi | /home/aaron/.config/opencode/skills/dotnet-openapi/SKILL.md |
| Span/ArrayPool/sealed perf patterns | dotnet-performance-patterns | /home/aaron/.config/opencode/skills/dotnet-performance-patterns/SKILL.md |
| Playwright E2E for .NET | dotnet-playwright | /home/aaron/.config/opencode/skills/dotnet-playwright/SKILL.md |
| dotnet-trace/counters/dump profiling | dotnet-profiling | /home/aaron/.config/opencode/skills/dotnet-profiling/SKILL.md |
| navigating .sln/.csproj structure | dotnet-project-analysis | /home/aaron/.config/opencode/skills/dotnet-project-analysis/SKILL.md |
| modern project structure, .slnx, CPM | dotnet-project-structure | /home/aaron/.config/opencode/skills/dotnet-project-structure/SKILL.md |
| SignalR, SSE, gRPC streaming | dotnet-realtime-communication | /home/aaron/.config/opencode/skills/dotnet-realtime-communication/SKILL.md |
| NBGV, SemVer, changelogs | dotnet-release-management | /home/aaron/.config/opencode/skills/dotnet-release-management/SKILL.md |
| Polly v8 retry/circuit breaker | dotnet-resilience | /home/aaron/.config/opencode/skills/dotnet-resilience/SKILL.md |
| Roslyn DiagnosticAnalyzer authoring | dotnet-roslyn-analyzers | /home/aaron/.config/opencode/skills/dotnet-roslyn-analyzers/SKILL.md |
| scaffold new .NET project (sln, CPM) | dotnet-scaffold-project | /home/aaron/.config/opencode/skills/dotnet-scaffold-project/SKILL.md |
| user secrets, env vars, rotation | dotnet-secrets-management | /home/aaron/.config/opencode/skills/dotnet-secrets-management/SKILL.md |
| REST vs gRPC vs SignalR vs SSE | dotnet-service-communication | /home/aaron/.config/opencode/skills/dotnet-service-communication/SKILL.md |
| Slopwatch: detect LLM reward hacking | dotnet-slopwatch | /home/aaron/.config/opencode/skills/dotnet-slopwatch/SKILL.md |
| SOLID/DRY/SRP C# anti-patterns | dotnet-solid-principles | /home/aaron/.config/opencode/skills/dotnet-solid-principles/SKILL.md |
| orienting in .NET solution | dotnet-solution-navigation | /home/aaron/.config/opencode/skills/dotnet-solution-navigation/SKILL.md |
| Spectre.Console rich output | dotnet-spectre-console | /home/aaron/.config/opencode/skills/dotnet-spectre-console/SKILL.md |
| Serilog, correlation, PII scrubbing | dotnet-structured-logging | /home/aaron/.config/opencode/skills/dotnet-structured-logging/SKILL.md |
| System.CommandLine 2.0 | dotnet-system-commandline | /home/aaron/.config/opencode/skills/dotnet-system-commandline/SKILL.md |
| Terminal.Gui v2 TUI | dotnet-terminal-gui | /home/aaron/.config/opencode/skills/dotnet-terminal-gui/SKILL.md |
| unit vs integration vs E2E decision | dotnet-testing-strategy | /home/aaron/.config/opencode/skills/dotnet-testing-strategy/SKILL.md |
| coverlet, Stryker, flaky detection | dotnet-test-quality | /home/aaron/.config/opencode/skills/dotnet-test-quality/SKILL.md |
| global/local dotnet tools, version pinning | dotnet-tool-management | /home/aaron/.config/opencode/skills/dotnet-tool-management/SKILL.md |
| trimming, ILLink annotations | dotnet-trimming | /home/aaron/.config/opencode/skills/dotnet-trimming/SKILL.md |
| writing TUnit tests | dotnet-tunit-test | /home/aaron/.config/opencode/skills/dotnet-tunit-test/SKILL.md |
| Blazor/MAUI/Uno/WPF UI choice tree | dotnet-ui-chooser | /home/aaron/.config/opencode/skills/dotnet-ui-chooser/SKILL.md |
| page objects, selectors, UI test layers | dotnet-ui-testing-core | /home/aaron/.config/opencode/skills/dotnet-ui-testing-core/SKILL.md |
| Uno MCP tool detection workflow | dotnet-uno-mcp | /home/aaron/.config/opencode/skills/dotnet-uno-mcp/SKILL.md |
| Uno Platform, MVUX, Hot Reload | dotnet-uno-platform | /home/aaron/.config/opencode/skills/dotnet-uno-platform/SKILL.md |
| Uno per-target deploy (WASM/iOS/Android) | dotnet-uno-targets | /home/aaron/.config/opencode/skills/dotnet-uno-targets/SKILL.md |
| Uno testing across runtimes | dotnet-uno-testing | /home/aaron/.config/opencode/skills/dotnet-uno-testing/SKILL.md |
| detect TFMs/SDK versions | dotnet-version-detection | /home/aaron/.config/opencode/skills/dotnet-version-detection/SKILL.md |
| LTS-to-LTS TFM upgrades | dotnet-version-upgrade | /home/aaron/.config/opencode/skills/dotnet-version-upgrade/SKILL.md |
| WinForms on .NET 8+ | dotnet-winforms-basics | /home/aaron/.config/opencode/skills/dotnet-winforms-basics/SKILL.md |
| WinUI 3, Windows App SDK | dotnet-winui | /home/aaron/.config/opencode/skills/dotnet-winui/SKILL.md |
| WPF/WinForms migration to modern .NET | dotnet-wpf-migration | /home/aaron/.config/opencode/skills/dotnet-wpf-migration/SKILL.md |
| WPF modern, MVVM Toolkit | dotnet-wpf-modern | /home/aaron/.config/opencode/skills/dotnet-wpf-modern/SKILL.md |
| XML doc comments, GenerateDocumentationFile | dotnet-xml-docs | /home/aaron/.config/opencode/skills/dotnet-xml-docs/SKILL.md |
| xUnit v3 tests, fixtures, parallelism | dotnet-xunit | /home/aaron/.config/opencode/skills/dotnet-xunit/SKILL.md |
| EF Core NoTracking, migrations, interceptors | efcore-patterns | /home/aaron/.config/opencode/skills/efcore-patterns/SKILL.md |
| global exception handling, ProblemDetails | exception-handling | /home/aaron/.config/opencode/skills/exception-handling/SKILL.md |
| feature flags, gradual rollouts | feature-flags | /home/aaron/.config/opencode/skills/feature-flags/SKILL.md |
| file uploads, streaming, storage abstraction | file-handling | /home/aaron/.config/opencode/skills/file-handling/SKILL.md |
| discover/install agent skills | find-skills | /home/aaron/.config/opencode/skills/find-skills/SKILL.md |
| Fly.io deploy, fly.toml, Machines, volumes | fly-io | /home/aaron/.config/opencode/skills/fly-io/SKILL.md |
| Go tests, Bubbletea TUI testing | go-testing | /home/aaron/.config/opencode/skills/go-testing/SKILL.md |
| IHttpClientFactory + Polly retries/timeouts | http-client-resilience | /home/aaron/.config/opencode/skills/http-client-resilience/SKILL.md |
| decompiling .NET with ILSpy | ilspy-decompile | /home/aaron/.config/opencode/skills/ilspy-decompile/SKILL.md |
| GitHub issue creation (issue-first) | issue-creation | /home/aaron/.config/opencode/skills/issue-creation/SKILL.md |
| adversarial dual blind review | judgment-day | /home/aaron/.config/opencode/skills/judgment-day/SKILL.md |
| multi-language, .resx, culture formatting | localization-globalization | /home/aaron/.config/opencode/skills/localization-globalization/SKILL.md |
| .NET local tool management | local-tools | /home/aaron/.config/opencode/skills/local-tools/SKILL.md |
| Serilog, correlation IDs, health checks | logging-observability | /home/aaron/.config/opencode/skills/logging-observability/SKILL.md |
| local email testing w/ Mailpit + Aspire | mailpit-integration | /home/aaron/.config/opencode/skills/mailpit-integration/SKILL.md |
| publish skills to dotnet-skills marketplace | marketplace-publishing | /home/aaron/.config/opencode/skills/marketplace-publishing/SKILL.md |
| config providers, IValidateOptions | microsoft-extensions-configuration | /home/aaron/.config/opencode/skills/microsoft-extensions-configuration/SKILL.md |
| MS.Extensions.DI lifetimes, keyed, decorators | microsoft-extensions-dependency-injection | /home/aaron/.config/opencode/skills/microsoft-extensions-dependency-injection/SKILL.md |
| custom middleware, IExceptionHandler | middleware-patterns | /home/aaron/.config/opencode/skills/middleware-patterns/SKILL.md |
| MJML responsive email templates | mjml-email-templates | /home/aaron/.config/opencode/skills/mjml-email-templates/SKILL.md |
| modern C#: records, Span, ValueTask | modern-csharp-coding-standards | /home/aaron/.config/opencode/skills/modern-csharp-coding-standards/SKILL.md |
| OTel instrumentation in .NET code | OpenTelemetry-NET-Instrumentation | /home/aaron/.config/opencode/skills/OpenTelemetry-NET-Instrumentation/SKILL.md |
| CPM, NuGet versioning strategies | package-management | /home/aaron/.config/opencode/skills/package-management/SKILL.md |
| Playwright E2E for Blazor | playwright-blazor | /home/aaron/.config/opencode/skills/playwright-blazor/SKILL.md |
| Blazor UI tests with Playwright | playwright-blazor-testing | /home/aaron/.config/opencode/skills/playwright-blazor-testing/SKILL.md |
| cache Playwright browsers in CI | playwright-ci-caching | /home/aaron/.config/opencode/skills/playwright-ci-caching/SKILL.md |
| solution structure, .slnx, CPM conventions | project-structure | /home/aaron/.config/opencode/skills/project-structure/SKILL.md |
| fixed/sliding/token bucket rate limits | rate-limiting | /home/aaron/.config/opencode/skills/rate-limiting/SKILL.md |
| Razor syntax / tag helpers | Razor | /home/aaron/.config/opencode/skills/Razor/SKILL.md |
| CSP, HSTS, X-Frame-Options, security middleware | security-headers | /home/aaron/.config/opencode/skills/security-headers/SKILL.md |
| JSON/binary serialization, STJ source-gen | serialization | /home/aaron/.config/opencode/skills/serialization/SKILL.md |
| SignalR hubs, WebSocket groups | signalr-integration | /home/aaron/.config/opencode/skills/signalr-integration/SKILL.md |
| create new agent skills | skill-creator | /home/aaron/.config/opencode/skills/skill-creator/SKILL.md |
| skills index / marketplace snippets | skills-index-snippets | /home/aaron/.config/opencode/skills/skills-index-snippets/SKILL.md |
| slopwatch CLI quality gates | slopwatch | /home/aaron/.config/opencode/skills/slopwatch/SKILL.md |
| Verify snapshots for API/UI responses | snapshot-testing | /home/aaron/.config/opencode/skills/snapshot-testing/SKILL.md |
| Testcontainers for real infra in tests | testcontainers | /home/aaron/.config/opencode/skills/testcontainers/SKILL.md |
| TestContainers xUnit integration tests | testcontainers-integration-tests | /home/aaron/.config/opencode/skills/testcontainers-integration-tests/SKILL.md |
| struct vs class, sealed, FrozenDictionary | type-design-performance | /home/aaron/.config/opencode/skills/type-design-performance/SKILL.md |
| FluentValidation, DataAnnotations, ProblemDetails | validation-patterns | /home/aaron/.config/opencode/skills/validation-patterns/SKILL.md |

## Compact Rules

Pre-digested rules per skill. Delegators copy matching blocks into sub-agent prompts as `## Project Standards (auto-resolved)`.

Curated for this repo's stack (nginx + Docker/Compose + secrets + config-only repo). For skills listed in the table without a block below, the delegator should read the full SKILL.md before injecting rules.

### dotnet-container-deployment
- Docker Compose is the local-dev orchestrator; K8s manifests (Deployment/Service/probes) are the prod path — don't mix concerns
- Health probes must hit a real `/health` endpoint the app serves, not `/`
- Compose services need explicit `depends_on` + healthchecks; don't rely on start order
- Env-specific compose files (local/prod) must share one base file — never duplicate whole configs
- Container ports must match what the proxy targets (`api:5274`, `frontend:5062` in dev; `127.0.0.1:8090/8091` on prod host)
- CI/CD builds and pushes images — never build on the production host

### dotnet-containers
- Multi-stage Dockerfile: SDK stage for build, `aspnet`/runtime stage for run — final image never contains the SDK
- Order Dockerfile layers: csproj restore BEFORE copying source (layer caching)
- Never run as root — use non-root user / `USER` directive or rootless
- Define `HEALTHCHECK` or rely on orchestrator probes pointing to the app's health endpoint
- `dotnet publish` container feature (.NET 8+) is an alternative to hand-written Dockerfiles — pick one, don't blend
- Pin base image tags (major.minor) — `latest` breaks reproducibility

### dotnet-secrets-management
- NEVER commit secrets, connection strings, or API keys — not in appsettings.json, not in compose files, not in nginx env templates
- Local dev → user secrets; production → environment variables injected by the secret manager (bws / Bitwarden Secrets Manager in this stack)
- envsubst templates must reference `${VAR}` placeholders only — resolved at deploy time from bws, never hard-coded
- Rotate secrets on suspicion; treat any secret pushed to git as compromised
- Bind config via Options pattern (`IOptions<T>`), don't read env vars scattered through code

### security-headers (applies to nginx proxy context)
- The nginx edge is a good place to set: `X-Frame-Options`, `X-Content-Type-Options`, `Referrer-Policy`, HSTS (prod, HTTPS only)
- HSTS only on HTTPS responses — sending it over HTTP permanently bricks access for unconfigured clients
- CSP must be tuned to the app's actual script/style sources — start report-only, then enforce
- `add_header` in a `location` block INHERITS nothing from `server` — re-declare headers per location or they vanish (nginx gotcha: add_header is not inherited when a child block defines its own)
- Always `always` suffix so headers ship on error responses too
- `server_tokens off` on prod (already present in nginx.prod.conf.bak)

### logging-observability
- Structured logs beat free-text; correlate requests across nginx → API with `X-Request-ID` / correlation header passed through the proxy
- nginx `log_format` must capture `$request_time` for latency analysis (current config lacks it — candidate for improvement)
- Health endpoints must not spam access logs at the same level as real traffic
- Separate access/error logs per environment; the prod config already uses `dotnet-app-access.log` / `dotnet-app-error.log`
- Timeouts must be consistent across layers: proxy read/send (3600s for SignalR), app, DB — the longest leg wins

### dotnet-gha-patterns
- Use `workflow_call` reusable workflows + composite actions for shared steps; avoid copy-pasted YAML
- Path-based triggers (`paths:`) so infra changes only run infra jobs — this repo would trigger on `nginx*.conf`
- Concurrency groups cancel superseded runs on the same branch
- Cache NuGet (`actions/cache` / `setup-dotnet` cache) keyed on lockfile hash
- `workflow_dispatch` inputs for manual deploy gates; environment protection rules for prod

### agent-browser (verification substitute — no test runner in this repo)
- Workflow: launch → navigate → assert visible state → screenshot → close; keep sessions short
- Prefer assertions on text/selectors over screenshots for pass/fail decisions
- Use it for end-to-end smoke tests of the proxy (`/`, `/api`, `/health`, `/reservacionesHub`) after config changes
- Screenshots are evidence, not tests — pair them with explicit assertions

### dotnet-integration-testing (relevant for sibling `gym` repo, not this one)
- `WebApplicationFactory<TEntryPoint>` for in-process API tests; package version must match the app's TFM major
- Testcontainers for disposable DBs/queues — no shared dev servers in tests
- One fixture per test class scope; reset state between tests, don't share mutable singletons
- Never assert on infra you don't control; health checks gate readiness before tests run

### dotnet-devcert-trust (SSL/letsencrypt troubleshooting)
- `dotnet dev-certs https --trust` only covers local dev — prod uses letsencrypt certs at `/etc/letsencrypt/live/{domain}/`
- `UntrustedRoot` on Linux → cert not in system CA bundle; `RemoteCertificateNameMismatch` → SNI/domain mismatch
- nginx TLS failures: verify cert/key paths exist INSIDE the container/host where nginx runs, and `dhparam.pem` is present
- Validate with `nginx -t` before reload; reload (not restart) preserves established connections

### work-unit-commits
- Commit by work unit (deliverable behavior/fix/docs), never by file type
- Tests + docs go in the SAME commit as the code they describe
- Each commit message must tell the story from diff + message alone
- If SDD tasks forecast >400 lines → split into chained PR slices before implementing
- Conventional commits only; NEVER add Co-Authored-By / AI attribution (project rule)

### issue-creation
- Blank issues disabled — always use the bug/feature template
- Every issue gets `status:needs-review`; maintainer must set `status:approved` before any PR
- Questions → Discussions, not issues

### branch-pr
- Every PR MUST link exactly one approved issue — no exceptions
- Exactly one `type:*` label per PR; automated checks must pass before merge
- Blank PRs without issue linkage are blocked by GitHub Actions

### cognitive-doc-design
- Lead with the answer/decision; context after (this repo's README is empty — prime candidate)
- Progressive disclosure: happy path first, edge cases later
- Chunk with headings; signpost with labels/tables/callouts
- Recognition over recall: prefer tables/checklists over prose
- Design docs so reviewers verify intent without reconstructing the story

### http-client-resilience (backend behavior behind the proxy)
- Use `IHttpClientFactory` named/typed clients — never `new HttpClient()` per request (socket exhaustion)
- Retry only idempotent operations; Polly for retry/circuit breaker/timeout
- Timeouts must be shorter than the nginx `proxy_read_timeout` leg or the proxy masks app failures
- Circuit breaker prevents cascade failures — essential when API and frontend are behind the same edge

### find-skills
- Use when the user asks "how do I do X" / "is there a skill for X" / wants to extend capabilities
- Search the registry/index first, don't invent skills
- Install only skills with clear triggers and LLM-first structure

## Project Conventions

| File | Path | Notes |
|------|------|-------|
| (project root) | — | No `AGENTS.md`, `agents.md`, `CLAUDE.md`, `.cursorrules`, `GEMINI.md`, or `copilot-instructions.md` found in project root |
| Global agent config | /home/aaron/.config/opencode/AGENTS.md | Applies to all projects: conventional commits (no AI attribution), never build after changes, verify claims with evidence, Spanish→Rioplatense voseo, push back on code-without-context, Engram save protocol |

Read the convention file listed above for project-specific patterns and rules.
