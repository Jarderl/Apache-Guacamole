#!/bin/bash

# ============================================
# Script de instalação do Apache Guacamole
# Autor: SeuNome
# Baseado em: MysticRyuujin/guac-install
# ============================================

set -e

# Verifica se está rodando como root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Execute este script como root."
  exit 1
fi

echo "🚀 Iniciando instalação do Apache Guacamole..."
sleep 1

# Atualiza o sistema
echo "🔄 Atualizando pacotes..."
apt update && apt upgrade -y

# Instala dependências básicas
echo "📦 Instalando dependências..."
apt install -y sudo curl wget

# Diretório de trabalho
WORKDIR="/root"
cd "$WORKDIR"

# Baixa o script oficial
echo "⬇️ Baixando guac-install.sh..."
wget -q https://raw.githubusercontent.com/MysticRyuujin/guac-install/master/guac-install.sh

# Dá permissão de execução
chmod +x guac-install.sh

# Executa o instalador
echo "⚙️ Executando instalador do Guacamole..."
./guac-install.sh

echo "✅ Instalação finalizada!"
echo "🌐 Acesse: http://IP_DO_SERVIDOR:8080/guacamole"
