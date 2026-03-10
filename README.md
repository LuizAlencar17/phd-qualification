# Qualificação (LaTeX)

Projeto LaTeX da qualificação (PPGCC/UFMG), com fonte em `latex/`.

## Estrutura

- `latex/Thesis.tex`: arquivo principal
- `latex/base.bib`: bibliografia
- `latex/images/`: figuras
- `latex/ppgccufmg.cls`, `latex/*.bst`: classe e estilos

## Requisitos

Recomendado: `latexmk` + uma distribuição TeX (ex.: TeX Live).

Em Debian/Ubuntu (exemplo):

```bash
sudo apt-get update
sudo apt-get install -y latexmk texlive-full
```

> Observação: `texlive-full` é grande; se preferir, instale um conjunto menor e ajuste conforme pacotes faltantes.

## Como compilar

A partir da raiz do repositório:

```bash
cd latex
latexmk -pdf Thesis.tex
```

O PDF gerado por padrão é `latex/Thesis.pdf` (ignorado pelo `.gitignore`).

## Como limpar artefatos

Para remover arquivos gerados (auxiliares, logs, PDF, etc.):

```bash
cd latex
latexmk -C
```

Se quiser manter o PDF e apagar só auxiliares:

```bash
cd latex
latexmk -c
```

## Subir no GitHub (primeira vez)

```bash
git init
git add .
git commit -m "Initial commit"
# crie o repositório no GitHub e depois:
git branch -M main
git remote add origin <URL_DO_REPO>
git push -u origin main
```

## Dica (se já existirem artefatos no diretório)

Este projeto atualmente contém arquivos gerados pelo LaTeX (por exemplo, `*.aux`, `*.log`, `Thesis.pdf`). O `.gitignore` evita que sejam adicionados daqui pra frente, mas você pode limpar antes do primeiro commit com:

```bash
cd latex
latexmk -C
```
