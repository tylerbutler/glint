import gleam/option.{None, Some}
import gleeunit/should
import glint/help

pub fn public_help_types_can_be_constructed_test() {
  let meta: help.Metadata = help.Metadata("root", "Root command")
  let unnamed_args: help.ArgsCount = help.MinArgs(1)
  let flag = help.Flag(meta: meta, type_: "String", default: Some("default"))
  let tree =
    help.Tree(
      meta: meta,
      flags: [flag],
      subcommands: [],
      unnamed_args: Some(unnamed_args),
      named_args: ["name"],
    )

  tree.meta.name
  |> should.equal("root")

  tree.flags
  |> should.equal([flag])

  tree.subcommands
  |> should.equal([])

  tree.unnamed_args
  |> should.equal(Some(unnamed_args))

  tree.named_args
  |> should.equal(["name"])

  let no_default = help.Flag(meta: meta, type_: "Bool", default: None)
  no_default.default
  |> should.equal(None)
}
