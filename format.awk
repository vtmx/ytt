# BEGIN { system("clear") }

# Ignora linhas com [Música]
/^[0-9]+$|\[[Mm]úsica\]/ { next }

# Ignora linhas com [Risadas]
/^[0-9]+$|\[[Rr]isadas\]/ { next }

# Separa tempo inicial
/-->/ {
  split($0, parts, " --> ")
  split(parts[1], start, ",")
  start_time = start[1]
  next
}

NF {
  # Remove a ocorrência de [risadas]
  gsub(/ \[[Rr]isadas\]/, "")

  # Remove a ocorrência de >>
  gsub(/>> /, "")

  # Imprimi linha curta
  print start_time " = " $0
}

# Separar a string evita o erro
END { print "\n# vim" ":" "ft=dosini" }

# ft=awk
