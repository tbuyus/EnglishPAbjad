#vowels come first or they will be picked up by the generalised double letter match

# THERE IS A LIST OF EXEPTIONS THAT NEED TO BE CORRECTED AFTER THIS IS RUN
# SEE FILE TRUE-DOUBLES.TXT
# looking for redundency in words with a single sound coded twice in two consecutive symbols

#and looking for doubled letters kinda the same thing

#misses or two obscure and foriegn to worry about many proper nouns

#s/zś\|śz/###z###/g
#s/jĝ\|ĝj/###jĝ###/g
#s/ĭy\|yĭ/###ĭy###/g
#s/¢ť\|ť¢/###¢ť###/g
#s/wŭ\|ŭw/###wŭ###/g
#s/ëö\|öë/###ëö###/g
#s/ëü\|üë/###ëü###/g
#s/åø\|øå/##åø###/g
#s/iė\|ėi/###iė###/g
#s/ėų\|ųė/###ėų###/g
#s/ių\|ųi/###ėi###/g
#s/êï\|ïê/###êï###/g
#s/ïɥ\|ɥï/###ïɥ###/g
#s/êɥ\|ɥê/###ïɥ###/g
#s/îŷ\|ŷî/###îŷ###/g
#s/uő\|őu/###uő###/g
#s/wǔ\|ɥê/###wǔ###/g



#hits
#s/fþ\|þf/##fþ###/g# hit dissapointing coding of pflieger like german words
#s/tð\|ðt/###tð###/gn #schmidt stadt


s/óú/óù/g
s/ëö\|öë/###ëö###/g
s/ëü\|üë/###ëü###/g
s/åø\|øå/##åø###/g
s/iė\|ėi/###iė###/g
s/ėų\|ųė/###ėų###/g
s/ių\|ųi/###ėi###/g
s/êï\|ïê/###êï###/g
s/ïɥ\|ɥï/###ïɥ###/g
s/êɥ\|ɥê/###ïɥ###/g
s/îŷ\|ŷî/###îŷ###/g
s/uő\|őu/###uő###/g
s/wǔ\|ɥê/###wǔ###/g






#s/ei\|ie/###uy##/g

s/ðt/d0t/g
s/þf/pf/g
s/sç/sc0/g
s/ōū/ōù/g
s/öü/öù/g
s/öö/öò/g

s/êê/êè/g
s/ōō/ōò/g

# catch all for doubled letters
s/\(.*\,.*\)\([a-z]\)\2/\1\2\20/


#now doubled sounds
