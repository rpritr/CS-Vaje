# Verifying Software Integrity (SHA256 & GPG)

## 🎯 Objectives

In this lab, students will learn how to:

- verify file integrity using SHA256 checksums  
- understand why checksums alone are not enough  
- use GPG to sign and verify files  
- detect tampered software before execution  
- apply secure practices when downloading scripts  

---

## 🧠 Background

When downloading scripts or software from the internet, there is always a risk that:

- the file was modified (tampered)  
- the file was replaced by a malicious version  
- the source cannot be trusted  

To mitigate this, we use:

- **Checksums (SHA256)** → verify integrity  
- **Digital signatures (GPG)** → verify authenticity  

---

## 📁 Lab Setup

You are given the following file:

install.sh

This script simulates a simple software installation.

---

## ⚙️ Task 1: Inspect the Script

Before running any script, always inspect it.

    cat install.sh

👉 Question:
- What does this script do?

FIrst lets install the required packages:

    sudo apt install gnupg coreutils

---

## ⚙️ Task 2: Generate SHA256 Checksum

Create a checksum file:

    sha256sum install.sh > install.sh.sha256

View the checksum:

    cat install.sh.sha256

---

## ⚙️ Task 3: Verify File Integrity

Check if the file is unchanged:

    sha256sum -c install.sh.sha256

Expected output:

    install.sh: OK

---

## ⚙️ Task 4: Generate GPG Key Pair

Generate your GPG key:

    gpg --full-generate-key

Recommended:

- RSA and RSA  
- 4096 bits  
- Set name and email  

List keys:

    gpg --list-keys

---

## ⚙️ Task 5: Sign the Checksum File

Sign the checksum file:

    gpg --detach-sign install.sh.sha256
    
This creates:

    install.sh.sha256.sig

Note to use the same key:

    gpg --list-secret-keys --keyid-format LONG
    gpg --local-user KEYID --detach-sign install.sh.sha256
---

## ⚙️ Task 6: Verify the Signature

Verify that the checksum is authentic:

    gpg --verify install.sh.sha256.sig install.sh.sha256

---

## ⚙️ Task 7: Simulate a Tampering Attack

Modify the script:

    echo "echo MALICIOUS CODE EXECUTED" >> install.sh

Now verify again:

    sha256sum -c install.sh.sha256

Expected:

    install.sh: FAILED

---

## ⚙️ Task 8: Safe Execution Workflow

1. Download file  
2. Verify checksum  
3. Verify signature  
4. Execute only if valid  

---

## 📝 Questions

1. Why should you never execute scripts without inspection?  
2. What does SHA256 guarantee?  
3. What does GPG guarantee?  
4. Can SHA256 prove the author of a file?  
5. Why is signing the checksum important?  
6. What happened after the script was modified?  

---

## 🧪 Bonus Task (Optional)

- Download a Linux ISO  
- Verify its checksum  
- Verify its GPG signature
- Source: https://www.kali.org/docs/introduction/download-images-securely/

---

## 🧹 Cleanup

    rm -f install.sh.sha256 install.sh.sha256.sig
    rm -rf src

---

## 🔑 Key Takeaways

- Integrity ≠ authenticity  
- Checksums detect changes  
- GPG proves origin  
- Always verify before execution  

---

## ⚠️ Important

Running unverified scripts can lead to:

- system compromise  
- data theft  
- malware infection  

Always follow secure practices.
