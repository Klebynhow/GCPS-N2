# 0001 — Produção é uma Release do GitHub com o pacote web anexado

- Status: aceito
- Data: <dd/mm/aaaa>

## Contexto
O N2_GCPS é um app Flutter didático, sem backend e sem servidor próprio. Ele precisa de um
"ambiente de produção" para demonstrar CD, mas não há hospedagem gratuita simples para o
alvo escolhido, e o laboratório tem rede restrita. O PGC (6.1) exige que o mesmo pacote
seja promovido de staging para produção, sem recompilar.

## Decisão
O job `preparar` gera o pacote uma única vez (`flutter build web --release`, compactado em
`.zip`). Staging é o artefato candidato da execução. Produção é a baseline: tag `vX.Y.Z`
mais uma Release com notas e o pacote anexado, criada só após a aprovação manual no
Environment `production`. O GitHub Pages não é usado.

## Alternativas consideradas
- **GitHub Pages:** o Flutter web precisa de `--base-href` diferente em `/staging/` e na
  raiz, o que exigiria dois builds e quebraria a regra de compilar uma vez só. Além disso,
  `*.github.io` pode ser bloqueado no laboratório.
- **Firebase Hosting ou similar:** exige conta externa e segredos no repositório, fora do
  escopo e com mais superfície de risco.
- **APK Android:** exige keystore de assinatura, que é um segredo a gerenciar.

## Consequências
Melhora: nenhum segredo, nenhuma conta externa, baseline rastreável e rollback sem
recompilar (workflow Rollback). Piora: não existe URL pública do app para usuários finais,
e o "teste em staging" é baixar e abrir o pacote. Pendente: se o app ganhar usuários reais,
rever esta decisão e adotar uma hospedagem.
