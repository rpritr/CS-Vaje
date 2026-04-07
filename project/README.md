# 🛡️ Empirical Project: SSH Security Weakness Study

## 📌 Overview

In this project, you will perform an empirical analysis of SSH security by simulating brute-force attacks under different configurations.

The goal is to understand how password strength and defensive mechanisms affect the resistance of an SSH service against automated attacks.

---

## 🐳 Lab Setup (Docker)

This lab uses a preconfigured SSH server running inside Docker.

### 1. Start the environment

```bash
docker compose up -d
```

---

### 2. Connect to the SSH server

```bash
ssh student@localhost -p 2222
```

Default credentials:
- Username: `student`
- Password: `password123`

---

### ⚠️ SSH Warning (IMPORTANT)

If you see the following warning:

```
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```

This is expected when restarting Docker containers.

Fix it with:

```bash
ssh-keygen -R "[localhost]:2222"
```

Then reconnect.

---

### 3. Add additional users (for experiments)

If the create_users.sh script is not present in docker you can copy the script into the container:

```bash
docker cp create_users.sh ssh_lab:/create_users.sh
```

Run it:

```bash
docker exec -it ssh_lab bash
chmod +x /create_users.sh
/create_users.sh
```

This will create:

| User | Password | Purpose |
|------|---------|--------|
| weakuser | 123456 | Easy to crack |
| mediumuser | Password123 | Moderate |
| stronguser | Str0ng!Pass#2026 | Hard to crack |

---

### 4. Run brute-force attack

Example using Hydra:

```bash
hydra -l weakuser -P passwords.txt ssh://localhost:2222
```

---

### ⚠️ Important

- Perform attacks **only on this local environment**
- Do NOT target real systems

---

## 🎯 Objectives

- Understand how SSH authentication can be attacked using brute-force techniques  
- Evaluate the impact of password strength on attack success  
- Analyze defensive mechanisms such as rate limiting  
- Collect and interpret empirical data  

---

## 🧪 Scenario

You are a security analyst tasked with evaluating the resilience of an SSH server.

The organization suspects that weak credentials and poor configuration may expose the system to brute-force attacks.

Your job is to test different configurations and provide evidence-based recommendations.

---

## 🛠️ Tools

- `nmap` – scanning  
- `hydra` – brute-force  
- Linux (Ubuntu/Kali recommended)  

Optional:
- Python / Excel  

---

## ⚙️ Experimental Setup

Test at least **3 configurations**:

- Weak password, no protection  
- Strong password, no protection  
- Strong password + rate limiting (e.g., fail2ban)  

---

## 🔍 Tasks

### 1. Reconnaissance
- Identify SSH service using `nmap`

### 2. Brute-force attack
- Execute attack using `hydra`
- Record:
  - success
  - time
  - attempts

### 3. Data collection

| Config | Password | Protection | Success | Time | Attempts |
|--------|----------|-----------|--------|------|----------|

---

### 4. Analysis

- Impact of password strength  
- Effectiveness of protections  
- Security vs usability trade-off  
- Explain how fail2ban would affect your results.
- Would it prevent brute-force attacks completely?
- How could an attacker bypass it?

---

### 5. Recommendations

Provide at least 3 improvements.

---

## 📊 Deliverables

Report (5–10 pages):

1. Introduction  
2. Methodology  
3. Experiment  
4. Results  
5. Discussion  
6. Conclusion  

---

## 📈 Evaluation

| Criterion | Points |
|----------|--------|
| Understanding | 10 |
| Design | 20 |
| Execution | 20 |
| Analysis | 20 |
| Discussion | 20 |
| Clarity | 10 |

---

## 💡 Bonus

- Dictionary vs brute-force  
- Graphs  
- Additional defenses  
