# Menu sem loader:
Descrição:
Este script carrega diretamente um menu pré-configurado de um repositório remoto no GitHub. Ele é ideal para quem deseja uma implementação rápida e prática, sem etapas adicionais como verificações de integridade ou carregamentos de recursos extras. Basta executar o script, e o menu estará disponível imediatamente. Recomendado para usuários que precisam de simplicidade e eficiência.


loadstring(game:HttpGet("https://raw.githubusercontent.com/Kovizim/Basic-menu/refs/heads/main/Meumenu.lua"))();


# Menu com loader
Descrição:
Esse script utiliza um loader, uma etapa intermediária que pode realizar várias tarefas antes de carregar o menu principal. O loader pode ser usado para verificar se o ambiente de execução está correto, carregar dependências adicionais ou garantir que o menu esteja otimizado para o uso. Essa abordagem é útil para garantir uma experiência mais robusta, especialmente em ambientes dinâmicos, onde o menu pode precisar de ajustes antes de ser exibido.


loadstring(game:HttpGet("https://raw.githubusercontent.com/Kovizim/Basic-menu/refs/heads/main/Loader.lua"))();
