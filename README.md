# LeanLogicaProposicional

## Objetivo

Este proyecto verificará formalmente seis propiedades básicas del cálculo
proposicional con Lean 4. Las demostraciones se encuentran en
`Demostraciones.lean` y el resumen informativo de la ejecución está en
`Main.lean`.

## Estructura inicial

```text
LeanLogicaProposicional/
├── lakefile.toml
├── lean-toolchain
├── Main.lean
├── Demostraciones.lean
├── Evidencias/
│   ├── Demostracion1.lean
│   ├── Demostracion2.lean
│   ├── Demostracion3.lean
│   ├── Demostracion4.lean
│   ├── Demostracion5.lean
│   └── Demostracion6.lean
└── README.md
```

La versión fijada en `lean-toolchain` es Lean `v4.19.0`. Lake la descargará
automáticamente la primera vez que se use el proyecto mediante `elan`.

## Preparar Lean 4 en Windows

1. Instala el administrador de versiones de Lean, **elan**, en PowerShell:

   ```powershell
   winget install -e --id Lean.Elan
   ```

2. Cierra y abre una nueva terminal de PowerShell para que se actualice el
   `PATH`, y comprueba la instalación:

   ```powershell
   elan --version
   ```

3. Instala la extensión oficial **Lean 4** (`leanprover.lean4`) en Visual
   Studio Code. También puede hacerse desde una terminal donde `code` esté
   disponible:

   ```powershell
   code --install-extension leanprover.lean4
   ```

4. Abre la carpeta del proyecto en Visual Studio Code:

   ```powershell
   cd LeanLogicaProposicional
   code .
   ```

## Las seis demostraciones

Todas las propiedades reciben proposiciones de tipo `Prop`, se declaran con
`theorem` y se prueban con un bloque `by`.

1. **Identidad de la implicación:** `P → P`. `intro` recibe una evidencia de
   `P` y `exact` devuelve esa misma evidencia.
2. **Conmutatividad de la conjunción:** `(P ∧ Q) → (Q ∧ P)`. `constructor`
   abre las dos metas y `.left` y `.right` obtienen cada parte de la hipótesis.
3. **Conmutatividad de la disyunción:** `(P ∨ Q) → (Q ∨ P)`. `cases` separa
   los casos y `left` o `right` seleccionan la disyunción correcta.
4. **Transitividad de la implicación:** `(P → Q) → (Q → R) → (P → R)`.
   Se encadenan las dos implicaciones después de introducir sus hipótesis.
5. **Eliminación de la conjunción:** `(P ∧ Q) → P`. Se usa `.left` para
   extraer la primera evidencia de la conjunción.
6. **Introducción de la doble negación:** `P → ¬¬P`. Al suponer `P` y `¬P`
   se obtiene la contradicción requerida por la doble negación.

No se usan axiomas adicionales ni demostraciones incompletas.

## Comandos de configuración, compilación y ejecución

Desde la carpeta del proyecto, ejecuta:

```powershell
lake update
lake build
lake exe LeanLogicaProposicional
```

Para revisar todas las demostraciones en conjunto, también puede usarse:

```powershell
lake env lean Demostraciones.lean
```

`lake build` y `lake env lean Demostraciones.lean` hacen que Lean verifique
formalmente los teoremas. `Main.lean` importa `Demostraciones.lean`, por lo
que sus mensajes `[OK]` son solo un resumen que se alcanza tras una compilación
exitosa, no una prueba independiente.

## Capturas de pantalla

Para cada demostración hay un archivo de evidencia individual. Cada uno importa
los teoremas ya verificados y muestra dos resultados reales de Lean:

- `#check` muestra el tipo lógico que Lean aceptó.
- `#print` muestra la definición de prueba elaborada y comprobada por Lean.

En la terminal integrada, ejecuta **un comando por captura**:

```powershell
lake env lean Evidencias/Demostracion1.lean
lake env lean Evidencias/Demostracion2.lean
lake env lean Evidencias/Demostracion3.lean
lake env lean Evidencias/Demostracion4.lean
lake env lean Evidencias/Demostracion5.lean
lake env lean Evidencias/Demostracion6.lean
```

Para cada una de las seis capturas, usa solamente la terminal: ejecuta el
comando correspondiente y toma la imagen cuando aparezcan el tipo aceptado y
la definición de prueba que Lean elaboró. No es necesario abrir Visual Studio
Code para estas capturas.

Para la séptima captura, abre la terminal integrada en la carpeta del proyecto
y ejecuta:

```powershell
lake build
lake exe LeanLogicaProposicional
```

La terminal debe mostrar una compilación sin errores y el resumen de las seis
demostraciones.

## Conclusión

Lean permite comprobar que cada paso de una demostración respeta las reglas
lógicas. Por eso sirve para presentar las propiedades no solo como afirmaciones
matemáticas, sino como pruebas verificadas por un compilador.
