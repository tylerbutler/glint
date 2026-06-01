//// Stable, public introspection API for glint command trees.
////
//// This module is intended for tools that auto-generate reference
//// documentation from a command tree, such as Markdown, JSON, manpages, or
//// other formats. Use `glint.document/1` as the entry point for producing
//// these public help values.

import gleam/option.{type Option}
import glint/internal/help as internal

pub type Metadata =
  internal.Metadata

pub type ArgsCount =
  internal.ArgsCount

pub type Flag {
  Flag(meta: internal.Metadata, type_: String, default: Option(String))
}

pub type Tree {
  Tree(
    meta: internal.Metadata,
    flags: List(Flag),
    subcommands: List(Tree),
    unnamed_args: Option(internal.ArgsCount),
    named_args: List(String),
  )
}
