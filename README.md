# Desafio Técnico Codefy: Infraestrutura AWS com Terraform

## Descrição
Este projeto cria uma infraestrutura básica na AWS usando Terraform, visando atender aos requisitos do desafio técnico da codefy, para o candidado **Álefe Daniel Cosendey**. 

A infraestrutura inclui:
- Uma VPC com sub-redes públicas e privadas.
- Uma instância EC2 com acesso restrito e um bucket S3.
- Um banco de dados RDS MySQL acessível apenas pela EC2.

## Requisitos
- Terraform instalado.
- Credenciais AWS configuradas localmente.
- IP público do candidato para restrição SSH.

## Como Executar
1. Clone o repositório:
   ```bash
   git clone https://github.com/AldanBR/DT-Codefy.git
   cd <repo-folder>
   ```
2. Crie um arquivo `terraform.tfvars` com os valores sensíveis:
   ```hcl
   aws_region    = "us-east-1"
   allowed_ssh_ip = "YOUR_PUBLIC_IP/32"
   rds_username  = "admin"
   rds_password  = "securepassword"
   ```
3. Inicialize o Terraform:
   ```bash
   terraform init
   ```
4. Aplique as mudanças:
   ```bash
   terraform apply
   ```
5. Após provisionar, veja os outputs:
   ```bash
   terraform output
   ```

## Outputs
- IP público da instância EC2.
- Endpoint do banco de dados RDS.

## Plano de Custos
- EC2: Aproximadamente $8/mês.
- RDS MySQL: Aproximadamente $15/mês.
- S3: Custos dependem do uso.

### Módulos utilizados:

---

## Apresentação do Projeto



