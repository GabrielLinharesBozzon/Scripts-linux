#!/bin/bash

cd /home/gabriel/imagens-livros

for arquivo in *; do
    if [ -d "$arquivo" ]; then
        # Se for um diretório, entra nele e faz a varredura
        cd "$arquivo"
        for conteudo_arquivo in *; do
            if [ -d "$conteudo_arquivo" ]; then
                # Se for um subdiretório, pode fazer algo aqui se necessário
                :
            else
                # Se for um arquivo, converte jpg para png
                if [[ "$conteudo_arquivo" == *.jpg ]]; then
                    imagem_sem_extensao="${conteudo_arquivo%.*}"
                    convert "$conteudo_arquivo" "${imagem_sem_extensao}.png"
                fi
            fi
        done
        cd ..
    else
        # Se não for um diretório, mas um arquivo, converte jpg para png
        if [[ "$arquivo" == *.jpg ]]; then
            imagem_sem_extensao="${arquivo%.*}"
            convert "$arquivo" "${imagem_sem_extensao}.png"
        fi
    fi
done
