(rule
 (alias runtest)
 (mode promote)
 
 (deps
  (package ortac-qcheck-stm))
 (targets test.ml)
 (action
  (setenv
   ORTAC_ONLY_PLUGIN
   qcheck-stm
   (with-stdout-to
    %{targets}
    (run
     ortac
     qcheck-stm
     %{dep:../src/bob.mli}
     %{dep:conf.ml}
     --quiet)))))

(test
 (name test)
 (modules test)
 (libraries
  bob
  qcheck-stm.stm
  qcheck-stm.sequential
  qcheck-multicoretests-util
  ortac-runtime-qcheck-stm)
 
 (action
  (run
   %{test}
   --verbose)))
