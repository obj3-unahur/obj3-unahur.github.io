#!/usr/bin/env ruby

require 'yaml'

def posts
  Dir['./_posts/*']
end

def videos(clase)
  (clase['videos'] || []).map { |it| '* ' + it['nombre']  }.join("\n")
end

def lecturas(clase)
  (clase['lecturas'] || []).map { |it| '* ' + (it['id'] || '') + (it['title'] || '') }.join("\n")
end

def ejercicios(clase)
  clase['entrega']['ejercicios'].map { |it| '* ' + it['nombre'] }
end

def leer_clase(numero)
  ruta_clase = posts.find { |it| it.include? "clase-#{numero}" }
  YAML.load_file ruta_clase
end

clases = 1..7
for numero in clases
  clase = leer_clase(numero)
  puts "*** #{clase['title']} ***"
  puts 'Lecturas'
  puts lecturas(clase)
  puts 'Videos'
  puts videos(clase)
  puts 'Ejercicios'
  puts ejercicios(clase)
  puts
end
