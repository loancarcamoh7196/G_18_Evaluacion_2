def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end

#Llama a archivo y almacena su contenido localmente
array_alumnos = read_alum('alumnos.csv')

#Menu
def menu
  puts "*----------------------------------------------------------------------*"
  puts "------------------------- Menú Desafío Latam ---------------------------"
  puts "*----------------------------------------------------------------------* \n"
  puts "1.- Nombre de cada alumno y el promedio de sus notas."
  puts "2.- Nombre de cada alumno y la cantidad de inasistencias."
  puts "3.- Nombres de los alumnos aprobados."
  puts "4.- Salir"
  puts "Ingrese opción: "
end

def aprobar?( nota_alumno=5.0)
  nota_min = 5.0
  msj = "posee nota necesaria para aprobar." if nota_alumno >= nota_min
  return msj
end

opcion = 5

while opcion !=4
  menu
  opcion = gets.chomp.to_i

  if opcion == 1
    puts "\n*---- Opción 1  - Nombre de cada alumno y el promedio de sus notas ----* \n"
    array_alumnos.each do |alumno|
      nom = alumno[0]
      suma_nota = alumno[1..-1].map { |num| num.to_i}
      prom_nota = suma_nota.sum / alumno[1..-1].count.to_f
      puts "#{nom}: #{prom_nota}"
    end
    puts "\n*------------------------------ Fin opcion ----------------------------*\n \n  \n  \n"
  elsif opcion == 2
    puts "\n*-- Opción 2  - Nombre de cada alumno y la cantidad de inasistencias --* \n"
    inasistencias = 0
    array_alumnos.each do |alumno|
      nom = alumno[0]
      alumno[1..-1].each do |evaluacion|
        inasistencias = inasistencias +1 if evaluacion == 'A'
      end
      puts "#{nom}: #{inasistencias}"
    end
    puts "\n*------------------------------ Fin opcion ----------------------------*\n \n  \n  \n"
  elsif opcion == 3
    puts "\n*------------ Opción 3  - Nombres de los alumnos aprobados --------------* \n \n"
    array_alumnos.each do |alumno|
      nom = alumno[0]
      suma_nota = alumno[1..-1].map { |num| num.to_i}
      prom_nota = suma_nota.sum / alumno[1..-1].count.to_f
      aprobo = aprobar?(prom_nota)
      puts "El alumno #{nom} #{aprobo}" if aprobo != nil
    end
    puts "\n*------------------------------ Fin opcion ----------------------------*\n \n  \n  \n"
  elsif opcion == 4
    puts "\n*--------------- Opción 4 - Salir del Programa ------------------------*"
    puts "Adios\nTen un buen día! ;)"
  else
    puts "\n¡Atención!, selecione una opción válida...\n \n  \n  \n"
  end
end
