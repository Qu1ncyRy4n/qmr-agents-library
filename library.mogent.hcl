library {
  format = 2
  id     = "qmr/agents"
  name   = "QMR Agent Library"
}

content {
  markdown_root = "agents"
}

sections {
  section "intro" {
    title = "Intro"
    tags  = ["intro"]
    curate = "foundation"

    section "assistant-agent" {
      title  = "Assistant Agent"
      source = "intro/assistant-agent.md"
    }

    section "author-ownership" {
      title  = "Author Ownership, No Agent Signatures"
      source = "intro/author-ownership.md"
    }

    section "instruction-conflicts" {
      title  = "Flag AGENTS.md Or Other Conflicts"
      source = "intro/instruction-conflicts.md"
    }
  }

  section "workflow" {
    title = "Workflow / Process"
    tags  = ["workflow"]
    curate = "choose"
    defaults = {
      "principled-code-and-tool-use"         = true
      "developer-decision-involvement-level" = true
      "decision-first"                       = true
      "staged-interface-development"         = true
      "git-commit-mode"                      = true
    }

    section "principled-code-and-tool-use" {
      title  = "Principled Code And Tool Use"
      source = "workflow/principled-code-and-tool-use.md"
    }

    section "developer-decision-involvement-level" {
      title  = "Developer Decision Involvement Level"
      source = "workflow/developer-decision-involvement-level.md"
    }

    section "decision-first" {
      title = "Decision First"

      section "plan-ahead" {
        title  = "Plan Ahead"
        source = "workflow/decision-first/plan-ahead.md"
      }
    }

    section "staged-interface-development" {
      title  = "Staged Interface Development"
      source = "workflow/staged-interface-development.md"
    }

    section "git-commit-mode" {
      title  = "Use An Explicit Git Commit Mode"
      source = "workflow/git-commit-mode.md"
    }
  }

  section "constraints" {
    title = "Constraints and Safety"
    tags  = ["constraints", "safety"]
    curate = "foundation"

    section "focused-change-loop" {
      title  = "Focused Change Loop"
      source = "constraints/focused-change-loop.md"
    }

    section "unknown-work-caution" {
      title  = "Unknown Work Caution"
      source = "constraints/unknown-work-caution.md"
    }

    section "consult-docs-first" {
      title  = "Don't Reinvent The Wheel, Consult Docs First"
      source = "constraints/consult-docs-first.md"
    }

    section "approval-for-costly-actions" {
      title  = "Keep Costly Or Irreversible Actions Approval Only, Visible, And Trackable"
      source = "constraints/approval-for-costly-actions.md"
    }

    section "security" {
      title  = "Security"
      source = "constraints/security.md"
      tldr   = "Protect confidential information and avoid unsafe external actions."
    }
  }
}

trees {
  tree "skills" {
    root = "skills"

    entry "git-change-finalization" {
      path = "git-change-finalization"
      tldr = "Finalize a reviewed Git change cleanly."
    }

    entry "maintain-documentation" {
      path = "maintain-documentation"
      tldr = "Maintain repository documentation with focused review."
    }

    entry "nix-development" {
      path = "nix-development"
      tldr = "Work safely in a Nix development environment."
    }

    entry "rust-development" {
      path = "rust-development"
      tldr = "Develop and validate Rust changes."
    }

    entry "shell-command-failures" {
      path = "shell-command-failures"
      tldr = "Diagnose and recover from shell command failures."
    }

    entry "edit-thought-experiment" {
      path = "edit-thought-experiment"
      tldr = "Edit and review a thought experiment."
    }

    entry "preserve-comment-intent" {
      path = "preserve-comment-intent"
      tldr = "Preserve the intent of meaningful code comments."
    }

    entry "cdint-grid" {
      path = "cdint-grid"
      tldr = "CDINT Grid coordination and workflow skills."
    }
  }
}
