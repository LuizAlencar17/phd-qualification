#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LATEX_DIR="${SCRIPT_DIR}/latex"
MAIN_DOC="Thesis.tex"

echo "==> Entrando em ${LATEX_DIR}..."
cd "${LATEX_DIR}"

echo "==> Compilando ${MAIN_DOC} com latexmk..."
latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error "${MAIN_DOC}"

echo "==> Compilação finalizada com sucesso!"
echo "==> Arquivo gerado: ${LATEX_DIR}/Thesis.pdf"
