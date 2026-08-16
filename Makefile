# Makefile para compilação do documento LaTeX
MAIN = Thesis
LATEX_DIR = latex
BUILD_CMD = latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error $(MAIN).tex

.PHONY: all build watch clean purge help

all: build

build:
	@echo "==> Compilando $(MAIN).tex..."
	@cd $(LATEX_DIR) && $(BUILD_CMD)
	@echo "==> Concluído com sucesso: $(LATEX_DIR)/$(MAIN).pdf"

watch:
	@echo "==> Modo contínuo (recompilação automática ao salvar)..."
	@cd $(LATEX_DIR) && latexmk -pdf -pvc -synctex=1 -interaction=nonstopmode $(MAIN).tex

clean:
	@echo "==> Limpando arquivos auxiliares de compilação..."
	@cd $(LATEX_DIR) && latexmk -c $(MAIN).tex
	@rm -f $(LATEX_DIR)/*.synctex.gz $(LATEX_DIR)/*.thm $(LATEX_DIR)/*.bbl $(LATEX_DIR)/*.blg

purge:
	@echo "==> Limpando todos os arquivos gerados (incluindo PDF)..."
	@cd $(LATEX_DIR) && latexmk -C $(MAIN).tex
	@rm -f $(LATEX_DIR)/*.synctex.gz $(LATEX_DIR)/*.thm $(LATEX_DIR)/*.bbl $(LATEX_DIR)/*.blg $(LATEX_DIR)/$(MAIN).pdf

help:
	@echo "Comandos disponíveis:"
	@echo "  make         - Compila o documento (Thesis.tex -> Thesis.pdf)"
	@echo "  make watch   - Compila continuamente ao alterar e salvar arquivos"
	@echo "  make clean   - Remove arquivos temporários (.aux, .log, .toc, etc.)"
	@echo "  make purge   - Remove temporários e o PDF gerado"
