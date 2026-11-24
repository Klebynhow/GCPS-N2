# 0002 — O CI bloqueia apenas vulnerabilidades críticas nas dependências

- Status: aceito
- Data: <dd/mm/aaaa>

## Contexto
O job `dependencias` do CI usa o `dependency-review-action`, com `fail-on-severity`. As
dependências do projeto são `cupertino_icons` (execução) e `flutter_test` e `flutter_lints`
(apenas desenvolvimento). Em <dd/mm/aaaa> foram conferidos os Dependabot alerts em
Security: <descrever o que existe, ex.: "nenhum alerta aberto" ou "N alertas high, todos em
dependência de desenvolvimento">.

## Decisão
Manter o limite em `critical`. Alertas `high` ou menores não bloqueiam o merge, mas são
tratados pelos PRs do Dependabot. **Prazo de revisão desta decisão:** <dd/mm/aaaa>.

## Alternativas consideradas
- **Subir o limite para `high`:** mais seguro, mas dependências de desenvolvimento
  costumam gerar alertas que não chegam ao app e travariam PRs sem ganho real de segurança.
- **Não bloquear nada:** descartado; o PGC 5.3 exige um limite objetivo.

## Consequências
Melhora: o fluxo não trava por alertas sem impacto em produção. Piora: um alerta `high`
em dependência de execução poderia entrar sem bloqueio; por isso o Dependabot alerts fica
ativo e os alertas são revisados no prazo acima. Pendente: reavaliar o limite na data
de revisão.
