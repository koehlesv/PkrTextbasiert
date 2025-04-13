# Nutzungsbedingungen

Mit diesem Programm darf nicht um Geld oder andere Wertgegenstände gespielt werden. Im Übrigen gelten die Bedingungen der Lizenz und die im Programm angezeigten Hinweise.


# Spielprinzip

Spielbar für 2 bis 5 Spielende (computerbasierte Spielende inbegriffen).
Es ist möglich, nur computerbasierte Spielende, nur menschliche Spielende, oder eine Kombination aus beiden spielen zu lassen.

Pro Runde erhalten alle fünf Karten. Danach kann jede Person auswählen, ob sie zwischen null und fünf Karten tauschen möchte; In diesem Fall werden die ausgewählten Karten hinten auf den Kartenstapel zurückgelegt, und die ausgewählte Anzahl an Karten wird nun vom Kartenstapel nachgezogen. Das Pokerkartendeck enthält 52 Karten und besteht aus vier Farben (Karo, Pik, Herz, Kreuz), die in jeweils dreizehn Werten vorliegen: 2, 3, 4, 5, 6, 7, 8, 9, 10, Bube, Dame, König, Ass (aufsteigend sortiert). Am Ende jeder Runde werden die Personen mit den meisten und den wenigsten Punkten ermittelt (je höher die Punktzahl desto besser). Die Ermittlung funktioniert folgendermaßen (absteigend sortiert von der höchsten zur niedrigsten Wertung):

-Royal Flush: Eine Folge von fünf Karten derselben Farbe, deren Werte sich jeweils um einen Punkt unterscheiden und das Ass beinhalten.

-Straight Flush: Eine Folge von fünf Karten derselben Farbe, deren Werte sich jeweils um einen Punkt unterscheiden.

-Four of a Kind: Vier Karten mit demselben Wert.

-Full House: Drei Karten mit dem gleichen Wert, und zwei Karten mit einem anderen, ebenfalls gleichen Wert (z.B. 3 x Ass und 2 x 4).

-Flush: Eine Folge von fünf Karten derselben Farbe.

-Straight: Eine Folge von fünf Karten, deren Werte sich jeweils um einen Punkt unterscheiden.

-Three of a Kind: Eine Folge von drei Karten derselben Farbe.

-Two Pair: Zwei Karten mit dem gleichen Wert, und zwei weitere Karten mit einem anderen, ebenfalls gleichen Wert (z.B. 2 x 6 und 2 x 9).

-One Pair: Zwei Karten mit demselben Wert.

-Highest Card: Die Karte mit dem höchsten Wert.

Sind nicht alle Karten in einer Folge enthalten, dürfen die anderen beliebige Werte enthalten. Es zählt nur die Wertung mit der höchsten Punktzahl. Haben mehrere Personen dieselbe gewertete Folge, so wird die höchste Karte der gewerteten Folge verglichen und es gewinnt die Person mit der höchsten Karte (bzw. es verliert diejenige mit der niedrigsten Karte). Bleibt es bei einem Gleichstand, so werden alle diese Personen in der aktuellen Runde gleich bewertet.

Es gibt zwei mögliche Spielprinzipien: absteigend und aufsteigend.
- Absteigend: Alle erhalten zu Spielbeginn die vorgegebene Anzahl an Tokens. In jeder Runde verliert die Person mit der niedrigsten Wertung ein Token. Wer keine Tokens mehr besitzt, scheidet aus dem Spiel aus. Es gewinnt, wer am Ende als Einziges noch Tokens besitzt.
- Aufsteigend: Alle beginnen mit 0 Tokens. In jeder Runde gewinnt die Person mit der höchsten Wertung ein Token. Wer die zu Beginn festgelegte Anzahl Tokens erreicht, scheidet aus dem Spiel aus. Es verliert, wer am Ende als Einziges die vordefinierte Token-Anzahl nicht erreicht hat.


