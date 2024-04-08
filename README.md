# Example repo about using Ortac/Dune

The only purpose of this repo is to demonstrate how to generate tests using Ortac/QCheckSTM and Ortac/Dune.

The most interesting part is the `dune` file of the `test` directory, that reads as follow:

```dune
(rule
 (alias runtest)
 (mode promote)
 (targets dune.inc)
 (deps
  (:spec %{project_root}/src/bob.mli))
 (action
  (with-stdout-to
   %{targets}
   (run
    ortac
    dune
    qcheck-stm
    %{spec}
    %{dep:conf.ml}
    --library=bob
    test.ml))))

(include dune.inc)
```

Arguably, this is still a quite verbose stanza. And maybe not the best dune style. But is contains the minimal information to generate and run the tests:

1. which plugin to use to generate the tests: `qcheck-stm`
2. where to read the specifications: `../src/bob.mli`
3. where to read the configuration: `conf.ml`
4. what library is it testing (to actually run the code): `bob`
5. where to write the tests: `test.ml`

Using a naming convention we could try to remove `3.` and `5.`, but that would forbid to test the same module with different configurations.
