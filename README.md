# 📝 Automatizador de Guías Técnicas (Markdown to IEEE PDF)

Este proyecto es una herramienta de automatización desarrollada en **Bash** para convertir apuntes de estudio estructurados en **Obsidian** al formato académico profesional **IEEE**. 

Diseñado originalmente para la asignatura de **Matemáticas Computacionales** en la **Facultad de Ciencias de la Computación (BUAP)**, el script soluciona el problema de transformar notas rápidas y flashcards de Anki en documentos técnicos listos para su entrega o publicación.

## 🚀 Características Técnicas

- **Saneamiento de Datos:** Utiliza expresiones regulares para eliminar metadatos de Anki (IDs), etiquetas de organización (#unidad) y enlaces internos de Obsidian.
- **Formato Académico:** Implementa la clase oficial IEEEtran para generar documentos en doble columna con estándares de ingeniería.
- **Renderizado Matemático:** Soporte completo para ecuaciones complejas en LaTeX.
- **Orden Lógico de Ensamble:** Combina múltiples archivos .md siguiendo una secuencia pedagógica definida en el script.

## 🛠️ Requisitos del Sistema

Para ejecutar este script en una distribución basada en Debian/Ubuntu (como Linux Mint), asegúrate de tener instaladas las siguientes dependencias:

- Pandoc
- Texlive-latex-base
- Texlive-fonts-recommended
- Wget

Puedes instalarlas con: sudo apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-publishers texlive-lang-spanish wget

## 📦 Uso

1. Coloca tus notas de Obsidian (.md) en el mismo directorio que el script.
2. Dale permisos de ejecución: chmod +x creararchivo.sh
3. Ejecuta el automatizador: ./creararchivo.sh

## 📂 Flujo de Procesamiento

El script procesa actualmente los siguientes temas en orden secuencial:
1. Fundamentos de Sistemas de Numeración.
2. Análisis de Sistemas Posicionales (Decimal, Binario, Octal, Hexadecimal).
3. Algoritmos de Conversión (Método de residuos, potencias y fórmulas).
4. Relaciones entre bases.

## 🛡️ Enfoque en Ciberseguridad

Como estudiante de Cybersecurity Engineering, este script fue diseñado bajo el principio de Integridad de Datos, asegurando que el contenido de las notas originales no sea alterado durante el proceso de limpieza y que el saneamiento de texto elimine cualquier metadato no deseado antes de la compilación final.

---
**Autor:** Javier Pozos Avila  
**Institución:** Benemérita Universidad Autónoma de Puebla (BUAP)  
**Carrera:** Ingeniería en Ciberseguridad
