# Contributing to Deliberate Skills

Thanks for your interest in contributing! This project aims to be the deepest planning and most disciplined execution skills in the Claude Code ecosystem.

## How to Contribute

### Bug Reports
Open an issue with:
- What you expected to happen
- What actually happened
- Steps to reproduce
- Your Claude Code version and model

### New Features
1. Open an issue describing the feature and why it matters
2. Reference research or competitor analysis if applicable
3. Wait for discussion before starting work

### Pull Requests
1. Fork the repo
2. Create a branch: `git checkout -b feature/your-feature`
3. Make changes following the guidelines below
4. Test with real Claude Code usage
5. Submit PR with description of changes and testing done

## Skill Authoring Guidelines

Follow Anthropic's official best practices:

- **SKILL.md under 500 lines** — move detailed content to `references/`
- **Description in third person** — "Produces plans" not "You can use this to plan"
- **Description = trigger conditions only** — no workflow summary (Claude shortcuts it)
- **Imperative language** — "Write failing test" not "Consider writing a test"
- **Progressive disclosure** — metadata → SKILL.md → references → scripts
- **Only teach what Claude doesn't know** — your workflow, not general coding

## Areas Where Help Is Needed

- **Eval framework**: Formal testing using Anthropic's skill-creator framework
- **Example outputs**: More sample plans and execution reports for different task types
- **Browser UAT patterns**: Test patterns for different app types (SPA, API, mobile web)
- **Hook improvements**: Better drift detection and state management
- **Documentation**: Architecture deep-dives, troubleshooting guides

## Code of Conduct

Be constructive. Focus on making the tools better. Respect different workflows and preferences.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
