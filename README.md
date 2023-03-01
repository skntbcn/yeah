# yeah
Gestión sencilla de tus comandos favoritos

<p align="center">
  <img src="images/avatar.png" alt="Yeah Logo" width="64"
	style="margin-right: 5px; float:left;" />
</p>

Herramienta básica para tener un forma de organizar algunos apuntes de trabajo durante tus ejercicios de pentesting.

¿Cómo funciona?
=
Básicamente funciona manejando los directorios y ficheros (llamados secciones y páginas) en la ruta donde está el script. Las secciones son los directorios y las páginas los ficheros que hay dentro de cada directorio y que contienen la información.

El script tira del history del usuario, obteniendo el último comando ejecutado por completo, dándo al usuario la oportunidad de añadirlo a una sección y página, a la vez que se ofrece la oportunidad de añadir un comentario al comando.

Tiene básicamente 3 formas de operar (implementaré algunas más); lectura, escritura y listado.

Para listar las páginas existentes, simplemente ejecuta:
```bash=
❯ $> yeah
[+] Sections and pages:
aws                      s3
htb-machine              <empty>
mssql                    impacket-mssqlclient
nc                       listen
network-scan             nmap
python                   impacket-psexec servers
smb                      smbclient
string-generator         crunch
vpn                      openvpn
web                      gobuster wfuzz
windows                  dangerous_paths netuse winpeas
```

Si quieres leer una página, ejecuta:
```bash=
❯ $> yeah mssql impacket-mssqlclient read
[+] Page information:

# Connect SQL Server with Windows auth
impacket-mssqlclient [-db Catalog] -port 1433 -windows-auth [DOM\]user@rtarget

# Is this user sysadmin
SELECT is_srvrolemember('sysadmin');
....
...
..
.
[+] Bye!
```

Si quieres añadir una nueva página, ejecuta:
```bash=
❯ $> touch file
❯ ## yeah section_name page_name
❯ $> yeah example test
[!] Section does not exist!
[!] Page does not exist!
[?] Do you want to store 'touch file' in section 'example' and page 'test'? [y/n]: 
[?] Add a comment or leave it blank []: Test Comment
[+] Section created!
[+] Page created!
[+] Saved in /path/to/yeah.repo/example/test, bye!

❯ $> cat /path/to/yeah.repo/example/test
# Test Comment
touch file

❯ $> yeah example test read
[+] Page information:

# Test Comment
touch file
[+] Bye!

❯ $> yeah
[+] Sections and pages:
aws                      s3
example                  test
htb-machine              <empty>
....
...
..
.
```

Cosas que te debes modificar del script:
* Valor de la variable 'yeahpath'
* Valor de la variable 'username'
* Valor de la variable HISTFILE, que en el script por defecto está a ~/.zsh_history. Aproximadamente en la línea 102

💡 Yo tengo un alias en mi .zshrc con algo así:
```bash=
alias yeah='/path/to/yeah.repo'
```
