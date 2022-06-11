#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#
sed 's/\//-/g' data.csv > data1.csv
sed 's/-\([0-9][0-9]\);/-20\1;/' data1.csv > data2.csv
sed 's/\([0-9]\+\)\-\([0-9]\+\)\-\([0-9]\+\)/\3-\2-\1/g' data2.csv > data3.csv
sed 's/-\([1-9]\);/-0\1;/g' data3.csv > data4.csv
sed 's/-\([1-9]\)-/-0\1-/g' data4.csv > data5.csv
sed 's/;;/;\\N;/g;' data5.csv > data6.csv
sed 's/;N/;\\N/g;' data6.csv > data7.csv
sed 's/;\\N;$/;\\N;\\N/g' data7.csv > data8.csv
sed 's/n/N/g;' data8.csv > data9.csv
sed 's/;N$/;\\N/g' data9.csv > data10.csv
sed 's/,/./g;' data10.csv > data11.csv
sed 's/;/,/g;' data11.csv > output.csv
