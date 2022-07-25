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

## Program usage
Program lze samostatně spustit pomocí bash scriptu.
```bash
bin/run.sh
```

> ### Info
> To vám umožňuje si vytvořit link do bin složky.

Pro příklad vytvoření linku:
```bash

```