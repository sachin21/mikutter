# -*- coding: utf-8 -*-
module Cairo::SpecialEdge
  FOOTER_URL = 'http://mikutter.hachune.net/img/footer.png'
  RAW = [[0.38507142857142856,0.9584285714285715].freeze,[0.39482142857142855,0.9707857142857143].freeze,[0.4603928571428571,0.9740357142857143].freeze,[0.4941428571428572,0.9681785714285713].freeze,[0.5285714285714286,0.9603928571428573].freeze,[0.5649285714285714,0.9448214285714286].freeze,[0.6207857142857143,0.9428571428571428].freeze,[0.6922142857142857,0.9448214285714286].freeze,[0.7149285714285715,0.9324642857142856].freeze,[0.7454642857142857,0.9].freeze,[0.7589285714285714,0.8982142857142857].freeze,[0.7866071428571428,0.8839285714285714].freeze,[0.8428571428571429,0.8669642857142857].freeze,[0.8589285714285714,0.85].freeze,[0.8625,0.8428571428571429].freeze,[0.9053571428571429,0.8196428571428571].freeze,[0.93125,0.7928571428571428].freeze,[0.9482142857142857,0.7803571428571429].freeze,[0.9732142857142857,0.7276785714285714].freeze,[0.9875,0.5839285714285715].freeze,[0.9839285714285714,0.5080357142857143].freeze,[0.9660714285714286,0.4660714285714286].freeze,[0.9303571428571429,0.4142857142857143].freeze,[0.9232142857142858,0.3892857142857143].freeze,[0.8863571428571428,0.35064285714285715].freeze,[0.8450714285714286,0.29778571428571426].freeze,[0.8196428571428571,0.2642857142857143].freeze,[0.8107142857142857,0.24821428571428572].freeze,[0.7178571428571429,0.15892857142857142].freeze,[0.6928571428571428,0.15].freeze,[0.6732142857142858,0.13035714285714287].freeze,[0.6053571428571428,0.10714285714285714].freeze,[0.6053571428571428,0.08571428571428572].freeze,[0.5660714285714286,0.04642857142857143].freeze,[0.48928571428571427,0.03571428571428571].freeze,[0.43392857142857144,0.05].freeze,[0.3678571428571429,0.07857142857142857].freeze,[0.3454642857142857,0.08960714285714286].freeze,[0.3259642857142857,0.10128571428571428].freeze,[0.28635714285714287,0.11557142857142857].freeze,[0.2694642857142857,0.13310714285714287].freeze,[0.2551785714285714,0.13960714285714287].freeze,[0.21557142857142858,0.18375].freeze,[0.21039285714285713,0.19482142857142856].freeze,[0.20517857142857143,0.20842857142857144].freeze,[0.187,0.22660714285714287].freeze,[0.17921428571428571,0.22921428571428573].freeze,[0.16753571428571426,0.23832142857142857].freeze,[0.16039285714285714,0.25064285714285717].freeze,[0.1519642857142857,0.2727142857142857].freeze,[0.14414285714285713,0.29350000000000004].freeze,[0.14157142857142857,0.3396071428571429].freeze,[0.14025,0.3545357142857143].freeze,[0.14482142857142857,0.36557142857142855].freeze,[0.1480357142857143,0.38571428571428573].freeze,[0.14675000000000002,0.40910714285714284].freeze,[0.14025,0.43246428571428575].freeze,[0.13246428571428573,0.44285714285714284].freeze,[0.12596428571428572,0.45517857142857143].freeze,[0.11167857142857143,0.4675357142857143].freeze,[0.10064285714285715,0.47921428571428576].freeze,[0.09025,0.49803571428571425].freeze,[0.0759642857142857,0.5103928571428571].freeze,[0.06428571428571428,0.5188214285714287].freeze,[0.055178571428571424,0.5292142857142857].freeze,[0.0435,0.5512857142857144].freeze,[0.033107142857142856,0.5759642857142857].freeze,[0.02142857142857143,0.6155714285714287].freeze,[0.022714285714285715,0.6688214285714286].freeze,[0.026607142857142857,0.6922142857142857].freeze,[0.02207142857142857,0.7026071428571429].freeze,[0.027285714285714285,0.7402500000000001].freeze,[0.039607142857142855,0.7831071428571429].freeze,[0.054535714285714285,0.8116785714285715].freeze,[0.07078571428571429,0.83375].freeze,[0.08896428571428572,0.8759642857142858].freeze,[0.10453571428571429,0.9344285714285714].freeze,[0.11882142857142858,0.9506428571428571].freeze,[0.12728571428571428,0.9389642857142858].freeze,[0.137,0.9454642857142858].freeze,[0.17660714285714288,0.9448214285714286].freeze,[0.17921428571428571,0.9318214285714287].freeze,[0.19414285714285714,0.9155714285714286].freeze,[0.2019642857142857,0.9045357142857143].freeze,[0.23375,0.8980357142857143].freeze,[0.25064285714285717,0.89675].freeze,[0.2623214285714286,0.9045357142857143].freeze,[0.27985714285714286,0.9103928571428571].freeze,[0.30128571428571427,0.9155714285714286].freeze,[0.3142857142857143,0.9259642857142857].freeze,[0.3259642857142857,0.9363571428571429].freeze,[0.337,0.9467499999999999].freeze,[0.35064285714285715,0.9558571428571428].freeze].freeze
  class << self
    def path(width, height)
      Cairo::Path.new.tap do |path|
        RAW.each {|x,y|
          path.line_to(x*width, y*height)
        }
        x,y = RAW.first
        path.line_to(x*width, y*height) end
    end
    memoize :path
  end
end
