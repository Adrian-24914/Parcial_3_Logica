import Demostraciones

/--
  Punto de entrada del proyecto.

  La importación hace que Lean compruebe todos los teoremas de
  `Demostraciones.lean` antes de que este programa pueda ejecutarse.
  Los mensajes siguientes son un resumen informativo de esa compilación.
-/
def main : IO Unit := do
  IO.println "============================================"
  IO.println " PROYECTO: LOGICA PROPOSICIONAL EN LEAN 4"
  IO.println "============================================"
  IO.println ""
  IO.println "Verificacion de demostraciones formales"
  IO.println ""
  IO.println "[OK] 1. Identidad de la implicacion"
  IO.println "[OK] 2. Conmutatividad de la conjuncion"
  IO.println "[OK] 3. Conmutatividad de la disyuncion"
  IO.println "[OK] 4. Transitividad de la implicacion"
  IO.println "[OK] 5. Eliminacion de la conjuncion"
  IO.println "[OK] 6. Introduccion de la doble negacion"
  IO.println ""
  IO.println "============================================"
  IO.println " RESULTADO: 6 DEMOSTRACIONES VERIFICADAS"
  IO.println "============================================"
