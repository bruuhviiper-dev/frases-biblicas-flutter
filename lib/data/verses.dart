import 'package:flutter/material.dart';

import 'models.dart';

/// Banco de versículos EMBUTIDO (funciona offline).
///
/// ⚠️ Direitos: o texto bíblico de TRADUÇÕES modernas (ARA, ARC, NVI, ACF...)
/// tem direitos autorais. Aqui usamos o fraseado clássico da tradução
/// João Ferreira de Almeida (edições antigas em DOMÍNIO PÚBLICO). Antes de
/// publicar, confirme a versão/tradução para garantir uso livre.
class VerseData {
  VerseData._();

  static const _roxo = [Color(0xFF6A11CB), Color(0xFF2575FC)];
  static const _verde = [Color(0xFF11998E), Color(0xFF38EF7D)];
  static const _rosa = [Color(0xFFEE0979), Color(0xFFFF6A00)];
  static const _azul = [Color(0xFF2193B0), Color(0xFF6DD5ED)];
  static const _noite = [Color(0xFF141E30), Color(0xFF243B55)];
  static const _ouro = [Color(0xFFFDC830), Color(0xFFF37335)];
  static const _esmeralda = [Color(0xFF0BAB64), Color(0xFF3BB78F)];
  static const _violeta = [Color(0xFF7F00FF), Color(0xFFE100FF)];
  static const _petroleo = [Color(0xFF0F2027), Color(0xFF2C5364)];
  static const _carmim = [Color(0xFFDA4453), Color(0xFF89216B)];
  static const _cura = [Color(0xFF00B4DB), Color(0xFF0083B0)];
  static const _perdao = [Color(0xFF56AB2F), Color(0xFFA8E063)];
  static const _familia = [Color(0xFFFF8008), Color(0xFFFFC837)];
  static const _sabedoria = [Color(0xFF42275A), Color(0xFF734B6D)];
  static const _consolo = [Color(0xFF485563), Color(0xFF29323C)];
  static const _vitoria = [Color(0xFFf12711), Color(0xFFf5af19)];
  static const _promessas = [Color(0xFF8E2DE2), Color(0xFF4A00E0)];
  // Categorias premium (exclusivas).
  static const _devocional = [Color(0xFFB8860B), Color(0xFF1A1A1A)];
  static const _poder = [Color(0xFF200122), Color(0xFF6F0000)];
  static const _salmosPoder = [Color(0xFF0F2027), Color(0xFF203A43)];

