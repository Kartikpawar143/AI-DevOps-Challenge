# 🐳 Dockerfile Generator

A GenAI powered tool that generates optimized Dockerfiles based on programming language input. This project uses Ollama with the Llama3 model to create Dockerfiles following best practices.

## 📋 Prerequisites

### Installing Ollama

1. **Download and Install Ollama**
   ```bash
   # For Linux
   curl -fsSL https://ollama.com/install.sh | sh

   # For MacOS
   brew install ollama
   ```

2. **Start Ollama Service**
   ```bash
   ollama serve
   ```

3. **Pull Llama3 Model**
   ```bash
   ollama pull llama3.2:1b
   ```

## 🚀 Project Setup

1. **Create Virtual Environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Linux/MacOS
   # or
   .\venv\Scripts\activate  # On Windows
   ```

2. **Install Dependencies**
   ```bash
   pip3 install -r requirements.txt
   ```

3. **Run the Application**
   ```bash
   python3 generate_dockerfile.py
   ```

## 💡 How It Works

1. The script takes a programming language as input (e.g., Python, Node.js, Java)
2. Connects to the Ollama API running locally
3. Generates an optimized Dockerfile with best practices for the specified language
4. Returns the Dockerfile content with explanatory comments

## 📝 Example Usage

```bash
python3 generate_dockerfile.py
Enter programming language: python
# Generated Dockerfile will be displayed...
```
## Outputs
<img width="1920" height="1080" alt="Screenshot 2025-09-24 185909" src="https://github.com/user-attachments/assets/94126ae0-4f04-4068-bd90-a9b8e14b62d5" />

<img width="1920" height="1080" alt="Screenshot 2025-09-24 191313" src="https://github.com/user-attachments/assets/62955539-e1c0-429c-b040-0611d5fafbfc" />

<img width="1920" height="1080" alt="Screenshot 2025-09-24 194403" src="https://github.com/user-attachments/assets/734061b4-8e39-4481-a9c7-6662b296c261" />

<img width="1920" height="1080" alt="Screenshot 2025-09-24 194517" src="https://github.com/user-attachments/assets/adb94313-1e16-46b1-8a68-43cd825d22c6" />

<img width="1920" height="1080" alt="Screenshot 2025-09-24 194931" src="https://github.com/user-attachments/assets/49759603-6425-43af-8a54-a9a3fc788e93" />
