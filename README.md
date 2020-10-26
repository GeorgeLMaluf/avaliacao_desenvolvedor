# README

**Configuração do Ambiente**
* Ruby  2.7.2
* Rails 5.2.4.4
* Sqlite 3

**Obter os fontes**
* Clone os fontes do repositório git
```bash
git clone https://github.com/GeorgeLMaluf/avaliacao_desenvolvedor.git
```
**Configuração**
* Acesse o diretório do projeto
```bash
cd avaliacao_desenvolvedor
```
* Dentro da pasta do projeto, execute os seguintes comandos:
```bash
bundle install
rails db:drop db:create db:migrate
```
**Execução dos testes**
* Para executar os testes, use o comando:
```bash
bundle exec rspec
```

**Execução da aplicação**
* Para executar a aplicação:
```bash
rails s
```
* Abra o navegador no endereço [http://localhost:3000](http://localhost:3000/)

E aproveite.