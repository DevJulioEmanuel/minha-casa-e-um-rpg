# 🏠 Projeto Minha Casa é um RPG

**Arthur Lelis, Julio Emanuel**

[PROJETO EM DESENVOLVIMENTO]

---

## 1. Visão Geral do Projeto

### 1.1 Contexto e Problema

Morar em república estudantil envolve conflitos recorrentes: louça suja, contas atrasadas e falta de organização. Aplicativos tradicionais de gestão são funcionais, mas entediantes, resultando em baixo engajamento ao longo do tempo.

### 1.2 Solução Proposta

Um aplicativo mobile híbrido (**Gestão + RPG**) onde a realização de tarefas domésticas e o pagamento de contas geram recompensas virtuais (**XP e Moedas**).  

O diferencial é a customização de um avatar pessoal, criando um senso de progresso e status dentro da casa.

### 1.3 Público-Alvo

- Estudantes universitários que dividem moradia  
- Jovens adultos em coliving  

### 1.4 Objetivo Principal

Tornar a convivência doméstica divertida e organizada, incentivando o cumprimento de deveres através de recompensas imediatas (gamificação) e competição saudável.

---

# 2. Escopo Funcional (MVP)

O MVP foca nas funcionalidades essenciais para gerenciar a casa e implementar o ciclo básico de gamificação:

> Realizar tarefa → Ganhar recompensa → Melhorar avatar

---

## 2.1 Módulo: Gestão da República

- Cadastro e Login (e-mail/senha)
- Criação de República
- Entrada em República via código de convite
- Feed de eventos:
  - "João pagou a luz"
  - "Maria lavou a louça"

---

## 2.2 Módulo: Tarefas (To-Do List)

- CRUD de tarefas
- Atribuição de responsável ou tarefa aberta
- Conclusão e validação (modelo baseado em confiança — honor system)

---

## 2.3 Módulo: Financeiro (Estilo Splitwise)

- Lançamento de contas
- Cálculo de saldos
- Registro de pagamento (settlement)

---

## 2.4 Módulo: Avatar e Perfil

- Visualização do avatar
- Inventário de itens (roupas, acessórios, pets)

---

# 3. Sistema de Gamificação (Core Mechanics)

## 3.1 Economia do Jogo

- **XP (Experiência)** → Determina o nível do usuário
- **Coins (Moedas)** → Usadas na loja

Ganho por:
- Completar tarefas
- Pagar contas

---

## 3.2 Regras de Pontuação (Exemplo)

| Ação | XP | Coins |
|------|----|--------|
| Tarefa simples | +50 XP | +10 |
| Tarefa complexa | +200 XP | +50 |
| Pagar conta no prazo | +100 XP | +20 |

---

## 3.3 Penalidades (Opcional no MVP)

- Atraso em contas → -50 XP  
- Perda de nível se o XP zerar  
- Tarefa não realizada no prazo → bloqueio temporário de ganho de XP  

---

## 3.4 Loja de Itens (Cosméticos)

A loja vende apenas itens visuais (**pay-to-win proibido**).

Categorias:
- Cabelo
- Camisa
- Calça
- Calçados
- Acessórios (óculos, chapéus)

Alguns itens exigem nível mínimo (ex: nível 10).

---

# 4. Regras de Negócio

- Validação automática ao clicar em "Concluir"
- Admin pode reverter ação (removendo XP/Coins)
- O aplicativo não processa pagamentos reais
- Usuário só pode pertencer a uma República por vez
- Itens comprados permanecem vinculados à conta do usuário

---

# 5. Estrutura de Navegação

O aplicativo será estruturado com uma barra de navegação inferior (bottom bar) com cinco abas principais.

---

## 5.1 República (Home)

Tela inicial do aplicativo.

Funcionalidades:
- Visualização da república ativa
- Lista de membros com:
  - Avatar
  - Nível
  - XP
  - Coins
  - Pets / Itens
- Ranking de XP (opcional)
- Feed de atividades recentes:
  - Conclusão de tarefas
  - Evolução de nível
  - Aquisição de itens

---

## 5.2 Tarefas

- CRUD de tarefas
- Atribuição a membros específicos
- Sistema de revezamento
- Status:
  - Pendente
  - Concluída
  - Atrasada

---

## 5.3 Despesas

Módulo inspirado no Splitwise.

- Cadastro e edição de despesas
- Divisão de valores
- Visualização de saldos
- Identificação de devedores

---

## 5.4 Loja

- Compra de itens cosméticos
- Uso de moedas obtidas
- Elemento motivacional e de personalização

---

## 5.5 Perfil

- Visualização do avatar
- Estatísticas pessoais
- Insígnias e troféus
- Acesso às configurações

---

# 6. Arquitetura e Tecnologias

## 6.1 Front-end (Mobile)

- Flutter (Dart)
- Gerenciamento de Estado: Provider ou Riverpod
- Renderização do Avatar:
  - Opção A: PNG em camadas (Stack)
  - Opção B: Rive ou Flare

---

## 6.2 Back-end (API)

- Java (JDK 17 ou 21)
- Spring Boot 3
- Spring Security com JWT
- Swagger/OpenAPI

---

## 6.3 Banco de Dados

- PostgreSQL
- Spring Data JPA (Hibernate)
- Flyway ou Liquibase

---

## 6.4 Divisão de Responsabilidades

| Camada | Responsabilidade |
|---------|------------------|
| Front-end | UI/UX, animações, validação local, chamadas HTTP, cache |
| Back-end | Regras de negócio, cálculo de XP/Coins, persistência, autenticação |

---

# 7. Modelagem de Dados

[Em processo de modelagem]


---

# 8. Fora do Escopo (V2.0)

- [ ] Chat em tempo real  
- [ ] Upload de fotos para comprovação  
- [ ] Sistema de guildas  
- [ ] Marketplace entre usuários  

---

# 9. Critérios de Sucesso

## Funcional
- Criar república
- Lançar conta
- Visualizar saldo atualizado

## Gamificação
Fluxo deve ocorrer sem latência perceptível:

Concluir tarefa → Atualizar saldo de coins → Comprar item → Atualizar avatar

## Técnico
- API respondendo em menos de 200ms
- Banco de dados corretamente normalizado

## Usabilidade
Cadastro de nova conta em até 30 segundos (3 a 4 cliques)


