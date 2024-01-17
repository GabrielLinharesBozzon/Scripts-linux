#!/bin/bash
converte_imagem(){
# Muda para o diretório correto
cd /home/gabriel/imagens-livros

# Verifica e cria o diretório se ele não existir
if [ ! -d png ]; then
    mkdir -p /home/gabriel/imagens-livros/png
fi

# Itera sobre os arquivos .jpg no diretório
for imagem in *.jpg; do
    # Obtém o nome do arquivo sem extensão
    imagem_sem_extensao="${imagem%.*}"
    # Converte o arquivo para .png no diretório 'png'
    convert "$imagem" "/home/gabriel/imagens-livros/png/${imagem_sem_extensao}.png"
done
}
converte_imagem 2>erros.txt

if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo de conversão"
fi
