# Output2Image
Simple bash script that transforms the output in an ansi file and then into a png file.

# Dependencies
Ansilove
```
sudo apt-get install ansilove
```
Security-Header-Checker
```
# Make sure to clone it inside the same directory you will clone Output2Image
git clone https://github.com/pedpedro/Security-Headers-Checker.git
cd Security-Headers-Checker
pip install -r requirements.txt
```
SSLScan
```
sudo apt-get install sslscan
```

#Install
```
git clone https://github.com/pedpedro/Output2Image.git
# Create a directory to work on a project:
mkdir <dir-name>
cd <dir-name>
cp ../Security-Headers-Checker/sec-headers-check.py . && cp ../Output2Image/o2i.sh .
sudo chmod +x o2i.sh
```

# Usage
```
Uso: ./o2i.sh [headers|sslscan] (alvo|lista)
```
