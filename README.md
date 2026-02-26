# Robot Framework + Appium — Automação de Testes Mobile

Suite de testes automatizados para o aplicativo **qafood** utilizando Robot Framework e Appium 2, com suporte a execução local via Android Studio e em nuvem via BrowserStack.

---

## 🚀 Stack

| Tecnologia      | Versão | Finalidade                       |
|-----------------|--------|----------------------------------|
| Robot Framework | 7.x    | Framework de automação de testes |
| AppiumLibrary   | 2.x    | Biblioteca para testes mobile    |
| Appium          | 2.x    | Servidor de automação mobile     |
| Python          | 3.8+   | Linguagem de programação         |
| Android Studio  | Latest | Emulador local                   |
| BrowserStack    | Cloud  | Execução em dispositivos reais   |

---

## 📁 Estrutura do Projeto

```text
robot-appium/
├── .venv/                          # Ambiente virtual Python (não versionado)
├── app/
│   └── qafood.apk             # APK do aplicativo (não versionado)
├── log/
│   ├── log.html                    # Log detalhado (gerado após execução)
│   ├── output.xml                  # Saída XML (gerado após execução)
│   └── report.html                 # Relatório HTML (gerado após execução)
├── testes/
│   └── login/
│       ├── credentials.robot       # Variáveis, locators e configurações (não versionado)
│       └── login.robot             # Suite de testes de login
├── browserstack_driver.py          # Configuração do driver para BrowserStack
├── .gitignore                      # Arquivos ignorados pelo Git
├── log.html                        # Log da última execução (raiz)
├── output.xml                      # Saída XML da última execução (raiz)
├── report.html                     # Relatório da última execução (raiz)
└── README.md                       # Documentação do projeto
```

---

## 🌐 Ambientes de Execução

O projeto suporta dois ambientes configurados via a variável `RUN_ENV` no arquivo `credentials.robot`.

### Local (Android Studio / Emulador)

- O Appium Server deve estar rodando em rede local
- O APK é referenciado diretamente pelo caminho local
- Ideal para desenvolvimento e depuração rápida

### BrowserStack (Nuvem)

- A URL de conexão aponta para `https://hub.browserstack.com/wd/hub`
- O APK deve ser previamente enviado ao BrowserStack e o `APP_ID` atualizado em `credentials.robot`
- As credenciais são carregadas via variáveis de ambiente do sistema
- Permite execução em dispositivos reais sem infraestrutura local

---

## 🔐 Configuração de Variáveis de Ambiente (Windows)

As credenciais do BrowserStack **nunca devem ser commitadas**. Configure-as como variáveis de ambiente no Windows:

```bash
# Abrir PowerShell como Administrador e executar:
[System.Environment]::SetEnvironmentVariable("BROWSERSTACK_USERNAME", "seu_usuario", "User")
[System.Environment]::SetEnvironmentVariable("BROWSERSTACK_ACCESS_KEY", "sua_access_key", "User")
```

Ou pela interface gráfica:

1. Pesquise **"Variáveis de Ambiente"** no menu Iniciar
2. Em **Variáveis do usuário**, clique em **Novo**
3. Adicione `BROWSERSTACK_USERNAME` e `BROWSERSTACK_ACCESS_KEY` com seus respectivos valores

> **Reinicie o terminal** após definir as variáveis para que sejam reconhecidas.

---

## ⚙️ Instalação

### Pré-requisitos

- Python 3.8 ou superior instalado
- Android Studio com emulador configurado (para execução local)
- Conta ativa no BrowserStack (para execução em nuvem)

### Passo a Passo

```bash
# 1. Clone o repositório
git clone https://github.com/ucgfilho/robot-appium.git
cd robot-appium

# 2. Crie e ative o ambiente virtual
python -m venv .venv
.venv\Scripts\activate

# 3. Instale as dependências
pip install robotframework
pip install robotframework-appiumlibrary

# 4. Crie o arquivo de credenciais
copy tests\login\credentials.robot.example tests\login\credentials.robot
# Edite credentials.robot com seus dados reais
```

> O arquivo `credentials.robot` está listado no `.gitignore` e **não é versionado**.

---

## ▶️ Execução dos Testes

### Execução Local (Emulador Android Studio)

Certifique-se de que o Appium Server está rodando (`appium`) e o emulador está iniciado.

```bash
# Defina o ambiente como LOCAL no credentials.robot:
# ${RUN_ENV}    LOCAL

# Executar todos os tests de login
robot tests/login/login.robot

# Executar por tag
robot --include login-com-sucesso tests/login/login.robot
robot --include login-sem-sucesso tests/login/login.robot

# Executar com relatório em pasta customizada
robot --outputdir results tests/login/login.robot
```

### Execução via BrowserStack (Nuvem)

```bash
# Defina o ambiente como BSTACK no credentials.robot:
# ${RUN_ENV}    BSTACK

# Certifique-se de que as variáveis de ambiente estão configuradas:
# BROWSERSTACK_USERNAME e BROWSERSTACK_ACCESS_KEY

# Executar todos os tests
robot tests/login/login.robot

# Executar por tag
robot --include login-com-sucesso tests/login/login.robot
```

---

## 📊 Relatórios

Após cada execução são gerados automaticamente na raiz do projeto:

| Arquivo       | Descrição                                                   |
|---------------|-------------------------------------------------------------|
| `log.html`    | Log detalhado com cada keyword executada                    |
| `report.html` | Relatório resumido com estatísticas de pass/fail            |
| `output.xml`  | Saída em XML para integração com CI/CD e outras ferramentas |

Para gerar relatórios em pasta separada:

```bash
robot --outputdir results --name "Login Suite" tests/login/login.robot
```

---

## ✅ Boas Práticas Aplicadas

- **Separação de responsabilidades**: Credenciais, locators e variáveis isolados em `credentials.robot`
- **Variáveis de ambiente**: Credenciais sensíveis carregadas via `Get Environment Variable`, nunca hardcoded
- **Suporte multi-ambiente**: Alternância entre Local e BrowserStack via variável `RUN_ENV`
- **Page Object Pattern**: Elementos organizados por tela no arquivo de resources
- **Keywords reutilizáveis**: Ações encapsuladas em keywords descritivas
- **Timeouts explícitos**: `Wait Until Element Is Visible` para sincronização confiável
- **Captura de evidências**: `Capture Page Screenshot` ao final de cada cenário
- **Teardown adequado**: `Close Application` garantindo limpeza de sessão
- **Tags**: Execução seletiva por `--include` / `--exclude`
- **BDD Style**: Cenários escritos em linguagem natural e legível

---

## 👤 Autor

**Ubirajara Filho**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ucgfilho/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ucgfilho)

---

## 📄 Licença

Este projeto está sob a licença MIT.
