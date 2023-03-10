# [overthewire.org's bandit wargames](https://overthewire.org/wargames/bandit)
Host: bandit.labs.overthewire.org
Port: 2220
<details><summary>Level 0</summary>

```bash
ssh -p 2220 bandit0@bandit.labs.overthewire.org
```
Password: bandit0
</details>
<details><summary>Level 1</summary>

```bash
cat readme
```
Password: NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL
</details>
<details><summary>Level 2</summary>

```bash
cat ./-
```
Password: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
</details>
<details><summary>Level 3</summary>

```bash
cat spaces\ in\ this\ filename
cat "spaces in this filename"
```
Password: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
</details>
<details><summary>Level 4</summary>

```bash
cat inhere/.hidden
```
Password: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
</details>
<details><summary>Level 5</summary>

```bash
file inhere/* | grep ": ASCII text"
```
Password: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
</details>
<details><summary>Level 6</summary>

```bash
find inhere/ -size 1033c
```
Password: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
</details>
<details><summary>Level 7</summary>

```bash
find / -size 33c -user bandit7 -group bandit6 2> /dev/null
```
Password: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
</details>
<details><summary>Level 8</summary>

```bash
cat data.txt | grep millionth
```
Password: TESKZC0XvTetK0S9xNwm25STk5iWrBvP
</details>
<details><summary>Level 9</summary>

```bash
sort data.txt | uniq --unique
```
Password: EN632PlfYiZbn3PhVK3XOGSlNInNE00t
</details>
<details><summary>Level 10</summary>

```bash
strings data.txt | grep ^==
```
Password: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s
</details>
<details><summary>Level 11</summary>

```bash
base64 --decode data.txt
```
Password: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
</details>
<details><summary>Level 12</summary>

```bash
tr "a-zA-Z" "n-za-mN-ZA-M" < data.txt
```
Password: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv
</details>
<details><summary>Level 13</summary>

```bash
folder=$(echo $RANDOM | md5sum | head -c 20)
mkdir /tmp/$folder && cd /tmp/$folder && cp ~/data.txt . 
xxd -revert data.txt > 1 && file 1
zcat 1 > 2 && file 2
bunzip2 2 && mv 2.out 3 && file 3
zcat 3 > 4 && file 4
tar -xvf 4 && file data5.bin
tar -xvf data5.bin && file data6.bin
bunzip2 data6.bin && file data6.bin.out
tar -xvf data6.bin.out && file data8.bin
zcat data8.bin > final
cat final
```
Password: wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
</details>
<details><summary>Level 14</summary>

```bash
ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org
```
Password: fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
</details>
<details><summary>Level 15</summary>

```bash
cat /etc/bandit_pass/bandit14
nmap -p 30000-30000 localhost
telnet localhost 30000
```
Password: jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
</details>
<details><summary>Level 16</summary>

```bash

```
Password: 
</details>
<details><summary>Level 17</summary>

```bash

```
Password: 
</details>
<details><summary>Level 18</summary>

```bash

```
Password: 
</details>
<details><summary>Level 19</summary>

```bash

```
Password: 
</details>
<details><summary>Level 20</summary>

```bash

```
Password: 
</details>
<details><summary>Level 21</summary>

```bash

```
Password: 
</details>
<details><summary>Level 22</summary>

```bash

```
Password: 
</details>
<details><summary>Level 23</summary>

```bash

```
Password: 
</details>
<details><summary>Level 24</summary>

```bash

```
Password: 
</details>
<details><summary>Level 25</summary>

```bash

```
Password: 
</details>
<details><summary>Level 26</summary>

```bash

```
Password: 
</details>
<details><summary>Level 27</summary>

```bash

```
Password: 
</details>
<details><summary>Level 28</summary>

```bash

```
Password: 
</details>
<details><summary>Level 29</summary>

```bash

```
Password: 
</details>
<details><summary>Level 30</summary>

```bash

```
Password: 
</details>
<details><summary>Level 31</summary>

```bash

```
Password: 
</details>
<details><summary>Level 32</summary>

```bash

```
Password: 
</details>
<details><summary>Level 33</summary>

```bash

```
Password: 
</details>