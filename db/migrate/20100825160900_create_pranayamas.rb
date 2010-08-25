class CreatePranayamas < ActiveRecord::Migration
  def self.up
    pranayama_tt = TechniqueType.create(:symbol => 'pranayama')
    pranayama_tt.translations_attributes = [{:locale => 'en', :name => 'Pránáyáma'}, {:locale => 'es', :name => 'Pránáyáma'}]
    pranayama_tt.save

    tamas = Technique.create!(:code => '1', :technique_type => pranayama_tt)
    tamas.translations_attributes = [{:locale => 'es', :name => 'Tamas pránáyáma', :description => "respiración imperceptible.
a) Inspirar tan lentamente que no se consiga percibir el menor movimiento respiratorio.
b) Retener el aire por unos segundos, sin contar ritmo.
c) Exhalar tan lentamente que sea imperceptible."}]
    tamas.save

    rajas = Technique.create!(:code => '2', :technique_type => pranayama_tt)
    rajas.translations_attributes = [{:locale => 'es', :name => 'Rajas pránáyáma', :description => "respiración dinámica.
No confundir con rája pránáyáma.
a) Inspirar elevando los brazos hasta la altura de los hombros.
b) Retener el aire cerrando firmemente las manos y moviendo vigorosamente los brazos, flexionándolos y extendiéndolos, trayendo las manos hasta los hombros y volviendo a extenderlos varias veces antes de exhalar.
c) Exhalar lentamente, bajando los brazos simultáneamente."}]
    rajas.save

    adhama = Technique.create!(:code => '3', :technique_type => pranayama_tt)
    adhama.translations_attributes = [{:locale => 'es', :name => 'Adhama pránáyáma', :description => "respiración abdominal sin ritmo.
Otros nombres:
ardha pránáyáma
ardha prána kriyá.
a) Inspirar proyectando el abdomen hacia afuera, procurando llenar la parte baja de los pulmones.
b) Retener el aire por algunos segundos, sin contar ritmo.
c) Exhalar retrayendo el abdomen, procurando vaciar todo lo posible los pulmones, especialmente la parte baja."}]
    adhama.save

    adhama_k = Technique.create!(:code => '4', :technique_type => pranayama_tt)
    adhama_k.translations_attributes = [{:locale => 'es', :name => 'Adhama kúmbhaka', :description => "respiración abdominal con ritmo (1-2-1).
Otro nombre: ardha kúmbhaka.
a) Inspirar proyectando el abdomen hacia afuera, contando un tiempo.
b) Retener el aire en los pulmones, contando dos tiempos.
c) Exhalar retrayendo el abdomen, contando un tiempo."}]
    adhama_k.save

    b_adhama_k = Technique.create!(:code => '5', :technique_type => pranayama_tt)
    b_adhama_k.translations_attributes = [{:locale => 'es', :name => 'Bandha adhama kúmbhaka', :description => "abdominal sin ritmo y con bandhas.
Otro nombre: bandha ardha prána kriyá.
a) Inspirar proyectando el abdomen hacia afuera, elevando el mentón y distendiendo la región de la tiroides.
b) Retener el aire, ejecutando jíhva bandha (comprimiendo la lengua contra el paladar, en la región más blanda).
c) Exhalar retrayendo el abdomen mientras baja la cabeza, comprimiendo el mentón contra el pecho (jalándhara bandha), contrayendo el abdomen bien hacia adentro, hacia atrás y hacia arriba (uddiyana bandha) y contrayendo fuertemente los esfínteres del ano y de la uretra (múla bandha)."}]
    b_adhama_k.save

    adhama_k_p = Technique.create!(:code => '6', :technique_type => pranayama_tt)
    adhama_k_p.translations_attributes = [{:locale => 'es', :name => 'Adhama kúmbhaka pránáyáma', :description => "abdominal con ritmo y con bandhas (1-2-1).
Otro nombre: ardha kúmbhaka bandha.
a) Inspirar proyectando el abdomen hacia afuera en un tiempo, elevando el mentón y distendiendo la región de la tiroides.
b) Retener el aire durante dos tiempos, ejecutando jíhva bandha (comprimiendo la lengua contra el paladar, en la parte más blanda, atrás).
c) Exhalar retrayendo el abdomen en un tiempo, mientras baja la cabeza, comprimiendo el mentón contra el pecho (jalándhara bandha), contrayendo el abdomen hacia adentro, hacia atrás y hacia arriba (uddiyana bandha) y contrayendo fuertemente los esfínteres del ano y de la uretra (múla bandha)."}]
    adhama_k_p.save

    madhyama = Technique.create!(:code => '7', :technique_type => pranayama_tt)
    madhyama.translations_attributes = [{:locale => 'es', :name => 'Madhyama pránáyáma', :description => "respiración media sin ritmo.
a) Colocar las palmas de las manos tocando los lados de las costillas, con los dedos vueltos hacia el frente.
b) Exhalar haciendo presión con las manos, de manera que éstas empujen las costillas y las puntas de los dedos se aproximen a la altura del plexo solar.
c) Inspirar deshaciendo la presión de las manos, dejando ahora que éstas sean impelidas hacia afuera por las costillas.
d) En este no se mueve la parte baja ni la alta de los pulmones, y cuando la musculatura intercostal esté bien dominada, la utilización de las manos podrá ser dispensada."}]
    madhyama.save

    madhyama_k = Technique.create!(:code => '8', :technique_type => pranayama_tt)
    madhyama_k.translations_attributes = [{:locale => 'es', :name => 'Madhyama kúmbhaka', :description => "respiración media con ritmo (1-2-1).
a) Proceder como en el pránáyáma anterior.
b) Respirar lo más lentamente posible, en la medida de su confort y de manera ritmada.
c) Inspirar en un determinado tiempo, retener el aire en los pulmones dos veces ese tiempo y exhalar en el mismo tiempo de la inspiración."}]
    madhyama_k.save

    b_madhyama_p = Technique.create!(:code => '9', :technique_type => pranayama_tt)
    b_madhyama_p.translations_attributes = [{:locale => 'es', :name => 'Bandha madhyama pránáyáma', :description => "respiración media sin ritmo y con bandhas.
a) Respirar utilizando sólo la parte media de los pulmones, que corresponde a la región intercostal.
b) Inspirar inclinando la cabeza hacia atrás y colocar la punta de la lengua en el paladar blando, presionándolo bien atrás (jíhva bandha), mientras se retiene el aire en los pulmones.
c) Exhalar, aproximando el mentón a lo alto del pecho, flexionando la región cervical.
d) Con los pulmones vacíos, mantener la presión del mentón contra el pecho (jalándhara bandha), contraer el abdomen profundamente (uddiyana bandha) y también los esfínteres del ano y de la uretra (múla bandha). Permanencia libre en la retención sin aire."}]
    b_madhyama_p.save

    madhyama_k_p = Technique.create!(:code => '10', :technique_type => pranayama_tt)
    madhyama_k_p.translations_attributes = [{:locale => 'es', :name => 'Madhyama kúmbhaka pránáyáma', :description => "respiración media con ritmo y con bandhas (1-2-1).
a) Ejecutar el pránáyáma anterior, agregando ritmo.
b) Inspirar en un determinado tiempo, retener el aire en los pulmones el doble de este tiempo y exhalar haciendo el mismo conteo de la inspiración."}]
    madhyama_k_p.save

    uttama = Technique.create!(:code => '11', :technique_type => pranayama_tt)
    uttama.translations_attributes = [{:locale => 'es', :name => 'Uttama pránáyáma', :description => "respiración alta sin ritmo.
a) Inspirar llevando el aire hacia el extremo superior de los pulmones. Para eso, se deben mantener levemente contraídas las musculaturas abdominal e intercostal.
b) Retener el aire durante algunos instantes.
c) Exhalar con suavidad y control."}]
    uttama.save

    uttama_k = Technique.create!(:code => '12', :technique_type => pranayama_tt)
    uttama_k.translations_attributes = [{:locale => 'es', :name => 'Uttama kúmbhaka', :description => "respiración alta con ritmo (1-2-1).
a) Desarrollar la respiración alta como se explica arriba, procurando ejecutarla lo más lentamente posible e introducir el ritmo.
b) Inspirar en un tiempo, retener el aire en dos tiempos y exhalar en un tiempo."}]
    uttama_k.save

    b_uttama_p = Technique.create!(:code => '13', :technique_type => pranayama_tt)
    b_uttama_p.translations_attributes = [{:locale => 'es', :name => 'Bandha uttama pránáyáma', :description => "respiración alta sin ritmo y con bandhas.
a) Inspirar llevando el aire hacia la parte alta de los pulmones, dejando caer la cabeza hacia atrás y haciendo jíhva bandha, presionando con la punta de la lengua la región anterior del paladar.
b) Mantener este bandha durante el tiempo de retención con aire.
c) Exhalar y aproximar el mentón al esternón.
d) Permanecer con los pulmones vacíos manteniendo la presión del mentón contra el tórax (jalándhara bandha), contraer el abdomen llevándolo hacia adentro y hacia arriba (uddiyana bandha) y ejecutar la contracción de los esfínteres del ano y de la uretra (múla bandha).
OBS.: en este respiratorio, las partes baja y media de los pulmones no se utilizan."}]
    b_uttama_p.save

    uttama_k_p = Technique.create!(:code => '14', :technique_type => pranayama_tt)
    uttama_k_p.translations_attributes = [{:locale => 'es', :name => 'Uttama kúmbhaka pránáyáma', :description => "respiración alta con ritmo y con bandhas (1-2-1).
a) Inspirar con suavidad por las fosas nasales, en un tiempo, llenando sólo la parte alta de los pulmones.
b) Retener el aire en dos tiempos, ejecutando jíhva bandha (la cabeza hacia atrás, con la punta de la lengua presionando la región blanda del paladar).
c) Exhalar en un tiempo, presionando el mentón contra la parte alta del esternón.
d) Permanecer sin aire libremente, manteniendo el mentón sobre el pecho, haciendo presión en la región de la glándula tiroides (jalándhara bandha), contrayendo profundamente el abdomen (uddiyana bandha) y los esfínteres del ano y de la uretra (múla bandha)."}]
    uttama_k_p.save

    raja = Technique.create!(:code => '15', :technique_type => pranayama_tt)
    raja.translations_attributes = [{:locale => 'es', :name => 'Rája pránáyáma', :description => "respiración completa, sin ritmo, sin bandhas.
Otro nombre: prána kriyá.
a) Inspirar proyectando el abdomen hacia afuera, luego las costillas hacia los lados, y finalmente dilatando la parte más alta del tórax, sin contar ritmo.
b) Retener el aire en los pulmones por algunos segundos, sin contar ritmo.
c) Exhalar, soltando el aire primeramente de la parte alta, después de la parte media y finalmente de la parte baja de los pulmones (hay autores que prefieren la exhalación en el orden inverso, lo que, en nuestra opinión, no altera casi nada)."}]
    raja.save

    bandha = Technique.create!(:code => '16', :technique_type => pranayama_tt)
    bandha.translations_attributes = [{:locale => 'es', :name => 'Bandha pránáyáma', :description => "respiración completa, sin ritmo, con bandhas.
Otro nombre: prána bandha kriyá.
a) Inspirar proyectando el abdomen hacia afuera, luego las costillas hacia los lados y finalmente dilatando la parte más alta del tórax, todo en la misma inspiración, sin contar ritmo; al mismo tiempo elevar el mentón, distendiendo la región de la tiroides.
b) Retener el aire durante algunos segundos con la cabeza inclinada hacia atrás y sin contar ritmo.
c) Exhalar llevando la cabeza hacia el frente, soltando el aire primeramente de la parte alta, después de la parte media y finalmente de la parte más baja de los pulmones, sin contar ritmo; al mismo tiempo que se exhala, ir comprimiendo el mentón contra el pecho (jalándhara bandha), contrayendo el abdomen bien hacia adentro, atrás y arriba (uddiyana bandha) y contrayendo con fuerza los esfínteres del ano y de la uretra (múla bandha)."}]
    bandha.save

    antara = Technique.create!(:code => '17', :technique_type => pranayama_tt)
    antara.translations_attributes = [{:locale => 'es', :name => 'Antara kúmbhaka', :description => "respiración completa con ritmo (1-2-1).
Otro nombre: kúmbhaka.
a) Inspirar dilatando la parte baja (adhama), media (madhyama) y alta (uttama) de los pulmones, primeramente proyectando el abdomen hacia afuera, después las costillas hacia los lados y finalmente expandiendo la zona alta del tórax, contando un tiempo.
b) Retener el aire en los pulmones, contando dos tiempos.
c) Exhalar, soltando el aire primeramente de la parte alta, después de la parte media y finalmente de la parte baja de los pulmones, contando un tiempo.
OBS.: para los más adelantados, el ritmo puede ir progresivamente pasando a 1–4–2, que es mucho más fuerte."}]
    antara.save

    kevala = Technique.create!(:code => '18', :technique_type => pranayama_tt)
    kevala.translations_attributes = [{:locale => 'es', :name => 'Kêvala kúmbhaka', :description => "retención del aliento.
Este respiratorio es citado por Pátañjali en su obra clásica Yôga Sútra, escrita hace más de 2.000 años. 
Consiste en retener el aire en cualquier fase de la respiración, es decir, sin haber inspirado o exhalado previamente con la intención de retener después.
El practicante debe retener el mayor tiempo posible, sin exageración, progresivamente."}]
    kevala.save

    bandha_kumbhaka_pranayama = Technique.create!(:code => '19', :technique_type => pranayama_tt)
    bandha_kumbhaka_pranayama.translations_attributes = [{:locale => 'es', :name => 'Bandha kúmbhaka pránáyáma', :description => "respiración completa, con ritmo y con bandhas (1-2-1).
Otro nombre: kúmbhaka bandha.
a) Inspirar como en antara kúmbhaka, ya explicado, sólo que al inspirar se eleva el mentón distendiendo la tiroides, mientras se cuenta un tiempo.
b) Retener el aire contando dos tiempos.
c) Exhalar como en antara kúmbhaka, en un tiempo, sólo que al exhalar se debe ir inclinando la cabeza hacia el frente, comprimiendo el mentón contra el pecho (jalándhara bandha), contrayendo el abdomen bien hacia adentro, hacia atrás y hacia arriba (uddiyana bandha) y contrayendo con fuerza los esfínteres del ano y de la uretra (múla bandha). La práctica conjunta de esos tres bandhas se denomina bandha traya.
OBS.: para los más adelantados, el ritmo puede ir progresivamente pasando a 1–4–2."}]
    bandha_kumbhaka_pranayama.save

    manasika = Technique.create!(:code => '20', :technique_type => pranayama_tt)
    manasika.translations_attributes = [{:locale => 'es', :name => 'Manasika pránáyáma', :description => "respiración completa con mentalización.
a) Inspirar lentamente e imaginar con nitidez una fuerte luz dorada que penetra por las fosas nasales.
b) Retener el aire en los pulmones, visualizando que esa energía es absorbida por los alvéolos, penetra en la corriente sanguínea y es depositada en cada célula, revitalizándolas.
c) Al exhalar, mentalizar que el cuerpo irradia como el sol.
d) Se pueden agregar bandhas y ritmo, como también utilizar otros colores de acuerdo con el interés del momento."}]
    manasika.save

    bahya = Technique.create!(:code => '21', :technique_type => pranayama_tt)
    bahya.translations_attributes = [{:locale => 'es', :name => 'Báhya kúmbhaka', :description => "retención vacía (sin aire).
Otro nombre: shúnyaka.
a) Hacer una respiración completa (adhama, madhyama, uttama).
b) Exhalar lentamente.
c) Retener sin aire el mayor tiempo posible, sin exageración, aumentando progresivamente.
OBS.: este pránáyáma se utiliza para inhibir las funciones cerebrales mediante la reducción de la provisión de oxígeno al cerebro, y con eso facilitar el control de los vrittis (“Yôga chitta vritti nirôdhah”, Yôga Sútra, cap. I, vers. 2). Se trata de una práctica que encierra algún riesgo de lesionar el sistema nervioso, y por eso no se recomienda para iniciantes."}]
    bahya.save

    nadi_shod = Technique.create!(:code => '22', :technique_type => pranayama_tt)
    nadi_shod.translations_attributes = [{:locale => 'es', :name => 'Nádí shôdhana pránáyáma', :description => "respiración alternada sin ritmo.
Otro nombre: vamakrama o vamah krama.
a) Colocar las manos en jñána mudrá.
b) Obstruir la fosa nasal derecha con el dedo medio de la mano derecha en jñána mudrá19.
c) Inspirar por la fosa nasal izquierda (respiración completa).
d) Retener el aire el mayor tiempo posible, sin exageración, confortablemente.
e) Cambiar la fosa nasal en actividad, obstruyendo ahora la izquierda, siempre con las manos en jñána mudrá19 y utilizando la misma mano para obstruir la fosa nasal.
f) Exhalar por el lado derecho.
g) Continuar el pránáyáma, inspirando por la fosa nasal derecha, y así sucesivamente.
OBS.: nótese que la fosa nasal en actividad se alterna siempre que los pulmones están llenos y jamás cuando están vacíos. Hay otros mudrás que pueden utilizarse para obstruir las fosas nasales y cada escuela tiene preferencia por uno de ellos. En nuestro caso, optamos por jñána mudrá."}]
    nadi_shod.save

    nadi_shod_k = Technique.create!(:code => '23', :technique_type => pranayama_tt)
    nadi_shod_k.translations_attributes = [{:locale => 'es', :name => 'Nádí shôdhana kúmbhaka', :description => "alternada con ritmo (1-2-1 ó 1-4-2).
Otro nombre: sukha púrvaka.
Exactamente igual al pránáyáma anterior, sólo que agregando ritmo: un tiempo para inspirar, dos para retener con aire, uno para exhalar, y sin retención vacía (shúnyaka).
Los más adelantados podrán ir pasando progresivamente al ritmo 1-4-2. Lea explicaciones sobre el ritmo al inicio de este capítulo."}]
    nadi_shod_k.save

    man_nadi_shod = Technique.create!(:code => '24', :technique_type => pranayama_tt)
    man_nadi_shod.translations_attributes = [{:locale => 'es', :name => 'Manasika nádí shôdhana', :description => "alternada con ritmo (1-2-1 ó 1-4-2).
a) Respirar en forma amplia, conciente y profunda, por las dos fosas nasales.
b) Imaginar una intensa luminosidad que penetra por la fosa nasal derecha.
c) Retener el aire en los pulmones, visualizando que esta energía impregna todo el cuerpo.
d) Durante la exhalación, mentalizarla saliendo por la fosa nasal izquierda.
e) En la inspiración siguiente, imaginar una fuerte luz que penetra por la fosa nasal izquierda.
f) En la retención con aire, ésta es asimilada.
g) En la exhalación, imaginarla saliendo por la fosa nasal derecha.
h) Ejecutar varios ciclos.
OBS.: se puede utilizar cualquiera de los colores recomendados para las prácticas de mentalización."}]
    man_nadi_shod.save

    surya = Technique.create!(:code => '25', :technique_type => pranayama_tt)
    surya.translations_attributes = [{:locale => 'es', :name => 'Súrya pránáyáma', :description => "respiración por la fosa nasal positiva o solar.
a) Colocar las manos en jñána mudrá19.
b) Obstruir la fosa nasal negativa (izquierda para los hombres o derecha para las mujeres), con el dedo medio de cualquier mano.
c) Inspirar y exhalar sin retención, siempre por la fosa nasal positiva (derecha para los hombres o izquierda para las mujeres).
OBS.: existe también la variación con exhalación por la boca."}]
    surya.save

    man_surya = Technique.create!(:code => '26', :technique_type => pranayama_tt)
    man_surya.translations_attributes = [{:locale => 'es', :name => 'Manasika súrya pránáyáma', :description => "respiración solar ejecutada mentalmente.
a) Respirar en forma completa, suave y profunda, por ambas fosas nasales.
b) Visualizar una fuerte luminosidad de color anaranjado que entra por la fosa nasal solar (derecha para los hombres e izquierda para las mujeres) durante la inspiración y sale por la misma durante la exhalación."}]
    man_surya.save

    chandra = Technique.create!(:code => '27', :technique_type => pranayama_tt)
    chandra.translations_attributes = [{:locale => 'es', :name => 'Chandra pránáyáma', :description => "respiración por la fosa nasal negativa o lunar.
Igual a súrya pránáyáma, sólo que utilizando la otra fosa nasal.
OBS.: existe también la variación con exhalación por la boca."}]
    chandra.save

    man_chandra = Technique.create!(:code => '28', :technique_type => pranayama_tt)
    man_chandra.translations_attributes = [{:locale => 'es', :name => 'Manasika chandra pránáyáma', :description => "respiración lunar ejecutada mentalmente.
a) Mantener la respiración completa, suave y profunda, por las dos fosas nasales.
b) Imaginar una luz intensa de color azul celeste que penetra por la fosa nasal lunar (izquierda para los hombres y derecha para las mujeres) durante la inspiración y sale por la misma durante la exhalación."}]
    man_chandra.save

    suryabheda = Technique.create!(:code => '29', :technique_type => pranayama_tt)
    suryabheda.translations_attributes = [{:locale => 'es', :name => 'Súryabhêda pránáyáma', :description => "respiración alternada con inspiración solar sin ritmo.
a) Manos en jñána mudrá.
b) Obstruir la fosa nasal negativa (izquierda para los hombres o derecha para las mujeres) utilizando el dedo medio de la mano derecha.
c) Inspirar por la fosa nasal positiva (derecha para los hombres e izquierda para las mujeres).
d) Retener el aliento, ejecutando jalándhara bandha y deglutiendo la saliva.
e) Deshacer el jalándhara bandha y exhalar por la otra fosa nasal.
f) Repetir todo el proceso, teniendo cuidado de inspirar siempre por la fosa nasal solar o positiva y exhalar siempre por la lunar o negativa.
No hacer como en vamah krama o en sukha púrvaka, en los que el proceso de alternancia va sustituyendo siempre la fosa nasal en actividad de inspiración."}]
    suryabheda.save

    chandrabheda = Technique.create!(:code => '30', :technique_type => pranayama_tt)
    chandrabheda.translations_attributes = [{:locale => 'es', :name => 'Chandrabhêda pránáyáma', :description => "respiración alternada con inspiración lunar sin ritmo.
Este pránáyáma es exactamente igual al anterior, sólo que con inspiración por la fosa nasal negativa y exhalación por la positiva.
No debe ser utilizado a no ser en casos específicos indicados por su Maestro directo."}]
    chandrabheda.save

    suryabheda_k = Technique.create!(:code => '31', :technique_type => pranayama_tt)
    suryabheda_k.translations_attributes = [{:locale => 'es', :name => 'Chandrabhêda pránáyáma', :description => "respiración alternada con inspiración lunar sin ritmo.
Este pránáyáma es exactamente igual al anterior, sólo que con inspiración por la fosa nasal negativa y exhalación por la positiva.
No debe ser utilizado a no ser en casos específicos indicados por su Maestro directo."}]
    suryabheda_k.save

    bhastrika = Technique.create!(:code => '32', :technique_type => pranayama_tt)
    bhastrika.translations_attributes = [{:locale => 'es', :name => 'Bhastriká', :description => "respiración de soplo rápido.
Otro nombre: en algunas escuelas, bhastriká se denomina kapálabhati, ¡y viceversa!
a) Inspirar y exhalar bien rápido y fuerte por las dos fosas nasales, produciendo un ruido similar al de un fuelle.
b) El ritmo ideal es el de inspirar y exhalar en sólo un segundo (un segundo para los dos movimientos).
c) Los novatos lo ejecutarán más lentamente para no perder el ritmo. Los más adelantados lo harán más rápido, más fuerte y utilizando la respiración completa. Mientras eso no sea posible, pruebe con la abdominal.
d) Al finalizar, permanecer en shúnyaka y bandha traya."}]
    bhastrika.save

    s_bhastrika = Technique.create!(:code => '33', :technique_type => pranayama_tt)
    s_bhastrika.translations_attributes = [{:locale => 'es', :name => 'Súrya Bhastriká', :description => "respiración de soplo rápido por la fosa nasal solar.
Ejecutar el mismo pránáyáma anterior, pero sólo con la fosa nasal positiva (derecha para los hombres e izquierda para las mujeres), sin alternar."}]
    s_bhastrika.save

    c_bhastrika = Technique.create!(:code => '34', :technique_type => pranayama_tt)
    c_bhastrika.translations_attributes = [{:locale => 'es', :name => 'Chandra Bhastriká', :description => "respiración de soplo rápido por la fosa nasal lunar.
Ejecutar el mismo pránáyáma anterior, pero con la fosa nasal negativa."}]
    c_bhastrika.save

    ns_bhastrika = Technique.create!(:code => '35', :technique_type => pranayama_tt)
    ns_bhastrika.translations_attributes = [{:locale => 'es', :name => 'Nádí shôdhana bhastriká', :description => "soplo rápido alternado.
Para los practicantes que ya dominen las técnicas de los dos pránáyámas anteriores, existe éste que es bastante más complejo, ya que exige buena coordinación motora.
Es que al ejecutar esta técnica, el yôgin (jamás escriba yoguin) debe ir cambiando rápidamente la fosa nasal en actividad, de manera que inspire por una y exhale por la otra, y no por la misma.
Es un pránáyáma muy fuerte, para los que están bien entrenados y quieren efectos más vigorosos.
Prohibido para novatos e imprudentes."}]
    ns_bhastrika.save

    kapalabhati = Technique.create!(:code => '36', :technique_type => pranayama_tt)
    kapalabhati.translations_attributes = [{:locale => 'es', :name => 'Kapálabhati', :description => "respiración de soplo lento.
Otro nombre: en algunas escuelas, kapálabhati es denominado bhastriká, ¡y viceversa!
a) Inspirar profundamente en ritmo normal, una respiración completa.
b) No retener.
c) Exhalar todo el aire vigorosamente por las fosas nasales de una sola vez, con la duración máxima de medio segundo."}]
    kapalabhati.save

    s_kapalabhati = Technique.create!(:code => '37', :technique_type => pranayama_tt)
    s_kapalabhati.translations_attributes = [{:locale => 'es', :name => 'Súrya kapálabhati', :description => "soplo lento por la fosa nasal solar.
Ejecutar el mismo pránáyáma anterior, pero sólo con la fosa nasal positiva (derecha para los hombres e izquierda para las mujeres)."}]
    s_kapalabhati.save

    c_kapalabhati = Technique.create!(:code => '38', :technique_type => pranayama_tt)
    c_kapalabhati.translations_attributes = [{:locale => 'es', :name => 'Chandra kapálabhati', :description => "soplo lento por la fosa nasal lunar.
Ejecutar el mismo pránáyáma anterior, pero con la fosa nasal negativa."}]
    c_kapalabhati.save

    ns_kapalabhati = Technique.create!(:code => '39', :technique_type => pranayama_tt)
    ns_kapalabhati.translations_attributes = [{:locale => 'es', :name => 'Nádí shôdhana kapálabhati', :description => "soplo lento alternado.
Para los practicantes más adelantados que deseen efectos más fuertes; consiste en inspirar profundamente por una fosa nasal en ritmo normal. No retener, y exhalar por la fosa nasal opuesta, de la misma forma que en los pránáyámas anteriores.
La diferencia está, por lo tanto, en la alternancia de las fosas nasales, que los precedentes no tienen, ya que utilizan sólo la derecha o sólo la izquierda."}]
    ns_kapalabhati.save

    mantra = Technique.create!(:code => '40', :technique_type => pranayama_tt)
    mantra.translations_attributes = [{:locale => 'es', :name => 'Mantra pránáyáma', :description => "respiratorio ritmado con emisión de mantra (1-2-3).
Otro nombre: pránava pránáyáma.
a) Sentarse de preferencia en siddhásana.
b) Inspirar en un tiempo, mentalizando la absorción del prána a través de las fosas nasales y su canalización por las nádís, directamente hacia el ájña chakra.
c) Retener el aire dos tiempos, visualizando que el ájña chakra brilla, gira vertiginosamente en sentido dextrógiro (dakshinavartêna) y crece en su diámetro.
d) Exhalar en tres tiempos, emitiendo el vaikharí mantra ÔM armoniosamente hasta que se termine el aliento."}]
    mantra.save

    omkara = Technique.create!(:code => '41', :technique_type => pranayama_tt)
    omkara.translations_attributes = [{:locale => 'es', :name => 'Ômkára pránáyáma', :description => "respiratorio ritmado con manasika mantra (1-4-2).
a) Inspirar como en kúmbhaka, pero marcando el tiempo no por medio de segundos, sino con repeticiones de manasika mantra, visualizando la sílaba ÔM. Ejemplo de visualización que corresponde a tres segundos:
ÔM-ÔM-ÔM
b) Retener el aire como en el kúmbhaka, pero, al contar cuatro tiempos, utilizar repeticiones mentales del mátriká mantra. Ejemplo de visualización que corresponde a 4x3 segundos:
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
c) Exhalar como en el kúmbhaka, pero, al contar dos tiempos, utilizar repeticiones mentales del ÔM. Ejemplo de visualización que corresponde a 2x3 segundos:
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
El practicante puede optar por la unidad de tiempo ÔM-ÔM; o bien ÔM-ÔM-ÔM; o bien ÔM-ÔM-ÔM-ÔM, etc. Lo fundamental es el sentido común, el progreso gradual y la orientación de un Maestro.
El yôgin más avanzado pasará a utilizar el yantra ÔM para el conteo."}]
    omkara.save

    soplo_ha = Technique.create!(:code => '42', :technique_type => pranayama_tt)
    soplo_ha.translations_attributes = [{:locale => 'es', :name => 'Soplo ha', :description => "exhalación fuerte, sonora y repentina, por la boca.
a) De pie, con las piernas ligeramente apartadas.
b) Inspirar, elevando los brazos hacia el frente y arriba.
c) Retener el aire por un segundo.
d) Exhalar todo el aire de los pulmones en menos de un segundo, enérgicamente, dejando caer los brazos, tronco y cabeza hacia el frente, emitiendo el sonido HA, como si se estuviese gritando, sólo que el sonido no se habrá producido por un grito, sino por una exhalación fuerte y rápida.
Medida de seguridad:
Para respetar su columna y los músculos de la espalda, evite hacer con violencia el movimiento del tronco hacia adelante, especialmente si el cuerpo está muy frío, ya sea por la temperatura del día o por el hecho de estar al comienzo de la práctica."}]
    soplo_ha.save

    ujjayi = Technique.create!(:code => '43', :technique_type => pranayama_tt)
    ujjayi.translations_attributes = [{:locale => 'es', :name => 'Ujjáyí pránáyáma', :description => "respiratorio con contracción de la glotis.
a) Inspirar por las fosas nasales, contrayendo la glotis; con eso, el practicante percibe un leve ruido semejante al del ronquido, pero que debe ser suave, de manera que, en lo posible, otra persona a su lado no consiga oírlo.
b) Retener el aire en los pulmones con la glotis totalmente cerrada y jalándhara bandha.
c) Exhalar por las fosas nasales, contrayendo la glotis y produciendo el mismo ruido suave del roce del aire contra las vías respiratorias."}]
    ujjayi.save

    shitali = Technique.create!(:code => '44', :technique_type => pranayama_tt)
    shitali.translations_attributes = [{:locale => 'es', :name => 'Shítálí pránáyáma', :description => "respiratorio con la lengua en forma de canaleta.
a) Colocar la lengua en forma de canaleta entre los dientes semicerrados.
b) Realizar una inspiración completa por la boca, haciendo que el aire penetre por el canal formado por la lengua.
c) Retener el aire, sin ritmo.
d) Exhalar normalmente por las fosas nasales."}]
    shitali.save

    shitkari = Technique.create!(:code => '45', :technique_type => pranayama_tt)
    shitkari.translations_attributes = [{:locale => 'es', :name => 'Shítkárí pránáyáma', :description => "respiratorio con la lengua y los dientes.
a) Cerrar los dientes, dejando los labios entreabiertos y la lengua levemente apoyada detrás de los incisivos superiores.
b) Inspirar por la boca, haciendo que el aire pase por entre los dientes y la lengua.
c) Retener el aire, sin ritmo.
d) Exhalar normalmente por las fosas nasales."}]
    shitkari.save

    bhramari = Technique.create!(:code => '46', :technique_type => pranayama_tt)
    bhramari.translations_attributes = [{:locale => 'es', :name => 'Bhrámárí pránáyáma', :description => "respiratorio con el ruido de la abeja.
a) Hacer una inspiración profunda como en ujjáyí.
b) No retener el aire.
c) Exhalar lenta y profundamente, produciendo un zumbido semejante al de la abeja (bhrámárí)."}]
    bhramari.save

    murcha = Technique.create!(:code => '47', :technique_type => pranayama_tt)
    murcha.translations_attributes = [{:locale => 'es', :name => 'Múrchhá pránáyáma', :description => "a) Sentarse en padmásana.
b) Inspirar como en ujjáyí.
c) Retener el aire por mucho tiempo, con jalándhara bandha.
d) Exhalar lentamente.
e) Durante la retención sin aire, ejecutar múla bandha."}]
    murcha.save

    plavini = Technique.create!(:code => '48', :technique_type => pranayama_tt)
    plavini.translations_attributes = [{:locale => 'es', :name => 'Plavíní pránáyáma', :description => "a) Inspirar, deglutiendo el aire como si fuera agua, llenando el estómago de aire.
b) Exhalar eructando."}]
    plavini.save

    sama_vritti = Technique.create!(:code => '49', :technique_type => pranayama_tt)
    sama_vritti.translations_attributes = [{:locale => 'es', :name => 'Sama vritti pránáyáma', :description => "a) Realizar una inspiración completa, lenta y profunda, en 5 segundos.
b) Retener el aire 5 segundos.
c) Exhalar en 5 segundos."}]
    sama_vritti.save

    visama_vritti = Technique.create!(:code => '50', :technique_type => pranayama_tt)
    visama_vritti.translations_attributes = [{:locale => 'es', :name => 'Visama vritti pránáyáma', :description => "a) Ejecutar todo un ciclo de respiración completa ritmada con el ritmo 1-4-2.
b) Repetir todo el ciclo, usando el ritmo 2-4-1.
c) Repetir todo el ciclo, usando el ritmo 4-2-1.
d) Reiniciar todo el proceso descripto en las letras a, b, c, cuantas veces lo determine su Maestro. No teniendo un Maestro, use el sentido común."}]
    visama_vritti.save

    chaturanga = Technique.create!(:code => '51', :technique_type => pranayama_tt)
    chaturanga.translations_attributes = [{:locale => 'es', :name => 'Chaturánga pránáyáma', :description => "respiratorio cuadrado.
a) Inspirar en 4 segundos.
b) Retener el aire en 4 segundos.
c) Exhalar en 4 segundos.
d) Retener sin aire en 4 segundos."}]
    chaturanga.save

    viloma = Technique.create!(:code => '52', :technique_type => pranayama_tt)
    viloma.translations_attributes = [{:locale => 'es', :name => 'Vilôma pránáyáma', :description => "a) Sentarse en padmásana, con las manos en jñána mudrá.
b) Ejecutar jalándhara bandha.
c) Inspirar en 2 segundos y detenerse sin haber llenado los pulmones.
d) Retener el aire por 2 segundos.
e) Inspirar un poco más, durante otros 2 segundos.
f) Retener el aire por 2 segundos más.
g) Continuar el proceso hasta llenar totalmente los pulmones.
h) Realizar entonces kúmbhaka por 5 a 10 segundos.
i) Ejecutar en este punto múla bandha, durante el kúmbhaka.
j) Exhalar.
k) Repetir el número de veces que su Maestro determine. No teniendo un Maestro, use el sentido común y repita cerca de 10 a 15 veces, pero siempre ajustando la permanencia y la repetición a su nivel de adelanto."}]
    viloma.save

    anuloma = Technique.create!(:code => '53', :technique_type => pranayama_tt)
    anuloma.translations_attributes = [{:locale => 'es', :name => 'Anulôma pránáyáma', :description => "a) Hacer jalándhara bandha.
b) Inspirar por las fosas nasales como en ujjáyí.
c) Retener de 5 a 10 segundos.
d) Ejecutar múla bandha.
e) Obstruir las fosas nasales, manteniendo el múla bandha.
f) Exhalar lentamente por la fosa nasal izquierda, manteniendo la derecha obstruida.
g) Repetir el pránáyáma de a a f , exhalando ahora por la fosa nasal derecha.
h) Terminando las dos fases, el anulôma completa un ciclo.
i) Repetir de 5 a 8 ciclos."}]
    anuloma.save

    pratiloma = Technique.create!(:code => '54', :technique_type => pranayama_tt)
    pratiloma.translations_attributes = [{:locale => 'es', :name => 'Pratilôma pránáyáma', :description => "a) Hacer jalándhara bandha.
b) Obstruir las fosas nasales con la mano derecha.
c) Presionar el orificio nasal izquierdo y controlar la abertura del derecho.
d) Inspirar lenta y profundamente por la fosa nasal derecha.
e) Retener el aire presionando los dos orificios nasales.
f) Realizar múla bandha mientras dure el kúmbhaka (5 a 10 segundos).
g) Exhalar por las dos fosas nasales como en ujjáyí.
h) Repetir presionando ahora el orificio nasal derecho y controlando
la abertura del izquierdo.
i) Terminando todo el pránáyáma, se completa un ciclo.
j) Repetir de 5 a 8 ciclos."}]
    pratiloma.save

    chakra = Technique.create!(:code => '55', :technique_type => pranayama_tt)
    chakra.translations_attributes = [{:locale => 'es', :name => 'Chakra pránáyáma', :description => "Ejecutar seis veces seguidas ômkára pránáyáma, sólo que en lugar de ÔM, debe pronunciarse cada vez uno de los bíja mantras de los chakras, en el orden exacto de ascensión: LAM, VAM, RAM, YAM, HAM, ÔM.
La pronunciación correcta es fundamental incluso si el mantra es sólo mentalizado, de ahí la necesidad de un Maestro que lo enseñe y escuche para corregir.
Terminadas las 6 veces, una para cada bíja, se habrá completado un ciclo. Repetir 10 ciclos. Aumentar progresivamente la unidad de tiempo medida por los mantras, agregando cada mes un segundo más en el púraka (representado por una repetición más del mantra en la inspiración).
Por ejemplo: el primer mes se hará ÔM; el segundo, ÔM-ÔM; el tercero, ÔM-ÔM-ÔM-; y así sucesivamente, ampliando el tiempo de la unidad padrón que servirá para contar el ritmo 1-4-2.
Pero es importante que el practicante sepa parar de aumentar el tiempo, o incluso reducirlo, siempre que sienta que el kúmbhaka está siendo excesivo."}]
    chakra.save

    kundalini = Technique.create!(:code => '56', :technique_type => pranayama_tt)
    kundalini.translations_attributes = [{:locale => 'es', :name => 'Kundaliní pránáyáma', :description => "respiratorio para activar la kundaliní.
a) Proceder como en nádí shôdhana pránáyáma, obstruyendo el orificio nasal derecho e inspirando por el izquierdo, mentalizando que el prána penetra por idá (si el practicante es hombre) o por pingalá (si el practicante es mujer), y que desciende serpenteando en torno de la columna vertebral hasta el múládhára chakra.
b) Cuando termine la inspiración, retener el aire en los pulmones mentalizando que el prána llegó al múládhára chakra y vitalizó la kundaliní; como su naturaleza es ígnea, imaginar que el oxígeno la estimuló y la hizo ascender más; visualizar que la kundaliní activó el múládhára chakra y comenzó a subir por sushumná nádí.
c) Cambiar la fosa nasal en actividad y exhalar por la derecha, mentalizando que un haz de luz dorada está desobstruyendo el canal de sushumná nádí desde el múládhára hasta el swáddhisthána chakra.
d) Cambiar la fosa nasal en actividad y repetir todo exactamente de la misma forma.
e) Todo lo que se hizo hasta aquí constituye la fase de desobstrucción del primero al segundo chakra; repetir ahora igual, una vez con cada fosa nasal, mentalizando que la kundaliní asciende hasta el tercer chakra, manipura, y que el haz de luz sube hasta él.
f) Repetir todo de la misma forma para cada uno de los demás chakras, hasta el sahásrara; será, por lo tanto, un total de doce ciclos respiratorios completos.
Su Maestro le enseñará cómo acoplar ritmo, mudrás, mantras, bandhas y, más tarde, el manasika pránáyáma en las etapas adecuadas para dinamizar la práctica, conforme considere al practicante suficientemente leal y disciplinado, y por lo tanto merecedor y apto para acelerar el proceso."}]
    kundalini.save

    shiva_shakti = Technique.create!(:code => '57', :technique_type => pranayama_tt)
    shiva_shakti.translations_attributes = [{:locale => 'es', :name => 'Shiva-Shaktí pránáyáma', :description => "respiración de Shiva y su consorte.
a) Los compañeros, de sexos opuestos, se sientan frente a frente en siddhásana y con las manos en átman mudrá.
b) Cada uno aproxima su nariz a la del compañero, sin tocarla, y cuando uno exhala, el otro inspira su aliento.
c) Después de algunos intercambios de aliento, terminar con un mantra ÔM largo y reverencia recíproca en prônam mudrá.
d) Pránáyáma de duración indeterminada."}]
    shiva_shakti.save

    tantrika = Technique.create!(:code => '58', :technique_type => pranayama_tt)
    tantrika.translations_attributes = [{:locale => 'es', :name => 'Tantrika pránáyáma', :description => "respiración para activar los chakras.
a) Los compañeros, de sexos opuestos, se sientan frente a frente en siddhásana y con las manos en prônam mudrá.
b) Ambos vocalizan tres veces el bíja mantra de cada chakra en orden ascendente, para establecer el ritmo del manasika bíja mantra que harán enseguida.
c) Se friccionan las palmas de las manos antes de energizar cada chakra.
d) Después de friccionarse las manos, la izquierda se mantiene en contacto con la mano izquierda del compañero.
e) Ejecutan el chakra pránáyáma, enseñado anteriormente, aplicando la palma de la mano derecha en la región del chakra correspondiente al bíja mantra que fue mentalizado, friccionándolo moderadamente.
f) Terminado el número de repeticiones del bíja mantra, pasar al chakra siguiente hasta el ájña chakra, y después retornar al múládhára, repitiendo varias veces el proceso.
g) Terminar con un mantra ÔM largo y reverencia recíproca en prônam mudrá."}]
    tantrika.save

    part = Part.find_by_symbol('pranayama')
    part.technique_type = pranayama_tt
    asana = TechniqueType.find_by_symbol('asana')
    part.technique_types << asana
    part.save

    part = Part.find_by_symbol('asana')
    part.technique_types << pranayama_tt
    part.save
  end

  def self.down
  end
end
