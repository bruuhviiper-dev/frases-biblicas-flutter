/// Gerador PROCEDURAL de devocionais — SEM IA, 100% offline e sem custo.
///
/// Combina fragmentos originais (abertura + verdade + aplicação) para produzir
/// milhares de mensagens únicas (24 × 28 × 24 = 16.128 combinações), o que dá
/// a sensação de conteúdo "infinito" sem depender de API. O "devocional do dia"
/// é determinístico (muda a cada dia, por anos sem repetir em sequência).
class DevotionalGenerator {
  DevotionalGenerator._();

  static const List<String> _open = [
    'Hoje, lembre-se:',
    'Neste dia:',
    'Comece o dia sabendo:',
    'Não importa o que venha:',
    'Em meio à correria:',
    'Quando a ansiedade bater:',
    'Antes de qualquer coisa:',
    'Mesmo no cansaço:',
    'Guarde esta verdade:',
    'Para o seu coração hoje:',
    'Respire e confie:',
    'Se hoje está difícil:',
    'No silêncio da manhã:',
    'Ao abrir os olhos hoje:',
    'Onde quer que você esteja:',
    'Hoje Deus te lembra:',
    'Leve isto com você:',
    'Que fique no seu coração:',
    'Em qualquer batalha:',
    'Quando a dúvida vier:',
    'No meio da tempestade:',
    'Para encarar este dia:',
    'Antes de dormir, saiba:',
    'Do amanhecer ao anoitecer:',
  ];

  static const List<String> _truth = [
    'Deus está no controle, mesmo do que você não entende',
    'o amor de Deus por você não depende do seu desempenho',
    'nenhuma oração sincera cai no vazio',
    'você é mais forte do que imagina, porque a força vem de Deus',
    'o que parece atraso costuma ser preparo',
    'a graça de Deus é nova a cada manhã',
    'Deus transforma desertos em lugares de encontro',
    'você não caminha sozinho nem por um instante',
    'a paz de Deus é maior do que qualquer problema',
    'cada lágrima sua é vista e cuidada por Deus',
    'a fé cresce justamente quando é testada',
    'Deus escreve reto até pelas linhas tortas da sua história',
    'o seu valor está em quem Deus diz que você é',
    'depois da noite mais escura, o sol volta a nascer',
    'Deus guarda o melhor para quem espera nele',
    'a sua história ainda vai testemunhar a fidelidade de Deus',
    'confiar é descansar mesmo sem ver o fim do caminho',
    'Deus sustenta quem entrega o peso a ele',
    'há propósito até no que parece perdido',
    'o cuidado de Deus chega antes mesmo do seu pedido',
    'a esperança em Deus nunca decepciona',
    'pequenos passos de fé movem grandes montanhas',
    'Deus é refúgio certo na hora incerta',
    'o perdão liberta primeiro quem perdoa',
    'a alegria do Senhor é a sua força',
    'Deus não desiste de você',
    'você é amado exatamente como é, hoje',
    'toda promessa de Deus tem a hora certa de se cumprir',
  ];

  static const List<String> _apply = [
    'Respire e siga em paz.',
    'Caminhe com fé hoje.',
    'Descanse nessa certeza.',
    'Entregue o seu dia a Deus.',
    'Confie e prossiga.',
    'Deixe o medo do lado de fora.',
    'Agradeça antes mesmo de ver.',
    'Levante a cabeça e siga.',
    'Permita-se confiar de novo.',
    'Comece com gratidão.',
    'Não tenha medo de recomeçar.',
    'Guarde isso no coração.',
    'Siga firme: você não está só.',
    'Sorria, o melhor ainda vem.',
    'Ore e descanse.',
    'Dê o primeiro passo.',
    'Acredite mais uma vez.',
    'Hoje, escolha a fé.',
    'Espere com paciência.',
    'Vá com coragem.',
    'Confie no tempo de Deus.',
    'Tenha um dia abençoado.',
    'Respire fundo e continue.',
    'Deus vai com você.',
  ];

  /// Total de devocionais únicos possíveis.
  static int get total => _open.length * _truth.length * _apply.length;

  /// Devocional na posição [i] (estável: o mesmo i sempre gera o mesmo texto).
  static String byIndex(int i) {
    final n = i.abs();
    final o = _open[n % _open.length];
    final t = _truth[(n ~/ _open.length) % _truth.length];
    final a = _apply[(n ~/ (_open.length * _truth.length)) % _apply.length];
    return '$o $t. $a';
  }

  /// Devocional do dia (determinístico, espalhado para não repetir em sequência).
  static String ofDay([DateTime? date]) {
    final d = date ?? DateTime.now();
    final dayIndex = DateTime(d.year, d.month, d.day)
        .difference(DateTime(2020, 1, 1))
        .inDays;
    return byIndex(dayIndex * 7919); // 7919 é primo: espalha pelas combinações
  }
}
