# Password Generator

`password-generator.py` is a Python script designed to generate highly secure and complex passwords by combining random letters, symbols, and numbers. Using a mix of cryptographic-grade randomness and varied character sets, it provides strong passwords ideal for safeguarding sensitive accounts and applications.

## Features

- **Multi-part Password Structure**: Each password consists of four randomized segments, containing letters, symbols, and numbers in each part to maximize security.
- **Customizable Password Count**: Specify how many passwords you need, and the script will generate unique options for you.
- **Enhanced Security**: Uses Python’s `secrets` library to ensure cryptographic randomness, providing maximum entropy for password generation.

## Getting Started

### Prerequisites
- Python 3.x is required to run this script.

### Download and run
1. Clone this repository:
   ```bash
   git clone https://github.com/GlitchLinux/password-generator.py.git
   cd password-generator.py
   python3 password-generator.py
