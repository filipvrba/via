# Via
Is tool for *ruby on rails*. It allows typing of pure a html code,
so no more repeating an special symbols.

- I'll show you example from **via**:
  ```erb
  # index.html.via

  10.times do |number|
    <p>= number</p>
  end
  ```

  > ### Info
  > Via look like ruby classic code and
  > 10x printing a dom element with sequence number.

- Now I will show you it same code in **erb**:
  ```erb
  # index.html.erb

  <% 10.times do |number| %>
    <p><%= number %></p>
  <% end %>
  ```

Can be seen from exemples, **via** adhere to ruby philosophy *"A programmer's best friend"*.

## 1 Installation
This a program has been very easy to install. Repository must be cloned to your directory
and bash script under name *install.sh* is ready for start via a console.

**Quick installation:**
```bash
git clone https://github.com/filipvrba/via.git &&
cd via && bin/install.sh
```

> ### Info
> All an submodules be cloned to a repository and
> create link for a bash script under name 'run.sh'.

## 2 Usage
The application is standalone and edit a code is not required.
A *'via'* is command in terminal with helping start program.
This application search all files with a *'.via'* ending suffix,
in an directory tree hierarchy. This all files transformate to an *erb* form
and saved them with a *'.erb'* ending suffix to new files.

**Start program:**
```bash
via
```

> ### Warning
> If not pasted a relative path to directory or file,
> so program search from current a directory.
> Maybe a program ending while a bit later.
> For a program manual ending recommended with key typing CTRL+C.

## 2.1 Parameters
Via uses parameters that extend the functionality of the application.

- **-i:** the Via implemented to an rails project

- **-d ID:** developer mode with an number identification.
  - **0** - Transformed text prints to a terminal and create new a file (default).
  - **1** - Transformed text prints to a terminal, by without a file create.
  - **2** - Searches all files under suffix a *'.via'* and print found all files with relative path.

- **-s DIR:** a directory for save files.

This pattern by apply for start a **via** program, so parameters by added to a center the command.

```
via [parameters] [file|dir]
```

## 2.2 Example
Create a workspace directory and in inside create next directories with a file.

```
.
└── share
    └── vias
        └── index.html.via
```

```erb
# index.html.via

10.times do |number|
  <p>= number</p>
end
```

A file under name *'index.html.via'* added to a *'vias'* directory,

Added to a *'vias'* directory was a new file named *'index.html.via'*,
so file transformation to erb form.

Přidal jsem do složky *'vias'* soubor pod názvem *'index.html.via'*,
který chci aby se transformoval do podoby **erb**. Nechci míchat soubory
*'.erb'* s *'.via'*. Proto nově vytvořené soubory by se měli vytvořit do
*'share'* adresáře. Pro lepší kontrolu chci vytisknout do terminálu
transformovaný text.

**Použiji tento příkaz:**

```bash
via -d -s share share/vias
```

**Return:**

```
==========ERB==========
+--------------+
|index.html.erb|
+--------------+
<%10.times do |number|%>
  <p><%= number%></p>
<%end%>

This a file '/share/index.html.erb' has been created.
```