  static const List<VerseCategory> categories = [
    VerseCategory(
      id: 'fe',
      name: 'Fé',
      emoji: '🙏',
      gradient: _roxo,
      verses: [
        Verse(
            'Ora, a fé é o firme fundamento das coisas que se esperam, e a prova das coisas que se não veem.',
            'Hebreus 11:1'),
        Verse('Porque andamos por fé, e não por vista.', '2 Coríntios 5:7'),
        Verse('Tudo é possível ao que crê.', 'Marcos 9:23'),
        Verse('E sem fé é impossível agradar-lhe.', 'Hebreus 11:6'),
        Verse(
            'Se tiverdes fé como um grão de mostarda, direis a este monte: Passa daqui para acolá, e há de passar.',
            'Mateus 17:20'),
        Verse(
            'A vossa fé não se apoie em sabedoria dos homens, mas no poder de Deus.',
            '1 Coríntios 2:5'),
        Verse('Combati o bom combate, completei a carreira, guardei a fé.',
            '2 Timóteo 4:7'),
        Verse('Vigiai, estai firmes na fé, portai-vos varonilmente, fortalecei-vos.',
            '1 Coríntios 16:13'),
        Verse('De sorte que a fé é pelo ouvir, e o ouvir pela palavra de Deus.',
            'Romanos 10:17'),
      ],
    ),
    VerseCategory(
      id: 'esperanca',
      name: 'Esperança',
      emoji: '🌅',
      gradient: _ouro,
      verses: [
        Verse(
            'Os que esperam no Senhor renovarão as suas forças; subirão com asas como águias.',
            'Isaías 40:31'),
        Verse(
            'Porque eu bem sei os pensamentos que tenho a vosso respeito, pensamentos de paz, e não de mal, para vos dar o fim que esperais.',
            'Jeremias 29:11'),
        Verse('E a esperança não traz confusão.', 'Romanos 5:5'),
        Verse(
            'Esperei com paciência no Senhor, e ele se inclinou para mim, e ouviu o meu clamor.',
            'Salmos 40:1'),
        Verse(
            'Alegrai-vos na esperança, sede pacientes na tribulação, perseverai na oração.',
            'Romanos 12:12'),
        Verse(
            'Bem-aventurado aquele que tem o Deus de Jacó por seu auxílio, cuja esperança está no Senhor seu Deus.',
            'Salmos 146:5'),
        Verse('Espera no Senhor, anima-te, e ele fortalecerá o teu coração.',
            'Salmos 27:14'),
        Verse(
            'Porque tu és a minha esperança, Senhor Deus; tu és a minha confiança desde a minha mocidade.',
            'Salmos 71:5'),
        Verse(
            'Ora, o Deus de esperança vos encha de todo o gozo e paz na vossa fé.',
            'Romanos 15:13'),
        Verse('Lança o teu cuidado sobre o Senhor, e ele te susterá.',
            'Salmos 55:22'),
      ],
    ),
    VerseCategory(
      id: 'amor',
      name: 'Amor',
      emoji: '❤️',
      gradient: _rosa,
      verses: [
        Verse(
            'Porque Deus amou o mundo de tal maneira que deu o seu Filho unigênito, para que todo aquele que nele crê não pereça, mas tenha a vida eterna.',
            'João 3:16'),
        Verse('Nós o amamos a ele porque ele nos amou primeiro.',
            '1 João 4:19'),
        Verse('O amor é sofredor, é benigno; o amor não é invejoso.',
            '1 Coríntios 13:4'),
        Verse('Acima de tudo, tende ardente amor uns para com os outros.',
            '1 Pedro 4:8'),
        Verse('Amarás o teu próximo como a ti mesmo.', 'Mateus 22:39'),
        Verse(
            'Nisto conhecerão todos que sois meus discípulos: se vos amardes uns aos outros.',
            'João 13:35'),
        Verse('O amor tudo sofre, tudo crê, tudo espera, tudo suporta.',
            '1 Coríntios 13:7'),
        Verse(
            'Agora, pois, permanecem a fé, a esperança e o amor; mas o maior destes é o amor.',
            '1 Coríntios 13:13'),
        Verse('Amados, amemo-nos uns aos outros, porque o amor é de Deus.',
            '1 João 4:7'),
        Verse(
            'O amor não faz mal ao próximo; de sorte que o amor é o cumprimento da lei.',
            'Romanos 13:10'),
      ],
    ),
    VerseCategory(
      id: 'paz',
      name: 'Paz',
      emoji: '🕊️',
      gradient: _azul,
      verses: [
        Verse(
            'Deixo-vos a paz, a minha paz vos dou; não vo-la dou como o mundo a dá.',
            'João 14:27'),
        Verse(
            'E a paz de Deus, que excede todo o entendimento, guardará os vossos corações e os vossos sentimentos em Cristo Jesus.',
            'Filipenses 4:7'),
        Verse(
            'Em paz também me deitarei e dormirei, porque só tu, Senhor, me fazes habitar em segurança.',
            'Salmos 4:8'),
        Verse('Aquietai-vos, e sabei que eu sou Deus.', 'Salmos 46:10'),
        Verse(
            'Bem-aventurados os pacificadores, porque eles serão chamados filhos de Deus.',
            'Mateus 5:9'),
        Verse('Tu conservarás em paz aquele cujo pensamento está firme em ti.',
            'Isaías 26:3'),
        Verse('Buscai a paz, e segui-a.', 'Salmos 34:14'),
        Verse(
            'O Senhor dará força ao seu povo; o Senhor abençoará o seu povo com paz.',
            'Salmos 29:11'),
        Verse('E a paz de Deus domine em vossos corações.', 'Colossenses 3:15'),
      ],
    ),
    VerseCategory(
      id: 'protecao',
      name: 'Proteção',
      emoji: '🛡️',
      gradient: _noite,
      verses: [
        Verse('O Senhor é o meu pastor; nada me faltará.', 'Salmos 23:1'),
        Verse('Deus é o nosso refúgio e fortaleza, socorro bem presente na angústia.',
            'Salmos 46:1'),
        Verse(
            'Aquele que habita no esconderijo do Altíssimo, à sombra do Onipotente descansará.',
            'Salmos 91:1'),
        Verse(
            'Não temas, porque eu sou contigo; não te assombres, porque eu sou o teu Deus.',
            'Isaías 41:10'),
        Verse('O nome do Senhor é torre forte; para ela corre o justo e está seguro.',
            'Provérbios 18:10'),
        Verse('Em ti, Senhor, confio; nunca seja eu confundido.', 'Salmos 31:1'),
        Verse('Tu és o meu refúgio; tu me guardas da angústia.', 'Salmos 32:7'),
        Verse('O anjo do Senhor acampa-se ao redor dos que o temem, e os livra.',
            'Salmos 34:7'),
        Verse(
            'Os olhos do Senhor estão sobre os justos, e os seus ouvidos atentos ao seu clamor.',
            'Salmos 34:15'),
      ],
    ),
    VerseCategory(
      id: 'forca',
      name: 'Força',
      emoji: '💪',
      gradient: _carmim,
      verses: [
        Verse('Posso todas as coisas naquele que me fortalece.',
            'Filipenses 4:13'),
        Verse(
            'Esforça-te, e tem bom ânimo; não temas, nem te espantes, porque o Senhor teu Deus é contigo por onde quer que andares.',
            'Josué 1:9'),
        Verse('O Senhor é a minha força e o meu escudo.', 'Salmos 28:7'),
        Verse('Mas os que esperam no Senhor renovarão as suas forças.',
            'Isaías 40:31'),
        Verse('A alegria do Senhor é a vossa força.', 'Neemias 8:10'),
        Verse(
            'Ainda que a minha carne e o meu coração desfaleçam, Deus é a força do meu coração para sempre.',
            'Salmos 73:26'),
        Verse('Esforçai-vos, e ele fortalecerá o vosso coração, vós todos que esperais no Senhor.',
            'Salmos 31:24'),
        Verse('Confortai as mãos fracas, e fortalecei os joelhos vacilantes.',
            'Isaías 35:3'),
        Verse('Deus é a minha fortaleza e a minha força, e ele perfaz o meu caminho.',
            '2 Samuel 22:33'),
      ],
    ),
    VerseCategory(
      id: 'gratidao',
      name: 'Gratidão',
      emoji: '🌻',
      gradient: _esmeralda,
      verses: [
        Verse('Em tudo dai graças, porque esta é a vontade de Deus em Cristo Jesus para convosco.',
            '1 Tessalonicenses 5:18'),
        Verse(
            'Rendei graças ao Senhor, porque ele é bom, porque a sua benignidade dura para sempre.',
            'Salmos 107:1'),
        Verse(
            'Bendize, ó minha alma, ao Senhor, e não te esqueças de nenhum de seus benefícios.',
            'Salmos 103:2'),
        Verse('Entrai pelas suas portas com ação de graças, e nos seus átrios com louvor.',
            'Salmos 100:4'),
        Verse('Louvarei ao Senhor de todo o meu coração; contarei todas as tuas maravilhas.',
            'Salmos 9:1'),
        Verse('Graças a Deus pelo seu dom inefável.', '2 Coríntios 9:15'),
        Verse(
            'Cantai ao Senhor, bendizei o seu nome; anunciai a sua salvação de dia em dia.',
            'Salmos 96:2'),
        Verse('E tudo quanto fizerdes, fazei-o de todo o coração, como ao Senhor.',
            'Colossenses 3:23'),
      ],
    ),
    VerseCategory(
      id: 'ansiedade',
      name: 'Ansiedade & Medo',
      emoji: '🌿',
      gradient: _verde,
      verses: [
        Verse(
            'Não estejais inquietos por coisa alguma; antes as vossas petições sejam em tudo conhecidas diante de Deus.',
            'Filipenses 4:6'),
        Verse(
            'Lançando sobre ele toda a vossa ansiedade, porque ele tem cuidado de vós.',
            '1 Pedro 5:7'),
        Verse('Em o dia em que eu temer, hei de confiar em ti.', 'Salmos 56:3'),
        Verse(
            'Vinde a mim, todos os que estais cansados e oprimidos, e eu vos aliviarei.',
            'Mateus 11:28'),
        Verse(
            'Olhai para as aves do céu: vosso Pai celestial as alimenta. Não valeis vós muito mais do que elas?',
            'Mateus 6:26'),
        Verse(
            'Buscai primeiro o reino de Deus e a sua justiça, e todas estas coisas vos serão acrescentadas.',
            'Mateus 6:33'),
        Verse('Não se turbe o vosso coração; credes em Deus, crede também em mim.',
            'João 14:1'),
        Verse(
            'Quando se multiplicavam as minhas preocupações, as tuas consolações me alegravam a alma.',
            'Salmos 94:19'),
        Verse('Não temas, crê somente.', 'Marcos 5:36'),
      ],
    ),
    VerseCategory(
      id: 'salmos',
      name: 'Salmos',
      emoji: '🎶',
      gradient: _violeta,
      verses: [
        Verse('O Senhor é a minha luz e a minha salvação; a quem temerei?',
            'Salmos 27:1'),
        Verse('Cria em mim, ó Deus, um coração puro, e renova em mim um espírito reto.',
            'Salmos 51:10'),
        Verse('Este é o dia que fez o Senhor; regozijemo-nos, e alegremo-nos nele.',
            'Salmos 118:24'),
        Verse('Lâmpada para os meus pés é a tua palavra, e luz para o meu caminho.',
            'Salmos 119:105'),
        Verse('Entrega o teu caminho ao Senhor; confia nele, e ele tudo fará.',
            'Salmos 37:5'),
        Verse('Deleita-te também no Senhor, e ele te concederá o que deseja o teu coração.',
            'Salmos 37:4'),
        Verse('Buscai ao Senhor e a sua força; buscai a sua face continuamente.',
            'Salmos 105:4'),
      ],
    ),
    VerseCategory(
      id: 'proverbios',
      name: 'Provérbios',
      emoji: '🧭',
      gradient: _petroleo,
      verses: [
        Verse(
            'Confia no Senhor de todo o teu coração, e não te estribes no teu próprio entendimento.',
            'Provérbios 3:5'),
        Verse('O temor do Senhor é o princípio da sabedoria.', 'Provérbios 9:10'),
        Verse('O coração alegre serve de bom remédio.', 'Provérbios 17:22'),
        Verse(
            'Ensina a criança no caminho em que deve andar, e até quando envelhecer não se desviará dele.',
            'Provérbios 22:6'),
      ],
    ),
    VerseCategory(
      id: 'cura',
      name: 'Cura',
      emoji: '🩹',
      gradient: _cura,
      verses: [
        Verse('Sara-me, Senhor, e sararei; salva-me, e serei salvo; porque tu és o meu louvor.',
            'Jeremias 17:14'),
        Verse('Ele sara os quebrantados de coração, e liga as suas feridas.',
            'Salmos 147:3'),
        Verse('E pelas suas pisaduras fomos sarados.', 'Isaías 53:5'),
        Verse('A oração da fé salvará o doente, e o Senhor o levantará.',
            'Tiago 5:15'),
        Verse(
            'Bendize, ó minha alma, ao Senhor; é ele que sara todas as tuas enfermidades.',
            'Salmos 103:2-3'),
      ],
    ),
    VerseCategory(
      id: 'perdao',
      name: 'Perdão',
      emoji: '🤝',
      gradient: _perdao,
      verses: [
        Verse(
            'Se confessarmos os nossos pecados, ele é fiel e justo para nos perdoar os pecados.',
            '1 João 1:9'),
        Verse('Perdoai, e sereis perdoados.', 'Lucas 6:37'),
        Verse(
            'Porque, se perdoardes aos homens as suas ofensas, também vosso Pai celestial vos perdoará a vós.',
            'Mateus 6:14'),
        Verse('Suportando-vos uns aos outros, e perdoando-vos uns aos outros.',
            'Colossenses 3:13'),
      ],
    ),
    VerseCategory(
      id: 'familia',
      name: 'Família',
      emoji: '🏡',
      gradient: _familia,
      verses: [
        Verse('Eu e a minha casa serviremos ao Senhor.', 'Josué 24:15'),
        Verse('Honra a teu pai e a tua mãe.', 'Êxodo 20:12'),
        Verse('Eis que os filhos são herança do Senhor.', 'Salmos 127:3'),
        Verse('Crê no Senhor Jesus Cristo e serás salvo, tu e a tua casa.',
            'Atos 16:31'),
      ],
    ),
    VerseCategory(
      id: 'sabedoria',
      name: 'Sabedoria',
      emoji: '🦉',
      gradient: _sabedoria,
      verses: [
        Verse(
            'Se algum de vós tem falta de sabedoria, peça-a a Deus, que a todos dá liberalmente.',
            'Tiago 1:5'),
        Verse(
            'Porque o Senhor dá a sabedoria; da sua boca é que vem o conhecimento e o entendimento.',
            'Provérbios 2:6'),
        Verse(
            'Ensina-nos a contar os nossos dias, de tal maneira que alcancemos corações sábios.',
            'Salmos 90:12'),
      ],
    ),
    VerseCategory(
      id: 'consolo',
      name: 'Consolo',
      emoji: '🕯️',
      gradient: _consolo,
      verses: [
        Verse('Bem-aventurados os que choram, porque eles serão consolados.',
            'Mateus 5:4'),
        Verse('Perto está o Senhor dos que têm o coração quebrantado.',
            'Salmos 34:18'),
        Verse('E Deus limpará de seus olhos toda a lágrima.',
            'Apocalipse 21:4'),
        Verse(
            'Ainda que eu andasse pelo vale da sombra da morte, não temeria mal algum, porque tu estás comigo.',
            'Salmos 23:4'),
      ],
    ),
    VerseCategory(
      id: 'vitoria',
      name: 'Vitória',
      emoji: '🏆',
      gradient: _vitoria,
      verses: [
        Verse('Mas graças a Deus que nos dá a vitória por nosso Senhor Jesus Cristo.',
            '1 Coríntios 15:57'),
        Verse('Se Deus é por nós, quem será contra nós?', 'Romanos 8:31'),
        Verse(
            'Em todas estas coisas somos mais que vencedores, por aquele que nos amou.',
            'Romanos 8:37'),
        Verse('Nenhuma arma forjada contra ti prosperará.', 'Isaías 54:17'),
      ],
    ),
    VerseCategory(
      id: 'promessas',
      name: 'Promessas',
      emoji: '✨',
      gradient: _promessas,
      verses: [
        Verse(
            'Porque todas quantas promessas há de Deus são nele sim, e por ele o amém, para glória de Deus.',
            '2 Coríntios 1:20'),
        Verse('Fiel é o que vos chama, o qual também o fará.',
            '1 Tessalonicenses 5:24'),
        Verse('O meu Deus suprirá todas as vossas necessidades.',
            'Filipenses 4:19'),
        Verse(
            'Não falhará nem uma só de todas as boas palavras que o Senhor falou.',
            'Josué 23:14'),
      ],
    ),
    // ---------- Categorias EXCLUSIVAS (premium) ----------
    VerseCategory(
      id: 'salmos_poder',
      name: 'Salmos de Poder',
      emoji: '🔥',
      gradient: _salmosPoder,
      premium: true,
      verses: [
        Verse(
            'Mil cairão ao teu lado, e dez mil à tua direita, mas não chegará a ti.',
            'Salmos 91:7'),
        Verse(
            'Porque aos seus anjos dará ordem a teu respeito, para te guardarem em todos os teus caminhos.',
            'Salmos 91:11'),
        Verse('Não temerás espanto noturno, nem seta que voe de dia.',
            'Salmos 91:5'),
        Verse('O Senhor é a minha rocha, e a minha fortaleza, e o meu libertador.',
            'Salmos 18:2'),
        Verse('Levanto os meus olhos para os montes; de onde virá o meu socorro?',
            'Salmos 121:1'),
        Verse('O Senhor te guardará de todo o mal; ele guardará a tua alma.',
            'Salmos 121:7'),
      ],
    ),
    VerseCategory(
      id: 'devocional',
      name: 'Devocional Diário',
      emoji: '📿',
      gradient: _devocional,
      premium: true,
      verses: [
        Verse(
            'Comece o dia entregando suas preocupações a Deus: Ele cuida de cada detalhe da sua vida.',
            'Devocional'),
        Verse(
            'A fé não tira a tempestade, mas garante quem segura o leme do seu barco.',
            'Devocional'),
        Verse(
            'Deus não promete um caminho sem vales, mas promete caminhar com você em todos eles.',
            'Devocional'),
        Verse(
            'O silêncio da oração é onde a alma cansada encontra forças novas.',
            'Devocional'),
        Verse(
            'Confie no tempo de Deus: o que parece demora costuma ser preparo.',
            'Devocional'),
        Verse(
            'Gratidão transforma o pouco em suficiente e o comum em milagre.',
            'Devocional'),
        Verse('Deus escreve reto por linhas tortas: confie no rascunho de hoje.',
            'Devocional'),
        Verse('A paz não é a ausência de problemas, é a presença de Deus neles.',
            'Devocional'),
        Verse(
            'Antes de pedir forças, agradeça pelas que já te trouxeram até aqui.',
            'Devocional'),
        Verse('O que você entrega a Deus pela manhã, Ele carrega o dia todo.',
            'Devocional'),
        Verse('A fé começa exatamente onde termina o seu controle.',
            'Devocional'),
        Verse('Nem toda porta fechada é castigo; muitas são proteção.',
            'Devocional'),
        Verse('Descanse: cuidar de você também é uma forma de obedecer a Deus.',
            'Devocional'),
        Verse('A oração muda primeiro quem ora, e depois muda a situação.',
            'Devocional'),
        Verse('Deus nunca chega atrasado; Ele chega no tempo perfeito.',
            'Devocional'),
        Verse('Sua maior batalha pode ser o palco do seu maior testemunho.',
            'Devocional'),
        Verse('Semeie hoje a fé que você vai querer colher amanhã.',
            'Devocional'),
        Verse('O deserto também é escola: ali se aprende a depender de Deus.',
            'Devocional'),
        Verse('Quando faltar a resposta, que sobre a confiança em Deus.',
            'Devocional'),
        Verse('Cada amanhecer prova que Deus ainda tem planos com você.',
            'Devocional'),
      ],
    ),
    VerseCategory(
      id: 'palavra_vitoria',
      name: 'Palavra de Vitória',
      emoji: '👑',
      gradient: _poder,
      premium: true,
      verses: [
        Verse(
            'Eu sou mais que vencedor: nada que tentou me ferir terá a palavra final.',
            'Declaração de fé'),
        Verse('Onde Deus me planta, eu floresço, mesmo no inverno.',
            'Declaração de fé'),
        Verse('A minha história ainda vai testemunhar a fidelidade de Deus.',
            'Declaração de fé'),
        Verse('Levanto a cabeça: sou filho do Rei e herdeiro das promessas.',
            'Declaração de fé'),
        Verse('O medo não manda em mim; quem governa o meu coração é a fé.',
            'Declaração de fé'),
        Verse('Hoje eu escolho confiar, mesmo sem ver o fim do caminho.',
            'Declaração de fé'),
        Verse('Sou curado, sustentado e amado pelo Deus que não falha.',
            'Declaração de fé'),
        Verse('O que tentou me derrubar virou degrau pra minha vitória.',
            'Declaração de fé'),
        Verse('Eu prospero porque ando de mãos dadas com a fé.',
            'Declaração de fé'),
        Verse('Minha família é abençoada e a minha casa serve ao Senhor.',
            'Declaração de fé'),
        Verse('Eu não temo o amanhã, porque Deus já esteve nele.',
            'Declaração de fé'),
        Verse('A provisão chega, porque o meu Deus é dono de tudo.',
            'Declaração de fé'),
        Verse('Sou semente que venceu o solo duro e brotou mesmo assim.',
            'Declaração de fé'),
        Verse('A vitória já está decretada; eu só caminho até ela.',
            'Declaração de fé'),
        Verse('Nenhuma palavra negativa terá poder sobre a minha vida.',
            'Declaração de fé'),
        Verse('Sou forte na fraqueza, porque a força vem dEle em mim.',
            'Declaração de fé'),
        Verse('O medo não habita onde a fé já tomou posse.',
            'Declaração de fé'),
        Verse('Sou mais que conquistador: sou filho do Rei.',
            'Declaração de fé'),
        Verse('A minha história termina em vitória, porque Deus a escreve.',
            'Declaração de fé'),
      ],
    ),
  ];

  /// Todos os versículos numa lista.
  static List<Verse> get all =>
      [for (final c in categories) ...c.verses];

  /// Versículos das categorias GRÁTIS (usado no versículo do dia, pra não
  /// vazar o conteúdo exclusivo).
  static List<Verse> get freeVerses =>
      [for (final c in categories) if (!c.premium) ...c.verses];

  static VerseCategory categoryById(String id) =>
      categories.firstWhere((c) => c.id == id, orElse: () => categories.first);
}
