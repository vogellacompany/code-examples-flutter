# math_pdf_generator

Diese App generiert Matheaufgaben und ermöglicht das ausdrucken der Aufgaben.

Mit dieser App kann man Grundrechenarten üben. Es sind 4 unterschiedliche Schwierigkeitsgrade möglich. Aufgaben werden erzeugt und als PDF zum Ausdrucken zur Verfügung gestellt.

## Applikation für den Release bauen

Es existieren zwei mögliche Formate: App bundle und APK. App bundle wird vom Goolge Play Store bevorzugt.

[source, console]
----
flutter build appbundle
----

Der Bundle ist dann hier zu finden: /code-examples-flutter/math_pdf_generator/build/app/outputs/bundle/release/app-release.aab

NOTE: Eventuell musst man flutter clean ausführen, nachdem gradle files geändert wurden, bevor man einen neune appbundle erzeugt.

