#Create CA_ROOT

##Step 1: Generate a Private Key

    openssl genrsa -des3 -out ca_root.key 2048

##Step 2: Generate a CSR (Certificate Signing Request)

    openssl req -new -key ca_root.key -out ca_root.csr

##Step 3: Remove Passphrase from Key

    cp ca_root.key ca_root.key.org
    openssl rsa -in ca_root.key.org -out ca_root.key

##Step 4: Generating a Self-Signed Certificate

    openssl x509 -req \
     -days 3650 -sha256 \
     -signkey ca_root.key \
     -in ca_root.csr \
     -out ca_root.crt


#Create CA_APP

##Step 1: Generate a Private Key

    openssl genrsa -des3 -out hypercd.key 2048

##Step 2: Generate a CSR (Certificate Signing Request)

    openssl req -new -key hypercd.key -out hypercd.csr
    openssl req -in hypercd.csr -noout -text

##Step 3: Remove Passphrase from Key

    cp hypercd.key hypercd.key.org
    openssl rsa -in hypercd.key.org -out hypercd.key

##Step 4: Generating a Certificate via CA_ROOT

    mkdir -p demoCA/newcerts
    touch demoCA/index.txt demoCA/index.txt.attr
    echo 1000 > demoCA/serial
    openssl ca \
     -days 1825 \
     -notext -md sha256 \
     -cert ca_root.crt -keyfile ca_root.key \
     -in hypercd.csr -out hypercd.crt

##Step 5: Verify the cert

    openssl x509 -noout -text -in hypercd.crt