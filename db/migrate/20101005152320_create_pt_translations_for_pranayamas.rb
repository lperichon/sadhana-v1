class CreatePtTranslationsForPranayamas < ActiveRecord::Migration
  def self.up
       tamas = Technique.find_by_code( '1')
    tamas.translations_attributes = [{:locale => 'pt', :name => 'Tamas pránáyáma', :description => "respiração imperceptível.
a)Inspirar tão lentamente que não se consiga perceber o mínimo movimento respiratório;
b)reter o ar por alguns segundos, sem contar ritmo;
c)expirar tão lentamente que seja imperceptível."}]
    tamas.save

    rajas = Technique.find_by_code( '2')
    rajas.translations_attributes = [{:locale => 'pt', :name => 'Rajas pránáyáma', :description => "respiração dinâmica.
Não confundir com rája pránáyáma.
a)Inspirar elevando os braços até a altura dos ombros;
b)reter o ar fechando firmemente as mãos e movimentando vigorosamente os braços, flexionando-os e estendendo-os, trazendo as mãos até aos ombros e voltando a estendê-los várias vezes antes de expirar;
c)expirar lentamente, baixando os braços simultaneamente."}]
    rajas.save

    adhama = Technique.find_by_code( '3')
    adhama.translations_attributes = [{:locale => 'pt', :name => 'Adhama pránáyáma', :description => "respiração abdominal sem ritmo.
Outros nomes:
ardha pránáyáma;
ardha prána kriyá.
a)Inspirar projetando o abdômen para fora, procurando encher a parte baixa dos pulmões;
b)reter o ar por alguns segundos, sem contar ritmo;
c)expirar retraindo o abdômen, procurando esvaziar tanto quanto possível os pulmões, especialmente a parte baixa."}]
    adhama.save

    adhama_k = Technique.find_by_code( '4')
    adhama_k.translations_attributes = [{:locale => 'pt', :name => 'Adhama kúmbhaka', :description => "respiração abdominal com ritmo (1-2-1).
Outro nome: ardha kúmbhaka.
a)Inspirar projetando o abdômen para fora, contando um tempo;
b)reter o ar nos pulmões, contando dois tempos;
c)expirar retraindo o abdômen, contando um tempo."}]
    adhama_k.save

    b_adhama_k = Technique.find_by_code( '5')
    b_adhama_k.translations_attributes = [{:locale => 'pt', :name => 'Bandha adhama kúmbhaka', :description => "abdominal sem ritmo e com bandhas.
Outro nome: bandha ardha prána kriyá.
a)Inspirar projetando o abdômen para fora, elevando o queixo e distendendo a região da tireóide;
b)reter o ar, executando jíhva bandha (comprimindo a língua contra o palato, na região mais macia);
c)expirar retraindo o abdômen enquanto baixa a cabeça, comprimindo o queixo contra o peito (jalándhara bandha), puxando o abdômen bem para dentro, para trás e para cima (uddiyana bandha) e contraindo fortemente os esfíncteres do ânus e da uretra (múla bandha)."}]
    b_adhama_k.save

    adhama_k_p = Technique.find_by_code( '6')
    adhama_k_p.translations_attributes = [{:locale => 'pt', :name => 'Adhama kúmbhaka pránáyáma', :description => "abdominal com ritmo e com bandhas (1-2-1).
Outro nome: ardha kúmbhaka bandha.
a)Inspirar projetando o abdômen para fora em um tempo, elevando o queixo e distendendo a região da tireóide;
b)reter o ar durante dois tempos, executando jíhva bandha (comprimindo com a língua contra o palato, na parte mais macia, atrás);
c)expirar retraindo o abdômen em um tempo, enquanto abaixa a cabeça, comprimindo o queixo contra o peito (jalándhara bandha), puxando o abdômen para dentro, para trás e para cima (uddiyana bandha) e contraindo fortemente os esfíncteres do ânus e da uretra (múla bandha)."}]
    adhama_k_p.save

    madhyama = Technique.find_by_code( '7')
    madhyama.translations_attributes = [{:locale => 'pt', :name => 'Madhyama pránáyáma', :description => "respiração média sem ritmo.
a)Colocar as palmas das mãos tocando os lados das costelas, com os dedos voltados para a frente;
b)expirar fazendo pressão com as mãos, de forma que estas empurrem as costelas e as pontas dos dedos se aproximem na altura do plexo solar;
c)inspirar desfazendo a pressão das mãos, deixando agora, que estas sejam impelidas para fora, pelas costelas;
d)neste pránáyáma não se movimenta a parte baixa nem a alta dos pulmões e quando a musculatura intercostal estiver bem dominada, a utilização das mãos poderá ser dispensada."}]
    madhyama.save

    madhyama_k = Technique.find_by_code( '8')
    madhyama_k.translations_attributes = [{:locale => 'pt', :name => 'Madhyama kúmbhaka', :description => "respiração média com ritmo (1-2-1).
a)Proceder como no pránáyáma anterior;
b)respirar o mais lentamente possível, na medida do seu conforto e de forma ritmada;
c)inspirar num determinado tempo, reter o ar nos pulmões duas vezes este tempo e expirar no mesmo tempo da inspiração."}]
    madhyama_k.save

    b_madhyama_p = Technique.find_by_code( '9')
    b_madhyama_p.translations_attributes = [{:locale => 'pt', :name => 'Bandha madhyama pránáyáma', :description => "respiração média sem ritmo e com bandhas.
a) Respirar utilizando apenas a parte média dos pulmões, que corresponde à região intercostal;
b) inspirar inclinando a cabeça para trás e colocar a ponta da língua no palato mole, pressionando-o bem atrás (jíhva bandha), enquanto retiver o ar nos pulmões;
c) expirar, aproximando o queixo do alto do peito, flexionando a região cervical;
d) com os pulmões vazios, manter a pressão do queixo contra o peito (jalándhara bandha), contrair o abdômen profundamente (uddiyana bandha) e também os esfíncteres do ânus e da uretra (múla bandha). Permanência livre na retenção sem ar."}]
    b_madhyama_p.save

    madhyama_k_p = Technique.find_by_code( '10')
    madhyama_k_p.translations_attributes = [{:locale => 'pt', :name => 'Madhyama kúmbhaka pránáyáma', :description => "média com ritmo e com bandhas (1-2-1).
a)Executar o pránáyáma anterior, acrescentando ritmo;
b)inspirar num determinado tempo, reter o ar nos pulmões duas vezes este tempo e expirar fazendo a mesma contagem da inspiração."}]
    madhyama_k_p.save

    uttama = Technique.find_by_code( '11')
    uttama.translations_attributes = [{:locale => 'pt', :name => 'Uttama pránáyáma', :description => "respiração alta sem ritmo.
a)Inspirar levando o ar para o ápice dos pulmões. Para isso, devem-se manter as musculaturas abdominal e intercostal levemente contraídas;
b)reter o ar durante alguns instantes;
c)expirar com suavidade e controle."}]
    uttama.save

    uttama_k = Technique.find_by_code( '12')
    uttama_k.translations_attributes = [{:locale => 'pt', :name => 'Uttama kúmbhaka', :description => "respiração alta com ritmo (1-2-1).
a) Desenvolver a respiração alta como explicada acima, procurando executá-la o mais lentamente possível e introduzir o ritmo;
b) inspirar em um tempo, reter o ar em dois tempos e expirar em um tempo."}]
    uttama_k.save

    b_uttama_p = Technique.find_by_code( '13')
    b_uttama_p.translations_attributes = [{:locale => 'pt', :name => 'Bandha uttama pránáyáma', :description => "alta sem ritmo e com bandhas.
a) Inspirar levando o ar para a parte alta dos pulmões, tombando a cabeça para trás e fazendo jíhva bandha, pressionando a ponta da língua contra a região anterior do palato;
b)manter este bandha durante o tempo de retenção com ar;
c)expirar e aproximar o queixo do esterno;
d) permanecer com os pulmões vazios mantendo a pressão do queixo contra o tórax (jalándhara bandha), contrair o abdômen puxando-o para dentro e para cima (uddiyana bandha) e executar a contração dos esfíncteres do ânus e da uretra (múla bandha).
Obs.: neste respiratório a parte baixa e média dos pulmões não são utilizadas."}]
    b_uttama_p.save

    uttama_k_p = Technique.find_by_code( '14')
    uttama_k_p.translations_attributes = [{:locale => 'pt', :name => 'Uttama kúmbhaka pránáyáma', :description => "alta com ritmo e com bandhas (1-2-1).
a) Inspirar com suavidade pelas narinas, em um tempo, enchendo apenas a parte alta dos pulmões.
b) reter o ar em dois tempos, executando jíhva bandha– a cabeça tombada para trás, com a ponta da língua pressionando a região macia do palato;
c) expirar em um tempo, pressionando o queixo contra o alto do esterno;
d) permanecer sem ar livremente, mantendo o queixo no peito, fazendo pressão na região da glândula tireóide (jalándhara bandha), contraindo profundamente o abdômen (uddiyana bandha) e os esfíncteres do ânus e da uretra (múla bandha)."}]
    uttama_k_p.save

    raja = Technique.find_by_code( '15')
    raja.translations_attributes = [{:locale => 'pt', :name => 'Rája pránáyáma', :description => "respiração completa, sem ritmo, sem bandhas. Outro nome: prána kriyá.
a) Inspirar projetando o abdômen para fora, em seguida, as costelas para os lados e finalmente, dilatando a parte mais alta do tórax, sem contar ritmo;
b)reter o ar nos pulmões por alguns segundos, sem contar ritmo;
c)expirar, soltando o ar primeiramente da parte alta, depois da parte média e finalmente da parte baixa dos pulmões (há autores que preferem expirar na ordem inversa–o que, a nosso ver, não altera quase nada)."}]
    raja.save

    bandha = Technique.find_by_code( '16')
    bandha.translations_attributes = [{:locale => 'pt', :name => 'Bandha pránáyáma', :description => "respiração completa, sem ritmo, com bandhas.
Outro nome: prána bandha kriyá.
a) Inspirar projetando o abdômen para fora, em seguida as costelas para os lados e finalmente dilatando a parte mais alta do tórax, tudo na mesma inspiração, sem contar ritmo; ao mesmo tempo elevar o queixo e distendendo a região da tireóide;
b) reter o ar durante alguns segundos com a cabeça tombada para trás e sem contar ritmo;
c)expirar tombando a cabeça para frente, soltando o ar primeiramente da parte alta, depois da parte média e finalmente da parte mais baixa dos pulmões, sem contar ritmo; ao mesmo tempo em que expira, vá comprimindo com queixo contra o peito (jalándhara bandha), puxando o abdômen bem para dentro, para trás e para cima (uddiyana bandha) e contraindo fortemente os esfíncteres do ânus e da uretra (múla bandha)."}]
    bandha.save

    antara = Technique.find_by_code( '17')
    antara.translations_attributes = [{:locale => 'pt', :name => 'Antara kúmbhaka', :description => "respiração completa com ritmo (1-2-1 ou 1-4-2).
Outro nome: kúmbhaka.
a)Inspirar dilatando a parte baixa (adhama), média (madhyama) e alta (uttama) dos pulmões, primeiramente projetando o abdômen para fora, depois as costelas para os lados e finalmente expandindo o alto do tórax, contando um tempo;
b)reter o ar nos pulmões, contando dois tempos;
c) expirar, soltando o ar primeiramente da parte alta, depois da parte média e finalmente da parte baixa dos pulmões, contando um tempo.
Obs.: para os mais adiantados, o ritmo pode ir progressivamente passando para 1-4-2, que é muito mais forte."}]
    antara.save

    kevala = Technique.find_by_code( '18')
    kevala.translations_attributes = [{:locale => 'pt', :name => 'Kêvala kúmbhaka', :description => "retenção do alento.
Este respiratório é citado por Pátañjali em sua obra clássica Yôga Sútra, escrito há mais de 2.000 anos.
Consiste em reter o ar em qualquer fase da respiração, isto é, sem ter inspirado ou expirado previamente com a intenção de reter após.
O praticante deve reter o maior tempo possível, sem exagero, progressivamente."}]
    kevala.save

    bandha_kumbhaka_pranayama = Technique.find_by_code( '19')
    bandha_kumbhaka_pranayama.translations_attributes = [{:locale => 'pt', :name => 'Bandha kúmbhaka pránáyáma', :description => "respiração completa, com ritmo e com bandhas (1-2-1).
Outro nome: kúmbhaka bandha.
a) Inspirar como no antara kúmbhaka, acima, só que, ao inspirar, elevar o queixo distendendo a tireóide, enquanto conta um tempo;
b)reter o ar contando dois tempos;
c)expirar como no antara kúmbhaka, em um tempo, só que ao expirar deve-se ir tombando a cabeça para frente, comprimindo com o queixo contra o peito (jalándhara bandha), puxando o abdômen bem para dentro, para trás e para cima (uddiyana bandha) e contraindo fortemente os esfíncteres do ânus e da uretra (múla bandha). A prática conjunta desses três bandhas é denominada bandha traya.
Obs.: para os mais adiantados o ritmo pode ir progressivamente passando para 1-4-2."}]
    bandha_kumbhaka_pranayama.save

    manasika = Technique.find_by_code( '20')
    manasika.translations_attributes = [{:locale => 'pt', :name => 'Manasika pránáyáma', :description => "respiração completa com mentalização.
a) Inspirar lentamente e imaginar com nitidez uma forte luz dourada penetrando por suas narinas;
b) reter o ar nos pulmões, visualizando esta energia sendo absorvida pelos alvéolos, penetrando na corrente sangüínea e sendo depositada em cada célula, revitalizando-as;
c)ao expirar mentalize seu corpo irradiante como o sol;
d) pode-se acrescentar bandhas e ritmo, como também utilizar outras cores de acordo com o seu interesse naquele momento."}]
    manasika.save

    bahya = Technique.find_by_code( '21')
    bahya.translations_attributes = [{:locale => 'pt', :name => 'Báhya kúmbhaka', :description => "retenção vazia (sem ar).
Outro nome: shúnyaka.
a)Fazer uma respiração completa (adhama, madhyama, uttama);
b) expirar lentamente;
c) reter sem ar o maior tempo possível, sem exagero, aumentando progressivamente.
Obs.: este pránáyáma é utilizado para inibir as funções cerebrais mediante a redução do fornecimento de oxigênio ao cérebro e com isso facilitar o controle dos vrittis (“Yôga chitta vritti nirôdhah”, Yôga Sútra, cap. I, vers. 2). Trata-se de uma prática que envolve algum risco de lesar o sistema nervoso e por isso não é recomendada para iniciantes."}]
    bahya.save

    nadi_shod = Technique.find_by_code( '22')
    nadi_shod.translations_attributes = [{:locale => 'pt', :name => 'Nádí shôdhana pránáyáma', :description => "respiração alternada sem ritmo.
Outro nome: vamakrama ou vamah krama.
a)Colocar as mãos em jñána mudrá;
b)obstruir a narina direita com o dedo médio da mão direita em jñána mudrá;
c)inspirar pela narina esquerda (respiração completa);
d)reter o ar o maior tempo possível, sem exagero, confortavelmente;
e) trocar a narina em atividade, obstruindo agora a narina esquerda, sempre com as mãos em jñána mudrá e utilizando a mesma mão para obstruir a narina;
f)expirar pela narina direita;
g) continuar o pránáyáma, inspirando pela narina direita e assim sucessivamente.
Obs.: Note que a narina em atividade é alternada sempre que os pulmões estão cheios e jamais quando estão vazios. Há outros mudrás que podem ser utilizados para obstruir as narinas e cada escola tem preferência por um deles. No nosso caso, optamos pelo jñána mudrá."}]
    nadi_shod.save

    nadi_shod_k = Technique.find_by_code( '23')
    nadi_shod_k.translations_attributes = [{:locale => 'pt', :name => 'Nádí shôdhana kúmbhaka', :description => "alternada com ritmo (1-2-1 ou 1-4-2).
Outro nome: sukha púrvaka.
Exatamente igual ao pránáyáma anterior, só acrescentando o ritmo de um tempo para inspirar, dois para reter com ar, um para expirar e sem retenção vazia (shúnyaka).
Os mais adiantados poderão ir passando progressivamente para o ritmo 1-4-2.
Leia explicações sobre o ritmo no início deste capítulo."}]
    nadi_shod_k.save

    man_nadi_shod = Technique.find_by_code( '24')
    man_nadi_shod.translations_attributes = [{:locale => 'pt', :name => 'Manasika nádí shôdhana', :description => "respiração alternada executada mentalmente.
a) Respirar de forma ampla, consciente e profunda, pelas duas narinas;
b)imaginar uma intensa luminosidade penetrando pela narina direita;
c)reter o ar nos pulmões, visualizando esta energia impregnando todo o seu corpo;
d)durante a expiração mentalizá-la saindo pela narina esquerda;
e) na inspiração seguinte imaginar uma forte luz penetrando pela narina esquerda;
f)na retenção com ar, esta é assimilada;
g)na expiração, imaginá-la saindo pela narina direita.
h)executar vários ciclos.
Obs.: pode-se utilizar qualquer uma das cores recomendadas para as práticas de mentalização."}]
    man_nadi_shod.save

    surya = Technique.find_by_code( '25')
    surya.translations_attributes = [{:locale => 'pt', :name => 'Súrya pránáyáma', :description => "respiração pela narina positiva ou solar.
a) Colocar as mãos em jñána mudrá;
b) obstruir a narina negativa (esquerda para os homens ou direita para as mulheres), com o dedo médio de qualquer mão;
c)inspirar e expirar sem retenção, sempre pela narina positiva (direita para os homens ou esquerda para as mulheres).
Obs.: Existe também a variação que comporta a expiração pela boca."}]
    surya.save

    man_surya = Technique.find_by_code( '26')
    man_surya.translations_attributes = [{:locale => 'pt', :name => 'Manasika súrya pránáyáma', :description => "respiração solar executada mentalmente.
a)Respirar de forma completa, suave e profunda por ambas narinas;
b) visualizar uma forte luminosidade de cor alaranjada entrando por sua narina solar (direita para os homens e esquerda para as mulheres) durante a inspiração e saindo pela mesma durante a expiração."}]
    man_surya.save

    chandra = Technique.find_by_code( '27')
    chandra.translations_attributes = [{:locale => 'pt', :name => 'Chandra pránáyáma', :description => "respiração pela narina negativa ou lunar.
Igual ao súrya pránáyáma, só que utilizando a outra narina.
Obs.: Existe também a variação que comporta a expiração pela boca."}]
    chandra.save

    man_chandra = Technique.find_by_code( '28')
    man_chandra.translations_attributes = [{:locale => 'pt', :name => 'Manasika chandra pránáyáma', :description => "respiração lunar executada mentalmente.
a)Manter a respiração completa, suave e profunda pelas duas narinas;
b)imaginar uma luz intensa de cor azul celeste penetrando pela narina lunar (esquerda para os homens e direita para as mulheres) durante a inspiração e saindo pela mesma durante a expiração."}]
    man_chandra.save

    suryabheda = Technique.find_by_code( '29')
    suryabheda.translations_attributes = [{:locale => 'pt', :name => 'Súryabhêda pránáyáma', :description => "respiração alternada com inspiração solar sem ritmo.
a)Mãos em jñána mudrá;
b) obstruir a narina negativa (esquerda para os homens ou direita para as mulheres) utilizando o dedo médio da mão direita;
c) inspirar pela narina positiva (direita para os homens e esquerda para as mulheres);
d)reter o alento, executando jalándhara bandha e deglutindo a saliva; e)desfazer o jalándhara bandha e expirar pela outra narina;
f)repetir todo o processo, tomando o cuidado de inspirar sempre pela narina solar ou positiva e expirar sempre pela lunar ou negativa.
Não fazer como no vamah krama ou como no sukha púrvaka, em que o processo de alternância vai substituindo sempre a narina em atividade de inspiração."}]
    suryabheda.save

    chandrabheda = Technique.find_by_code( '30')
    chandrabheda.translations_attributes = [{:locale => 'pt', :name => 'Chandrabhêda pránáyáma', :description => "respiração alternada com inspiração lunar sem ritmo.
Este pránáyáma é igual ao anterior só que com inspiração pela narina negativa e expiração pela narina positiva.
Não deve ser utilizado a não ser em casos específicos indicados pelo seu Mestre direto."}]
    chandrabheda.save

    suryabheda_k = Technique.find_by_code( '31')
    suryabheda_k.translations_attributes = [{:locale => 'pt', :name => 'Chandrabhêda pránáyáma', :description => "respiração alternada com inspiração solar, com ritmo (1-4-2).
Semelhante ao súryabhêda pránáyáma, com a diferença de tempo de retenção do ar nos pulmões.
Neste caso a retenção ou kúmbhaka deve ser o máximo que o praticante puder manter, sem exagero.
No final, executar uddiyana bandha e múla bandha enquanto expirar."}]
    suryabheda_k.save

    bhastrika = Technique.find_by_code( '32')
    bhastrika.translations_attributes = [{:locale => 'pt', :name => 'Bhastriká', :description => "respiração do sopro rápido.
Outro nome: em algumas escolas, o bhastriká é denominado kapálabhati e vice-versa!
a)Inspirar e expirar bem rápido e forte pelas duas narinas, produzindo um ruído alto como o de um fole;
b) o ritmo ideal é o de inspirar e expirar em apenas um segundo (um segundo para os dois movimentos);
c)os novatos executarão mais lentamente para não perder o ritmo. Os mais adiantados farão mais rápido, mais forte e utilizando a respiração completa. Enquanto isso não for possível, tente a abdominal;
d)no fim, permanecer em shúnyaka e bandha traya."}]
    bhastrika.save

    s_bhastrika = Technique.find_by_code( '33')
    s_bhastrika.translations_attributes = [{:locale => 'pt', :name => 'Súrya Bhastriká', :description => "respiração do sopro rápido pela narina solar.
Executar o mesmo pránáyáma anterior, porém, só com a narina positiva (direita para os homens e esquerda para as mulheres), sem alternar."}]
    s_bhastrika.save

    c_bhastrika = Technique.find_by_code( '34')
    c_bhastrika.translations_attributes = [{:locale => 'pt', :name => 'Chandra Bhastriká', :description => "respiração do sopro rápido pela narina lunar.
Executar o mesmo pránáyáma anterior, porém, com a narina negativa."}]
    c_bhastrika.save

    ns_bhastrika = Technique.find_by_code( '35')
    ns_bhastrika.translations_attributes = [{:locale => 'pt', :name => 'Nádí shôdhana bhastriká', :description => "sopro rápido alternado.
Para os praticantes que já dominaram as técnicas dos dois pránáyámas anteriores, existe este que é bem mais complexo, já que exige boa coordenação motora.
É que, ao executar esta técnica o yôgin (jamais escrevayoguin) deve ir rapidamente trocando a narina em atividade, de forma que inspire por uma e expire pela outra– e não pela mesma.
É um pránáyáma muito forte, para os que estão bem treinados e querem efeitos mais vigorosos.
Interditados aos novatos e imprudentes."}]
    ns_bhastrika.save

    kapalabhati = Technique.find_by_code( '36')
    kapalabhati.translations_attributes = [{:locale => 'pt', :name => 'Kapálabhati', :description => "respiração do sopro lento.
Outro nome:em algumas escolas, o kapálabhati é denominado bhastriká e vice-versa!
a) Inspirar profundamente em ritmo normal, uma respiração completa;
b) não reter;
c)expirar todo o ar vigorosamente pelas narinas de uma só vez com a duração máxima de meio segundo."}]
    kapalabhati.save

    s_kapalabhati = Technique.find_by_code( '37')
    s_kapalabhati.translations_attributes = [{:locale => 'pt', :name => 'Súrya kapálabhati', :description => "sopro lento pela narina solar.
Executar o mesmo pránáyáma anterior, porém, só com a narina positiva (direita para os homens e esquerda para as mulheres)."}]
    s_kapalabhati.save

    c_kapalabhati = Technique.find_by_code( '38')
    c_kapalabhati.translations_attributes = [{:locale => 'pt', :name => 'Chandra kapálabhati', :description => "sopro lento pela narina lunar.
Executar o mesmo pránáyáma anterior, porém, com a narina negativa."}]
    c_kapalabhati.save

    ns_kapalabhati = Technique.find_by_code( '39')
    ns_kapalabhati.translations_attributes = [{:locale => 'pt', :name => 'Nádí shôdhana kapálabhati', :description => "sopro lento alternado.
Para os praticantes mais adiantados que desejarem efeitos mais fortes, consiste em inspirar profundamente por uma narina em ritmo normal.
Não reter. E expirar pela narina oposta, da mesma forma que nos pránáyámas anteriores.
A diferença está, portanto, na alternância das narinas, que os precedentes não têm, já que utilizam só a direita ou só a esquerda."}]
    ns_kapalabhati.save

    mantra = Technique.find_by_code( '40')
    mantra.translations_attributes = [{:locale => 'pt', :name => 'Mantra pránáyáma', :description => "respiratório ritmado com emissão de mantra (1-2-3).
Outro nome: pránava pránáyáma.
a) Sentar-se de preferência em siddhásana;
b) inspirar em um tempo, mentalizando a absorção do prána através das narinas e sua canalização pelas nádís, diretamente para o ájña chakra;
c) reter o ar em dois tempos, visualizando o ájña chakra brilhando, girando vertiginosamente no sentido dextrógiro (dakshinavártêna) e crescendo em seu diâmetro;
d) expirar em três tempos, emitindo o vaikharí mantra ÔM harmoniosamente até se extinguir o fôlego."}]
    mantra.save

    omkara = Technique.find_by_code( '41')
    omkara.translations_attributes = [{:locale => 'pt', :name => 'Ômkára pránáyáma', :description => "respiratório ritmado com manasika mantra (1-4-2).
a)Inspirar como no kúmbhaka, porém, ao marcar um tempo, ao invés de segundos, contar com repetições de manasika mantra, visualizando a sílaba ÔM. Exemplo de visualização que corresponde a três segundos:
ÔM-ÔM-ÔM,
b) reter o ar como no kúmbhaka, porém, ao contar quatro tempos, utilizar repetições mentais do mátriká mantra. Exemplo de visualização que corresponde a 4 x 3 segundos:
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
c) expirar o ar como no kúmbhaka, porém, ao contar dois tempos, utilizar repetições mentais do ÔM.Exemplo de visualização que corresponde a 2 x 3 segundos:
ÔM-ÔM-ÔM
ÔM-ÔM-ÔM
O praticante pode optar pela unidade de tempo ÔM-ÔM; ou ÔM-ÔM- ÔM; ou ÔM-ÔM-ÔM-ÔM; etc. O fundamental é o bom senso, o progresso gradual e a orientação de um Mestre.
O yôgin mais avançado passará a utilizar o yantra ÔM para fins de contagem"}]
    omkara.save

    soplo_ha = Technique.find_by_code( '42')
    soplo_ha.translations_attributes = [{:locale => 'pt', :name => 'Soplo ha', :description => "expiração forte pela boca emitindo som alto e
a)Em pé, com as pernas ligeiramente afastadas;
b)inspirar, elevando os braços para frente e para cima;
c)reter o ar por um segundo;
d) expirar todo o ar dos pulmões em menos de um segundo, energicamente, jogando os braços, tronco e cabeça para frente, emitindo o som HA, como se estivesse gritando–só que o som não é produzido por um grito e sim por uma expiração forte e rápida
Medida de segurança: para respeitar sua coluna e músculos das costas, evite fazer com violência o movimento do tronco para frente, especialmente se o corpo estiver muito frio, quer pela temperatura do dia, quer pelo fato de estar no início da prática."}]
    soplo_ha.save

    ujjayi = Technique.find_by_code( '43')
    ujjayi.translations_attributes = [{:locale => 'pt', :name => 'Ujjáyí pránáyáma', :description => "respiratório com contração da glote.
a) Inspirar pelas narinas, contraindo a glote; com isso o praticante observa um leve ruído semelhante ao do ressonar, mas que deve ser suave e, de preferência, outra pessoa ao seu lado não consiga ouvir esse ruído;
b) reter o ar nos pulmões com a glote totalmente fechada e jalándhara bandha;
c) expirar pelas narinas, contraindo a glote e produzindo o mesmo ruído suave do atrito do ar com as vias respiratórias."}]
    ujjayi.save

    shitali = Technique.find_by_code( '44')
    shitali.translations_attributes = [{:locale => 'pt', :name => 'Shítálí pránáyáma', :description => "respiratório com a língua em calha.
a)Colocar a língua em forma de calha entre os dentes semicerrados;
b) realizar uma inspiração completa pela boca, fazendo o ar penetrar pelo canal formado pela língua;
c)reter o ar, sem ritmo;
d)expirar normalmente pelas narinas."}]
    shitali.save

    shitkari = Technique.find_by_code( '45')
    shitkari.translations_attributes = [{:locale => 'pt', :name => 'Shítkárí pránáyáma', :description => "respiratório com a língua e os dentes.
a) Cerrar os dentes, deixando os lábios entreabertos e a língua levemente encostada por trás dos dentes incisivos superiores;
b) inspirar pela boca, fazendo o ar passar por entre os dentes e a língua;
c)reter o ar, sem ritmo;
d)expirar normalmente pelas narinas."}]
    shitkari.save

    bhramari = Technique.find_by_code( '46')
    bhramari.translations_attributes = [{:locale => 'pt', :name => 'Bhrámárí pránáyáma', :description => "respiratório com o ruído da abelha.
a)Fazer uma inspiração profunda como no ujjáyí;
b)não reter o ar;
c)expirar lenta e profundamente, produzindo um zumbido semelhante ao da abelha (bhrámárí)."}]
    bhramari.save

    murcha = Technique.find_by_code( '47')
    murcha.translations_attributes = [{:locale => 'pt', :name => 'Múrchhá pránáyáma', :description => "a)Sentar-se em padmásana;
b)inspirar como no ujjáyí;
c)reter o ar por muito tempo, com jalándhara bandha;
d) expirar lentamente; e)durante a retenção sem ar, executar o múla bandha."}]
    murcha.save

       plavini = Technique.find_by_code( '48')
       plavini.translations_attributes = [{:locale => 'es', :name => 'Plavíní pránáyáma', :description => "respiratório com deglutição de ar.
a)Inspirar, deglutindo o ar como se fosse água, enchendo o estômago de ar.
b)expirar eructando (não ensine este exercício em sala de aula!)."}]
       plavini.save

       sama_vritti = Technique.find_by_code( '49')
    sama_vritti.translations_attributes = [{:locale => 'es', :name => 'Sama vritti pránáyáma', :description => "a)Realizar uma inspiração completa, lenta e profunda em 5 segundos;
b)reter em 5 segundos;
c)expirar em 5 segundos."}]
    sama_vritti.save

       visama_vritti = Technique.find_by_code( '50')
       visama_vritti.translations_attributes = [{:locale => 'pt', :name => 'Visama vritti pránáyáma', :description => "a) Executar todo um ciclo de respiração completa ritmada com o ritmo 1-4-2;
b)repetir todo um ciclo, usando o ritmo 2-4-1;
c)repetir todo um ciclo, usando o ritmo 4-2-1;
d) reiniciar todo o processo descrito nas letras a, b, c, quantas vezes o seu Mestre determinar. Não tendo um Mestre, use o bom senso."}]
       visama_vritti.save

       chaturanga = Technique.find_by_code( '51')
       chaturanga.translations_attributes = [{:locale => 'pt', :name => 'Chaturánga pránáyáma', :description => "respiratório quadrado.
a)Inspirar em 4 segundos;
b)reter o ar em 4 segundos;
c)expirar em 4 segundos;
d)reter sem ar em 4 segundos."}]
       chaturanga.save

       viloma = Technique.find_by_code( '52')
       viloma.translations_attributes = [{:locale => 'pt', :name => 'Vilôma pránáyáma', :description => "a)Sentar-se em padmásana, com as mãos em jñána mudrá;
b)inspirar em 2 segundos e parar sem encher os pulmões;
c)reter o ar por 2 segundos;
d)inspirar mais um pouco, durante mais 2 segundos;
e)reter o ar por mais 2 segundos;
f)continuar o processo até preencher totalmente os pulmões;
g)realizar então o kúmbhaka por 5 a 10 segundos;
h)executar neste ponto o múla bandha, durante o kúmbhaka;
i) exalar;
j)repetir o número de vezes que o seu Mestre determinar.
Não tendo um Mestre, use o bom senso e repita cerca de 10 a 15 vezes, mas sempre ajustando a permanência e a repetição ao seu adiantamento."}]
    viloma.save

    anuloma = Technique.find_by_code( '53')
    anuloma.translations_attributes = [{:locale => 'pt', :name => 'Anulôma pránáyáma', :description => "a)Fazer o jalándhara bandha;
b)inspirar pelas narinas como em ujjáyí;
c)reter de 5 a 10 segundos;
d)executar o múla bandha;
e)obstruir as narinas, mantendo o múla bandha;
f)expirar lentamente pela narina esquerda, mantendo a direita obs- truída;
g)repetir o pránáyáma dea af, expirando agora pela narina direita;
h)terminando as duas fases, o anulôma completa um ciclo;
i)repetir de 5 a 8 ciclos."}]
    anuloma.save

    pratiloma = Technique.find_by_code( '54')
    pratiloma.translations_attributes = [{:locale => 'pt', :name => 'Pratilôma pránáyáma', :description => "a)Fazer o jalándhara bandha;
b)obstruir as narinas com a mão direita;
c)pressionar a narina esquerda e controlar a abertura da direita;
d)inspirar lenta e profundamente pela narina direita;
e)reter o ar pressionando as duas narinas;
f)realizar o múla bandha enquanto durar o kúmbhaka (5 a 10 segundos);
g)expirar pelas duas narinas como em ujjáyí;
h) repetir pressionando agora a narina direita e controlando a abertura da esquerda;
i)terminando todo o pránáyáma, completa um ciclo;
j)repetir de 5 a 8 ciclos."}]
    pratiloma.save

    chakra = Technique.find_by_code( '55')
    chakra.translations_attributes = [{:locale => 'pt', :name => 'Chakra pránáyáma', :description => "respiratório para ativar os chakras.
Executar seis vezes seguidas o ômkára pránáyáma, só que no lugar do ÔM, deve ser feito cada vez utilizando um dos bíja mantras dos chakras, na ordem certa de ascensão: LAM, VAM, RAM, YAM, HAM, ÔM.
A pronúncia correta é fundamental mesmo se o mantra for apenas mentalizado, daí a necessidade de um Mestre que a ensine e ouça para corrigir.
Quando completar as 6 vezes, uma para cada bíja, completou um ciclo. Repita 10 ciclos. Vá progressivamente aumentando a unidade de tempo medida pelos mantras, acrescentando a cada mês mais um segundo no púraka (representado por mais uma repetição do mantra na inspiração).
Por exemplo: no primeiro mês fará ÔM; no segundo, ÔM-ÔM; no terceiro, ÔM-ÔM-ÔM;
e assim sucessivamente, ampliando o tempo da unidade padrão que servirá para contar o ritmo 1-4-2.
Mas é importante que o praticante saiba parar de aumentar o tempo, ou até mesmo reduzi-lo, sempre que sentir que o kúmbhaka está sendo excessivo."}]
    chakra.save

    kundalini = Technique.find_by_code( '56')
    kundalini.translations_attributes = [{:locale => 'pt', :name => 'Kundaliní pránáyáma', :description => "respiratório para ativar a kundaliní.
a) Proceder como no nádí shôdhana pránáyáma, obstruindo a narina direita e inspirando pela esquerda, mentalizando que o prána penetra por idá (se o praticante for homem) ou por pingalá (se o praticante for mulher), e que desce serpenteando em torno da coluna vertebral até o múládhára chakra.
b) quando terminar a inspiração, reter o ar nos pulmões mentalizando que o prána chegou ao múládhára chakra e vitalizou a kundaliní; como sua natureza é ígnea, imaginar que o oxigênio a estimulou e a acendeu mais; visualizar que a kundaliní ativou o múládhára chakra e começou a subir pela sushumná nádí;
c) trocar a narina em atividade e expirar pela direita, mentalizando que um jato de luz dourada está desobstruindo o canal da sushumná nádí desde o múládhára até o swaddhisthana chakra;
d) trocar a narina em atividade e repetir tudo exatamente da mesma forma;
e) tudo o que foi feito até aqui constitui a fase de desobstrução do primeiro ao segundo chakra; repetir agora igual, uma vez com cada narina, mentalizando que a kundaliní ascende até o terceiro chakra, manipura, e que o jato de luz sobe até ele;
f)repetir tudo da mesma forma para cada um dos demais chakras, até o sahásrara; será, portanto, num total de doze ciclos respiratórios completos.
Seu Mestre lhe ensinará como acoplar ritmo, mudrás, mantras, bandhas e, mais tarde, o manasika pránáyáma nas etapas adequadas para dinamizar a prática, conforme considere o praticante suficientemente leal e disciplinado, logo, merecedor e apto a acelerar o processo."}]
    kundalini.save

    shiva_shakti = Technique.find_by_code( '57')
    shiva_shakti.translations_attributes = [{:locale => 'pt', :name => 'Shiva-Shaktí pránáyáma', :description => "respiração de Shiva e sua consorte.
a) Os parceiros, de sexos opostos, sentam-se frente a frente em siddhásana e com as mãos em átman mudrá;
b) ambos aproximam suas narinas das do parceiro, sem tocar, e quando um expira o outro inspira seu alento.
c)após algumas trocas de alento, terminar com um mantra ÔM longo e reverência recíproca em prônam mudrá;
d)pránáyáma de duração indeterminada."}]
    shiva_shakti.save

    tantrika = Technique.find_by_code( '58')
    tantrika.translations_attributes = [{:locale => 'pt', :name => 'Tantrika pránáyáma', :description => "respiração para ativar os chakras.
a) Os parceiros, de sexos opostos, sentam-se frente a frente em siddhásana e com as mãos em prônam mudrá;
b) ambos vocalizam três vezes o bíja mantra de cada chakra na ordem ascendente para estabelecer o ritmo do manasika bíja mantra que farão em seguida;
c) atritam as palmas das mãos antes de cada chakra que vai ser energizado;
d) após atritar as mãos, a esquerda se mantém em contato com a mão esquerda do parceiro.
e)executam o chakra pránáyáma, ensinado anteriormente, aplicando a palma da mão direita na região do chakra correspondente ao bíja mantra que for mentalizado, atritando-o moderadamente;
f)terminado o número de repetições do bíja mantra, passar para o chakra seguinte até o ájña chakra e, depois, retornar ao múládhára, repetindo várias vezes o processo;
g) terminar com um mantra ÔM longo e reverência recíproca em prônam mudrá."}]
    tantrika.save
  end

  def self.down
  end
end
