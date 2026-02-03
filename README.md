# Robot Framework + Appium - Automação de Testes Mobile

Suite de testes automatizados para o aplicativo mobile **QAzando Food** utilizando Robot Framework e Appium, com execução em nuvem via BrowserStack.

---

## 🚀 Tecnologias

| Tecnologia      | Versão | Finalidade                       |
| --------------- | ------ | -------------------------------- |
| Robot Framework | 7.x    | Framework de automação de testes |
| AppiumLibrary   | 2.x    | Biblioteca para testes mobile    |
| Appium          | 2.x    | Servidor de automação mobile     |
| Python          | 3.8+   | Linguagem de programação         |
| BrowserStack    | Cloud  | Plataforma de testes em nuvem    |

---

## Estrutura do Projeto

```
robot-appium/
├── .gitignore                       # Arquivos ignorados pelo Git
├── app/
│   └── qazandofood.apk             # APK do aplicativo (não versionado)
├── testes/
│   ├── cadastro/                    # Testes de cadastro (futuro)
│   └── login/
│       ├── credentials.robot        # Variáveis e locators (não versionado)
│       └── login.robot              # Suite de testes de login
├── log.html                         # Relatório de log (gerado)
├── output.xml                       # Saída em XML (gerado)
├── report.html                      # Relatório HTML (gerado)
└── README.md                        # Documentação do projeto
```

---

## Padrões de Projeto

- **Resource Files**: Separação de variáveis e locators em arquivo dedicado
- **Keywords Customizadas**: Encapsulamento de ações reutilizáveis
- **Page Object Pattern**: Organização de elementos e ações por tela
- **BDD Style**: Testes escritos em linguagem natural e legível

---

## Configuração BrowserStack

O projeto está configurado para executar testes em dispositivos reais na nuvem através do BrowserStack.

**Credenciais necessárias**:

- `USERNAME`: Seu usuário do BrowserStack
- `ACCESS_KEY`: Sua chave de acesso do BrowserStack
- `APP_ID`: ID do aplicativo carregado no BrowserStack

**Dispositivo configurado**:

- **Modelo**: Google Pixel 7
- **SO**: Android 13.0
- **Automation**: UiAutomator2

> **Nota de Segurança**: As credenciais devem ser mantidas em um arquivo `credentials.robot` que não é versionado. Crie uma cópia do arquivo de exemplo e adicione suas credenciais reais.

---

## Funcionalidades

### Login

| Cenário           | Tag               | Status |
| ----------------- | ----------------- | ------ |
| Login com sucesso | login-com-sucesso | ✅     |
| Login sem sucesso | login-sem-sucesso | ✅     |

### Cadastro

| Cenário            | Status |
| ------------------ | ------ |
| Em desenvolvimento | 🚧     |

---

## Instalação

### Pré-requisitos

- Python 3.8 ou superior
- pip (gerenciador de pacotes Python)

### Instalação das dependências

```bash
git clone https://github.com/SEU_USUARIO/robot-appium.git
cd robot-appium
pip install robotframework
pip install robotframework-appiumlibrary
```

---

## Execução

```bash
# Executar todos os testes
robot testes/

# Executar testes de login
robot testes/login/

# Executar teste específico
robot testes/login/login.robot

# Executar por tag
robot --include login-com-sucesso testes/login/login.robot

# Executar com relatório customizado
robot --outputdir results --name "Login Tests" testes/login/
```

---

## Relatórios

Após a execução, são gerados automaticamente:

- **log.html**: Log detalhado da execução com expandir/colapsar
- **report.html**: Relatório resumido com estatísticas
- **output.xml**: Saída em formato XML para integração com outras ferramentas

---

## Locators Utilizados

### Tela de Login

| Elemento            | Estratégia       | Valor                                                                |
| ------------------- | ---------------- | -------------------------------------------------------------------- |
| Texto "Falta pouco" | XPath            | `//android.widget.TextView[@text="Falta pouco pra matar sua fome!"]` |
| Campo E-mail        | Accessibility ID | `email`                                                              |
| Campo Senha         | Accessibility ID | `password`                                                           |
| Botão Login         | Accessibility ID | `login-button`                                                       |
| Mensagem de Erro    | XPath            | `//android.widget.TextView[@text="Erro ao realizar login"]`          |

### Tela Home

| Elemento       | Estratégia       | Valor            |
| -------------- | ---------------- | ---------------- |
| Botão Endereço | Accessibility ID | `address-button` |

---

## Boas Práticas Implementadas

- ✅ Separação de credenciais e dados sensíveis
- ✅ Uso de timeouts explícitos para sincronização
- ✅ Captura de screenshots ao final de cada teste
- ✅ Fechamento adequado da aplicação após cada teste
- ✅ Tags para execução seletiva de testes
- ✅ Keywords reutilizáveis e descritivas
- ✅ Aguardar visibilidade de elementos antes de interagir

---

## Próximos Passos

- [ ] Implementar testes de cadastro
- [ ] Adicionar suporte a múltiplos dispositivos/resoluções
- [ ] Configurar CI/CD com GitHub Actions
- [ ] Adicionar testes de fluxos completos (E2E)
- [ ] Implementar data-driven testing com arquivos CSV/JSON
- [ ] Adicionar relatórios customizados com Robot Framework Metrics

---

## Autor

**Ubirajara Filho**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ucgfilho/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ucgfilho)

---

## Licença

Este projeto está sob a licença MIT.