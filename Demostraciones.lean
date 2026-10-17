/-
  Demostraciones formales de propiedades del cálculo proposicional.
  Cada teorema usa solamente reglas constructivas de Lean 4.
-/

/--
  Demostración 1: una proposición se implica a sí misma (P → P).
  `intro` incorpora la hipótesis P y `exact` la usa como resultado.
-/
theorem identidad_implicacion (P : Prop) : P → P := by
  intro hP
  exact hP

/--
  Demostración 2: el orden de una conjunción puede intercambiarse
  ((P ∧ Q) → (Q ∧ P)). `constructor` crea las dos partes de Q ∧ P.
-/
theorem conmutatividad_conjuncion (P Q : Prop) : (P ∧ Q) → (Q ∧ P) := by
  intro hConjuncion
  constructor
  · exact hConjuncion.right
  · exact hConjuncion.left

/--
  Demostración 3: el orden de una disyunción puede intercambiarse
  ((P ∨ Q) → (Q ∨ P)). `cases` separa los dos casos posibles y
  `left` o `right` seleccionan la alternativa correspondiente.
-/
theorem conmutatividad_disyuncion (P Q : Prop) : (P ∨ Q) → (Q ∨ P) := by
  intro hDisyuncion
  cases hDisyuncion with
  | inl hP =>
      right
      exact hP
  | inr hQ =>
      left
      exact hQ

/--
  Demostración 4: si P implica Q y Q implica R, entonces P implica R
  ((P → Q) → (Q → R) → (P → R)). Las hipótesis se introducen en orden y
  se aplican una después de la otra.
-/
theorem transitividad_implicacion (P Q R : Prop) :
    (P → Q) → (Q → R) → (P → R) := by
  intro hPQ
  intro hQR
  intro hP
  exact hQR (hPQ hP)

/--
  Demostración 5: de una conjunción se puede obtener su primera parte
  ((P ∧ Q) → P). Después de `intro`, `.left` selecciona la evidencia de P.
-/
theorem eliminacion_conjuncion (P Q : Prop) : (P ∧ Q) → P := by
  intro hConjuncion
  exact hConjuncion.left

/--
  Demostración 6: una proposición implica su doble negación (P → ¬¬P).
  Se supone P y también una negación de P; aplicarlas produce la contradicción.
-/
theorem introduccion_doble_negacion (P : Prop) : P → ¬¬P := by
  intro hP
  intro hNoP
  exact hNoP hP
