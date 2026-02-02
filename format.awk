# BEGIN { system("clear") }

# Ignora número da legenda e linhas com [Música]
/^[0-9]+$|\[Música\]/ { next }

# Separa tempo inicial
/-->/ {
  split($0, parts, " --> ")
  split(parts[1], start, ",")
  start_time = start[1]
  next
}

NF {
  # Remove a ocorrência de >>
  gsub(/>> /, "")

  # Imprimi linha longa
  # if (match($0, /^[A-Z]/)) {
  #   if (firstline_exist == 0) {
  #     printf "%s - %s ", start_time, $0
  #     firstline_exist = 1
  #   } else {
  #     printf "\n%s - %s ", start_time, $0
  #   }
  # } else {
  #   printf "%s", $0
  # }

  # Imprimi linha curta
  print start_time " = " $0
}

END { print "\n# vim:ft=dosini" }

# ft=awk
