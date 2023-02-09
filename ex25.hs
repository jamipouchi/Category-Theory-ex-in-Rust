listOfUnitsYoneda :: [()] -> (() -> x) -> [x]
listOfUnitsYoneda og f = map f og

-- by the Yoneda Lemma (() -> x) F x ≅ F ()