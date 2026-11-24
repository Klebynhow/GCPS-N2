# Onboarding — N2_GCPS

Guia para quem vai contribuir com o projeto pela primeira vez.

## 1. Instalar
1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install) e confira com `flutter doctor`.
2. Tenha o Git e uma conta no GitHub.
3. Clone e baixe as dependências (no Git Bash):
```bash
git clone https://github.com/Klebynhow/GCPS-N2.git
cd GCPS-N2
flutter pub get
```

## 2. Rodar e testar
```bash
flutter run -d chrome     # roda o app no navegador
flutter test              # testes
flutter analyze           # análise estática
```

## 3. Contribuir
1. Abra uma Issue (modelo **Funcionalidade** ou **Defeito**).
2. Crie a branch a partir da `main`: `git checkout -b feature/<numero-da-issue>-<descricao>`.
3. Faça commits pequenos e rode `flutter analyze` e `flutter test` antes de enviar.
4. `git push -u origin <sua-branch>` e abra o Pull Request.
5. O título do PR segue Conventional Commits (ex.: `feat(counter): adiciona botão de reiniciar`)
   e a descrição traz `Closes #<numero>`.

A `main` não aceita push direto: o PR precisa de 1 aprovação do revisor e dos checks
`ci-ok` e `titulo-pr` verdes. O merge é sempre **Squash and merge**.

## 4. Ler o resultado do pipeline
Na aba **Checks** do PR:
- `titulo-pr` vermelho: o título do PR não segue Conventional Commits.
- `qualidade` vermelho: abra **Details**; o passo que falhou é lint (`flutter analyze`),
  testes (`flutter test`) ou build.
- `dependencias` vermelho: há dependência nova com vulnerabilidade crítica.
- `ci-ok` só fica verde quando todos os outros passam.

## 5. Versões e entrega
Depois do merge, o CD calcula a versão pelo título do PR (`feat` sobe a minor, `fix` a
patch), publica em staging e espera a aprovação do `production`. Cada versão aprovada vira
uma Release com tag `vX.Y.Z`. Para voltar a uma versão anterior, use **Actions → Rollback**.
