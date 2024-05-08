# coreai-mcu-core

## Prerequisites
* Docker
* Docker Compose
* WSL2 (Windows only)

## Services
| Service |
|---------|
[coreai-mcu-documents](https://github.com/DEFRA/coreai-mcu-documents)
[coreai-mcu-frontend](https://github.com/DEFRA/coreai-mcu-frontend)
[coreai-mcu-generation-oai](https://github.com/DEFRA/coreai-mcu-generation-oai)
[coreai-mcu-knowledge-pgv](https://github.com/DEFRA/coreai-mcu-knowledge-pgv)
[coreai-mcu-responses](https://github.com/DEFRA/coreai-mcu-responses)

## Setting up the project
```bash
git clone https://github.com/DEFRA/coreai-mcu-core --recurse-submodules
```

## Updating submodules
```bash
git submodule update --remote
```

## Environment variables
| Name | Description | Required | Default |
| --- | --- | --- | --- |
| `MESSAGE_QUEUE_HOST` | Azure Service Bus namespace host | Yes | |
| `MESSAGE_QUEUE_USER` | Azure Service Bus namespace SAS policy name | Yes | |
| `MESSAGE_QUEUE_PASSWORD` | Azure Service Bus namespace SAS policy key | Yes | |
| `MESSAGE_QUEUE_SUFFIX` | For local development - Use your initials | No | |
| `AZURE_OPENAI_INSTANCE_NAME` | Azure OpenAI instance name e.g. openai-12345 | Yes | |
| `AZURE_OPENAI_KEY` | Azure OpenAI key | Yes | |
| `AZURE_OPENAI_API_VERSION` | Azure OpenAI API version | Yes | `2024-02-01` |
| `EMBEDDING_MODEL_NAME` | Azure OpenAI embedding model deployment name. Note: This is not the model name, but the deployment name | Yes | |
| `GENERATION_MODEL_NAME` | Azure OpenAI generation model deployment name. Note: This is not the model name, but the deployment name | Yes | |
| `AZURE_STORAGE_USE_CONNECTION_STRING` | Use connection string for Azure Storage | Yes | `true` |
| `AZURE_STORAGE_ACCOUNT` | Azure Storage account name (Azurite by default) | Yes | `devstoreaccount1` |
| `AZURE_STORAGE_CONNECTION_STRING` | Azure Storage connection string (Azurite by default) | Yes | |
| `AWS_BEDROCK_REGION` | AWS Bedrock region | Yes | |
| `AWS_BEDROCK_ACCESS_KEY_ID` | AWS Bedrock access key ID | Yes (if Bedrock is enabled) | |
| `AWS_BEDROCK_SECRET_ACCESS_KEY` | AWS Bedrock secret access key | Yes (if Bedrock is enabled) | |
| `AWS_BEDROCK_MAX_TOKENS_TO_SAMPLE` | AWS Bedrock max tokens | Yes (if Bedrock is enabled) | 4000 |
| `NOTIFY_API_KEY` | Gov Notify API key | Yes | |
| `NOTIFY_TEMPLATE_ID_CORRESPONDENCE` | Template ID for Gov Notify | Yes | |
| `CARBON_COPY_EMAIL_ADDRESS` | Email address for carbon copy for use with Gov Notify | Yes | |
| `AUTHENTICATION_ENABLED` | Enable authentication | No | false |
| `AZUREID_CLIENT_SECRET` | Azure ID client secret | No | |
| `AZUREID_CLIENT_ID` | Azure ID client ID | No | |
| `AZUREID_TENANT_ID` | Azure ID tenant ID | No | |
| `DOCUMENTS_API_BASE_URL` | Base URL for Documents API | No | `coreai-mcu-documents` |
| `RESPONSES_API_BASE_URL` | Base URL for Responses API | No | `coreai-mcu-responses` |
| `KNOWLEDGE_API_BASE_URL` | Base URL for Knowledge API | No | `coreai-mcu-knowledge-pgv` |
| `PROMPTS_API_BASE_URL` | Base URL for Prompts API | No | `coreai-mcu-prompts` |
| `PERSONA_API_BASE_URL` | Base URL for Persona API | No | `coreai-mcu-persona` |
| `NEXTAUTH_SECRET` | NextAuth secret | No | |
| `LANGFUSE_SALT` | NextAuth secret | No | |

> [!NOTE]
> The `NEXTAUTH_SECRET` and `LANGFUSE_SALT` can be generated using the following command:
> ```bash
> openssl rand -base64 32
> ```

Create a `.env` file based on the `.env.example` file. The `.env` file should be placed in the root of the project.

Run the following command to export the environment variables:
```bash
source .env
```

## Running the services
To start the coreai-mcu services execute the following:
```bash
./scripts/start
```
