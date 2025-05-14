# Sentinela_Repository

Este repositório foi criado para a tarefa de colaboração em Git da Squad Thunderbolts. Nosso objetivo é escrever uma história em conjunto, praticando o versionamento em diferentes branches e realizando merges.

## Como Colaborar na História:

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/Gvitor10/Sentinela_Repository
    ```
2.  **Crie sua branch individual:** A partir da branch `main`, crie uma branch com um nome descritivo (ex: `feature/sua-parte`, `story/seu-nome`).
    ```bash
    git checkout main
    git checkout -b feature/seu-nome
    ```
3.  **Escreva sua parte da história:** Abra o arquivo `historia.txt` (crie-o se não existir na raiz do repositório) e adicione sua contribuição ao final.
4.  **Salve, adicione e commite suas alterações:**
    ```bash
    git add Historia.txt
    git commit -m "Add: Adiciona a parte da história de [Seu Nome]"
    ```
5.  **Envie sua branch para o repositório remoto:**
    ```bash
    git push origin feature/seu-nome
    ```
6.  **Crie um Pull Request (PR):** No GitHub (ou similar), crie um PR com sua branch tendo como destino a branch `main`. Descreva brevemente sua contribuição na descrição do PR.
7.  **Aguarde o Merge:** Um membro da Squad fará o merge do seu PR para a `main`.

## Merges da Main para as Branches Individuais (Gitflow):

Periodicamente, para manter sua branch atualizada com a história principal, execute os seguintes comandos na sua branch local:

```bash
git checkout main
git pull origin main
git checkout sua-branch
git merge main
