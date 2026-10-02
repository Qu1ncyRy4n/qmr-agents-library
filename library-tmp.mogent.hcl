# Provisional metadata proposal. This file is not loaded by Mogent; review and
# selectively promote its metadata into library.mogent.hcl after dogfooding.

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
    tldr  = "Shared working relationship and instruction-conflict guidance."
    tags  = ["scope/core", "topic/intro"]

    inclusion { policy = "baseline" } # rename inclusion? enforcement -> policy? usage_recommendation, vitality? defaults

    section "assistant-agent" {
      title  = "Assistant Agent"
      source = "intro/assistant-agent.md"
      tldr   = "Establish the developer-agent working relationship."
      tags   = ["topic/identity", "topic/role"]
    # git-hash = ""
    # go versioning fetching @vnum or hash...
    #
    }

# client side
# include = {
#   baseline = {
#     choose_defaults = true
#     except = {
#       "multi-agent-workflow" = true
#     }
#   }
#   optional = {
#     include_by_tag = ["*/nix" lang/rust", "tools/vc/grid] # not necesarily os/nix
#     exclude_by_tag = ["tools/vc/git", "os/nix"]
#
#   }
#   opt_in = {
#     "accessiblity/tts-and-slides-streams" = true # warns: high tokens!
#    }
# }


    section "author-ownership" {
      title  = "Author Ownership, No Agent Signatures"
      source = "intro/author-ownership.md"
      tldr   = "Keep official authorship with the developer."
      tags   = ["topic/authorship", "scope/constraints"]
    }

    section "instruction-conflicts" {
      title  = "Flag AGENTS.md Or Other Conflicts"
      source = "intro/instruction-conflicts.md"
      tldr   = "Surface material instruction conflicts with a proposed resolution."
      tags   = ["topic/conflicts", "scope/safety"]
    }
  }

  section "workflow" {
    title = "Workflow / Process"
    tldr  = "Development process, decision involvement, and reviewable delivery."
    tags  = ["scope/core", "topic/workflow"]

    inclusion { # intent or inclu-intent. Really needs this to be worded well.
      policy = "explicit" # include = { choose_defaults = true  }
      defaults = { # section defaults
        "principled-code-and-tool-use"           = true
        "developer-decision-involvement-level"   = true
        "decision-first"                         = true
        "staged-interface-development"           = true
        "git-commit-mode"                        = true
      }
    }

    section "principled-code-and-tool-use" {
      title  = "Principled Code And Tool Use"
      source = "workflow/principled-code-and-tool-use.md"
      tldr   = "Use relevant local guidance and sound defaults before inventing process."
      tags   = ["topic/workflow", "tools/guidance"]
    }

    section "developer-decision-involvement-level" {
      title  = "Developer Decision Involvement Level"
      source = "workflow/developer-decision-involvement-level.md"
      tldr   = "Match questions and approvals to the developer's desired involvement."
      tags   = ["topic/decision-making", "topic/workflow"]
    }

    section "decision-first" {
      title = "Decision First"
      tldr  = "Resolve consequential decisions before implementation detail."
      tags  = ["topic/decision-making", "topic/planning"]

      section "plan-ahead" {
        title  = "Plan Ahead"
        source = "workflow/decision-first/plan-ahead.md"
        tldr   = "Create bounded, adaptable plans before substantial work."
        tags   = ["topic/planning"]
      }
    }

    section "staged-interface-development" {
      title  = "Staged Interface Development"
      source = "workflow/staged-interface-development.md"
      tldr   = "Develop changed interfaces in observable, reviewable stages."
      tags   = ["topic/interfaces", "topic/workflow"]
    }

    section "git-commit-mode" {
      title  = "Use An Explicit Git Commit Mode"
      source = "workflow/git-commit-mode.md"
      tldr   = "Agree whether commits require a prompt or follow an approved goal."
      tags   = ["tools/git", "topic/workflow"]
    }
  }

  section "constraints" {
    title = "Constraints and Safety"
    tldr  = "Focused change, caution, documentation, approval, and security constraints."
    tags  = ["scope/constraints", "scope/core", "scope/safety"]

    inclusion { policy = "baseline" }

    section "focused-change-loop" {
      title  = "Focused Change Loop"
      source = "constraints/focused-change-loop.md"
      tldr   = "Inspect, change narrowly, validate, review the diff, and report risk."
      tags   = ["topic/focus", "topic/workflow"]
    }

    section "unknown-work-caution" {
      title  = "Unknown Work Caution"
      source = "constraints/unknown-work-caution.md"
      tldr   = "Treat existing work as owned until its scope is clear."
      tags   = ["topic/change-safety", "topic/ownership"]
    }

    section "consult-docs-first" {
      title  = "Don't Reinvent The Wheel, Consult Docs First"
      source = "constraints/consult-docs-first.md"
      tldr   = "Read local documentation and implementation before inventing solutions."
      tags   = ["topic/documentation", "topic/research"]
    }

    section "approval-for-costly-actions" {
      title  = "Keep Costly Or Irreversible Actions Approval Only, Visible, And Trackable"
      source = "constraints/approval-for-costly-actions.md"
      tldr   = "Require explicit approval for destructive, external, paid, or irreversible actions."
      tags   = ["topic/approval", "topic/irreversible-actions", "scope/safety"]
    }

    section "security" {
      title  = "Security"
      source = "constraints/security.md"
      tldr   = "Protect confidential information and avoid unsafe external actions."
      tags   = ["topic/credentials", "topic/security"]
    }
  }
}

trees {
  tree "skills" {
    root = "skills"

    entry "git-change-finalization" {
      path = "git-change-finalization"
      tldr = "Finalize a reviewed Git change cleanly."
      tags = ["skill/git-change-finalization", "tools/git"]
    }

    entry "maintain-documentation" {
      path = "maintain-documentation"
      tldr = "Maintain repository documentation with focused review."
      tags = ["skill/maintain-documentation", "topic/documentation"]
    }

    entry "nix-development" {
      path = "nix-development"
      tldr = "Work safely in a Nix development environment."
      tags = ["skill/nix-development", "lang/nix", "tools/nix"]
    }

    entry "rust-development" {
      path = "rust-development"
      tldr = "Develop and validate Rust changes."
      tags = ["skill/rust-development", "lang/rust"]
    }

    entry "shell-command-failures" {
      path = "shell-command-failures"
      tldr = "Diagnose and recover from shell command failures."
      tags = ["skill/shell-command-failures", "tools/shell"]
    }

    entry "edit-thought-experiment" {
      path = "edit-thought-experiment"
      tldr = "Edit and review a thought experiment."
      tags = ["skill/edit-thought-experiment", "topic/thought-experiments"]
    }

    entry "preserve-comment-intent" {
      path = "preserve-comment-intent"
      tldr = "Preserve the intent of meaningful code comments."
      tags = ["skill/preserve-comment-intent", "topic/comments"]
    }

    entry "cdint-grid" {
      path = "cdint-grid"
      tldr = "CDINT Grid coordination and workflow skills."
      tags = ["skill/cdint-grid", "project/cdint-grid"]
    }
  }
}
