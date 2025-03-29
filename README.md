# OpenMinds

**OpenMinds** è un'applicazione iOS progettata per sensibilizzare i bambini sulla **prevenzione dal fumo** attraverso un gioco educativo. Il gioco è una corsa infinita: quando il bambino perde, viene mostrato un breve video educativo animato che sensibilizza il bambino sui pericoli del fumo e sull'importanza di evitare questa cattiva abitudine. Il progetto si concentra sulla **prevenzione** e sull'educazione dei bambini su questo tema importante.

## Funzionalità

- **Gioco di corsa infinita**: Il bambino corre attraverso un ambiente virtuale e affronta ostacoli. Ogni volta che perde, viene mostrato un video educativo che illustra i pericoli del fumo e promuove comportamenti sani.
- **Video educativo**: Ogni volta che il bambino perde, viene visualizzato un video animato che sensibilizza sui pericoli del fumo, per aumentare la consapevolezza sui rischi legati al tabagismo.
- **Semplicità d'uso**: L'applicazione è progettata per essere facilmente comprensibile e accessibile per i bambini, con un'interfaccia user-friendly e contenuti animati coinvolgenti.

## Tecnologie utilizzate

- **Swift**: Linguaggio di programmazione utilizzato per lo sviluppo dell'applicazione.
- **Xcode**: Ambiente di sviluppo integrato (IDE) utilizzato per la creazione dell'app.
- **SpriteKit**: Framework utilizzato per la creazione del gioco, che offre strumenti per la gestione di animazioni, fisica e rendering 2D.

## Struttura del progetto

Il progetto è stato sviluppato utilizzando una struttura monolitica, con l'intera logica del gioco gestita nel file `main`. Tuttavia, sarebbe stato preferibile utilizzare il pattern **MVC** (Model-View-Controller) per suddividere meglio la logica in moduli separati, migliorando la manutenibilità e la scalabilità del codice. La scelta di un'architettura più modulare avrebbe permesso una gestione più chiara e un'evoluzione più semplice del progetto.

## Come iniziare

1. **Clona il repository**:
   ```bash
   git clone https://github.com/tuo-repository/OpenMinds.git
