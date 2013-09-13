//Constellation lines adapted from John Walker's "Home Planet", Cnamess.csv

var constnames = [
[ 0.147654854719 ,  0.685041731408 ,  "Andromeda"  ],
[ 2.64888620575 ,  -0.587303293296 ,  "Antlia"  ],
[ 4.22387132275 ,  -1.33360608145 ,  "Apus"  ],
[ 5.94206070488 ,  -0.183783170235 ,  "Aquarius"  ],
[ 5.15482994577 ,  0.0588175957922 ,  "Aquila"  ],
[ 4.51106525117 ,  -0.90565134886 ,  "Ara"  ],
[ 0.700575161751 ,  0.393920812175 ,  "Aries"  ],
[ 1.55692095924 ,  0.747175452779 ,  "Auriga"  ],
[ 3.84504760861 ,  0.56426494717 ,  "Bootes"  ],
[ 1.2359549098 ,  -0.677711348549 ,  "Caelum"  ],
[ 1.61032803435 ,  1.25593892974 ,  "Camelopardalis"  ],
[ 2.22450939813 ,  0.41119957177 ,  "Cancer"  ],
[ 3.40862802914 ,  0.73914693822 ,  "Canes Venatici"  ],
[ 1.78808981867 ,  -0.396015207278 ,  "Canis Major"  ],
[ 1.99595853258 ,  0.117984257435 ,  "Canis Minor"  ],
[ 5.5103535144 ,  -0.342957198017 ,  "Capricornus"  ],
[ 2.03182504871 ,  -0.997804733365 ,  "Carina"  ],
[ 0.227765467385 ,  1.05243353895 ,  "Cassiopeia"  ],
[ 3.390302072 ,  -0.767944870878 ,  "Centaurus"  ],
[ 5.86875687629 ,  1.26641090525 ,  "Cepheus"  ],
[ 0.447415153749 ,  -0.115889862332 ,  "Cetus"  ],
[ 3.14159265359 ,  -1.43099545371 ,  "Chamaeleon"  ],
[ 3.80315970656 ,  -1.1815879036 ,  "Circinus"  ],
[ 1.49356550739 ,  -0.647168086639 ,  "Columba"  ],
[ 3.33741859566 ,  0.395317075577 ,  "Coma Berenices"  ],
[ 4.88386757939 ,  -0.719948316448 ,  "Corona Australis"  ],
[ 4.15737427825 ,  0.569500934926 ,  "Corona Borealis"  ],
[ 3.24290901667 ,  -0.320442450666 ,  "Corvus"  ],
[ 2.97089945274 ,  -0.231256125889 ,  "Crater"  ],
[ 3.26751815912 ,  -1.05941485596 ,  "Crux"  ],
[ 5.39254378989 ,  0.865334243139 ,  "Cygnus"  ],
[ 5.40956075009 ,  0.211184839491 ,  "Delphinus"  ],
[ 1.39617613513 ,  -1.11683618835 ,  "Dorado"  ],
[ 4.69799001406 ,  1.15296450387 ,  "Draco"  ],
[ 5.56349879012 ,  0.138579142608 ,  "Equuleus"  ],
[ 1.01473442711 ,  -0.296880505764 ,  "Eridanus"  ],
[ 0.724137106652 ,  -0.470191700487 ,  "Fornax"  ],
[ 1.79280220765 ,  0.433190720345 ,  "Gemini"  ],
[ 5.87922885181 ,  -0.800407994965 ,  "Grus"  ],
[ 4.5618543324 ,  0.545066325398 ,  "Hercules"  ],
[ 0.840899633611 ,  -0.907571211037 ,  "Horologium"  ],
[ 2.39179920693 ,  -0.197571271326 ,  "Hydra"  ],
[ 0.677798615012 ,  -1.25803332484 ,  "Hydrus"  ],
[ 5.5339154593 ,  -0.919439449951 ,  "Indus"  ],
[ 5.89415141691 ,  0.814545161906 ,  "Lacerta"  ],
[ 2.61799387799 ,  0.12217304764 ,  "Leo"  ],
[ 2.70072248454 ,  0.580147443363 ,  "Leo Minor"  ],
[ 1.42314147208 ,  -0.337721210261 ,  "Lepus"  ],
[ 3.97594730251 ,  -0.269653369433 ,  "Libra"  ],
[ 4.0254273868 ,  -0.737925207743 ,  "Lupus"  ],
[ 2.02475646524 ,  0.834790981229 ,  "Lynx"  ],
[ 4.95010282451 ,  0.709476340936 ,  "Lyra"  ],
[ 1.4398966329 ,  -1.39608886867 ,  "Mensa"  ],
[ 5.48260277929 ,  -0.631809189222 ,  "Microscopium"  ],
[ 1.82264733786 ,  -0.0652753140246 ,  "Monoceros"  ],
[ 3.26202037198 ,  -1.21946154837 ,  "Musca"  ],
[ 4.19978577907 ,  -0.912632665868 ,  "Norma"  ],
[ 5.80487782567 ,  -1.47881747521 ,  "Octans"  ],
[ 4.46027616993 ,  -0.0462512251778 ,  "Ophiuchus"  ],
[ 1.45717539249 ,  0.0626573201466 ,  "Orion"  ],
[ 5.01607627023 ,  -1.13690747475 ,  "Pavo"  ],
[ 5.92111675385 ,  0.342957198017 ,  "Pegasus"  ],
[ 0.919963048726 ,  0.78347830122 ,  "Perseus"  ],
[ 0.191637151869 ,  -0.841772298237 ,  "Phoenix"  ],
[ 1.40874250575 ,  -0.901113492805 ,  "Pictor"  ],
[ 0.233263254529 ,  0.270176968209 ,  "Pisces"  ],
[ 5.86692428058 ,  -0.548556983902 ,  "Piscis Austrinus"  ],
[ 2.06114658014 ,  -0.565312144721 ,  "Puppis"  ],
[ 2.32765835692 ,  -0.509810674508 ,  "Pyxis"  ],
[ 1.02075581303 ,  -1.05574966453 ,  "Reticulum"  ],
[ 5.14880855985 ,  0.296705972839 ,  "Sagitta"  ],
[ 5.07498113249 ,  -0.508065345256 ,  "Sagittarius"  ],
[ 4.41524667523 ,  -0.622558944186 ,  "Scorpio"  ],
[ 0.261799387799 ,  -0.671777229093 ,  "Sculptor"  ],
[ 4.88282038184 ,  -0.176452787377 ,  "Scutum"  ],
[ 4.11836616947 ,  0.189368223841 ,  "Serpens"  ],
[ 4.7013934061 ,  -0.23596851487 ,  "Serpens Cauda"  ],
[ 2.64469741555 ,  -0.0326376570123 ,  "Sextans"  ],
[ 1.07206849304 ,  0.302640092296 ,  "Taurus"  ],
[ 5.03806741881 ,  -0.899542696478 ,  "Telescopium"  ],
[ 0.534856149274 ,  0.564439480095 ,  "Triangulum"  ],
[ 4.22125332887 ,  -1.15017197706 ,  "Triangulum Australe"  ],
[ 6.23815581248 ,  -1.11805791883 ,  "Tucana"  ],
[ 2.68684711698 ,  1.00321525405 ,  "Ursa Major"  ],
[ 3.9201840329 ,  1.3096950707 ,  "Ursa Minor"  ],
[ 2.44442088388 ,  -0.846659220142 ,  "Vela"  ],
[ 3.4931892314 ,  -0.0609119908946 ,  "Virgo"  ],
[ 2.00512151115 ,  -1.21108396796 ,  "Volans"  ],
[ 5.33206813131 ,  0.436855911774 ,  "Vulpecula"  ]
];
