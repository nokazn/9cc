#!/usr/bin/env make -f

CFLAGS=-std=c11 -g -static

.DEFAULT_GOAL := help

9cc: 9cc.c

.PHONY: test
test: 9cc # テストコードを実行
	./test.sh

.PHONY: clean
clean: # 生成物を削除;
	rm -f 9cc *.0 *~ tmp*

.PHONY: help
help: # すべてのコマンドのヘルプを表示
	@echo "📗 Displays help information for make commands."
	@echo "Commands:"
# コマンド一覧 -> ":" で改行 -> ":" を含む行 (前半) の \s を ", " に置換、"#" を含む行 (後半) からコメントを抽出 -> ":" で分けた個所を再連結 -> column で整形
	@grep -E '^[a-zA-Z]\S+(\s\S+)*:.*' ./Makefile \
		| sed --regexp-extended -e "s/:/:\n/" \
		| sed --regexp-extended -e "/:/ s/\s/, /g" -e "s/^.*[#|;]+\s*//" \
		| sed --regexp-extended -e "N" -e "s/:\n/:/g;" -e "s/^/  /" \
		| column -s ":" -t