# Blatt

Es wird mit einem französischen Blatt mit 52 Karten (keine Joker) gespielt. Zur Einfachheit werden hier deutsche Bezeichnungen verwendet.


# Strategie

Computerbasierte Spielende arbeiten wie folgt: Bewerte deine Hand und finde die höchste Kombination, die du derzeit auf der Hand hast. Behalte alle Karten, die zu dieser Kombination gehören, und tausche die anderen Karten aus.


# Lizenz

Die vollständige Lizenz befindet sich in der Datei License.md. Diese Software wird unter der veränderten Apache 2.0-Lizenz veröffentlicht. Im Folgenden findet sich ein Auszug der Ergänzungen zur Apache 2.0-Lizenz:

Diese Software (dies gilt für alle Bestandteile der Software, unter anderem die ausführbare Datei und den Quellcode) wird unter der modifizierten Apache 2.0-Lizenz veröffentlicht. Wir bezeichnen auch den Software-Quellcode, Dokumentationsquellen und Konfigurationsdateien im Nachfolgenden als Software.

Die folgenden Bestimmungen ergänzen die Apache License 2.0 und gelten für alle Original- und abgeleiteten Werke, auch bei teilweiser Ableitung, die auf dieser Software basieren (nachfolgend "Software").

## Zufallsgenerator-Integritätsklausel

a) Der in der Software implementierte Zufallsgenerator muss in jeder Ausführung gleichverteilt zufällige Ergebnisse liefern. Dies gilt als erfüllt, sofern die Funktion zur Erzeugung der Zufallszahlen des Originals unverändert übernommen wird.

b) Es ist untersagt, den Code des Zufallsgenerators in einer Weise zu modifizieren, die zu einer systematischen Verzerrung führt – das heißt, es dürfen keine Änderungen vorgenommen werden, die einzelne Nutzende bevorzugen oder benachteiligen.

## Verpflichtung zur Offenlegung

a) Jegliche Änderungen am Code des Zufallsgenerators müssen in den entsprechenden Versionshinweisen dokumentiert werden.

b) Sollte nachgewiesen werden, dass Änderungen zu einer ungleichverteilten Zufallsfunktion führen, behält sich der ursprüngliche Urheber das Recht vor, sämtliche Lizenzrechte in Bezug auf das betroffene Werk auszuüben.

## Warnhinweis-Pflicht

a) Jede Software, die auf dieser Software basiert, diese integriert oder ganz- oder teilweise davon ableitet (nachfolgend „abgeleitete Werke“), muss in der Benutzerschnittstelle permanent und an einer gut sichtbaren Stelle einen Warnhinweis anzeigen. Dieser Warnhinweis muss inhaltlich mindestens Folgendes beinhalten:

"Poker ist ein rundenbasiertes Spiel, bei welchem der Erfolg in hohem Maße vom Zufall abhängt. Mit diesem Programm darf nicht um Geld oder andere Wertgegenstände gespielt werden.
Glücksbasiertes Spielen kann süchtig machen; Infos unter https://www.buwei.de - kostenfrei und anonym."

b) Der angezeigte Warnhinweis darf in keiner Weise durch Modifikation, Unterdrückung oder sonstige Änderungen verändert, deaktiviert oder entfernt werden. Jede Abweichung von dieser Bedingung bedarf der ausdrücklichen schriftlichen Zustimmung des ursprünglichen Urhebers.

c) Diese zusätzliche Warnhinweis-Pflicht gilt für alle abgeleiteten Werke, unabhängig davon, in welchem Umfang sie die ursprüngliche Software nutzen oder erweitern. Die Anzeigepflicht erstreckt sich auf jede Oberfläche, in der der Nutzer mit der Software interagiert, und muss dauerhaft bestehen, solange das abgeleitete Werk in Betrieb ist.

Jede abgeleitete Software muss diesen Lizenztext enthalten.
