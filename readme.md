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

## Installation
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

## Usage
