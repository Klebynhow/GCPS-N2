# n2_gcps

Aplicativo contador em Flutter: ao tocar no botão **+**, o total de cliques aumenta.
É o projeto padrão do Flutter, usado apenas para demonstrar conceitos de GCS e CI/CD
(Pull Requests, proteção da `main`, ambientes `staging`/`production` e pipelines).

## Stack

- Flutter / Dart (SDK conforme `pubspec.yaml`)
- Alvos: web e Android
- Dependências travadas em `pubspec.lock`

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (`flutter doctor` sem erros)
- Chrome (para rodar na web) ou um emulador/dispositivo Android

## Como instalar e rodar

```bash
git clone https://github.com/Klebynhow/GCPS-N2.git
cd GCPS-N2
flutter pub get
flutter run -d chrome        # ou: flutter run  (escolha o emulador/dispositivo)
```

## Como rodar os testes

```bash
flutter test
flutter analyze              # análise estática
```

## Variáveis de ambiente

Copie `.env.example` para `.env` se precisar definir valores locais. O `.env` nunca é commitado.

## Como contribuir

A `main` só aceita Pull Requests (1 aprovação, histórico linear, squash merge).
Use `feature/<issue>-<descricao>` e título de PR em Conventional Commits
(ex.: `feat(counter): adiciona botão de reiniciar`). Detalhes no PGC (`docs/PGC_N2_GCPS.docx`).
