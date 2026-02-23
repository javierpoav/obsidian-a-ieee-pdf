#!/bin/bash

echo "⚙️ Iniciando generación con el formato de Autor corregido..."

# 1. Asegurar la plantilla IEEE
if [ ! -f "IEEEtran.cls" ]; then
    wget -qO IEEEtran.cls https://mirrors.ctan.org/macros/latex/contrib/IEEEtran/IEEEtran.cls
fi

# 2. Archivo temporal con las variables nativas de Pandoc (El secreto es la barra '|')
cat << 'EOF' > temp_limpio.md
---
title: "Sistemas de Numeración y Conversiones"
author: |
  \IEEEauthorblockN{Javier Pozos Avila}
  \IEEEauthorblockA{\textit{Facultad de Ciencias de la Computación} \\
  \textit{Benemérita Universidad Autónoma de Puebla (BUAP)} \\
  Puebla, México}
abstract: "El presente documento es una guía técnica enfocada en los fundamentos de los sistemas de numeración posicionales y las metodologías algorítmicas para la conversión entre bases. Material estructurado para la asignatura de Matemáticas Computacionales."
documentclass: IEEEtran
classoption: conference
number-sections: true
header-includes:
  - \renewcommand{\abstractname}{Resumen}
---
EOF

# 3. LISTA DE TEMAS
TEMAS=(
    "Sistema de numeración.md"
    "Sistema posicional.md"
    "Sistemas posicionales más utilizados.md"
    "Decimal.md"
    "Binario.md"
    "Octal.md"
    "Hexadecimal.md"
    "Conversión de base b a base 10.md"
    "Método por formula.md"
    "Método de multiplicar por la base y sumar el siguiente dígito.md"
    "Conversión de un numero base 10 a otra base.md"
    "Método de los residuos.md"
    "Método de extracción de potencias.md"
    "Relación sistema binario y octal.md"
    "Relación sistema binario y hexadecimal.md"
)

# 4. PROCESAMIENTO Y LIMPIEZA
echo "📂 Procesando contenido..."
for f in "${TEMAS[@]}"; do
    if [ -f "$f" ]; then
        titulo=$(basename "$f" .md | tr '[:lower:]' '[:upper:]')
        echo -e "\n\n# $titulo\n\n" >> temp_limpio.md
        
        perl -pe '
            s///g;
            s/#unidad[0-9]*//gi;
            s/ pasos: pa/ pasos:/g;
            s/^\[\[.*?\]\]\s*$//g;
            s/\[\[(.*?)\]\]/$1/g;
            s/^Q:\s*/\n\n**Pregunta:** /g;
            s/^A:\s*/\n\n**Respuesta:**\n\n/g;
            s/^(\d+\.)/\n$1/g;
            s/^(\*|-)\s+/\n$1 /g;
        ' "$f" >> temp_limpio.md
    fi
done

# 5. COMPILACIÓN FINAL
echo "🛠️ Compilando PDF..."
pandoc temp_limpio.md -o Guia_Matematicas_Final.pdf --pdf-engine=pdflatex

rm temp_limpio.md
echo "✅ Proceso completado. Abriendo documento..."
xdg-open Guia_Matematicas_Final.pdf &
