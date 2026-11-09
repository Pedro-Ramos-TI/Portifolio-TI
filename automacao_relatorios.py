import csv
from datetime import datetime

def processar_chamados(caminho_arquivo):
    total_chamados = 0
    abertos = 0
    em_atendimento = 0
    concluidos = 0
    criticos_abertos = []

    # Leitura e processamento do arquivo CSV
    with open(caminho_arquivo, mode='r', encoding='utf-8') as arquivo:
        leitor = csv.DictReader(arquivo)
        
        for linha in leitor:
            total_chamados += 1
            status = linha['status']
            prioridade = linha['prioridade']

            if status == 'Aberto':
                abertos += 1
                if prioridade == 'Alta':
                    criticos_abertos.append(f"- {linha['equipamento']} ({linha['setor']})")
            elif status == 'Em Atendimento':
                em_atendimento += 1
            elif status == 'Concluído':
                concluidos += 1

    # Geração do Relatório Formatado
    data_atual = datetime.now().strftime("%d/%m/%Y %H:%M")
    
    relatorio = f"""
==================================================
      RELATÓRIO AUTOMÁTICO DE SUPORTE DE TI
==================================================
Data de Geração: {data_atual}

📊 RESUMO EXECUTIVO:
- Total de Chamados Processados: {total_chamados}
- Chamados Concluídos: {concluidos}
- Chamados Em Atendimento: {em_atendimento}
- Chamados Pendentes (Abertos): {abertos}

🚨 PENDÊNCIAS DE ALTA PRIORIDADE:
"""
    if criticos_abertos:
        relatorio += "\n".join(criticos_abertos)
    else:
        relatorio += "Nenhuma pendência crítica no momento."

    relatorio += "\n\n=================================================="

    # Exibe no terminal
    print(relatorio)

    # Salva o relatório num arquivo de texto
    with open('relatorio_suporte_gerado.txt', 'w', encoding='utf-8') as f:
        f.write(relatorio)
        
    print("\n[SUCESSO] Relatório 'relatorio_suporte_gerado.txt' gerado com sucesso!")

# Execução do Script
if __name__ == '__main__':
    processar_chamados('chamados.csv')