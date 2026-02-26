# Robot Framework + Appium — Automação de Testes Mobile

Suite de testes automatizados para o aplicativo **qaFood** utilizando Robot Framework e Appium 2, com suporte a execução local via Android Studio e em nuvem via BrowserStack.

---

## Stack

| Tecnologia      | Versão | Finalidade                       |
|-----------------|--------|----------------------------------|
| Robot Framework | 7.x    | Framework de automação de testes |
| AppiumLibrary   | 2.x    | Biblioteca para testes mobile    |
| Appium          | 2.x    | Servidor de automação mobile     |
| Python          | 3.8+   | Linguagem de programação         |
| Android Studio  | Latest | Emulador local                   |
| BrowserStack    | Cloud  | Execução em dispositivos reais   |

---

## Estrutura do Projeto

```text
robot-appium/
├── .venv/                      # Ambiente virtual Python (não versionado)
├── app/
│   └── qaFood.apk              # APK do aplicativo (não versionado)
├── results/
│   ├── log.html                # Log detalhado (gerado após execução)
│   ├── output.xml              # Saída XML (gerado após execução)
│   └── report.html             # Relatório HTML (gerado após execução)
├── tests/
│   ├── base.robot              # Keywords reutilizáveis e configurações base
│   ├── credentials.robot       # Variáveis, locators e credenciais (não versionado)
│   ├── login/
│   │   └── login.robot         # Suite de testes de login
│   └── order/
│       └── order.robot         # Suite de testes de pedido
├── browserstack_driver.py      # Configuração do driver para BrowserStack
├── .gitignore                  # Arquivos ignorados pelo Git
└── README.md                   # Documentação do projeto
```

---

## Ambientes de Execução

O projeto suporta dois ambientes configurados via a variável `RUN_ENV` em `credentials.robot`.

### Local (Android Studio / Emulador)

- Appium Server deve estar rodando localmente (`appium`)
- APK referenciado pelo caminho local via `${APP_PATH_LOCAL}`
- Ideal para desenvolvimento e depuração rápida

### BrowserStack (Nuvem)

- Conexão via `https://hub.browserstack.com/wd/hub`
- APK enviado previamente ao BrowserStack — atualizar `${APP_ID_BSTACK}` em `credentials.robot`
- Credenciais carregadas via variáveis de ambiente do sistema
- Permite execução em dispositivos reais sem infraestrutura local

---

## Configuração de Variáveis de Ambiente (Windows)

As credenciais do BrowserStack **nunca devem ser commitadas**. Configure-as como variáveis de ambiente:

```powershell
# PowerShell (como Administrador)
[System.Environment]::SetEnvironmentVariable("BROWSERSTACK_USERNAME", "seu_usuario", "User")
[System.Environment]::SetEnvironmentVariable("BROWSERSTACK_ACCESS_KEY", "sua_access_key", "User")
```

Ou pela interface gráfica:

1. Pesquise **"Variáveis de Ambiente"** no menu Iniciar
2. Em **Variáveis do usuário**, clique em **Novo**
3. Adicione `BROWSERSTACK_USERNAME` e `BROWSERSTACK_ACCESS_KEY` com seus valores

> **Reinicie o terminal** após definir as variáveis para que sejam reconhecidas.

---

## Instalação

### Pré-requisitos

- Python 3.8 ou superior
- Android Studio com emulador configurado (execução local)
- Conta ativa no BrowserStack (execução em nuvem)

### Passo a Passo

```bash
# 1. Clone o repositório
git clone https://github.com/ucgfilho/robot-appium.git
cd robot-appium

# 2. Crie e ative o ambiente virtual
python -m venv .venv
.venv\Scripts\activate

# 3. Instale as dependências
pip install robotframework robotframework-appiumlibrary
```

> O arquivo `credentials.robot` está listado no `.gitignore` e **não é versionado**.

---

## Execução dos Testes

Certifique-se de que o Appium Server está rodando (`appium`) e o emulador está iniciado antes de executar localmente.

### Suites Disponíveis

| Suite   | Arquivo                    | Tags disponíveis                         |
|---------|----------------------------|------------------------------------------|
| Login   | `tests/login/login.robot`  | `login-com-sucesso`, `login-sem-sucesso` |
| Pedido  | `tests/order/order.robot`  | `realiza-pedido-com-sucesso`             |

### Comandos

```bash
# Executar suite de login
robot --outputdir results tests/login/login.robot

# Executar suite de pedido
robot --outputdir results tests/order/order.robot

# Executar todas as suites
robot --outputdir results tests/

# Executar por tag
robot --include login-com-sucesso --outputdir results tests/
robot --include realiza-pedido-com-sucesso --outputdir results tests/
```

> Altere `${RUN_ENV}` em `credentials.robot` para `LOCAL` ou `BSTACK` conforme o ambiente desejado.

---

## Relatórios

Após cada execução, os artefatos são gerados na pasta `results/`:

| Arquivo       | Descrição                                                   |
|---------------|-------------------------------------------------------------|
| `log.html`    | Log detalhado com cada keyword executada                    |
| `report.html` | Relatório resumido com estatísticas de pass/fail            |
| `output.xml`  | Saída XML para integração com CI/CD e outras ferramentas    |

---

## Boas Práticas Aplicadas

- **Separação de responsabilidades**: Credenciais, locators e variáveis isolados em `credentials.robot`
- **Keywords reutilizáveis em pt-br**: Fluxos encapsulados em `base.robot` com nomes descritivos
- **Variáveis de ambiente**: Credenciais sensíveis via `Get Environment Variable`, nunca hardcoded
- **Suporte multi-ambiente**: Alternância entre Local e BrowserStack via `${RUN_ENV}`
- **Timeouts explícitos**: `Wait Until Element Is Visible` para sincronização confiável
- **Captura de evidências**: `Capture Page Screenshot` ao final de cada cenário
- **Teardown adequado**: `Close Application` garantindo limpeza de sessão
- **Tags**: Execução seletiva por `--include` / `--exclude`
- **BDD Style**: Cenários escritos em linguagem natural e legível

---

## Autor

**Ubirajara Filho**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ucgfilho/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ucgfilho)

---

## Licença

Este projeto está sob a licença MIT.
