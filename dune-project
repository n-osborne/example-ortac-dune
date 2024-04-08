(lang dune 3.14)
(generate_opam_files)

(package
 (maintainers "bob")
 (synopsis "Something")
 (name bob)
 (depends
  ortac-dune
  ortac-qcheck-stm
  ortac-runtime-qcheck-stm))
